package product;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class AddProductServlet extends HttpServlet {

protected void doPost(HttpServletRequest req,HttpServletResponse res)
throws ServletException, IOException {

res.setContentType("text/html");
PrintWriter out = res.getWriter();

String name = req.getParameter("name");
String priceStr = req.getParameter("price");
String qtyStr = req.getParameter("quantity");

try{

if(name == null || name.trim().equals("")){
out.println("<h2>Name Required</h2>");
return;
}

if(!priceStr.matches("\\d+(\\.\\d+)?")){
out.println("<h2>Invalid Price</h2>");
out.println("<a href='addProduct.jsp'>Back</a>");
return;
}

if(!qtyStr.matches("\\d+")){
out.println("<h2>Invalid Quantity</h2>");
out.println("<a href='addProduct.jsp'>Back</a>");
return;
}

double price = Double.parseDouble(priceStr);
int qty = Integer.parseInt(qtyStr);

Connection con = DBConnection.getCon();

PreparedStatement ps = con.prepareStatement(
"insert into products(name,price,quantity) values(?,?,?)");

ps.setString(1,name);
ps.setDouble(2,price);
ps.setInt(3,qty);

ps.executeUpdate();

out.println("<h2>Product Inserted Successfully</h2>");
out.println("<a href='dashboard.jsp'>Home</a>");

}catch(Exception e){
out.println("<h2>Error</h2>");
}
}
}