<%@page import="bean.DbConnectionAll"%>
<%@page import="bean.permissionCheck"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="bean.GenrateLicense"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>eBioServer</title>
    <link rel="icon" type="image/ico" href="img/eicon.png" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="css/style.css" />
    <link href="https://fonts.googleapis.com/css?family=Exo+2|Merriweather|Merriweather+Sans|Patua+One" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Comfortaa|Concert+One|Courgette|Exo|Nunito|Oxygen|Philosopher|Signika|Yanone+Kaffeesatz" rel="stylesheet"> 
  
    <link rel="stylesheet" type="text/css" media="screen" href="css/bootstrap.min.css" />
    <script src="css/js/jquery.js"></script>
    <script src="css/js/bootstrap.min.js"></script>
    <script src="css/js/pace.min.js"></script>
    <script type="text/javascript" src="https://cdn.bootcss.com/typed.js/1.1.4/typed.min.js"></script>
    <link rel="stylesheet" type="text/css" media="screen" href="css/pace.css" />
    <style>
    canvas{
        background: white;
    }
   
    
    </style>
    <!--for  backpress button Disable  -->     
	<SCRIPT type="text/javascript">
    window.history.forward();
    function noBack() { window.history.forward(); }
   </SCRIPT>
  <BODY onload="noBack();"
    onpageshow="if (event.persisted) noBack();" onunload="">

</head>

<body>
<%
   HttpSession session1=request.getSession();  
String login_User=(String)session1.getAttribute("user"); 

if(login_User == null)
{

response.sendRedirect("index.jsp");
}
%>

<%!String Url, Database, Username, Password, Port;
	public void read() {
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

<%String MacAdd = GenrateLicense.searchForMac();
	request.getSession().setAttribute("MacAdd",MacAdd); %>
	
	
	<%
	read();

	response.setContentType("text/html");
	PrintWriter ut = response.getWriter();

	String id = request.getParameter("userId");
	String driverName = "com.mysql.jdbc.Driver";
	try {
		Class.forName(driverName);
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}

	Statement statement = null;
	ResultSet resultSet = null;
	Connection con=null;
	try {
		String Connection = "jdbc:mysql://" + Url + ":" + Port + "/" + Database + "?" + "user=" + Username
				+ "&password=" + Password + "";
		System.out.println(Connection);
		 con = DriverManager.getConnection(Connection);
		statement = con.createStatement();
		String sql = "SELECT * from  mastersettings ";
		resultSet = statement.executeQuery(sql);
		if(resultSet.next()){
			String licenseKey =resultSet.getString("LiecenceKey");
			
			request.getSession().setAttribute("licenseKey",licenseKey);
			
		}
		
		}
	    catch (Exception e) {
			e.printStackTrace();
	
	}
	finally{
		if(con!=null)
		{
			con.close();	
		}
	}%>

    <div class="header">
        <div class="row">
            <div class="col-sm-4">
                <span>
                    <img class="headerLogo" src="img/eicon.png" />
                    <span class="logo">eBioServer</span>
                </span>
            </div>
            <div class="col-sm-8"> </div>
        </div>
    </div>

    <div class="Middle">


        <!-- Side navigation -->
        <div class="sidenav">
       
            <p class="Menu">Main Menu</p>
            <form  id="btnDeviceList" action="permissionCheck" method="post">
           <a  href="#" onclick="document.getElementById('btnDeviceList').submit()">Device List</a>
            <input type=hidden name="permissioncheck" value="DeviceManagement">
            <input type=hidden name="permissionDevices" value="DeviceList" >
          </form>
           <form  id="btnDeviceCommand" action="permissionCheck" method="post">
            <a  href="#" onclick="document.getElementById('btnDeviceCommand').submit()">Device Command</a>
            <input type=hidden name="permissioncheck" value="DeviceManagement" >
             <input type=hidden name="permissionDevices" value="DeviceCommand" >
           </form>
           <form  id="btnDeviceLogs" action="permissionCheck" method="post">
            <a  href="#" onclick="document.getElementById('btnDeviceLogs').submit()">Device Logs</a>
             <input type=hidden name="permissioncheck" value="DeviceManagement" >
             <input type=hidden name="permissionDevices" value="DeviceLogs" >
           </form>
            <a style="border-top: 0px;" href="EmployeeLogs.jsp">Employees</a>
             
              <form  id="btnSystem" action="permissionCheck" method="post">
            <a  style="border-top: 0px;"href="#" onclick="document.getElementById('btnSystem').submit()">System User</a>
             <input type=hidden name="permissioncheck" value="ViewUsers" >
             <input type=hidden name="permissionDevices" value="SystemUser" >
           </form> 
           
           <a style="border-top: 0px;"href="#"  data-toggle="modal" data-target="#DatabasModal">About</a>       
          <a style="border-top: 0px;"href="#"  data-toggle="modal" data-target="#DataModal">Change Password</a>
           <form  id="btnlogoff" action="logout" method="post">        
            <a style="border-top: 0px;"href="#" onclick="document.getElementById('btnlogoff').submit()">Log Off</a>


 </form>  
        </div>

        <!-- Page content -->
        <div class="main">
        
                <div id="particles-js">
              
<div class="loginbox" style="border: 1px solid black; padding: 10px;" > 
<div class="modal-header">
                    <h5 class="modal-title" id="DatabaseModalLabel" style="font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;">About eBioServer</h5>
                
                </div>
<form id="DatabaseForm" action="Aboutus" method="post">
                        <table class="ModalTable" border="0">
                            <tr>
                                <td> Version:</td>
                                <td><input type="text" disabled name="databasetype" id="databasetype" value="eBioServer 1.0" required /></td>

                            </tr>
                            <tr>
                                <td>Mac-Address:</td>
                                <td><input type="text"  disabled name="ActivationCode"   id="ActivationCode"  value="${MacAdd}" required/></td>
                            </tr>
                            <tr>
                                <td>License Key:</td>
                                <td><input type="text" name="LicenseKey" id="LicenseKey" value="${licenseKey}" /></td>
                            </tr>
                            </table>
                    
                 <p style="font-size: 11px;"> eBioServer is a enterprise grade web based software designed developed and maintained by enterprise Software solutions Lab private Limited (eSSL Security). 
   </p>
                <div class="modal-footer">
              
                    <a style="padding: 3px 12px;font-size: 13px;"  class="Custombtn btn-outline-dark"   href="main.jsp">Close</a>
                    <input type="submit"  style="padding: 3px 12px;font-size: 13px;"  class="Custombtn btn-outline-dark" value="Save">
                
              
                </div>
                <p style="color: Red; font-size: 12px;">${Connectionerror}</p> <c:remove var="Connectionerror" scope="session" />
                 
                </form>

</div>
               
                
                
                
               
                </div>
      
    
    
        </div>

    </div>
    <div class="footerMain">
        <div class="copyrightText">Powered by
            <a href="http://www.esslindia.com">eSSL</a>
        </div>
    </div>
    <script src="css/js/particles.min.js"></script>
    <script src="css/js/app.js"></script>
    <script src="http://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"></script>
    <script>
    particlesJS("particles-js", {"particles":{"number":{"value":6,"density":{"enable":true,"value_area":800}},"color":{"value":"#1b1e34"},"shape":{"type":"polygon","stroke":{"width":0,"color":"#000"},"polygon":{"nb_sides":6},"image":{"src":"img/github.svg","width":100,"height":100}},"opacity":{"value":0.3,"random":true,"anim":{"enable":false,"speed":1,"opacity_min":0.1,"sync":false}},"size":{"value":160,"random":false,"anim":{"enable":true,"speed":10,"size_min":40,"sync":false}},"line_linked":{"enable":false,"distance":200,"color":"#ffffff","opacity":1,"width":2},"move":{"enable":true,"speed":8,"direction":"none","random":false,"straight":false,"out_mode":"out","bounce":false,"attract":{"enable":false,"rotateX":600,"rotateY":1200}}},"interactivity":{"detect_on":"canvas","events":{"onhover":{"enable":false,"mode":"grab"},"onclick":{"enable":false,"mode":"push"},"resize":true},"modes":{"grab":{"distance":400,"line_linked":{"opacity":1}},"bubble":{"distance":400,"size":40,"duration":2,"opacity":8,"speed":3},"repulse":{"distance":200,"duration":0.4},"push":{"particles_nb":4},"remove":{"particles_nb":2}}},"retina_detect":true});var count_particles, stats, update; stats = new Stats; stats.setMode(0); stats.domElement.style.position = 'absolute'; stats.domElement.style.left = '0px'; stats.domElement.style.top = '0px'; document.body.appendChild(stats.domElement); count_particles = document.querySelector('.js-count-particles'); update = function() { stats.begin(); stats.end(); if (window.pJSDom[0].pJS.particles && window.pJSDom[0].pJS.particles.array) { count_particles.innerText = window.pJSDom[0].pJS.particles.array.length; } requestAnimationFrame(update); }; requestAnimationFrame(update);;
    </script>
 
<!------------------------------------------- ChangePassword---------------------------------------------------- -->

    <div class="modal fade bd-example-modal-sm" id="DataModal" tabindex="-1" role="dialog" aria-labelledby="DatabasModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="DatabaseModalLabel">Change Password</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">&times;</span>
      </button>
                </div>
                <div class="modal-body">
                    <form id="DatabaseForm" action="ChangePassword" method="post">
                        <table class="ModalTable" border="0">
                          <tr>  <td width="15%"><input type="text" style="display:none;" name="SessionUser" id="SessionUser" value="${user}"></td>
                            </tr>
                            <tr>
                                <td>New Password</td>
                                
                                <td><input type="password" id="newPassword" name="newPass"  autocomplete="off"  required  onchange="checkPassword()"  /></td>

                            </tr>
                            <tr>
                                <td>Confirm Password</td>
                                <td><input type="password" id="newPasswordAgain" name="confirmPass"  autocomplete="off"   required onkeyup="checkPassword()"/></td>

                            </tr>
                         </table>
                    
               
                <div class="modal-footer">
                    <button type="button" style="padding: 3px 12px;font-size: 13px;" class="Custombtn btn-outline-dark" data-dismiss="modal">Close</button>
                    <input type="submit"  style="padding: 3px 12px;font-size: 13px;"  class="Custombtn btn-outline-dark" value="Save ">

                </div>
                </form>
            </div>
        </div>
    </div>
    </div>

<script>
function checkPassword(){
if ($('#newPasswordAgain').val() !== $('#newPassword').val()) {
$('#newPasswordAgain')[0].setCustomValidity('Passwords must match.');
}
else{
$('#newPasswordAgain')[0].setCustomValidity('');
}
}
</script>
  
</body>

</html>