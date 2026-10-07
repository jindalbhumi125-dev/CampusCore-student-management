<%@ page import="java.util.List" %>
<%@ page import="model.Student" %>

<!DOCTYPE html>
<html>

<head>

    <title>Search Student</title>

    <style>

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 30px;
        }

        .container {
            width: 90%;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px #cccccc;
        }

        h1 {
            text-align: center;
        }

        .search-box {
            text-align: center;
            margin: 25px;
        }

        input {
            padding: 10px;
            width: 300px;
        }

        button {
            padding: 10px 20px;
            background-color: #333333;
            color: white;
            border: none;
            cursor: pointer;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 25px;
        }

        th, td {
            padding: 12px;
            border: 1px solid #cccccc;
            text-align: center;
        }

        th {
            background-color: #333333;
            color: white;
        }

        .back {
            display: block;
            text-align: center;
            margin-top: 25px;
            text-decoration: none;
        }

    </style>

</head>

<body>

<div class="container">

    <h1>Search Student</h1>

    <div class="search-box">

        <form action="search" method="get">

            <input type="text"
                   name="search"
                   placeholder="Enter Student ID or Name"
                   value="<%= request.getAttribute("searchValue") != null
                           ? request.getAttribute("searchValue")
                           : "" %>"
                   required>

            <button type="submit">
                Search
            </button>

        </form>

    </div>

    <%
        List<Student> students =
                (List<Student>) request.getAttribute("students");

        if (students != null && !students.isEmpty()) {
    %>

    <table>

        <tr>
            <th>Student ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Department</th>
            <th>Year</th>
        </tr>

        <%
            for (Student student : students) {
        %>

        <tr>

            <td><%= student.getStudentId() %></td>

            <td><%= student.getName() %></td>

            <td><%= student.getEmail() %></td>

            <td><%= student.getDepartment() %></td>

            <td><%= student.getYear() %></td>

        </tr>

        <%
            }
        %>

    </table>

    <%
        } else if (request.getAttribute("students") != null) {
    %>

    <p style="text-align:center;">
        No student found.
    </p>

    <%
        }
    %>

    <a class="back" href="index.jsp">
        ? Back to Registration
    </a>

    <a class="back" href="show_all">
        View All Students
    </a>

</div>

</body>

</html>