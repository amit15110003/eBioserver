<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="bean.User"%>
<%@ page import="java.util.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="bean.devicelog"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>


<%@page import=" javax.servlet.http.HttpServletRequest"%>
<%@page import=" javax.servlet.http.HttpServletResponse"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>eBioServer</title>
<link rel="icon" type="image/ico" href="img/eicon.png" />
<meta name="viewport" content="width=device-width, initial-scale=1">


<script src="css/js/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="css/datatable.css">
<link href="https://fonts.googleapis.com/css?family=Comfortaa|Concert+One|Courgette|Exo|Nunito|Oxygen|Philosopher|Signika|Yanone+Kaffeesatz" rel="stylesheet"> 

<script type="text/javascript" charset="utf8" src="css/js/datatable.js"></script>

<link rel="stylesheet" type="text/css" media="screen"
	href="css/style.css" />

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css">
<link
	href="https://fonts.googleapis.com/css?family=Exo+2|Merriweather|Merriweather+Sans|Patua+One"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" media="screen"
	href="css/bootstrap.min.css" />
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
<script src="css/js/bootstrap.min.js"></script>
<script src="css/js/pace.min.js"></script>
<script type="text/javascript"
	src="https://cdn.bootcss.com/typed.js/1.1.4/typed.min.js"></script>
<link rel="stylesheet" type="text/css" media="screen"
	href="css/pace.css" />

<style>
canvas {
	background: white;
}
</style>

  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="css/js/custom.js" type="text/javascript"></script>
<script src="css/js/Editcustom.js" type="text/javascript"></script>
		
<SCRIPT type="text/javascript">
    window.history.forward();
    function noBack() { window.history.forward(); }
   </SCRIPT>
  <BODY onload="noBack();"
    onpageshow="if (event.persisted) noBack();" onunload="">
    
   
   
  <!-------------------------------- ajex for table log ------------------------------------>
  
  <style>
/* Center the loader */
#loader {
  position: absolute;
  left: 58%;
  top: 50%;
  z-index: 1;
  width: 150px;
  height: 150px;
  margin: -75px 0 0 -75px;
  border: 16px solid #f3f3f3;
  border-radius: 50%;
  border-top: 16px solid #3498db;
  width: 120px;
  height: 120px;
  -webkit-animation: spin 2s linear infinite;
  animation: spin 2s linear infinite;
}

@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

/* Add animation to "page content" */
.animate-bottom {
  position: relative;
  -webkit-animation-name: animatebottom;
  -webkit-animation-duration: 1s;
  animation-name: animatebottom;
  animation-duration: 1s
}

@-webkit-keyframes animatebottom {
  from { bottom:-100px; opacity:0 } 
  to { bottom:0px; opacity:1 }
}

@keyframes animatebottom { 
  from{ bottom:-100px; opacity:0 } 
  to{ bottom:0; opacity:1 }
}

#myDiv {
  display: none;
  text-align: center;
}
</style>

  <script>
  var myVar;
  myFunction();
  function myFunction() {
      myVar = setTimeout(showPage, 1000);
  }

  function showPage() {
    document.getElementById("loader").style.display = "none";
    document.getElementById("myDiv").style.display = "block";
    var table = $('#mytable').DataTable();
    table.columns.adjust().draw();
  }
</script>
  
  
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



	<div class="header">
		<div class="row">
			<div class="col-sm-4">
				<span> <img class="headerLogo" src="img/eicon.png" /> <span
					class="logo">eBioServer</span>
				</span>
			</div>
			<div class="col-sm-8"></div>
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
             <form id="btnAbout" action="permissionCheck" method="post">
				<a style="border-top: 0px;" href="#"
					onclick="document.getElementById('btnAbout').submit()">About
					</a> <input type=hidden name="permissioncheck" value="AboutUs">
				<input type=hidden name="permissionDevices" value="About">
			</form>
			<a style="border-top: 0px;"href="#"  data-toggle="modal" data-target="#DataModal">Change Password</a>        
          <form  id="btnlogoff" action="logout" method="post">        
            <a style="border-top: 0px;"href="#" onclick="document.getElementById('btnlogoff').submit()">Log Off</a>
 </form>  

		</div>

		<!-- Page content -->
		<div class="main">
			<div id="particles-js">
			<div id="loader"></div>
				<div class="datatable">
				
					<div class="datatable-top">
						<form action="devicelog" method="Get" id="form1">
						<table width="100%">
								
							<tr>
								<td width="15%" style="padding-bottom: 15px;">DeviceLogs </td>

								<td width="10%">
									<div>
										<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
				          
                                         	
									</div>
								</td>
                          <td width="20%">
									<div>
									<p>MONTH:<select name="Month" id="Month"
										style="font-size: 12px;margin-left: 8px;" required>
										    <option id="1" value="1">1</option>
											<option id="2" value="2">2</option>
											<option id="3" value="3">3</option>
											<option id="4" value="4">4</option>
											<option id="5" value="5">5</option>
											<option id="6" value="6">6</option>
											<option id="7" value="7">7</option>
											<option id="8" value="8">8</option>
											<option id="9" value="9">9</option>
											<option id="10" value="10">10</option>
											<option id="11" value="11">11</option>
											<option id="12" value="12">12</option>
									</select> 
										YEAR:<select name="Year" id="Year"
										style="font-size: 12px;margin-left: 8px;" required>
										     <option id="2010" value="2010">2010</option>
											<option id="2011" value="2011">2011</option>
											<option id="2012" value="2012">2012</option>
											<option id="2013" value="2013">2013</option>
											<option id="2014" value="2014">2014</option>
											<option id="2015" value="2015">2015</option>
											<option id="2016" value="2016">2016</option>
											<option id="2017" value="2017">2017</option>
											<option id="2018" value="2018">2018</option>
											<option id="2019" value="2019">2019</option>
											<option id="2020" value="2020">2020</option>
											<option id="2021" value="2021">2021</option>
											<option id="2022" value="2022">2022</option>
											<option id="2023" value="2023">2023</option>
											<option id="2024" value="2024">2024</option>
											<option id="2025" value="2025">2025</option>
											<option id="2026" value="2026">2026</option>
											<option id="2027" value="2027">2027</option>
											<option id="2028" value="2028">2028</option>
											<option id="2029" value="2029">2029</option>
											<option id="2030" value="2030">2030</option>
									</select>
									<input type="submit" class="Custombtn btn-outline-light" id="filter"
									value="UpDate Data">
									</p>
									
                                         	
									</div>
								</td>
								
                        

								<td width="2%"><a
									style="font-size: 20px; color: White; text-decoration: none; margin-top: -16px;"
									class="fas fa-window-close" href="main.jsp"></a></td>

							</tr>
							
						</table>
						</form>
					</div>




					<div class="datatable-middle" id="myDiv">
					
						<table class="Table table-bordered table-striped " id="mytable"
							style="margin: 0; padding: 0" ; align="center" cellpadding="5"
							cellspacing="5" border="0" width="100% ">
							<thead>
								<tr>
								<td><b>DownloadDate</b></td>
									<td><b>UserId </b></td>
									<td><b>LogDate</b></td>
									<td><b>DeviceName</b></td>
									<td><b>SerialNumber</b></td>
									<td><b>AttStatus</b></td>
									<td><b>VerifyMode</b></td>
    							</tr>
							 </thead>
							
					     <tbody>
					     
					     <c:forEach items="${piList}" var="theme" varStatus="status">
									<tr>
										<td>${theme.get(0)}</td>
										<td>${theme.get(1)}</td>
										<td>${theme.get(2)}</td>
										<td>${theme.get(3)}</td>
										<td>${theme.get(4)}</td>
										<td>${theme.get(5)}</td>
										<td>${theme.get(6)}</td>
									</tr>
								</c:forEach>
					     
                              
							</tbody>

						</table>


					</div>
					<div class="datatable-bottom">
						<table width="100%">
							<tr>
								<td width="95%">
									<p style="color: Red;">
										<b> ${message}</b>
									</p> <c:remove var="message" scope="session" />
									<p style="color: Red;">
										<b> ${error}</b>
									</p> 
									<c:remove var="message" scope="session" />
								</td>

								
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>


		<div class="footerMain">
			<div class="copyrightText">
				Powered by <a href="http://www.esslindia.com">eSSL</a>
			</div>
		</div>
		<script src="js/particles.min.js"></script>
		<script src="js/app.js"></script>
		<script
			src="http://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"></script>
		<script>
			particlesJS("particles-js", {
				"particles" : {
					"number" : {
						"value" : 6,
						"density" : {
							"enable" : true,
							"value_area" : 800
						}
					},
					"color" : {
						"value" : "#1b1e34"
					},
					"shape" : {
						"type" : "polygon",
						"stroke" : {
							"width" : 0,
							"color" : "#000"
						},
						"polygon" : {
							"nb_sides" : 6
						},
						"image" : {
							"src" : "img/github.svg",
							"width" : 100,
							"height" : 100
						}
					},
					"opacity" : {
						"value" : 0.3,
						"random" : true,
						"anim" : {
							"enable" : false,
							"speed" : 1,
							"opacity_min" : 0.1,
							"sync" : false
						}
					},
					"size" : {
						"value" : 160,
						"random" : false,
						"anim" : {
							"enable" : true,
							"speed" : 10,
							"size_min" : 40,
							"sync" : false
						}
					},
					"line_linked" : {
						"enable" : false,
						"distance" : 200,
						"color" : "#ffffff",
						"opacity" : 1,
						"width" : 2
					},
					"move" : {
						"enable" : true,
						"speed" : 8,
						"direction" : "none",
						"random" : false,
						"straight" : false,
						"out_mode" : "out",
						"bounce" : false,
						"attract" : {
							"enable" : false,
							"rotateX" : 600,
							"rotateY" : 1200
						}
					}
				},
				"interactivity" : {
					"detect_on" : "canvas",
					"events" : {
						"onhover" : {
							"enable" : false,
							"mode" : "grab"
						},
						"onclick" : {
							"enable" : false,
							"mode" : "push"
						},
						"resize" : true
					},
					"modes" : {
						"grab" : {
							"distance" : 400,
							"line_linked" : {
								"opacity" : 1
							}
						},
						"bubble" : {
							"distance" : 400,
							"size" : 40,
							"duration" : 2,
							"opacity" : 8,
							"speed" : 3
						},
						"repulse" : {
							"distance" : 200,
							"duration" : 0.4
						},
						"push" : {
							"particles_nb" : 4
						},
						"remove" : {
							"particles_nb" : 2
						}
					}
				},
				"retina_detect" : true
			});
			var count_particles, stats, update;
			stats = new Stats;
			stats.setMode(0);
			stats.domElement.style.position = 'absolute';
			stats.domElement.style.left = '0px';
			stats.domElement.style.top = '0px';
			document.body.appendChild(stats.domElement);
			count_particles = document.querySelector('.js-count-particles');
			update = function() {
				stats.begin();
				stats.end();
				if (window.pJSDom[0].pJS.particles
						&& window.pJSDom[0].pJS.particles.array) {
					count_particles.innerText = window.pJSDom[0].pJS.particles.array.length;
				}
				requestAnimationFrame(update);
			};
			requestAnimationFrame(update);
			;
		</script>

		

		<!---------------------------------------------Model for delete---------------------------------------------------------->


		<div class="modal fade" id="exampleModalCenter1" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<form action="DeleteDeviceCommand" method="post">

						<div class="modal-body">
							Are you Want to Delete ?

							<div class="form-group">
								<!--  <label for="Ip Address"  style="height:25px;" class="cols-sm-2 control-label"> Ip Address</label>-->
								<div class="cols-sm-10">
									<div class="input-group" style="width: 150px">
										<span class="input-group-addon"><i
											class="fa fa-user fa" aria-hidden="true"></i></span> <input
											type="hidden" class="form-control" style="height: 25px;"
											name="DeviceId" id="DeviceId" required />
									</div>
								</div>
							</div>


						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>

							<input type="submit" class="btn btn-primary" value="Delete">
						</div>
					</form>
				</div>
			</div>
		</div>






		
		
		<!------------------------------------- script for Delete button ----------------------------------------------------------->
		<script>
			$('.Table').on('click', '.delete', function() {
				var currow = $(this).closest('tr');
				var col1 = currow.find('td:eq(0)').text();
				
				//var result =col1+'\n'+col2+'\n'+col3+'\n'+col4+'\n'+col5;
					document.getElementById("DeviceId").value = col1;

			})
		</script>

		
		<!-- -------------------------------------- Script for datatable------------------------------------------------------------------------>
		<script type="text/javascript">
		$.fn.dataTable.ext.errMode = 'none';
			$(document).ready(
					function() {
						var table = $('#mytable').DataTable({
							'scrollY': 340,
							 "order": [[ 2, "desc" ]]
						})
						
					 myFunction();
			function myFunction() {
			   
			    
			    
			    var currentTime = new Date();
			    var month = currentTime.getMonth() + 1;
			    var year = currentTime.getFullYear();
			    document.getElementById("Month").value = ${Month};
			      document.getElementById("Year").value  =${Year};
			   //  document.getElementById("filter").click();
			    
			      
			}
					});
		</script>
		
	<!-- -------------------------------------- Script for Loader------------------------------------------------------------------>		


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