<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Student Management System</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 500px;
            margin: 50px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px #cccccc;
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            box-sizing: border-box;
        }

        .btn {
            width: 100%;
            padding: 12px;
            margin-top: 25px;
            border: none;
            background-color: #333333;
            color: white;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #555555;
        }

        .view {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
        }
    </style>
</head>

<body>

<div class="container">

    <h1>Student Management System</h1>

    <form action="register" method="post">

        <label>Student ID</label>
        <input type="number" name="studentId" required>

        <label>Student Name</label>
        <input type="text" name="name" required>

        <label>Email</label>
        <input type="email" name="email" required>

        <label>Department</label>
        <select name="department" required>
            <option value="">Select Department</option>
            <option value="MCA">MCA</option>
            <option value="BCA">BCA</option>
            <option value="MBA">MBA</option>
            <option value="BBA">BBA</option>
        </select>

        <label>Year</label>
        <select name="year" required>
            <option value="">Select Year</option>
            <option value="1">1st Year</option>
            <option value="2">2nd Year</option>
            <option value="3">3rd Year</option>
            <option value="4">4th Year</option>
        </select>

        <button class="btn" type="submit">
            Register Student
        </button>

    </form>

    <a class="view" href="show_all">
        View Registered Students
    </a>
    
    <a class="view" href="search.jsp">
    Search Student
    </a>

</div>

</body>
</html>