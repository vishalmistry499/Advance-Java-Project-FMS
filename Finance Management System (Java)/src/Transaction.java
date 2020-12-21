

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLIntegrityConstraintViolationException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Transaction
 */
public class Transaction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Transaction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		int CustId=Integer.parseInt(session.getAttribute("CId").toString());
		int SchemeId=Integer.parseInt(session.getAttribute("SchemeId").toString());
		int TransId=Integer.parseInt(request.getParameter("TId").toString());
		String CustName=session.getAttribute("CustName").toString();
		String CustAddress=request.getParameter("CustAddress").toString();
		String TypeOfPurchase=request.getParameter("TypeOfPurchase").toString();
		String TypeOfInvestment=request.getParameter("TypeOfInvestment").toString();
		double CustInterest=Double.parseDouble(request.getParameter("CustInterest").toString());
		double CustAmount=Double.parseDouble(request.getParameter("CustAmount").toString());
		double CustTenure=Double.parseDouble(request.getParameter("CustTem").toString());
		String CustBankName=request.getParameter("BankName").toString();
		String TDate=request.getParameter("PaymentDate").toString();
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/fms","root","root");
			Statement st=con.createStatement();
			String query="INSERT INTO `transactions`(`CustId`, `CustName`, `CustAddress`, `TypeOfPurchase`, `TypeOfScheme`, `SchemeId`, `Amount`, `Interest`, `Tenure`, `SchemeProvider`,`TransactionId`,`TransactionDate`) "
					+ "VALUES ("+CustId+",'"+CustName+"','"+CustAddress+"','"+TypeOfPurchase+"','"+TypeOfInvestment+"',"+SchemeId+","+CustAmount+","+CustInterest+","+CustTenure+",'"+CustBankName+"',"+TransId+",'"+TDate+"')";
			int cnt=st.executeUpdate(query);
			if(cnt>0)
			{
				response.setContentType("text/html");
				out.println("<script type=\"text/javascript\">alert('Transaction Succesful!');window.location.href='home.jsp';</script>");
			}
			else
			{
				response.setContentType("text/html");
				out.println("<script type=\"text/javascript\">alert('Transaction Unsuccesful!');window.location.href='home.jsp';</script>");
			}
		}
	 catch (SQLIntegrityConstraintViolationException e) {
		 response.setContentType("text/html");
			out.println("<script type=\"text/javascript\">alert('You have already applied for this scheme!');window.location.href='home.jsp';</script>");
	 }
		catch(Exception e)
		{
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
