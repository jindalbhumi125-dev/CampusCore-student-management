package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DBConnection;

@WebServlet("/register")
public class RegisterStudentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        int studentId = Integer.parseInt(
                request.getParameter("studentId"));

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String department = request.getParameter("department");

        int year = Integer.parseInt(
                request.getParameter("year"));

        try (Connection conn = DBConnection.getConnection()) {

            // Check whether Student ID already exists
            String checkSql =
                    "SELECT student_id FROM students WHERE student_id = ?";

            try (PreparedStatement checkPs =
                         conn.prepareStatement(checkSql)) {

                checkPs.setInt(1, studentId);

                ResultSet rs = checkPs.executeQuery();

                if (rs.next()) {

                    response.setContentType("text/html");

                    response.getWriter().println(
                        "<html><head><title>Already Registered</title></head>"
                        + "<body style='font-family:Arial;text-align:center;"
                        + "padding:50px;'>"
                        + "<h1>Student Already Registered!</h1>"
                        + "<p>Student ID <b>" + studentId
                        + "</b> is already registered.</p>"
                        + "<p>Please use a different Student ID.</p>"
                        + "<br>"
                        + "<a href='index.jsp'>Go Back to Registration</a>"
                        + "</body></html>"
                    );

                    return;
                }
            }

            // Insert new student
            String sql =
                    "INSERT INTO students "
                    + "(student_id, name, email, department, year) "
                    + "VALUES (?, ?, ?, ?, ?)";

            try (PreparedStatement ps =
                         conn.prepareStatement(sql)) {

                ps.setInt(1, studentId);
                ps.setString(2, name);
                ps.setString(3, email);
                ps.setString(4, department);
                ps.setInt(5, year);

                ps.executeUpdate();
            }

            response.sendRedirect("show_all");

        } catch (Exception e) {

            throw new ServletException(
                    "Unable to register student.", e);
        }
    }
}