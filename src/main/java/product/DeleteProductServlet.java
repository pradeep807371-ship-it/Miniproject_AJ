package product;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class DeleteProductServlet extends HttpServlet {

protected void doPost(HttpServletRequest req,HttpServletResponse res)
throws ServletException, IOException {

res.setContentType("text/html");
PrintWriter out = res.getWriter();

String sid=req.getParameter("id");

try{

int id=Integer.parseInt(sid);

Connection con=DBConnection.getCon();

PreparedStatement ps=con.prepareStatement(
"delete from products where id=?");

ps.setInt(1,id);

int x=ps.executeUpdate();

if(x>0)
out.println("<h2>Product Deleted Successfully</h2>");
else
out.println("<h2>ID Not Found</h2>");

out.println("<a href='dashboard.jsp'>Home</a>");

}catch(Exception e){
out.println("<h2>Invalid ID</h2>");
out.println("<a href='deleteProduct.jsp'>Back</a>");
}
}
}