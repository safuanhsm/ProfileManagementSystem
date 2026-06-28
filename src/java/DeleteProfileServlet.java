package controller;

import java.io.IOException;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import database.DBConnection;

@WebServlet("/deleteProfile")
public class DeleteProfileServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        try {

            // 1. ambil id dari URL
            int id = Integer.parseInt(request.getParameter("id"));

            // 2. connect DB
            Connection con = DBConnection.getConnection();

            // 3. SQL delete
            String sql = "DELETE FROM profiles WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            ps.executeUpdate();

            // 4. balik ke list
            response.sendRedirect("viewProfiles.jsp");

        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}