import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ProfileBean;
import database.DBConnection;

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String name = request.getParameter("name");
            String studentID = request.getParameter("studentID");
            String program = request.getParameter("program");
            String email = request.getParameter("email");
            String hobby = request.getParameter("hobby");
            String intro = request.getParameter("intro");

            ProfileBean profile = new ProfileBean();
            profile.setName(name);
            profile.setStudentID(studentID);
            profile.setProgram(program);
            profile.setEmail(email);
            profile.setHobby(hobby);
            profile.setIntro(intro);

            Connection con = DBConnection.getConnection();

if(con == null){
    throw new Exception("Database connection failed");
}

            String sql = "INSERT INTO profiles(name,studentID,program,email,hobby,intro) VALUES(?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, profile.getName());
            ps.setString(2, profile.getStudentID());
            ps.setString(3, profile.getProgram());
            ps.setString(4, profile.getEmail());
            ps.setString(5, profile.getHobby());
            ps.setString(6, profile.getIntro());

            ps.executeUpdate();

            request.setAttribute("profile", profile);

            request.getRequestDispatcher("profile.jsp").forward(request, response);

        } catch(Exception e){
            e.printStackTrace();
        }
    }
}