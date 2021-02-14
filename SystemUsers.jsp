<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="bean.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="bean.DbConnectionAll"%>
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
<link
	href="https://fonts.googleapis.com/css?family=Comfortaa|Concert+One|Courgette|Exo|Nunito|Oxygen|Philosopher|Signika|Yanone+Kaffeesatz"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="css/style.css" />
<link
	href="https://fonts.googleapis.com/css?family=Exo+2|Merriweather|Merriweather+Sans|Patua+One"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" media="screen"
	href="css/bootstrap.min.css" />
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
<script src="css/js/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="css/datatable.css">

<script type="text/javascript" charset="utf8" src="css/js/datatable.js"></script>

<script src="css/js/bootstrap.min.js"></script>
<script src="css/js/pace.min.js"></script>
<script type="text/javascript"
	src="https://cdn.bootcss.com/typed.js/1.1.4/typed.min.js"></script>
<link rel="stylesheet" type="text/css" media="screen"
	href="css/pace.css" />
<script src="css/js/EmpDeviceCode.js" type="text/javascript"></script>
<style>
canvas {
	background: white;
}
</style>


<SCRIPT type="text/javascript">
	window.history.forward();
	function noBack() {
		window.history.forward();
	}
</SCRIPT>
<BODY onload="noBack();" onpageshow="if (event.persisted) noBack();"
	onunload="">
	
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

</style>
</head>

<body>

	<%
		HttpSession session1 = request.getSession();
		String login_User = (String) session1.getAttribute("user");

		if (login_User == null) {

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
	}%>

	<%
		read();
		User user = new User();
		response.setContentType("text/html");
		PrintWriter ut = response.getWriter();

		String id = request.getParameter("userId");
		String driverName = "com.mysql.jdbc.Driver";
		
		ArrayList al = null;
		ArrayList pid_list = new ArrayList();
		ArrayList pid_list1 = new ArrayList();

		// user.setPagingNum(PagingNum);
		try {
			Class.forName(driverName);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		Statement statement = null;
		ResultSet resultSet = null;

		try {
			String Connection = "jdbc:mysql://" + Url + ":" + Port + "/" + Database + "?" + "user=" + Username
					+ "&password=" + Password + "";
			System.out.println(Connection);
			Connection con = DriverManager.getConnection(Connection);
			statement = con.createStatement();

			//String sql ="SELECT  * FROM users ";

			String sql = "SELECT * from users WHERE recordstatus=1 ";
			resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {

				//System.out.println(perset.getString("Permission_ids"));
				al = new ArrayList();
				al.add(resultSet.getString("UserId"));
				al.add(resultSet.getString("LoginName"));
				al.add(resultSet.getString("RoleName"));
				al.add(resultSet.getString("RecordStatus"));
				pid_list.add(al);

			}
			resultSet.close();

			for (int i = 0; i < pid_list.size(); i++) {
				ArrayList aa1 = new ArrayList();
				aa1 = (ArrayList) pid_list.get(i);
				ResultSet perset = null;
				String sqls = "SELECT m.UserId, m.Loginname,m.RoleName,GROUP_CONCAT(d.PermissionId)  permission_ids,GROUP_CONCAT(p.Permission) permission_names FROM users m JOIN userpermissions d ON (m.UserId = d.UserId) JOIN permissions p ON (d.PermissionId=p.PermissionId) WHERE  m.UserId = "
						+ aa1.get(0) + " and recordstatus=1 GROUP BY UserID ";
				System.out.println(aa1.get(0));
				perset = statement.executeQuery(sqls);
				perset.next();
				al = new ArrayList();
				al.add(aa1.get(0));
				al.add(aa1.get(1));
				al.add(aa1.get(2));
				try {
					al.add(perset.getString("Permission_ids"));
				} catch (Exception e) {
					al.add("");
				}
				pid_list1.add(al);

			}

			request.setAttribute("piList", pid_list1);

		} catch (Exception e) {
			e.printStackTrace();
		}
	%>


	<div class="header">
		<div class="row">
			<div class="col-sm-4">
				<span> <img class="headerLogo" src="img/eicon.png" /> <span
					class="logo">eBioServer</span>
				</span>
				<p>Welcome</p>
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
								<td width="98%">System User</td>


								<td width="2%"><a
									style="font-size: 20px; color: White; text-decoration: none; margin-top: 1px;"
									class="fas fa-window-close" href="main.jsp"></a></td>

							</tr>
						</table>
					</div>

					<div class="datatable-middle">
						<table class="Table table-bordered table-striped " id="mytable"
							style="margin: 0; padding: 0" ; align="center" cellpadding="5"
							cellspacing="5" border="0" width="100% ">

							<thead>
								<tr>
									<td style="display: none;">User Id</td>
									<td>LoginName</td>
									<td>RoleName</td>
									<td style="display: none;">PermissionId</td>

									<td></td>



								</tr>
							</thead>

							<tbody>


								<c:forEach items="${piList}" var="theme" varStatus="status">
									<tr>
										<td style="display: none;">${theme.get(0)}</td>
										<td>${theme.get(1)}</td>
										<td>${theme.get(2)}</td>
										<td style="display: none;">${theme.get(3)}</td>


										<td>
											<%
												if (User.getpermission().contains("EditUsers")) {
											%>
											<button type="button" id="editBtn"
												class="fas fa-edit edit"></button> <%
 	} else {
 %>
											<button type="button" disabled id="editBtn"
												class="fas fa-edit edit"></button> <%
 	}
 %>
  <%
 	if (User.getpermission().contains("DeleteUsers")) {
 %>
											<button type="button" id="deleteBtn"
												class="far fa-trash-alt delete"></button> <%
 	}

 		else {
 %>
											<button type="button" disabled id="deleteBtn"
												class="far fa-trash-alt delete"></button> <%
 	}
 %>


										</td>

									</tr>
								</c:forEach>

							</tbody>




						</table>

					</div>
					<div class="datatable-bottom">
						<table width="100%">
							<tr>
								<td width="75%">
									<p style="color: Red;"><b>${message}</b></p> <c:remove var="message"
										scope="session" />

								</td>
								<td width="15%"><p name="SessionUser" id="SessionUser"
										style="visibility: hidden;">${user}</p></td>

								<td width="10%">
									<%
										if (User.getpermission().contains("AddUsers")) {
									%>
									<button type="button"
										class="Custombtn2 btn-outline-light fas fa-plus-circle"
										id="AddBtn" data-toggle="modal"
										data-target="#exampleModalCenter">Add</button> <%
 	} else {
 %>
									<button type="button" disabled
										class="Custombtn2 btn-outline-light fas fa-plus-circle"
										id="AddBtn">Add</button> <%
 	}
 %>



								</td>
							</tr>
						</table>
					</div>
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


	<!------------------------------------------------- Model for Edit ---------------------------------------------------->
	<div class="modal fade bd-example-modal-lg" id="exampleModalCenter2"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">

			<div class="modal-content" style="width: 600px;">
				<form id="myForm12" action="EditSystemUserServlet" method="post">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLongTitle">SystemUser
							Information</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<table class="table">
							<tr style="height: 30px; padding: 0;">
								<td style="width: 20px;">
									<div class="form-group">
										<label for="Device Name" style="height: 25px;"
											class="cols-sm-2 control-label"> Login Name</label> <input
											type=hidden style="height: 25px;" class="form-control"
											name="UserId" id="UserId" required />
										<div class="cols-sm-10">
											<div class="input-group" style="width: 150px">
												<span class="input-group-addon"><i
													class="fa fa-user fa" aria-hidden="true"></i></span> <input
													type="text" style="height: 25px;" class="form-control"
													name="LoginName" id="LoginName" required />
											</div>

										</div>

									</div>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input"
											onClick="validate2()" id="customCheck00"> <label
											class="custom-control-label" for="customCheck00">IsAdmin</label>
									</div>
								</td>
								<td style="width: 20px;">

									<div class="form-group">
										<label for="Short Name" style="height: 25px;"
											class="cols-sm-2 control-label"> Password</label>
										<div class="cols-sm-10">
											<div class="input-group" style="width: 150px">
												<span class="input-group-addon"><i
													class="fa fa-user fa" aria-hidden="true"></i></span> <input
													type="Password" class="form-control" style="height: 25px;"
													name="Password" id="Password" required />
											</div>
										</div>
									</div>

								</td>



								<td>
									<div class="form-group">
										<label for="Short Name" style="height: 25px;"
											class="cols-sm-2 control-label">Role Name</label>
										<div class="cols-sm-10">
											<div class="input-group" style="width: 150px">
												<span class="input-group-addon"><i
													class="fa fa-user fa" aria-hidden="true"></i></span> <input
													type="text" class="form-control" style="height: 25px;"
													name="RoleName" id="RoleName" required />
											</div>
										</div>
									</div>

								</td>
							</tr>
							<tr>
								<td>
									<div>
										<label for="Short Name" style="height: 25px;"
											class="cols-sm-2 control-label" style="color:blue;">Permissions
											Allowed </label>




										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input" value="1"
												onClick="validate1()" id="customCheck01"> <label
												class="custom-control-label" for="customCheck01">Users</label>
										</div>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input2"
												value="2" id="customCheck02"> &nbsp;&nbsp;View Users
										</div>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input3"
												value="3" id="customCheck03"> &nbsp;&nbsp;Add Users
										</div>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input4"
												value="4" id="customCheck04"> &nbsp; &nbsp;Edit
											Users
										</div>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input4"
												value="5" id="customCheck05"> &nbsp; &nbsp;Delete
											Users
										</div>

										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												value="76" id="customCheck011"> <label
												class="custom-control-label" for="customCheck011">DeviceManagement</label>
										</div>

										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												value="77" id="customCheck012"> <label
												class="custom-control-label" for="customCheck012">Utilities</label>
										</div>

										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												value="88" id="customCheck013"> <label
												class="custom-control-label" for="customCheck013">AboutUs</label>
										</div>
										<input type=hidden name="permissionss1" id="permissionss1">




									</div>
								</td>
							</tr>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>

						<input type="submit" id="UptoDate" class="btn btn-primary"
							onClick="CreatedAllowedPermission1()" value="Update ">

					</div>
				</form>


			</div>

		</div>

	</div>




	<!---------------------------------------------Model for delete---------------------------------------------------------->


	<div class="modal fade" id="exampleModalCenter1" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<form action="DeleteSystemUserServlet" id="formId" method="post">

					<div class="modal-body">
						Are you Want to Delete ?

						<div class="form-group">
							<!--  <label for="Ip Address"  style="height:25px;" class="cols-sm-2 control-label"> Ip Address</label>-->
							<div class="cols-sm-10">
								<div class="input-group" style="width: 150px">
									<span class="input-group-addon"><i class="fa fa-user fa"
										aria-hidden="true"></i></span> <input type=hidden
										class="form-control" style="height: 25px;" name="UserIdDelete"
										id="UserIdDelete" required /> <input type=hidden
										class="form-control" style="height: 25px;"
										name="LoginNameDelete" id="LoginNameDelete" required />
								</div>
							</div>
						</div>


					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>

						<input type="submit" data-backdrop="static"
							class="btn btn-primary del" value="Delete">



					</div>
				</form>
			</div>
		</div>
	</div>


	<!-------------------------------------------------- Modal -- for Add button------------------------------------------------------------------------->
</body>
<div class="modal fade" id="exampleModalCenter" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">

		<div class="modal-content" style="width: 600px;">
			<form id="myForm1" method="post">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Users
						Information</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<table class="table">
						<tr style="height: 30px; padding: 0;">
							<td style="width: 20px;">
								<div class="form-group">
									<label for="Device Name" style="height: 25px;"
										class="cols-sm-2 control-label"> Login Name</label>
									<div class="cols-sm-10">
										<div class="input-group" style="width: 150px">
											<span class="input-group-addon"></span> <input
												type="text" style="height: 25px;" class="form-control"
												name="LoginName1" id="LoginName1" required />
										</div>
									</div>
								</div>
								<div class="custom-control custom-checkbox">
									<input type="checkbox" class="custom-control-input"
										onClick="validate02()" id="customCheck0"> <label
										class="custom-control-label" for="customCheck0">IsAdmin</label>
								</div>
							</td>
							<td style="width: 20px;">

								<div class="form-group">
									<label for="Short Name" style="height: 25px;"
										class="cols-sm-2 control-label"> Password</label>
									<div class="cols-sm-10">
										<div class="input-group" style="width: 150px">
											<span class="input-group-addon"></span> <input
												type="Password" class="form-control" style="height: 25px;"
												name="Password1" id="Password1" required />
										</div>
									</div>
								</div>

							</td>



							<td>
								<div class="form-group">
									<label for="Short Name" style="height: 25px;"
										class="cols-sm-2 control-label">Role Name</label>
									<div class="cols-sm-10">
										<div class="input-group" style="width: 150px">
											<span class="input-group-addon"></span> <input
												type="text" class="form-control" style="height: 25px;"
												name="RoleName1" id="RoleName1" required />
										</div>
									</div>
								</div>

							</td>
						</tr>
						<tr>
							<td>
								<div>
									<label for="Short Name" style="height: 25px;"
										class="cols-sm-2 control-label" style="color:blue;">Permissions
										Allowed </label>

									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input" value="1"
											onClick="validate()" id="customCheck1"> <label
											class="custom-control-label" for="customCheck1">Users</label>
									</div>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input2" value="2"
											id="customCheck2"> &nbsp;&nbsp;View Users
									</div>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input3" value="3"
											id="customCheck3"> &nbsp;&nbsp;Add Users
									</div>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input4" value="4"
											id="customCheck4"> &nbsp; &nbsp;Edit Users
									</div>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input4" value="5"
											id="customCheck5"> &nbsp; &nbsp;Delete Users
									</div>

									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input" value="76"
											id="customCheck11"> <label
											class="custom-control-label" for="customCheck11">Device
											Management</label>
									</div>

									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input" value="77"
											id="customCheck12"> <label
											class="custom-control-label" for="customCheck12">Utilities</label>
									</div>

									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input" value="88"
											id="customCheck13"> <label
											class="custom-control-label" for="customCheck13">AboutUs</label>
									</div>
									<input type=hidden name="permission" id="permission">



								</div>
							</td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>

					<input type="submit" name="SystemSave" id="Add"
						class="btn btn-primary Add" onClick="CreatedAllowedPermission();"
						value="Add">

				</div>
			</form>


		</div>

	</div>

</div>

<!-- <script type="text/javascript">

  $(document).ready(function(){
$(".Add").click(function(){
	 
	 

    alert("Added");

});
  });

</script>
 -->





<!---------------------------------------------------script for Edit button-------------------------------------------------->
<script type="text/javascript">
	function validate1() {
		var remember1 = document.getElementById("customCheck01");

		if (remember1.checked)

		{
			document.getElementById("customCheck02").checked = true;
			document.getElementById("customCheck03").checked = true;
			document.getElementById("customCheck04").checked = true;
			document.getElementById("customCheck05").checked = true;
			document.getElementById("customCheck02").disabled = true;
			document.getElementById("customCheck03").disabled = true;
			document.getElementById("customCheck04").disabled = true;
			document.getElementById("customCheck05").disabled = true;
		} else {
			document.getElementById("customCheck02").checked = false;
			document.getElementById("customCheck03").checked = false;
			document.getElementById("customCheck04").checked = false;
			document.getElementById("customCheck05").checked = false;

			document.getElementById("customCheck02").disabled = false;
			document.getElementById("customCheck03").disabled = false;
			document.getElementById("customCheck04").disabled = false;
			document.getElementById("customCheck05").disabled = false;
		}

	}
	function validate2() {
		var remember2 = document.getElementById("customCheck00");

		if (remember2.checked)

		{
			document.getElementById("customCheck01").checked = true;
			document.getElementById("customCheck02").checked = true;
			document.getElementById("customCheck03").checked = true;
			document.getElementById("customCheck04").checked = true;
			document.getElementById("customCheck05").checked = true;
			document.getElementById("customCheck011").checked = true;
			document.getElementById("customCheck012").checked = true;
			document.getElementById("customCheck013").checked = true;

			document.getElementById("customCheck01").disabled = true;
			document.getElementById("customCheck02").disabled = true;
			document.getElementById("customCheck03").disabled = true;
			document.getElementById("customCheck04").disabled = true;
			document.getElementById("customCheck05").disabled = true;
			document.getElementById("customCheck011").disabled = true;
			document.getElementById("customCheck012").disabled = true;
			document.getElementById("customCheck013").disabled = true;

		} else {
			document.getElementById("customCheck01").checked = false;
			document.getElementById("customCheck02").checked = false;
			document.getElementById("customCheck03").checked = false;
			document.getElementById("customCheck04").checked = false;
			document.getElementById("customCheck05").checked = false;
			document.getElementById("customCheck011").checked = false;
			document.getElementById("customCheck012").checked = false;
			document.getElementById("customCheck013").checked = false;

			document.getElementById("customCheck01").disabled = false;
			document.getElementById("customCheck02").disabled = false;
			document.getElementById("customCheck03").disabled = false;
			document.getElementById("customCheck04").disabled = false;
			document.getElementById("customCheck05").disabled = false;
			document.getElementById("customCheck011").disabled = false;
			document.getElementById("customCheck012").disabled = false;
			document.getElementById("customCheck013").disabled = false;
		}

	}

	function CreatedAllowedPermission1() {
		var Allowed = "";

		if (document.getElementById("customCheck01").checked == true) {
			Allowed = 1;
		}

		if (document.getElementById("customCheck02").checked == true) {
			Allowed += " " + 2;
		}

		if (document.getElementById("customCheck03").checked == true) {
			Allowed += " " + 3;
		}

		if (document.getElementById("customCheck04").checked == true) {
			Allowed += " " + 4;
		}

		if (document.getElementById("customCheck05").checked == true) {
			Allowed += " " + 5;
		}

		if (document.getElementById("customCheck011").checked == true) {
			Allowed += " " + 76;
		}

		if (document.getElementById("customCheck012").checked == true) {
			Allowed += " " + 77;
		}

		if (document.getElementById("customCheck013").checked == true) {
			Allowed += " " + 88;
		}
		document.getElementById("permissionss1").value = Allowed;
	}

	var loginNameCol;

	$('.Table')
			.on(
					'click',
					'.edit',
					function() {

						var currow = $(this).closest('tr');
						var col2 = currow.find('td:eq(1)').text();

						loginNameCol = col2;

						
						if (col2 == "essl") {
							alert("You Can't Edit this Account");

						} else if (col2 == document.getElementById("SessionUser").innerHTML) {
						
							alert("You Can't Edit Yourself");
						} else {

							$('#exampleModalCenter2').modal("show");

							$('input[type=checkbox]').each(function() {
								this.checked = false;
							});

							var col1 = currow.find('td:eq(0)').text();

							var col3 = currow.find('td:eq(2)').text();
							var col4 = currow.find('td:eq(3)').text();
							var col5 = currow.find('td:eq(4)').text();

							document.getElementById("UserId").value = col1;
							document.getElementById("LoginName").value = col2;
							document.getElementById("RoleName").value = col3;

							if (col4.includes("1") && col4.includes("2")
									&& col4.includes("3") && col4.includes("4")
									&& col4.includes("5")
									&& col4.includes("76")
									&& col4.includes("77")
									&& col4.includes("88")) {
								document.getElementById("customCheck00").checked = true;
							}

							if (col4.includes("1")) {

								document.getElementById("customCheck01").checked = true;
							}
							if (col4.includes("2")) {

								document.getElementById("customCheck02").checked = true;
							}
							if (col4.includes("3")) {

								document.getElementById("customCheck03").checked = true;
							}
							if (col4.includes("4")) {

								document.getElementById("customCheck04").checked = true;
							}
							if (col4.includes("5")) {

								document.getElementById("customCheck05").checked = true;
							}
							if (col4.includes("76")) {

								document.getElementById("customCheck011").checked = true;
							}
							if (col4.includes("77")) {

								document.getElementById("customCheck012").checked = true;
							}
							if (col4.includes("88")) {

								document.getElementById("customCheck013").checked = true;
							}
						}

					})
</script>

<!---------------------------------------- script for Delete button ---------------------------------------------------------------------->
<script>
	$('.Table').on('click', '.delete', function() {
		var currow = $(this).closest('tr');
		var col1 = currow.find('td:eq(0)').text();
		var col2 = currow.find('td:eq(1)').text();
		if (col2 == "essl") {
			alert("You Can't Delete this Account");
		} else if (col2 == document.getElementById("SessionUser").innerHTML) {
			alert("You Can't Delete Yourself.");
		} else {
			$('#exampleModalCenter1').modal("show");

			document.getElementById("UserIdDelete").value = col1;
			document.getElementById("LoginNameDelete").value = col2;
		}
	})
</script>

<!-- ----------------------------------------script for Add button---------------------------------------------------------------- -->
<script>
	$('#myForm1 input').on('change', function() {

		var val = $('input[name=customRadio1]:checked', '#myForm1').val();

	});
</script>

<!-- ----------------------------------------script for Add checkbox button---------------------------------------------------------------- -->
<script type="text/javascript">
	function validate() {
		var remember = document.getElementById('customCheck1');

		if (remember.checked)

		{
			document.getElementById("customCheck2").checked = true;
			document.getElementById("customCheck3").checked = true;
			document.getElementById("customCheck4").checked = true;
			document.getElementById("customCheck5").checked = true;
			document.getElementById("customCheck2").disabled = true;
			document.getElementById("customCheck3").disabled = true;
			document.getElementById("customCheck4").disabled = true;
			document.getElementById("customCheck5").disabled = true;
		} else {
			document.getElementById("customCheck2").checked = false;
			document.getElementById("customCheck3").checked = false;
			document.getElementById("customCheck4").checked = false;
			document.getElementById("customCheck5").checked = false;
			document.getElementById("customCheck2").disabled = false;
			document.getElementById("customCheck3").disabled = false;
			document.getElementById("customCheck4").disabled = false;
			document.getElementById("customCheck5").disabled = false;
		}

	}
	document.getElementById("customCheck0").checked = true;
	validate02();
	function validate02() {
		var remember02 = document.getElementById("customCheck0");

		if (remember02.checked)

		{
			document.getElementById("customCheck1").checked = true;
			document.getElementById("customCheck2").checked = true;
			document.getElementById("customCheck3").checked = true;
			document.getElementById("customCheck4").checked = true;
			document.getElementById("customCheck5").checked = true;
			document.getElementById("customCheck11").checked = true;
			document.getElementById("customCheck12").checked = true;
			document.getElementById("customCheck13").checked = true;
			document.getElementById("customCheck1").disabled = true;
			document.getElementById("customCheck2").disabled = true;
			document.getElementById("customCheck3").disabled = true;
			document.getElementById("customCheck4").disabled = true;
			document.getElementById("customCheck5").disabled = true;
			document.getElementById("customCheck11").disabled = true;
			document.getElementById("customCheck12").disabled = true;
			document.getElementById("customCheck13").disabled = true;

		} else {
			document.getElementById("customCheck1").checked = false;
			document.getElementById("customCheck2").checked = false;
			document.getElementById("customCheck3").checked = false;
			document.getElementById("customCheck4").checked = false;
			document.getElementById("customCheck5").checked = false;
			document.getElementById("customCheck11").checked = false;
			document.getElementById("customCheck12").checked = false;
			document.getElementById("customCheck13").checked = false;
			document.getElementById("customCheck1").disabled = false;
			document.getElementById("customCheck2").disabled = false;
			document.getElementById("customCheck3").disabled = false;
			document.getElementById("customCheck4").disabled = false;
			document.getElementById("customCheck5").disabled = false;
			document.getElementById("customCheck11").disabled = false;
			document.getElementById("customCheck12").disabled = false;
			document.getElementById("customCheck13").disabled = false;

		}
	}

	function CreatedAllowedPermission() {

		var AllowedPermission = "";

		if (document.getElementById("customCheck1").checked) {
			AllowedPermission = document.getElementById("customCheck1").value;

		}
		if (document.getElementById("customCheck2").checked) {

			AllowedPermission += " "
					+ document.getElementById("customCheck2").value;

		}
		if (document.getElementById("customCheck3").checked) {

			AllowedPermission += " "
					+ document.getElementById("customCheck3").value;

		}
		if (document.getElementById("customCheck4").checked) {

			AllowedPermission += " "
					+ document.getElementById("customCheck4").value;

		}

		if (document.getElementById("customCheck5").checked) {

			AllowedPermission += " "
					+ document.getElementById("customCheck5").value;

		}
		if (document.getElementById("customCheck11").checked) {

			AllowedPermission += " "
					+ document.getElementById("customCheck11").value;

		}
		if (document.getElementById("customCheck12").checked) {

			AllowedPermission += " "
					+ document.getElementById("customCheck12").value;

		}
		if (document.getElementById("customCheck13").checked) {

			AllowedPermission += " "
					+ document.getElementById("customCheck13").value;

		}

		document.getElementById("permission").value = AllowedPermission;
	}
</script>

<!-- -------------------------------------- Script for Datatable ------------------------------------------------------------------------>
<script type="text/javascript">
	$.fn.dataTable.ext.errMode = 'none';
	$(document).ready(function() {

		var table = $('#mytable').DataTable({
			'scrollY': 340,
		});

	});
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

<!--snackbar div ------- -->
 <div id="snackbar" style="" class="snackbar"></div>

<script>
<!--snackbar script ------- -->
function alertMsg(msg){
	var msg = msg;
	var x = document.getElementById("snackbar");
	 x.innerHTML = msg;
     x.style.background = "#d13535";
     x.className = "show";
     setTimeout(function () { x.className = x.className.replace("show", ""); }, 3000);
}
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