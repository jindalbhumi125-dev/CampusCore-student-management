<%@ page import="java.util.List" %>
<%@ page import="model.Student" %>

<!DOCTYPE html>
<html>
<head>

    <title>Registered Students</title>

    <style>

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 30px;
        }

        .container {
            width: 95%;
            margin: auto;
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 0 10px #cccccc;
        }

        h1 {
            text-align: center;
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

        .btn {
            padding: 7px 12px;
            text-decoration: none;
            color: white;
            background-color: #333333;
            border-radius: 4px;
        }

        .delete {
            background-color: #777777;
        }

        .home {
            display: inline-block;
            margin-top: 25px;
            text-decoration: none;
        }

    </style>

</head>

<body>

<div class="container">

    <h1>Registered Students</h1>

    <table>

        <tr>
            <th>Student ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Department</th>
            <th>Year</th>
            <th>Actions</th>
        </tr>

        <%
            List<Student> students =
                    (List<Student>) request.getAttribute("students");

            if (students != null && !students.isEmpty()) {

                for (Student student : students) {
        %>

        <tr>

            <td>
                <%= student.getStudentId() %>
            </td>

            <td>
                <%= student.getName() %>
            </td>

            <td>
                <%= student.getEmail() %>
            </td>

            <td>
                <%= student.getDepartment() %>
            </td>

            <td>
                <%= student.getYear() %>
            </td>

            <td>

                <a class="btn"
                   href="edit?id=<%= student.getStudentId() %>">
                    Edit
                </a>

                <a class="btn delete"
                   href="delete?id=<%= student.getStudentId() %>"
                   onclick="return confirm('Delete this student?');">
                    Delete
                </a>

            </td>

        </tr>

        <%
                }

            } else {
        %>

        <tr>
            <td colspan="6">
                No students registered yet.
            </td>
        </tr>

        <%
            }
        %>

    </table>

    <a class="home" href="index.jsp">
        ? Back to Registration
    </a>

</div>

</body>
</html>