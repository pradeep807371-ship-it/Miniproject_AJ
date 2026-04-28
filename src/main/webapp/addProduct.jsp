<%@ page import="java.sql.*,product.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
<title>Add Product</title>

<style>
body{
font-family:Arial;
background:lightgreen;
margin:0;
padding:0;
}

.box{
width:420px;
margin:auto;
margin-top:70px;
background:white;
padding:30px;
border-radius:10px;
box-shadow:0 0 10px gray;
}

h1{
text-align:center;
color:#333;
}

input{
width:100%;
padding:10px;
margin-top:8px;
margin-bottom:15px;
box-sizing:border-box;
}

input[type=submit]{
background:green;
color:white;
border:none;
font-size:16px;
cursor:pointer;
}

input[type=submit]:hover{
background:darkgreen;
}

a{
text-decoration:none;
font-size:16px;
}
</style>

<script>
function validateForm(){

let name=document.forms["f"]["name"].value.trim();
let price=document.forms["f"]["price"].value.trim();
let quantity=document.forms["f"]["quantity"].value.trim();

let namePattern=/^[A-Za-z ]+$/;

if(name==""){
alert("Enter Product Name");
return false;
}

if(!namePattern.test(name)){
alert("Product Name must contain letters only");
return false;
}

if(price=="" || isNaN(price)){
alert("Enter valid Price");
return false;
}

if(parseFloat(price)<0){
alert("Price cannot be negative");
return false;
}

if(quantity=="" || isNaN(quantity)){
alert("Enter valid Quantity");
return false;
}

if(parseInt(quantity)<0){
alert("Quantity cannot be negative");
return false;
}

return true;
}
</script>

</head>
<body>

<%
int nextId=1;

try{
Connection con=DBConnection.getCon();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select max(id) from products");

if(rs.next()){
nextId=rs.getInt(1)+1;
}
}catch(Exception e){}
%>

<div class="box">

<h1>Add Product</h1>

<form name="f" action="AddProductServlet" method="post" onsubmit="return validateForm()">

Product ID:
<input type="text" value="<%=nextId%>" readonly>

Product Name:
<input type="text" name="name" required>

Price:
<input type="text" name="price" required>

Quantity:
<input type="text" name="quantity" required>

<input type="submit" value="Add Product">

</form>

<center>
<a href="dashboard.jsp">Home</a>
</center>

</div>

</body>
</html>