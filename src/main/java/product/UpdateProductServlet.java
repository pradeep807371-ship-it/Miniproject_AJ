package product;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class UpdateProductServlet extends HttpServlet {

protected void doPost(HttpServletRequest req,HttpServletResponse res)
throws ServletException, IOException {

res.setContentType("text/html");
PrintWriter out = res.getWriter();

String sid=req.getParameter("id");
String name=req.getParameter("name");
String p=req.getParameter("price");
String q=req.getParameter("quantity");

try{

int id=Integer.parseInt(sid);
double price=Double.parseDouble(p);
int quantity=Integer.parseInt(q);

if(price<0 || quantity<0){
out.println("<h2>Negative values not allowed</h2>");
out.println("<a href='updateProduct.jsp'>Back</a>");
return;
}

Connection con=DBConnection.getCon();

PreparedStatement ps=con.prepareStatement(
"update products set name=?,price=?,quantity=? where id=?");

ps.setString(1,name);
ps.setDouble(2,price);
ps.setInt(3,quantity);
ps.setInt(4,id);

int x=ps.executeUpdate();

if(x>0)
out.println("<h2>Product Updated Successfully</h2>");
else
out.println("<h2>ID Not Found</h2>");

out.println("<a href='dashboard.jsp'>Home</a>");

}catch(Exception e){
out.println("<h2>Invalid Input Data</h2>");
out.println("<a href='updateProduct.jsp'>Back</a>");
}
}
}