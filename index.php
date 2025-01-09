<?php

#Session and Database connection
session_start();

$servername = "localhost";
$username = "u415861906_infosec22210";
$password = "=aM69Eh/:lY";
$dbname = "u415861906_infosec22210";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

#Set timezone to Manila
date_default_timezone_set('Asia/Manila');


#Get and Post request handlers and queries of data that are needed for display
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["signup"])) {
    $username = $_POST["username"];
    $password = $_POST["password"];
    $hashed_password = password_hash($password, PASSWORD_DEFAULT);


    if (!preg_match("/^[a-zA-Z0-9_-]{3,16}$/", $username)) {
        $signup_error = "Username must be 3-16 characters long and can only contain letters, numbers, underscores, and hyphens.";
    } elseif (!preg_match("/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/", $password)) {
        $signup_error = "Password must be at least 8 characters long and contain at least one letter and one number.";
    } else {

        $check_query = "SELECT * FROM users WHERE username = ?";
        $stmt = $conn->prepare($check_query);
        $stmt->bind_param("s", $username);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            $signup_error = "Username already exists!";
        } else {

            $insert_query = "INSERT INTO users (username, password) VALUES (?, ?)";
            $stmt = $conn->prepare($insert_query);
            $stmt->bind_param("ss", $username, $hashed_password);
            if ($stmt->execute()) {
                $signup_success = "Sign-up successful! You can now log in.";
            } else {
                $signup_error = "Error: " . $stmt->error;
            }
        }
    }
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["login"])) {
    $login_username = $_POST["login_username"];
    $login_password = $_POST["login_password"];


    $login_query =
        "SELECT id, username, password FROM users WHERE username = ?";
    $stmt = $conn->prepare($login_query);
    $stmt->bind_param("s", $login_username);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $user = $result->fetch_assoc();

        if (password_verify($login_password, $user["password"])) {
            $_SESSION["user_id"] = $user["id"];
            $_SESSION["username"] = $user["username"];
        } else {
            $login_error = "Invalid username or password.";
        }
    } else {
        $login_error = "Invalid username or password.";
    }
}

$_SESSION['is_login'] = true;

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["goto-signup"])) {
    $_SESSION['is_login'] = false;

    header('Location: ' . $_SERVER['PHP_SELF']);
    exit();

}
if (isset($_SESSION['user_id'])) {

    if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["submit_foods"])) {

        $breakfast_ids = isset($_POST["breakfast_ids"])
            ? $_POST["breakfast_ids"]
            : [];
        $lunch_ids = isset($_POST["lunch_ids"]) ? $_POST["lunch_ids"] : [];
        $dinner_ids = isset($_POST["dinner_ids"]) ? $_POST["dinner_ids"] : [];

        $date = date("Y-m-d", strtotime($_POST["date"]));


        $user_id = $_SESSION["user_id"];


        if (empty($user_id)) {
            echo "Error: User ID is required.";
            exit();
        }


        $conn->begin_transaction();

        try {

            foreach ($breakfast_ids as $food_id) {
                $stmt = $conn->prepare(
                    "INSERT INTO meal_selections (user_id, meal_type, food_id, date) VALUES (?, ?, ?, ?)"
                );
                $meal_type = "breakfast";
                $stmt->bind_param("isis", $user_id, $meal_type, $food_id, $date);
                $stmt->execute();

            }
            $stmt->close();

            foreach ($lunch_ids as $food_id) {
                $stmt = $conn->prepare(
                    "INSERT INTO meal_selections (user_id, meal_type, food_id, date) VALUES (?, ?, ?, ?)"
                );
                $meal_type = "lunch";
                $stmt->bind_param("isis", $user_id, $meal_type, $food_id, $date);
                $stmt->execute();

            }
            $stmt->close();

            foreach ($dinner_ids as $food_id) {
                $stmt = $conn->prepare(
                    "INSERT INTO meal_selections (user_id, meal_type, food_id, date) VALUES (?, ?, ?, ?)"
                );
                $meal_type = "dinner";
                $stmt->bind_param("isis", $user_id, $meal_type, $food_id, $date);
                $stmt->execute();

            }
            $stmt->close();


            $conn->commit();
        } catch (Exception $e) {

            $conn->rollback();
            echo "Error: " . $e->getMessage();
        }

        header('Location: ' . $_SERVER['PHP_SELF']);
        exit();
    }

    $foods_query = "SELECT * FROM foods";
    $foods_result = $conn->query($foods_query);

    $plans_query = "SELECT * FROM workout_plans";
    $plans_result = $conn->query($plans_query);


    $user_id = $_SESSION["user_id"];

    $sql = "SELECT  mp.id, mp.date, mp.meal_type, f.name, f.calories
        FROM meal_selections mp
        JOIN foods f ON mp.food_id = f.id
        WHERE mp.user_id = $user_id
        ORDER BY mp.date ASC,
                 CASE
                     WHEN mp.meal_type = 'Breakfast' THEN 1
                     WHEN mp.meal_type = 'Lunch' THEN 2
                     WHEN mp.meal_type = 'Dinner' THEN 3
                     ELSE 4
                 END ASC";

    $mealPlan_result = $conn->query($sql);


    $_SESSION['open-modal'] = false;

    if (isset($_POST['view_plan'])) {
        $plan_id = $_POST['plan_id'];

        $plan_query = "SELECT * FROM workout_plans WHERE id = ?";
        $stmt = $conn->prepare($plan_query);
        $stmt->bind_param("i", $plan_id);
        $stmt->execute();
        $plan_result = $stmt->get_result();

        $schedule_query = "SELECT * FROM workout_schedule WHERE workout_plan_id = ?";
        $stmt_schedule = $conn->prepare($schedule_query);
        $stmt_schedule->bind_param("i", $plan_id);
        $stmt_schedule->execute();
        $schedule_result = $stmt_schedule->get_result();

        $_SESSION['open-modal'] = true;


    }
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        if (isset($_POST['meal_id'])) {
            $meal_id = intval($_POST['meal_id']);



            $sql = "DELETE FROM meal_selections WHERE id = ?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param('i', $meal_id);
            $stmt->execute();
            $stmt->close();

            header('Location: ' . $_SERVER['PHP_SELF']);
            exit();

        }
    }

    if (isset($_POST["logout"])) {
        session_unset();
        session_destroy();
        header('Location: ' . $_SERVER['PHP_SELF']);
        exit();
    }


    $conn->close();
}
?>

<!-- Html code -->
<!DOCTYPE html>
<html lang="en">

<!-- Libraries and tools referenced in the head -->
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fitapp</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pikaday/css/pikaday.css" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/pikaday/pikaday.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<!-- CSS Styles-->
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
        }

        #header {

            background-color: #8B5DFF;

            display: flex;
            flex-direction: row;
            justify-content: space-between;
        }

        #brand-div {
            margin-left: 20px;
        }

        #brand-name {
            color: #FFFFFF;
            font-weight: bold;
            font-size: 20px;
            margin-right: 20px;
        }

        #user-div {

            display: flex;
            align-items: center;
            gap: 10px;
            margin-right: 20px;

        }

        #username {
            color: #FFFFFF;
            font-size: 16px;
        }

        label {
            font-size: 16px;
        }

        .food-input {
            width: 90%;



            padding: 12px 20px;

            font-size: 16px;

            font-family: 'Poppins', sans-serif;

            color: #333;

            background: #f9f9f9;

            border: 2px solid #8B5DFF;

            border-radius: 25px;

            outline: none;

            transition: all 0.3s ease;

            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);

        }

        input:focus {
            border-color: #6A42C2;

            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);

            background: #fff;

        }

        input::placeholder {
            color: #aaa;

            font-style: italic;

        }

        select {
            width: 80%;

            max-width: 400px;

            padding: 12px 20px;

            font-size: 16px;

            font-family: 'Poppins', sans-serif;

            color: #333;

            background: #f9f9f9;

            border: 2px solid #8B5DFF;

            border-radius: 25px;

            appearance: none;

            outline: none;

            transition: all 0.3s ease;

            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);

            cursor: pointer;

            background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" viewBox="0 0 10 10"><path d="M0 3l5 5 5-5z" fill="%238B5DFF"/></svg>');

            background-repeat: no-repeat;
            background-position: right 15px center;
            background-size: 10px;
        }

        select:focus {
            border-color: #6A42C2;

            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);

            background-color: #fff;

        }

        select option {
            background: #fff;

            color: #333;

            padding: 8px 12px;

            font-family: 'Poppins', sans-serif;

            transition: background 0.2s ease;

        }

        select option:hover {
            background: #8B5DFF;

            color: #fff;

        }

        .food-input-div {
            display: flex;
            flex-direction: column;
        }

        .logout-button {
            width: 80px;
            height: 30px;
            font-size: 14px;
            background: linear-gradient(135deg, #FF6B6B, #C54242);

            color: white;

            border: none;

            border-radius: 25px;

            text font-size: 16px;

            font-family: 'Poppins', sans-serif;

            cursor: pointer;

            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);

            transition: all 0.3s ease;

            text-transform: uppercase;

            letter-spacing: 1px;

        }

        .logout-button:hover {
            background: linear-gradient(135deg, #C54242, #FF6B6B);

            transform: scale(1.05);

            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);

        }

        .logout-button:active {
            transform: scale(0.98);

            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.15);

        }

        .hidden {
            display: none;
        }

        #login-container {

            width: 580px;
            height: 580px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
            background: white;
        }

        #login-container h2 {
            font-size: 48px;
            text-align: center;
        }

        #login-container #username {
            color: black;
        }

        #login-form,
        #signup-form {
            padding: 20px;
            display: flex;
            flex-direction: column;


        }

        #login-button {
            width: 90%;
            align-self: center;
        }

        #signup-button {
            width: 90%;
            align-self: center;
        }

        #login-form label {
            font-size: 20px;
        }

        #login-container ::placeholder {
            color: #aaa;

            font-style: italic
        }

        #login-container input {

            width: 85%;
            margin: 10px;
            height: 20px;

            padding: 12px;

            border: 2px solid rgba(169, 169, 169, 0.6);

            border-radius: 12px;

            font-size: 20px;

            transition: all 0.3s ease;

        }

        #login-container input:focus {
            outline: none;
            border: 2px solid #8B5DFF;

            background: rgba(169, 169, 169, 0.2);

        }

        .input-container i {

            font-size: 22px;

        }

        #goto-signup,
        #goto-login {
            margin-top: 20px;

            text-align: center;

        }

        #goto-signup button,
        #goto-login button {
            background: none;

            border: none;
            color: #8B5DFF;

            font-size: 16px;
            cursor: pointer;
            text-decoration: underline;
            padding: 0;
        }

        #goto-signup button:hover,
        #goto-login button:hover {
            color: #5D3FD3;

        }

        #container {
            display: flex;
            justify-content: flex-start;
            flex-direction: row;
            gap: 20px;


            max-height: 1000px;
            overflow-y: scroll;
            width: 100%;


        }

        #container::-webkit-scrollbar {
            width: 8px;

        }

        #container::-webkit-scrollbar-thumb {
            background-color: #FAC67A;

            border-radius: 4px;

        }

        #container::-webkit-scrollbar-track {
            background-color: transparent;

        }

        .main-content {


            display: flex;
            flex-direction: column;
            margin-left: 20px;
        }

        .today-container {
            box-shadow: 10px 10px 20px rgba(0, 0, 0, 0.15), -10px -10px 20px rgba(255, 255, 255, 0.8);
            margin-top: 20px;
            padding: 20px;
        }

        .foods-container {
            margin-top: 20px;
            box-shadow: 10px 10px 20px rgba(0, 0, 0, 0.15), -10px -10px 20px rgba(255, 255, 255, 0.8);
            padding: 20px;
        }

        .plans-container {
            margin-top: 20px;
            box-shadow: 10px 10px 20px rgba(0, 0, 0, 0.15), -10px -10px 20px rgba(255, 255, 255, 0.8);
            padding: 20px;
        }

        #confirm-meal-button,
        #login-button,
        #signup-button {

            background: linear-gradient(135deg, #8B5DFF, #6A42C2);

            color: white;

            border: none;

            border-radius: 30px;

            padding: 12px 28px;

            font-size: 16px;

            font-family: 'Poppins', sans-serif;

            cursor: pointer;

            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);

            transition: all 0.3s ease;

        }

        #confirm-meal-button,
        #login-button,
        #signup-button {
            background: linear-gradient(135deg, #6A42C2, #8B5DFF);

            transform: scale(1.05);

            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);

        }

        #confirm-meal-button:active,
        #login-button,
        #signup-button {
            transform: scale(0.98);

            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2);

        }

        .meal-plan-container {




            margin: 20px;

            border-radius: 10px;

        }

        .meal-plan-year {


            border-radius: 5px;
        }

        .meal-plan-month {
            display: flex;
            align-items: flex-start;

            flex-wrap: wrap;


        }

        .meal-plan-date {
            min-width: 180px;
            min-height: 180px;
            max-height: 360px;

            overflow-y: scroll;

            margin: 10px;
            background: #6A42C2;
            padding: 20px;
            border-radius: 5px;
        }

        .meal-plan-date::-webkit-scrollbar {
            width: 8px;

        }

        .meal-plan-date::-webkit-scrollbar-thumb {
            background-color: #FAC67A;

            border-radius: 4px;

        }

        .meal-plan-date::-webkit-scrollbar-track {
            background-color: transparent;

        }

        .meal-plan-date h3 {
            color: #FAC67A;
            F9E6CF
        }

        .meal-plan-date h4 {
            color: #F9E6CF;
        }

        .meal-plan-date p {
            color: #FFFFFF;
        }

        .meal-plan-item {
            padding: 5px;

            background: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            position: relative;

            display: inline-block;
        }

        .food-name {
            color: #FFFFFF;
        }

        .delete-button {
            display: none;

            background: none;
            border: none;
            color: red;
            font-size: 20px;
            margin-left: 2px;

            cursor: pointer;
        }


        .meal-item:hover .delete-button {
            display: inline;

        }

        .plans-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
        }

        .plan-card {
            background-color: white;

            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .plan-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2);
        }

        .plan-card img {
            width: 100%;
            height: 150px;
            object-fit: cover;
        }

        .plan-card .plan-content {
            padding: 15px;
        }

        .plan-card h3 {
            margin: 0 0 10px;
            font-size: 1.2em;
        }

        .plan-card p {


            margin: 0;
            color: #666;
            font-size: 0.9em;
        }


        #view-plan-button {
            width: 60px;
            height: 20px;
            margin-top: 10px;
            color: white;
            background: #6A42C2;
            border: none;
            border-radius: 5px;
        }

        #planModal {
            position: absolute;
            position: fixed;

            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);

            z-index: 1000;

            background-color: white;

            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);

            padding: 20px;

            border-radius: 8px;

            max-width: 500px;

            width: 90%;

        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
        }

        .wave {
            position: absolute;
            bottom: 0;
            opacity: 80%;
        }
    </style>

</head>

<!-- the body -->
<body>


    <header>
        <div id="header">
            <div id="brand-div">
                <p id="brand-name">Beefit</p>
            </div>

            <?php if (isset($_SESSION["user_id"])): ?>
                <div id="user-div">
                    <h1 id="username"><?php echo $_SESSION["username"]; ?></h1>
                    <form method="POST" action="index.php">
                        <button class="logout-button" type="submit" name="logout">Logout</button>
                    </form>
                </div>
            <?php endif; ?>
        </div>
    </header>

    <div id="container">

        <?php if (!isset($_SESSION["user_id"])): ?>
            <svg class="wave" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320">
                <defs>
                    <linearGradient id="gradient1" x1="0%" y1="0%" x2="100%" y2="100%">
                        <stop offset="0%" style="stop-color:#8B5DFF;stop-opacity:1" />
                        <stop offset="100%" style="stop-color:#4C2A9E;stop-opacity:1" />
                    </linearGradient>
                </defs>
                <path fill="url(#gradient1)"
                    d="M0,96L80,128C160,160,320,224,480,213.3C640,203,
            800,117,960,85.3C1120,53,1280,75,1360,85.3L1440,96L1440,320L1360,320C1280,320,1120,320,960,320C800,320,640,320,480,320C320,320,160,320,80,320L0,320Z">
                </path>
            </svg>
            <div id="login-container">

                <div id="login-section" class="">
                    <h2 id="welcomeBackMessage">Welcome back!</h2>

                    <form id="login-form" action="index.php" method="POST">
                        <?php if (isset($login_error)) {
                            echo "<p style='color:red;'>$login_error</p>";
                        } ?>

                        <div class="input-container">
                            <i class="fas fa-user"></i>
                            <input type="text" id="login_username" name="login_username" required
                                placeholder="Enter your username"><br><br>
                        </div>

                        <div class="input-container">
                            <i class="fas fa-lock"></i>
                            <input type="password" id="login_password" name="login_password" required
                                placeholder="Enter your password"><br><br>
                        </div>

                        <button id="login-button" type="submit" name="login" value="Login">LOGIN</button>
                    </form>
                    <div id="goto-signup">
                        <p>Don't have an account? <button type="button" onclick="toggleForm('signup')">Sign Up</button></p>
                    </div>
                </div>


                <div id="signup-section" class="hidden">
                    <h2>Join us</h2>
                    <?php if (isset($signup_success)) {
                        echo "<p style='color:green;'>$signup_success</p>";
                    } ?>
                    <?php if (isset($signup_error)) {
                        echo "<p style='color:red;'>$signup_error</p>";
                    } ?>

                    <form id="signup-form" action="index.php" method="POST">
                        <div class="input-container">
                            <i class="fas fa-user"></i>
                            <input type="text" id="username" name="username" required
                                placeholder="Enter your username"><br><br>
                        </div>

                        <div class="input-container">
                            <i class="fas fa-lock"></i>
                            <input type="password" id="password" name="password" required
                                placeholder="Enter your password"><br><br>
                        </div>

                        <button id="signup-button" type="submit" name="signup" value="signup">SIGN UP</button>
                    </form>
                    <div id="goto-login">
                        <p>Already have an account? <button type="button" onclick="toggleForm('login')">Log In</button></p>
                    </div>
                </div>

            </div>
        <?php endif; ?>

        <?php if (isset($_SESSION["user_id"])): ?>
            <div class="main-content<?php echo !isset($_SESSION["user_id"]) ? ' hidden' : ''; ?>">

                <section class="today-container">
                    <?php $date_today = date('Y-m-d'); ?>

                    <h1>Today</h1>

                    <?php

                    $meals_by_type = [];
                    $date = null;

                    while ($row = $mealPlan_result->fetch_assoc()):

                        $date = htmlspecialchars($row['date']);


                        if ($date === $date_today):
                            $meal_type = htmlspecialchars($row['meal_type']);
                            $food_name = htmlspecialchars($row['name']);
                            $calories = intval($row['calories']);



                            $meals_by_type[$meal_type][] = ['food_name' => $food_name, 'calories' => $calories];
                        endif;
                    endwhile;
                    ?>
                    <?php if (!$date === null): ?>
                        <h2><?= $date ?></h2>
                    <?php endif; ?>
                    <?php $total_calories = 0; ?>
                    <?php if (!empty($meals_by_type)): ?>
                        <?php foreach ($meals_by_type as $meal_type => $foods): ?>

                            <h2><?= $meal_type ?></h2>
                            <ul>
                                <?php

                                $meal_type_total_calories = 0;

                                foreach ($foods as $food):
                                    $meal_type_total_calories += $food['calories'];
                                    ?>
                                    <li><?= $food['food_name'] ?> (<?= $food['calories'] ?> calories)</li>
                                <?php endforeach; ?>
                            </ul>
                            <?php $total_calories += $meal_type_total_calories ?>
                            <p><strong>Total Calories for <?= $meal_type ?>:</strong> <?= $meal_type_total_calories ?></p>
                        <?php endforeach; ?>
                        <h3><strong>Total Calories: </strong><?= $total_calories ?></h3>
                    <?php else: ?>
                        <p>No meals found for today.</p>
                    <?php endif; ?>
                </section>


                <section class="foods-container">
                    <h1>Plan Meal</h1>
                    <?php if (isset($_GET["success"]) && $_GET["success"] == "true"): ?>
                    <?php endif; ?>


                    <form method="POST" action="index.php">
                        <div class="food-input-div">
                            <label for="date-picker">Select Date:</label>
                            <input class="food-input" type="text" id="date-picker" name="date">


                            <h2>Breakfast</h2>
                            <label for="breakfast_select">Select Breakfast Food:</label>
                            <select id="breakfast_select" onchange="addToList('breakfast')">
                                <option value="">Choose Food</option>
                                <?php while ($food = $foods_result->fetch_assoc()): ?>
                                    <option value="<?php echo $food["id"]; ?>">
                                        <?php echo $food["name"]; ?> - <?php echo $food[
                                                "calories"
                                            ]; ?> kcal
                                    </option>
                                <?php endwhile; ?>
                            </select>

                            <ul id="breakfast-list" class="selected-foods"></ul>
                            <input class="food-input" class="food-input" type="hidden" name="breakfast_ids[]"
                                id="breakfast_ids">


                            <h2>Lunch</h2>
                            <label for="lunch_select">Select Lunch Food:</label>
                            <select id="lunch_select" onchange="addToList('lunch')">
                                <option value="">Choose Food</option>
                                <?php $foods_result->data_seek(0);

                                ?>
                                <?php while ($food = $foods_result->fetch_assoc()): ?>
                                    <option value="<?php echo $food["id"]; ?>">
                                        <?php echo $food["name"]; ?> - <?php echo $food[
                                                "calories"
                                            ]; ?> kcal
                                    </option>
                                <?php endwhile; ?>
                            </select>

                            <ul id="lunch-list" class="selected-foods"></ul>
                            <input class="food-input" type="hidden" name="lunch_ids[]" id="lunch_ids">


                            <h2>Dinner</h2>
                            <label for="dinner_select">Select Dinner Food:</label>
                            <select id="dinner_select" onchange="addToList('dinner')">
                                <option value="">Choose Food</option>
                                <?php $foods_result->data_seek(0);

                                ?>
                                <?php while ($food = $foods_result->fetch_assoc()): ?>
                                    <option value="<?php echo $food["id"]; ?>">
                                        <?php echo $food["name"]; ?> - <?php echo $food[
                                                "calories"
                                            ]; ?> kcal
                                    </option>
                                <?php endwhile; ?>
                            </select>

                            <ul id="dinner-list" class="selected-foods"></ul>
                            <input type="hidden" name="dinner_ids[]" id="dinner_ids">
                        </div>


                        <button id="confirm-meal-button" type="submit" name="submit_foods">Confirm</button>
                    </form>

                </section>

            </div>

            <?php
            echo '<div class="meal-plan-container">';


            $today = date('Y-m-d');
            $mealPlan_result->data_seek(0);

            $years = [];
            while ($row = $mealPlan_result->fetch_assoc()) {
                if ($row["date"] >= $today) {
                    $years[date('Y', strtotime($row["date"]))] = true;
                }
            }
            $years = array_keys($years);
            echo '<div class="meal-plan-year">';
            foreach ($years as $year) {
                echo '<div class="meal-plan-year">';
                echo '<h1>' . htmlspecialchars($year) . '</h1>';


                $mealPlan_result->data_seek(0);
                $months = [];
                while ($row = $mealPlan_result->fetch_assoc()) {
                    if (date('Y', strtotime($row["date"])) == $year && $row["date"] >= $today) {
                        $months[date('F', strtotime($row["date"]))] = true;
                    }
                }
                $months = array_keys($months);

                foreach ($months as $month) {
                    echo '<h2>' . htmlspecialchars($month) . '</h2>';
                    echo '<div class="meal-plan-month">';


                    $mealPlan_result->data_seek(0);
                    $days = [];
                    while ($row = $mealPlan_result->fetch_assoc()) {
                        if (
                            date('Y', strtotime($row["date"])) == $year &&
                            date('F', strtotime($row["date"])) == $month &&
                            $row["date"] >= $today
                        ) {
                            $days[date('d', strtotime($row["date"]))] = true;
                        }
                    }
                    $days = array_keys($days);

                    foreach ($days as $day) {
                        echo '<div class="meal-plan-date">';
                        echo '<h3>Day ' . htmlspecialchars($day) . '</h3>';


                        $mealPlan_result->data_seek(0);
                        $mealGroups = [];

                        while ($row = $mealPlan_result->fetch_assoc()) {
                            if (
                                date('Y', strtotime($row["date"])) == $year &&
                                date('F', strtotime($row["date"])) == $month &&
                                date('d', strtotime($row["date"])) == $day &&
                                $row["date"] >= $today
                            ) {
                                $mealType = $row["meal_type"];
                                if (!isset($mealGroups[$mealType])) {
                                    $mealGroups[$mealType] = [];
                                }
                                $mealGroups[$mealType][] = [
                                    "id" => $row["id"],
                                    "name" => $row["name"],
                                    "calories" => $row["calories"]
                                ];
                            }
                        }

                        foreach ($mealGroups as $mealType => $meals) {
                            echo '<div class="meal-plan-meal-type">';
                            echo '<h4>' . htmlspecialchars($mealType) . '</h4>';
                            foreach ($meals as $meal) {
                                echo '<div class="meal-item">';
                                echo '<span class = "food-name">' . htmlspecialchars($meal["name"]) . ' (' . htmlspecialchars($meal["calories"]) . ')</span>';
                                echo '<form method="POST" action="index.php" style="display:inline-block;">';
                                echo '<input type="hidden" name="meal_id" value="' . htmlspecialchars($meal["id"]) . '">';
                                echo '<button type="submit" class="delete-button" title="Delete">&times;</button>';
                                echo '</form>';
                                echo '</div>';
                            }
                            echo '</div>';
                        }

                        echo '</div>';
                    }

                    echo '</div>';
                }

                echo '</div>';
            }

            echo '</div>';
            ?>
            </aside>

        </div>
        </div>
        <section class="plans-container">

            <h1>Plans</h1>
            <div class="plans-grid">
                <?php if ($plans_result->num_rows > 0): ?>
                    <?php while ($plan = $plans_result->fetch_assoc()): ?>
                        <div class="plan-card">
                            <img src="/img<?= htmlspecialchars($plan['image_path'], ENT_QUOTES, 'UTF-8') ?>" alt="Plan Image">
                            <div class="plan-content">
                                <h3><?php echo htmlspecialchars($plan["title"]); ?></h3>
                                <p><?php echo htmlspecialchars($plan["description"]); ?></p>
                                <form action="index.php" method="POST">
                                    <input type="hidden" name="plan_id" value="<?php echo $plan['id']; ?>">
                                    <input type="hidden" name="form_submitted" value="1">
                                    <button id="view-plan-button" type="submit" name="view_plan">View Plan</button>
                                </form>
                            </div>
                        </div>
                    <?php endwhile; ?>
                <?php endif; ?>
            </div>
        </section>

        <?php if ($_SESSION['open-modal'] == true): ?>
            <div id="planModal" class="modal">
                <div class="modal-content">
                    <span class="close" onclick="closePlanModal()">&times;</span>

                    <?php if ($plan = $plan_result->fetch_assoc()): ?>
                        <h2 id="modal-title"><?= htmlspecialchars($plan['title']); ?></h2>
                        <p id="modal-description"><?= htmlspecialchars($plan['description']); ?></p>
                        <p id="modal-duration"><?= htmlspecialchars($plan['duration_days']); ?> days</p>

                        <div id="modal-schedule">
                            <?php if ($schedule_result->num_rows > 0): ?>
                                <ul>
                                    <?php while ($schedule = $schedule_result->fetch_assoc()): ?>
                                        <li><strong>Day <?php echo $schedule['day_number']; ?>:</strong>
                                            <?php echo htmlspecialchars($schedule['activity_description']); ?></li>
                                    <?php endwhile; ?>
                                </ul>
                            <?php else: ?>
                                <p>No schedule available for this plan.</p>
                            <?php endif; ?>
                        </div>
                    <?php endif; ?>


                </div>
            </div>
        <?php endif; ?>


    <?php endif; ?>

<!-- Javascript-->
    <script src="https://cdn.jsdelivr.net/npm/pikaday/pikaday.js"></script>

    <script>

        const picker = new Pikaday({
            field: document.getElementById('date-picker'),
            minDate: new Date(),
            format: 'YYYY-MM-DD',
            onSelect: function (date) {
                console.log('Selected date: ', date);
            }
        });

        function toggleForm(formType) {
            const loginSection = document.getElementById('login-section');
            const signupSection = document.getElementById('signup-section');

            if (formType === 'login') {
                loginSection.classList.remove('hidden');
                signupSection.classList.add('hidden');
            } else if (formType === 'signup') {
                signupSection.classList.remove('hidden');
                loginSection.classList.add('hidden');
            }
        }

        function addToList(mealType) {
            const foodSelect = document.getElementById(mealType + "_select");
            const foodId = foodSelect.value;
            const foodText = foodSelect.options[foodSelect.selectedIndex].text;
            const list = document.getElementById(mealType + "-list");

            if (foodId !== "") {

                const listItem = document.createElement("li");
                listItem.textContent = foodText;
                listItem.setAttribute("data-food-id", foodId);

                const removeBtn = document.createElement("button");
                removeBtn.textContent = "Remove";
                removeBtn.classList.add("remove-btn");
                removeBtn.onclick = function () {
                    list.removeChild(listItem);
                    updateFoodIds(mealType);
                };


                listItem.appendChild(removeBtn);

                list.appendChild(listItem);


                updateFoodIds(mealType);


                foodSelect.value = "";
            }
        }

        function updateFoodIds(mealType) {
            const foodIds = [];
            const listItems = document.getElementById(mealType + "-list").children;


            for (let i = 0; i < listItems.length; i++) {
                const foodId = listItems[i].getAttribute("data-food-id");
                foodIds.push(foodId);
            }


            document.getElementById(mealType + "_ids").value = foodIds.join(',');
        }

        function closePlanModal() {

            document.getElementById('planModal').style.display = 'none';


        }

    </script>

    <?php if ($_SESSION['is_login'] === false): ?>
        <script>
            document.getElementById('login-section').style.display = 'none';
        </script>
    <?php endif; ?>

</body>

</html>