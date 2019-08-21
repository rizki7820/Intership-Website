<!DOCTYPE html>
<html>
<head>
    <title>Registration Form</title>
    <link href="https://fonts.googleapis.com/css?family=Hepta+Slab&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="assets/css/regist.css">
</head>
<body>
    <div class="box-form">
        <h2>Register</h2><hr><br>
        <form action="proses-daftar.php" method="post">
            Full Name :<br><br>
                <input type="text" name="name" required/><br><br>
            Gender :<br><br>
                <label class="container">Male
                <input type="radio" checked="checked" name="radio">
                <span class="checkmark"></span>
                </label>
                <label class="container">Female
                <input type="radio" checked="checked" name="radio">
                <span class="checkmark"></span>
                </label>
                <br>
            User Name :<br><br>      
                <input type="email" name="username" required/><br>
            Password :<br><br> 
                <input type="password" name="pass" required/><br><br>
            Cell Phone :<br><br>
                <input type="text" name="telp" required/><br><br>
           
            Address :<br><br>
                <textarea name="address" rows="5" cols="50" type="address"></textarea><br><br>
                <input type="submit" value="Cancel" onclick="window.history.back()"/>
                <input type="submit" name="register" value="Register Now">
        </form>
    </div>         
</body>
</html>
