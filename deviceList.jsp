
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="bean.User"%>
<%@ page import="java.util.*"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="bean.DeviceList"%>
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
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
<script src="css/js/jquery.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Comfortaa|Concert+One|Courgette|Exo|Nunito|Oxygen|Philosopher|Signika|Yanone+Kaffeesatz"
	rel="stylesheet">

<link rel="stylesheet" type="text/css" href="css/datatable.css">

<script type="text/javascript" charset="utf8" src="css/js/datatable.js"></script>

<link rel="stylesheet" type="text/css" media="screen"
	href="css/style.css" />


<link
	href="https://fonts.googleapis.com/css?family=Exo+2|Merriweather|Merriweather+Sans|Patua+One"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" media="screen"
	href="css/bootstrap.min.css" />

<script src="css/js/bootstrap.min.js"></script>
<script src="css/js/pace.min.js"></script>
<script src="css/js/Editcustom.js" type="text/javascript"></script>

<link rel="stylesheet" type="text/css" media="screen"
	href="css/pace.css" />

<style>
canvas {
	background: white;
}
</style>
<script src="css/js/custom.js" type="text/javascript"></script>
<script src="css/js/EmpDeviceCode.js" type="text/javascript"></script>
<script src="css/js/CommandOperation.js" type="text/javascript"></script>

<SCRIPT type="text/javascript">
    window.history.forward();
    function noBack() { window.history.forward(); }
   </SCRIPT>
	<!-- ======================style for right click========================================= -->
<style>

/*----------------------------style for snackbar-----------------------------*/

#snackbar {
    visibility: hidden; /* Hidden by default. Visible on click */
    min-width: 800px; /* Set a default minimum width */
    margin-left: -400px; /* Divide value of min-width by 2 */
    background-color: #333; /* Black background color */
    color: #fff; /* White text color */
    text-align: center; /* Centered text */
    border-radius: 2px; /* Rounded borders */
    padding: 16px; /* Padding */
    position: fixed; /* Sit on top of the screen */
    z-index: 999999 !important; /* Add a z-index if needed */
    left: 50%; /* Center the snackbar */
    bottom: 10px; /* 30px from the bottom */
}

/* Show the snackbar when clicking on a button (class added with JavaScript) */
#snackbar.show {
    visibility: visible; /* Show the snackbar */

/* Add animation: Take 0.5 seconds to fade in and out the snackbar.
However, delay the fade out process for 2.5 seconds */
    -webkit-animation: fadein 0.5s, fadeout 1s 2.5s;
    animation: fadein 0.5s, fadeout 1s 2.5s;
}

/* Animations to fade the snackbar in and out */
@-webkit-keyframes fadein {
    from {bottom: 0; opacity: 0;}
    to {bottom: 10px; opacity: 1;}
}

@keyframes fadein {
    from {bottom: 0; opacity: 0;}
    to {bottom: 10px; opacity: 1;}
}

@-webkit-keyframes fadeout {
    from {bottom: 10px; opacity: 1;}
    to {bottom: 0; opacity: 0;}
}

@keyframes fadeout {
    from {bottom: 10px; opacity: 1;}
    to {bottom: 0; opacity: 0;}
} 







/*----------------------------style for right click------------------------------*/




.center{
  text-align: center;
}
.menu {
  width: 120px;
  z-index: 1;
  box-shadow: 0 4px 5px 3px rgba(0, 0, 0, 0.2);
  position: fixed;
  display: none;
  color: #007bff;
 background-color: snow;
  transition: 0.2s display ease-in;
cursor: pointer;
width: 235px;
 
}
 li:hover {

    background-color: #bcc0c5;

    .menu-option {
      font-weight: 500;
      z-index: 1;
      font-size: 14px;
      padding: 0px 40px 10px 20px;
      // border-bottom: 1.5px solid rgba(0, 0, 0, 0.2);
      cursor: pointer;
width: 235px;
      &:hover {
        background: rgba(0, 0, 0, 0.2);
      }
    }
  }
}



button{
  background: grey;
  border: none;
  
  .next{
    color:green;
  }
  
  &[disabled="false"]:hover{
    .next{
      color: red;
      animation: move 0.5s;
      animation-iteration-count: 2;
    }
  }
}

@keyframes move{
  from{
    transform: translate(0%);
  }
  50%{
    transform: translate(-40%);
  }
  to{
    transform: transform(0%);
  }
}
</style>
	<!--  ===================end right click style ================================-->
	
</head>
<body onload="noBack();" onpageshow="if (event.persisted) noBack();"
	onunload="" id="body"> 
	
	<!--==============div for right click==================  -->
		<div class="menu">
			<ul class="menu-options">
			    <li class="menu-option" id="ClearLog">Clear Logs From Device</li>
				<li class="menu-option" id="ResetOpStamp">Reset OpStamp</li> 	
				<li class="menu-option" id="ResetTStamp">Reset Transaction Stamp</li>
				<li class="menu-option" id="RestartDevice" >Restart Device</li>
			    <li><a href="" onclick="this.href='UploadUsersToDe.jsp?nav='+document.getElementById('onClickSerialNumber').value+'&?name='+document.getElementById('ShortName').value"class="menu-option" id="UploadUsers"> Upload Users To Device</a></li>
			    <li class="menu-option" data-toggle="modal" data-target="#exampleModalCenterIp" id="ChangeIp">Change Ip Address</li>	
				<li class="menu-option" data-toggle="modal" data-target="#exampleModalCenterSubnet"id="ChangeSubnetMask">Change SubnetMask</li>
				<li class="menu-option" data-toggle="modal" data-target="#exampleModalCenterGateWay" >Change GateWay</li>
				<li class="menu-option" data-toggle="modal" data-target="#exampleModalCenterWebServer" id="ChangeWebServerIP">Change WebServerIP</li>
				<li class="menu-option" data-toggle="modal" data-target="#exampleModalCenterWebServerPort" id="ChangeWebServerPort">Change WebServerPort</li>
			</ul>
		</div>

	<%
		HttpSession session1 = request.getSession();
		String login_User = (String) session1.getAttribute("user");

		if (login_User == null) {

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
			<form id="btnDeviceList" action="permissionCheck" method="post">
				<a href="#"
					onclick="document.getElementById('btnDeviceList').submit()">Device
					List</a> <input type=hidden name="permissioncheck"
					value="DeviceManagement"> <input type=hidden
					name="permissionDevices" value="DeviceList">
			</form>
			<form id="btnDeviceCommand" action="permissionCheck" method="post">
				<a href="#"
					onclick="document.getElementById('btnDeviceCommand').submit()">Device
					Command</a> <input type=hidden name="permissioncheck"
					value="DeviceManagement"> <input type=hidden
					name="permissionDevices" value="DeviceCommand">
			</form>
			<form id="btnDeviceLogs" action="permissionCheck" method="post">
				<a href="#"
					onclick="document.getElementById('btnDeviceLogs').submit()">Device
					Logs</a> <input type=hidden name="permissioncheck"
					value="DeviceManagement"> <input type=hidden
					name="permissionDevices" value="DeviceLogs">
			</form>
			<a style="border-top: 0px;" href="EmployeeLogs.jsp">Employees</a>

			<form id="btnSystem" action="permissionCheck" method="post">
				<a style="border-top: 0px;" href="#"
					onclick="document.getElementById('btnSystem').submit()">System
					User</a> <input type=hidden name="permissioncheck" value="ViewUsers">
				<input type=hidden name="permissionDevices" value="SystemUser">
			</form>
<form id="btnAbout" action="permissionCheck" method="post">
				<a style="border-top: 0px;" href="#"
					onclick="document.getElementById('btnAbout').submit()">About
					</a> <input type=hidden name="permissioncheck" value="AboutUs">
				<input type=hidden name="permissionDevices" value="About">
			</form>
			<a style="border-top: 0px;"href="#"  data-toggle="modal" data-target="#DataModal">Change Password</a>
			<form id="btnlogoff" action="logout" method="post">
				<a style="border-top: 0px;" href="#"
					onclick="document.getElementById('btnlogoff').submit()">Log Off</a>
			</form>

		</div>

		<!-- Page content -->
		<div class="main">
			<div id="particles-js">
				<div class="datatable">
				
				

				
				
				
					<div class="datatable-top">
						<table width="100%">
							<tr>
								<td width="20%">DeviceList</td>

								<td width="58%">
									<div>
										<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


									</div>
								</td>
								<td width="2%"><a
									style="font-size: 15px; color: White; text-decoration: none; margin-top: 1px;"
									class="fas fa-sync-alt" href=""></a></td>

								<td width="2%"><a
									style="font-size: 20px; color: White; text-decoration: none; margin-top: 1px;"
									class="fas fa-window-close" href="main.jsp"></a></td>

							</tr>
						</table>
					</div>


					<div class="datatable-middle" id="my">

						<table class="Table table-bordered table-striped " id="mytable"
							style="margin: 0; padding: 0" ; align="center" cellpadding="5"
							cellspacing="5" border="0" width="100% ">
							<thead>
								<tr>
									<td style="display: none;"><b>Device Id</b></td>
									<td style="display: none;"><b>Device Name</b></td>
									<td><b>Short Name</b></td>
									<td style="display: none;"><b>Ip Address</b></td>
									<td style="display: none;"><b>Connection Type</b></td>
									<td><b>Serial No.</b></td>
									<td><b>Direction</b></td>
									<td style="display: none;"><b>Device Type</b></td>
									<td><b>Time Zone</b></td>
									<td style="display: none;"><b>Time Out</b></td>
									<td><b>T Stamp</b></td>
									<td><b>Op Stamp</b></td>
									<td><b>Location</b></td>
									<td><b>Status</b></td>
									<td><b>LastPing</b></td>
									<td></td>




								</tr>
							</thead>
							<tbody>
								<c:forEach items="${piList}" var="theme" varStatus="status">
									<tr>
										<td style="display: none;">${theme.get(0)}</td>
										<td style="display: none;">${theme.get(1)}</td>
										<td>${theme.get(2)}</td>
										<td style="display: none;">${theme.get(3)}</td>
										<td style="display: none;">${theme.get(4)}</td>
										<td>${theme.get(5)}</td>
										<td>${theme.get(6)}</td>
										<td style="display: none;">${theme.get(7)}</td>
										<td>${theme.get(8)}</td>
										<td style="display: none;">${theme.get(9)}</td>
										<td>${theme.get(10)}</td>
										<td>${theme.get(11)}</td>

										<td>${theme.get(12)}</td>
										<td>${theme.get(13)}</td> 
										<td>${theme.get(14)}</td> 
										<td><span style="display:flex;"><button type="button" id="editBtn"
												class="fas fa-edit edit" data-toggle="modal"
												data-target="#exampleModalCenter2"></button>
											<button type="button" id="deleteBtn"
												class="far fa-trash-alt  delete"
												data-toggle="modal" data-target="#exampleModalCenter1"></button></span></td>


									</tr>
								</c:forEach>

							</tbody>

						</table>


					</div>
					<div class="datatable-bottom">
						<table width="100%">
							<tr>
								<td width="90%">
									<p style="color: Green;">
										<b> ${message}</b>
									</p> <c:remove var="message" scope="session" />
									


								</td>
         <td width="5%">
         <input type="hidden" name="onClickSerialNumber" id="onClickSerialNumber">
         <input type="hidden" name="ShortName" id="ShortName">
         </td>
								<td width="5%">
									<button type="button"
										class="Custombtn2 btn-outline-light fas fa-plus-circle Add"
										data-toggle="modal" data-target="#exampleModal">Add</button>
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

		<!------------------------------------------------- Model for Edit ------------------------------------------------------>

		<div class="modal fade" id="exampleModalCenter2" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Device
							Information</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form id="myForm" method="post">
							<table class="ModalTable" border="0">
								<tr>


									<td>Device Name</td>
									<input type=hidden name="DeviceId" id="deviceId" required />
									<td><input type="text" name="DeviceFName" id="DeviceFName"
										required /></td>
									<td>Short Name</td>
									<td><input type="text" name="DeviceSName" id="ShortNamet"
										required /></td>
								</tr>
								<tr>
									<td>Serial Number</td>
									<td><input type="text" name="SerialNumber"
										id="SerialNumber" required /></td>
									<td>Connection Type</td>
									<td><select name="ConnectionType" id="ConnectionType">
											<option id="directionC1" value="TCP/IP">TCP/IP</option>
											<option id="directionC2" value="USB">USB</option>
									</select></td>
								</tr>
								<tr>
									<td>Ip Address</td>
									<td><input type="text" name="IpAddress" id="IpAddress"
										required /></td>
									<td>Device Location</td>
									<td><select name="Location"
										style="top: 0px; left: 0px; width: 200px; height: 25px; line-height: 20px; margin: 0; padding: 0;"
										onchange="document.getElementById('displayValue').value=this.options[this.selectedIndex].text;">
											<c:forEach var="d" items="${Data}">
												<option value="${d}">${d}</option>
											</c:forEach>
									</select> <input type="text" name="locationInput1" id="displayValue"
										placeholder="add/select a value" onfocus="this.select()"
										style="position: absolute; top: 138px; left: 474px; width: 183px; width: 180px\9; # width: 180px; height: 23px; height: 21px\9; # height: 18px; border: 1px solid #556;">
								</tr>
								<tr>
									<td>Time Zone</td>
									<td><input type="text" name="TimeZone" id="TimeZone"
										required /></td>
									<td>Time Out</td>
									<td><input type="text" name="TimeOut" id="TimeOut"
										required /></td>
								</tr>
								<tr>
									<td>Device Direction</td>
									<td><select name="DeviceDirection" id="DeviceDirection"
										required>
											<option id="direction1" value="in">In Device</option>
											<option id="direction2" value="out">Out Device</option>
											<option id="direction3" value="altinout">Alternate
												IN/Out Device</option>
											<option id="direction4" value="inout">System
												Direction(IN/Out)Device</option>
									</select></td>
								</tr>
								<tr>
									<td>Device Type</td>
									<td colspan="3">
										<div class="form-check-inline">
											<div class="custom-control custom-radio">
												<input type="radio" id="customRadio1" value="Attendance"
													name="customRadio" class="custom-control-input"> <label
													class="custom-control-label" style="margin-right: 15px;"
													for="customRadio1">Attendance</label>
											</div>
											<div class="custom-control custom-radio">
												<input type="radio" id="customRadio2" name="customRadio"
													value="Canteen" class="custom-control-input"> <label
													class="custom-control-label" for="customRadio2"
													style="margin-right: 15px;">Canteen</label>
											</div>
											<div class="custom-control custom-radio">
												<input type="radio" id="customRadio3" name="customRadio"
													value="Access" class="custom-control-input"> <label
													class="custom-control-label" for="customRadio3">Access
													Control</label>

											</div>
										</div>
									</td>
								</tr>
							</table>


							<div class="modal-footer">
								<input type=hidden class="form-control" name="DeviceType1"
									id="radioone" />

								<button type="button" class="btn btn-outline-dark"
									data-dismiss="modal">Close</button>
								<input type="submit" class="btn btn-outline-dark" id="save11"
									value="UpDate Data">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<!---------------------------------------------Model for delete---------------------------------------------------------->


		<div class="modal fade" id="exampleModalCenter1" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<form action="DeleteServlet" method="post">

						<div class="modal-body">
							Are you Want to Delete ?

							<div class="form-group">
								<!--  <label for="Ip Address"  style="height:25px;" class="cols-sm-2 control-label"> Ip Address</label>-->
								<div class="cols-sm-10">
									<div class="input-group" style="width: 150px">
										<span class="input-group-addon"><i
											class="fa fa-user fa" aria-hidden="true"></i></span> <input
											type=hidden class="form-control" style="height: 25px;"
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






		<!---------------------------------------  Add Modal ----------------------------------------------->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Device
							Information</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form id="myForm1" method="post">
							<table class="ModalTable" border="0">
								<tr>
									<td>Device Name</td>
									<td><input type="text" name="DeviceFName1"
										id="DeviceFName1" required /></td>
									<td>Short Name</td>
									<td><input type="text" name="DeviceSName1"
										id="DeviceSName1" required /></td>
								</tr>
								<tr>
									<td>Serial Number</td>
									<td><input type="text" name="SerialNumber1"
										id="SerialNumber1" required /></td>
									<td>Connection Type</td>
									<td><select name="ConnectionType1" id="ConnectionType1">
											<option id="directionC11" value="TCP/IP">TCP/IP</option>
											<option id="directionC22" value="USB">USB</option>
									</select></td>
								</tr>
								<tr>
									<td>Ip Address</td>
									<td><input type="text" name="IpAddress1" id="IpAddress1"
										required /></td>
									<td>Device Location</td>
									<td><select name="Location11" id="Location11"
										style="top: 0px; left: 0px; width: 200px; height: 25px; line-height: 20px; margin: 0; padding: 0;"
										onchange="document.getElementById('displayValue1').value=this.options[this.selectedIndex].text;">
											<c:forEach var="d" items="${Data}">
												<option value="${d}">${d}</option>
											</c:forEach>
									</select> <input type="text" name="locationInput" id="displayValue1"
										placeholder="Add location" onfocus="this.select()"
										style="position: absolute; top: 138px; left: 474px; width: 183px; width: 180px\9; # width: 180px; height: 23px; height: 21px\9; # height: 18px; border: 1px solid #556;">




									</td>

								</tr>
								<tr>
									<td>Time Zone</td>
									<td><input type="text" name="TimeZone1" value=330
										id="TimeZone1" required /></td>
									<td>Time Out</td>
									<td><input type="text" name="TimeOut1" value="300"
										id="TimeOut1" required /></td>
								</tr>
								<tr>
									<td>Device Direction</td>
									<td><select name="DeviceDirection1" id="DeviceDirection1"
										required>
											<option id="direction11" value="in">In Device</option>
											<option id="direction22" value="out">Out Device</option>
											<option id="direction33" value="altinout">Alternate
												IN/Out Device</option>
											<option id="direction44" value="inout">System
												Direction(IN/Out)Device</option>
									</select></td>
								</tr>
								<tr>
									<td>Device Type</td>
									<td colspan="3">
										<div class="form-check-inline">
											<div class="custom-control custom-radio">
												<input type="radio" id="customRadio11" value="Attendance"
													name="customRadio1" class="custom-control-input"> <label
													class="custom-control-label" style="margin-right: 15px;"
													for="customRadio11">Attendance</label>
											</div>
											<div class="custom-control custom-radio">
												<input type="radio" id="customRadio22" name="customRadio1"
													value="Canteen" class="custom-control-input"> <label
													class="custom-control-label" for="customRadio22"
													style="margin-right: 15px;">Canteen</label>
											</div>
											<div class="custom-control custom-radio">
												<input type="radio" id="customRadio33" name="customRadio1"
													value="Access" class="custom-control-input"> <label
													class="custom-control-label" for="customRadio33">Access
													Control</label>

											</div>
										</div>
									</td>
								</tr>
							</table>

							<div class="modal-footer">
								<input type="text" class="form-control"
									style="visibility: hidden;" name="DeviceType11" id="radioone1" />

								<button type="button" class="btn btn-outline-dark"
									data-dismiss="modal">Close</button>
								<input type="submit" class="btn btn-outline-dark" id="save11q"
									value="Add Device">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<!---------------------------------------------------script for Edit button-------------------------------------------------->
		<script>
		$('#myForm input').on('change', function() {

			var val = $('input[name=customRadio]:checked', '#myForm').val();
			document.getElementById("radioone").value = val;
		});
 
	</script>
	
	
		<script>
		

		$('.Table').on('click', '.edit', function() {
			var currow = $(this).closest('tr');
			var col1 = currow.find('td:eq(0)').text();
			var col2 = currow.find('td:eq(1)').text();
			var col3 = currow.find('td:eq(2)').text();
			var col4 = currow.find('td:eq(3)').text();
			var col5 = currow.find('td:eq(4)').text();
			var col6 = currow.find('td:eq(5)').text();
			var col7 = currow.find('td:eq(6)').text();
			var col8 = currow.find('td:eq(7)').text();
			var col9 = currow.find('td:eq(8)').text();
			var col10 = currow.find('td:eq(9)').text();
			var col13 = currow.find('td:eq(12)').text();
			
			 document.getElementById("displayValue").value = col13;
			 document.getElementById("deviceId").value = col1;
			 document.getElementById("DeviceFName").value = col2;
		    document.getElementById("ShortNamet").value = col3;
		  
		    document.getElementById("ConnectionType").value = col5;
			document.getElementById("SerialNumber").value = col6;
			document.getElementById("DeviceDirection").value = col7;
			document.getElementById("IpAddress").value = col4;
			document.getElementById("radioone").value = col8;
			
			document.getElementById("TimeZone").value = col9;
			document.getElementById("TimeOut").value = col10;
			
		

			if (col8 == "Attendance") {
				document.getElementById("customRadio1").checked = true;
			} else if (col8 == "Canteen") {
				document.getElementById("customRadio2").checked = true;
			} else if (col8 == "Access") {
				document.getElementById("customRadio3").checked = true;
			}

			if (col7 == "in") {
				document.getElementById("direction1").value = col7;
			} else if (col7 == "out") {
				document.getElementById("direction2").value = col7;
			} else if (col7 == "altinout") {
				document.getElementById("direction3").value = col7;
			} else if (col7 == "inout") {
				document.getElementById("direction4").value = col7;
			}

			// alert(result);
		})
	</script>

		<!------------------------------------- script for Delete button ----------------------------------------------------------->
		<script>
	$('.Table').on('click', '.delete', function() {
		var currow = $(this).closest('tr');
		
		var col1 = currow.find('td:eq(0)').text();
		
		document.getElementById("DeviceId").value = col1;
		
	
	})
</script>

		<!-- ----------------------------------------script for Add button---------------------------------------------------------------- -->
		<script>
		$('#myForm1 input').on('change', function() {

			var val = $('input[name=customRadio1]:checked', '#myForm1').val();
			document.getElementById("radioone1").value = val;
			


		});
	
		$('.Add').on('click', function() {
			
			document.getElementById("customRadio11").checked = true;
		});
		
		
        

	</script>
<!-----------------------------MODEL FOR RIGHT CLICK BUTTONS---------------------------->
                        <!-- Modal ipAddress -->
<div class="modal fade" id="exampleModalCenterIp" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
    <div class="modal-content">
     
      <div class="modal-body">
       <input type="text" class="form-control form-control-sm" name="IpAddress" placeholder=" Change IP-Address" style="width:100%;margin: 0;">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-sm btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
                        
                         <!-- Modal SubnetMask -->
<div class="modal fade" id="exampleModalCenterSubnet" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
    <div class="modal-content">
     
      <div class="modal-body">
       <input type="text" id="SubNetMask" class="form-control form-control-sm" name="SubNetMask" placeholder=" Change SubnetMask" style="width:100%;margin: 0;">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="SubNetMaskbtn" class="btn btn-sm btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
 <!-- Modal GateWay -->
<div class="modal fade" id="exampleModalCenterGateWay" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
    <div class="modal-content">
     
      <div class="modal-body">
       <input type="text" id="GateWay" name="GateWay" class="form-control form-control-sm" name="GateWay" placeholder=" Change GateWay" style="width:100%;margin: 0;">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="GateWaybtn" class="btn btn-sm btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
 <!-- Modal WebServerIP -->
<div class="modal fade" id="exampleModalCenterWebServer" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
    <div class="modal-content">
     
      <div class="modal-body">
       <input type="text" class="form-control form-control-sm" id="WebServerIP" name="WebServerIP" placeholder=" Change WebServerIP" style="width:100%;margin: 0;">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="WebServerIPbtn" class="btn btn-sm btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
<!-- Modal WebServerPort -->
<div class="modal fade" id="exampleModalCenterWebServerPort" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
    <div class="modal-content">
     
      <div class="modal-body">
       <input type="text" id="WebServerPort" name="WebServerPort" class="form-control form-control-sm" name="WebServerPort" placeholder=" Change WebServerPort" style="width:100%;margin: 0;">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="WebServerPortbtn" class="btn btn-sm btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
<!-- -------------------------------------- Script for Edit hidden coloum ------------------------------------------------------------------------>
		<script type="text/javascript">
	$.fn.dataTable.ext.errMode = 'none';
		$(document).ready(function() {
	
	
			
				
		 var table = $('#mytable').DataTable({
			 'scrollY': 340,
			 
		 });
		 
		    $('#mytable tbody').on( 'click', 'tr', function () {
		        if ( $(this).hasClass('selected') ) {
		            $(this).removeClass('selected');
		        }
		        else {
		            table.$('tr.selected').removeClass('selected');
		            $(this).addClass('selected');
		        }
		    } );

		} );
		 
	</script>
	<!-- get value from click of serial number -->
	<script>
	 $('#mytable tr').click(function () {

	       
	        var SerialNumber = document.getElementById('mytable').rows[this.rowIndex].cells[5].innerHTML;
	        var Name = document.getElementById('mytable').rows[this.rowIndex].cells[2].innerHTML;
	  	  
	        document.getElementById("onClickSerialNumber").value=SerialNumber;
	        document.getElementById("ShortName").value=Name;
	
	
	 });
	
     </script>
	<!-----------------------------Script for Right Click Commands----------------------------------------->
		
<script type="text/javascript" charset="utf8" src="css/js/rightClick.js"></script>
 <!------------------------------------- About Modal -------------------------------------->

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
<!--snackbar div ------- -->
 <div id="snackbar" style="" class="snackbar"></div>

<script>
//<!--snackbar script ------- -->
function alertMsg(msg){
	var msg = msg;
	var x = document.getElementById("snackbar");
	 x.innerHTML = msg;
     x.style.background = "#d13535";
     x.className = "show";
     setTimeout(function () { x.className = x.className.replace("show", ""); }, 3000);
}
//<!--------------------------- password change script ---------------------------------->
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