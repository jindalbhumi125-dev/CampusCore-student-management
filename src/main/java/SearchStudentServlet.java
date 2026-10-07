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

@WebServlet("/search")
public class SearchStudentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String search = request.getParameter("search");

        String sql = "SELECT * FROM students "
                   + "WHERE student_id = ? "
                   + "OR name LIKE ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            int studentId;

            try {
                studentId = Integer.parseInt(search);
            } catch (NumberFormatException e) {
                studentId = -1;
            }

            ps.setInt(1, studentId);
            ps.setString(2, "%" + search + "%");

            ResultSet rs = ps.executeQuery();

            java.util.List<Student> students =
                    new java.util.ArrayList<>();

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
            request.setAttribute("searchValue", search);

            request.getRequestDispatcher("search.jsp")
                   .forward(request, response);

        } catch (Exception e) {

            throw new ServletException(
                    "Unable to search student.", e);
        }
    }
}