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
import java.util.ArrayList;
import java.util.List;

import model.Student;
import util.DBConnection;

@WebServlet("/show_all")
public class ShowStudentsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        List<Student> students = new ArrayList<>();

        String sql = "SELECT student_id, name, email, " +
                     "department, year FROM students " +
                     "ORDER BY student_id";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

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

                students.add(student);
            }

            request.setAttribute("students", students);

            request.getRequestDispatcher("students.jsp")
                   .forward(request, response);

        } catch (Exception e) {

            throw new ServletException(
                    "Unable to display students.", e);
        }
    }
}