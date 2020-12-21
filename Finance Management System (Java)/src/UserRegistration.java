

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;  
public class UserRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public UserRegistration() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String name=fname+" "+lname;
		String email=request.getParameter("email");
		int age=Integer.parseInt(request.getParameter("age"));
		Long phone=Long.parseLong(request.getParameter("phone"));
		String gender=request.getParameter("gender");
		String dob=request.getParameter("dob");
		//DateTimeFormatter format = DateTimeFormatter.ofPattern("dd-mmm-yyyy");
		//LocalDate dob = LocalDate.parse(date,format); 
		String Country=request.getParameter("Country");
		String State=request.getParameter("State");
		String City=request.getParameter("City");
		String uname=request.getParameter("name");
		String pass=request.getParameter("password");
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/fms","root","root");
			Statement st=con.createStatement();
			String query="INSERT INTO `user`(`Name`, `Age`, `PhoneNo`, `Gender`, `DOB`, `Country`, `State`, `City`, `Username`, `Password`, `Email`) "
					+ "VALUES ('"+name+"',"+age+","+phone+",'"+gender+"','"+dob+"','"+Country+"','"+State+"','"+City+"','"+uname+"','"+pass+"','"+email+"')";
			int cnt=st.executeUpdate(query);
			if(cnt>0)
			{
				response.setContentType("text/html");
			 	out.println("<script type=\"text/javascript\">alert('Registration Successful');window.location.href='index.html';</script>");
			}
			else
			{
				response.setContentType("text/html");
			 	out.println("<script type=\"text/javascript\">alert('Error while Registrating User!Try again Later');window.location.href='sign.html';</script>");
			}
		}
		catch ( Exception e) {
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
