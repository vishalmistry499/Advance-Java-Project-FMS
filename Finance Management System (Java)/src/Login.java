

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.sql.*;

/**
 * Servlet Filter implementation class Login
 */
public class Login implements Filter {

    /**
     * Default constructor. 
     */
    public Login() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here

		// pass the request along the filter chain
		String uname=request.getParameter("name");
		String pass=request.getParameter("password");
		try
		{
			int flag=0;
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/fms","root","root");
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select * from user");
			PrintWriter out=response.getWriter();
			while(rs.next())
			{
				String username=rs.getString("Username");
				String psd=rs.getString("Password");
				String name=rs.getString("Name");
				if(username.equals(uname) && psd.equals(pass))
				{
					flag=1;
					HttpServletRequest req=(HttpServletRequest) request;
					HttpSession session=req.getSession();  
				    session.setAttribute("CustName",name);
				    session.setAttribute("CId",rs.getInt("Id"));  
				    session.setAttribute("CustCountry",rs.getString("Country"));  
				    session.setAttribute("CustState",rs.getString("State"));  
				    session.setAttribute("CustCity",rs.getString("City"));  
				    session.setAttribute("CustEmail",rs.getString("Email"));  
				    chain.doFilter(request, response);
					break;
				}
			}
			if(flag==0)
			{
				response.setContentType("text/html");
				out.println("<script type=\"text/javascript\">alert('Invalid Login Credentials');window.location.href='index.html';</script>");
			}
		} 
		catch (Exception e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
