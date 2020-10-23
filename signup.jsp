<html>
    <head>
        <style>* {
box-sizing: border-box;
}

*:focus {
    outline: none;
}
body {
font-family: Arial;
background-color: #3498DB;
padding: 50px;
}
.login {
margin: 20px auto;
width: 300px;
}
.login-screen {
background-color: #FFF;
padding: 20px;
border-radius: 5px
}

.app-title {
text-align: center;
color: #777;
}

.login-form {
text-align: center;
}
.control-group {
margin-bottom: 10px;
}

input {
text-align: center;
background-color: #ECF0F1;
border: 2px solid transparent;
border-radius: 3px;
font-size: 16px;
font-weight: 200;
padding: 10px 0;
width: 250px;
transition: border .5s;
}

input:focus {
border: 2px solid #3498DB;
}

.btn {
  border: 2px solid transparent;
  background: #3498DB;
  color: #ffffff;
  font-size: 16px;
  line-height: 25px;
  padding: 10px 0;
  text-decoration: none;
  text-shadow: none;
  border-radius: 3px;
  transition: 0.25s;
  display: block;
  width: 250px;
}

.btn:hover {
  background-color: #2980B9;
}

.login-link {
  font-size: 12px;
  color: #444;
  display: block;
    margin-top: 12px;
}
.overlay {
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  background: rgba(0, 0, 0, 0.7);
  transition: opacity 500ms;
  visibility: hidden;
}
.overlay:target {
  visibility: visible;
  opacity: 1;
}
.popup h2 {
  margin-top: 0;
  color: #333;
  font-family: Tahoma, Arial, sans-serif;
}
.script{
      border: 2px solid transparent;
  background: #3498DB;
  color: #ffffff;
  font-size: 16px;
  line-height: 25px;
  padding: 10px 0;
  text-decoration: none;
  text-shadow: none;
  border-radius: 3px;
  box-shadow: none;
  transition: 0.25s;
  display: block;
  width: 250px;
}
            </style>
    </head>   
<body>
    <div class="login">
        <div class="login-screen">
            <div class="app-title">
                <h1>Sign Up</h1>
            </div>

            <div class="login-form">
                <form>
    <label for="id"></label>
    <input type="text" id="id" name="id" placeholder="Email ID"><br>

    <label for="name"></label>
    <input type="text" id="name" name="name" placeholder="Name"><br>

    <label for="mobile"></label>
    <input type="text" id="mobile" name="mobile" placeholder="Mobile"><br>
    
    <label for="salary"></label>
    <input type="text" id="salary" name="salary" placeholder="Salary"><br>
    
    <label for="address"></label>
    <input type="text" id="address" name="address" placeholder="Address"><br>
    
     <label for="password"></label>
    <input type="password" id="password" name="password" placeholder="Password"><br>
    <input class="btn" type="submit" value="Sign Up">
    
  </form>
                <!--<a class="btn" href="#">Sign Up</a>-->
                <a class="login-link" href="login.jsp">Already have an account?<br>Click to Sign in</a>
            </div>
        </div>
    </div>
            <%@page import= "java.sql.*" %>
        <%
            
        String ID= request.getParameter("id");
        if(ID!=null)
        {
        String password = request.getParameter("password");   
        String name = request.getParameter("name");
          String mobile = request.getParameter("mobile");
          String salary = request.getParameter("salary");
          String address = request.getParameter("address");
        String sql="INSERT INTO `userdata`(`email`, `password`, `name`, `mobile`, `salary`, `address`) VALUES ('"+ID+"','"+password+"', '"+name+"', '"+mobile+"', '"+salary+"', '"+address+"')";
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/registration?serverTimezone=UTC","root","");
        Statement st = con.createStatement();
        int n=st.executeUpdate(sql);
        if(n>0)
        {
        %> <script> alert("User Added Successfully"); </script>
        <%}
        
        }
        
         catch(Exception e)
        {
            out.println("Error"+e.getMessage());
        }
        }
        
        %>
</body>
</html>
