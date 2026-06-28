package controller;

import java.io.IOException;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import database.DBConnection;

@WebServlet("/updateProfile")
public class UpdateProfileServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        try {

            int id = Integer.parseInt(request.getParameter("id"));

            String name = request.getParameter("name");
            String studentID = request.getParameter("studentID");
            String program = request.getParameter("program");
            String email = request.getParameter("email");
            String hobby = request.getParameter("hobby");
            String intro = request.getParameter("intro");

            Connection con = DBConnection.getConnection();

            String sql = "UPDATE profiles SET name=?, studentID=?, program=?, email=?, hobby=?, intro=? WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, name);
            ps.setString(2, studentID);
            ps.setString(3, program);
            ps.setString(4, email);
            ps.setString(5, hobby);
            ps.setString(6, intro);
            ps.setInt(7, id);

            ps.executeUpdate();

            response.sendRedirect("viewProfiles.jsp");

        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}