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
box-shadow: none;
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
  box-shadow: none;
  transition: 0.25s;
  display: block;
  width: 250px;
  margin: 0 auto;
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
.sign-up {
  font-size: 12px;
  color: #444;
  display: block;
    margin-top: 12px;
}
            </style>
    </head>   
<body>
    <div class="login">
        <div class="login-screen">
            <div class="app-title">
                <h1>Login</h1>
            </div>

            <div class="login-form">
                <form>
    <label for="id"></label>
    <input type="text" id="id" name="id" placeholder="Email ID"><br>

    <label for="password"></label>
    <input type="password" id="password" name="password" placeholder="Password"><br><br>
    <input class="btn" type="submit" value="Login">
    </form>
    
                <a class="login-link" href="lost.jsp">Lost your password?</a>
                <a class="sign-up" href="signup.jsp">Create Account</a>
                
            </div>
        </div>
    </div>
    <%@page import="java.sql.*"%>
    <%
        String ID= request.getParameter("id");
        if(ID!=null)
        {
        String password = request.getParameter("password");   
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/registration?serverTimezone=UTC","root","");
        Statement st = con.createStatement();
        int count=0;
        ResultSet rs= st.executeQuery("SELECT * FROM `userdata` WHERE email='"+ID+"' AND password='"+password+"'");
        if(rs.next())
        {

             response.sendRedirect("loggedin.jsp"); 
        }
//        out.print(email);
//        out.print(pass);
 
        else
        {
           %>
            <script>
                alert("Invalid Credentials");
            </script>
<%
}
        }
         catch(Exception e)
        {
            out.println("Error"+e.getMessage());
        }
        }
        
        %>
</body>
</html>