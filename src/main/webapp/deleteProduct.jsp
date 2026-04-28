<html>
<head>
<title>Delete Product</title>

<style>
body{
font-family:Arial;
background:#ffe6e6;
text-align:center;
padding-top:100px;
}

.box{
background:white;
width:400px;
margin:auto;
padding:30px;
border-radius:10px;
box-shadow:0 0 10px gray;
}

h1{
color:#cc0000;
}

input[type=number]{
width:80%;
padding:10px;
margin:10px;
}

input[type=submit]{
background:#cc0000;
color:white;
border:none;
padding:10px 25px;
font-size:16px;
border-radius:5px;
cursor:pointer;
}

a{
display:block;
margin-top:15px;
text-decoration:none;
}
</style>

<script>
function confirmDelete() {
    var id = document.forms[0].id.value;

    if(id === ""){
        alert("Please enter Product ID first.");
        return false;
    }

    return confirm(
    "Product ID: " + id + "\n\n" +
    "Warning: You are about to delete this product.\n" +
    "This action is permanent and cannot be undone.\n\n" +
    "Do you want to continue?"
    );
}
</script>

</head>

<body>

<div class="box">

<h1>Delete Product</h1>

<form action="DeleteProductServlet" method="post" onsubmit="return confirmDelete();">

Enter Product ID:<br>

<input type="text" name="id" required>

<br><br>

<input type="submit" value="Delete">

</form>

<p style="color:red; font-size:14px;">
Note: Deleted products cannot be recovered. Please verify the Product ID before deleting.
</p>

<a href="dashboard.jsp">Back to Dashboard</a>

</div>

</body>
</html>