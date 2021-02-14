<%@ page import="bean.User"%>
<%@page import="java.io.IOException"%>
   <%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>eBioServer Login</title>
    <link rel="icon" type="image/ico" href="img/eicon.png" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="css/style.css" />
    <link rel="stylesheet" type                                                                                      ="text/css" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css">
    <script src="css/js/jquery.js"></script>
    <script src="css/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Exo+2|Merriweather|Merriweather+Sans|Patua+One" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Comfortaa|Concert+One|Courgette|Exo|Nunito|Oxygen|Philosopher|Signika|Yanone+Kaffeesatz" rel="stylesheet">
    <script src="css/js/script.js"></script>
    <script type="text/javascript" src="https://cdn.bootcss.com/typed.js/1.1.4/typed.min.js"></script>
    <script src="css/js/pace.min.js"></script>
    <link rel="stylesheet" type="text/css" media="screen" href="css/pace.css" />
     <!--for  backpress button Disable  -->     
	<SCRIPT type="text/javascript">
    window.history.forward();
    function noBack() { window.history.forward(); }
   </SCRIPT>
  <BODY onload="noBack();"
    onpageshow="if (event.persisted) noBack();" onunload="">
     <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
    <style>
        .modal-sm {
            max-width: 370px;
        }
    </style>

    <script>
        $(document).ready(function() {
            // Start when document will be ready.
            $("#login_button").click(function() {
                var email = $("#email").val(); // Store E-mail input value in the variable email.
                var password = $("#password").val(); // Store Password input value in the variable password.
                /* Check if email=formget@gmail.com and password=fugo then,Show the message Account Validated!!! in the Div having id message.*/
                if (email == "dx" && password == "dx") {
                    alert("Success");
                }
                /* If E-mail and Password do not match then shake Div having id maindiv and show the message "***Invalid email or password***" in the div having id message.*/
                else {
                    $(".loginbox").effect("shake");

                }
            });
        });
        
    </script>
     <script>
     document.getElementById('databaseserver').value ="";
     
     </script>
</head>
<%!	
	String Url=null, Database=null, Username=null,Password=null,Port=null;
	public  void read(){
         try {
            FileReader reader = new FileReader("DdSettings.txt");
            BufferedReader bufferedReader = new BufferedReader(reader);
 
            String line;
 
            Url = bufferedReader.readLine();
            Port = bufferedReader.readLine();
            Database = bufferedReader.readLine();
            Username = bufferedReader.readLine();
            Password = bufferedReader.readLine();
            reader.close();
 
        } catch (IOException e) {
            e.printStackTrace();
        }
    } 
    %>
    <%

        read();
    if(Url==null)
    {
    	Url="";
    	Port="";
    	Database="";
    	Username="";
    	Password="";
    }
    %>
<body>


   
    <div id="particles-js">

        <div class="loginbox">
            <div class="loginboxtop">
                <table>
                    <tr>
                        <td>
                            <img class="eBioServerIcon" src="img/eicon.png" alt="Card image cap">
                        </td>
                        <td>
                            <span class="eBioServerLogo">
                                <span class="write"></span>
                            </span>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="card" style="width: 18rem;">
               <form action="FirstServlet" method="POST">
                    <div class="input-group ">
                       <input type="text" name="LoginName" class="form-control" placeholder="Username" aria-label="Username" required>
                    </div>
                    <div class="input-group">
                        <input type="Password" name="LoginPassword" class="form-control" placeholder="Password" aria-label="Password" required>
                    </div>
                    <button type="submit" id="login_button" style="width: 266px;margin: 10px;" class="btn btn-dark">Login</button>
                    <div style="float: right;margin-right: 11px;margin-bottom: 5px;"><i data-toggle="modal" data-target="#DatabasModal" style="cursor:pointer;font-size:21px;" title="Database Settings" class="fas fa-database"></i></div>
                </form>
            </div>
            	<%
String login_msg=(String)request.getAttribute("error");  
if(login_msg!=null)
out.println("<font color=red size=4px>"+login_msg+"</font>");
%>

        </div>
        <div class="errorbox">
      <p style="color: Red;">${messageException}</p> <c:remove var="message" scope="session" />
									
          <p style="color: Red;">${Connectionerror}</p> <c:remove var="Connectionerror" scope="session" />   
         <p style="color: Green;">${Connection}</p> <c:remove var="Connection" scope="session" />   
        </div>	    
	    </div>

    <!-- scripts -->
    
<div class="footer">
    <div class="copyrightText">Powered by <a href="http://www.esslindia.com">eSSL</a></div>
</div>
  <!-- Database Modal -->
    <div class="modal fade bd-example-modal-sm" id="DatabasModal" tabindex="-1" role="dialog" aria-labelledby="DatabasModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="DatabaseModalLabel">Database Settings</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">&times;</span>
      </button>
                </div>
                <div class="modal-body">
                    <form id="DatabaseForm" action="ConnectionDataBase" method="post">
                        <table class="ModalTable" border="0">
                            <tr>
                                <td>Database Type</td>
                                <td><input type="text" disabled name="databasetype" id="databasetype" value="MySql" required /></td>

                            </tr>
                            <tr>
                                <td>Database Server</td>
                                <td><input type="text" name="databaseserver"   id="databaseserver" value="<%=Url%>" required/></td>
                            </tr>
                            <tr>
                                <td>Connection Port</td>
                                <td><input type="text" name="port" id="port" value="<%=Port%>" Required/></td>
                            </tr>
                            <tr>
                                <td>Database Name</td>
                                <td><input type="text" name="databasename"  id="databasename"  value="<%=Database%>" required/></td>
                            </tr>
                            <tr>
                                <td>User name</td>
                                <td><input type="text" name="username"  id="username" value="<%=Username%>" required/></td>
                            </tr>
                            <tr>
                                <td>Password</td>
                                <td><input type="password" name="password" id="password" value="<%=Password%>" Required/></td>
                            </tr>
                        </table>
                    
               
                <div class="modal-footer">
                    <button type="button" style="padding: 3px 12px;font-size: 13px;" class="Custombtn btn-outline-dark" data-dismiss="modal">Close</button>
                    <input type="submit"  style="padding: 3px 12px;font-size: 13px;"  class="Custombtn btn-outline-dark" value="Save Connection">

                </div>
                </form>
            </div>
        </div>
    </div>
    </div>




</body>
<script src="css/js/particles.min.js"></script>
    <script src="css/js/app.js"></script>

    <script src="http://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"></script>


    <script type="text/javascript">
        $(function () {
            $(".write").typed({
                strings: ["eSSL", "eBioServer", "eBioServer", "eBioServer", "eBioServer", "eBioServer", "eBioServer"],
                typeSpeed: 40,
            });
        });
    </script>


</html>