<%@ page import="model.Student" %>

<%
    Student student =
            (Student) request.getAttribute("student");
%>

<!DOCTYPE html>
<html>

<head>

    <title>Edit Student</title>

    <style>

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 30px;
        }

        .container {
            width: 500px;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px #cccccc;
        }

        h1 {
            text-align: center;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            box-sizing: border-box;
        }

        button {
            width: 100%;
            padding: 12px;
            margin-top: 25px;
            background-color: #333333;
            color: white;
            border: none;
            cursor: pointer;
        }

        button:hover {
            background-color: #555555;
        }

        .back {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
        }

    </style>

</head>

<body>

<div class="container">

    <h1>Edit Student</h1>

    <form action="edit" method="post">

        <label>Student ID</label>

        <input type="number"
               name="studentId"
               value="<%= student.getStudentId() %>"
               readonly>

        <label>Student Name</label>

        <input type="text"
               name="name"
               value="<%= student.getName() %>"
               required>

        <label>Email</label>

        <input type="email"
               name="email"
               value="<%= student.getEmail() %>"
               required>

        <label>Department</label>

        <select name="department" required>

            <option value="MCA"
                <%= student.getDepartment().equals("MCA") ? "selected" : "" %>>
                MCA
            </option>

            <option value="BCA"
                <%= student.getDepartment().equals("BCA") ? "selected" : "" %>>
                BCA
            </option>

            <option value="MBA"
                <%= student.getDepartment().equals("MBA") ? "selected" : "" %>>
                MBA
            </option>

            <option value="BBA"
                <%= student.getDepartment().equals("BBA") ? "selected" : "" %>>
                BBA
            </option>

        </select>

        <label>Year</label>

        <select name="year" required>

            <option value="1"
                <%= student.getYear() == 1 ? "selected" : "" %>>
                1st Year
            </option>

            <option value="2"
                <%= student.getYear() == 2 ? "selected" : "" %>>
                2nd Year
            </option>

            <option value="3"
                <%= student.getYear() == 3 ? "selected" : "" %>>
                3rd Year
            </option>

            <option value="4"
                <%= student.getYear() == 4 ? "selected" : "" %>>
                4th Year
            </option>

        </select>

        <button type="submit">
            Update Student
        </button>

    </form>

    <a class="back" href="show_all">
        ? Back to Students
    </a>

</div>

</body>

</html>