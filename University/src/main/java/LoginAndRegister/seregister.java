package LoginAndRegister;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/seregister")
public class seregister extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uname = request.getParameter("name");
        String upassword = request.getParameter("password");
        String uemail = request.getParameter("email");
        PrintWriter out = response.getWriter();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/universityguide", "root", "");

            // Check if email already exists
            PreparedStatement checkStmt = con.prepareStatement("SELECT * FROM register WHERE email = ?");
            checkStmt.setString(1, uemail);
            ResultSet rs = checkStmt.executeQuery();
            if (rs.next()) {
                // Email already exists, send response indicating failure
            	  out.println("<script type='text/javascript'>");
                  out.println("alert('Registration failed: Email already exists!');");
                  out.println("location='AdminLTE/loginAndregister/register.jsp';"); // Redirect to login page
                  out.println("</script>");
             
            } else {
                // Email does not exist, proceed with registration
                PreparedStatement pst = con.prepareStatement("INSERT INTO register(name, email, password) VALUES (?, ?, ?)");
                pst.setString(1, uname);
                pst.setString(2, uemail);
                pst.setString(3, upassword);

                int row = pst.executeUpdate();

                if (row > 0) {
                    request.setAttribute("status", "success");
                    response.sendRedirect("AdminLTE/loginAndregister/login.jsp");
                } else {
                    request.setAttribute("status", "fail");
                    request.getRequestDispatcher("AdminLTE/loginAndregister/login.jsp").forward(request, response);
                }
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            out.println(e.getMessage());
        }
    }
}
