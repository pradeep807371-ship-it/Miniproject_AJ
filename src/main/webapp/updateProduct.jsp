<%@ page import="java.sql.*,product.DBConnection" %>

<%
String idParam = request.getParameter("id");
ResultSet rs = null;
boolean found = false;

if(idParam != null && !idParam.isEmpty()){
    try{
        int id = Integer.parseInt(idParam);

        Connection con = DBConnection.getCon();

        PreparedStatement ps = con.prepareStatement(
            "select * from products where id=?"
        );

        ps.setInt(1,id);
        rs = ps.executeQuery();

        if(rs.next()){
            found = true;
        }
    }catch(Exception e){
        out.println("<p style='color:red;'>Invalid ID format</p>");
    }
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Edit Product</title>
</head>
<body>

<h2>Search Product by ID</h2>

<form method="get">
    Enter ID:
    <input type="number" name="id" required>
    <input type="submit" value="Search">
</form>

<hr>

<%
if(idParam != null){
    if(found){
%>

<h2>Edit Product</h2>

<form action="UpdateProductServlet" method="post">

ID:
<input type="text" name="id"
value="<%=rs.getInt("id")%>" readonly><br><br>

Name:
<input type="text" name="name"
value="<%=rs.getString("name")%>" required><br><br>

Price:
<input type="number" name="price" min="0" step="0.01"
value="<%=rs.getDouble("price")%>" required><br><br>

Quantity:
<input type="number" name="quantity" min="0"
value="<%=rs.getInt("quantity")%>" required><br><br>

<input type="submit" value="Update Product">

</form>

<%
    } else {
%>
<p style="color:red;">ID not found</p>
<%
    }
}
%>

</body>
</html>