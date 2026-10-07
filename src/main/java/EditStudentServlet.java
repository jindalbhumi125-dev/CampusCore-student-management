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

import model.Student;
import util.DBConnection;

@WebServlet("/edit")
public class EditStudentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int studentId = Integer.parseInt(
                request.getParameter("id"));

        String sql = "SELECT * FROM students WHERE student_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, studentId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                Student student = new Student();

                student.setStudentId(
                        rs.getInt("student_id"));

                student.setName(
                        rs.getString("name"));

                student.setEmail(
                        rs.getString("email"));

                student.setDepartment(
                        rs.getString("department"));

                student.setYear(
                        rs.getInt("year"));

                request.setAttribute("student", student);

                request.getRequestDispatcher("edit.jsp")
                       .forward(request, response);

            } else {

                response.sendRedirect("show_all");
            }

        } catch (Exception e) {

            throw new ServletException(
                    "Unable to load student details.", e);
        }
    }

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

        String sql = "UPDATE students SET name=?, email=?, "
                   + "department=?, year=? "
                   + "WHERE student_id=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, department);
            ps.setInt(4, year);
            ps.setInt(5, studentId);

            ps.executeUpdate();

            response.sendRedirect("show_all");

        } catch (Exception e) {

            throw new ServletException(
                    "Unable to update student.", e);
        }
    }
}