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
<%@page import="bean.DeviceList"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>


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
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" media="screen"
	href="css/bootstrap.min.css" />

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
<script src="css/js/custom.js" type="text/javascript"></script>
<script src="css/js/Editcustom.js" type="text/javascript"></script>

<SCRIPT type="text/javascript">
    window.history.forward();
    function noBack() { window.history.forward(); }
   </SCRIPT>
  <BODY onload="noBack();"
    onpageshow="if (event.persisted) noBack();" onunload="">
    
 <script>
$(document).ready(function() {

 e.preventDefault();
    $.ajax({
        type: "POST",
        url: "devicelog",
        data: { 
        	id: $(this).val(),


              },


        success : function(responseText) {
			console.log(responseText);
},
		error: function(xhr, ajaxOptions, thrownError) {
			alert("Update failed. error code "+xhr.status);
	   }
			
});

});
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


<%!	
	String Url, Database, Username,Password,Port;
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
		User user = new User();
		response.setContentType("text/html");
		PrintWriter ut = response.getWriter();

		String id = request.getParameter("userId");
		String driverName = "com.mysql.jdbc.Driver";
		
		ArrayList al = null;
		ArrayList pid_list = new ArrayList();
		// user.setPagingNum(PagingNum);
		try {
			Class.forName(driverName);
			
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		
		Statement statement = null;
		ResultSet resultSet = null;
		try {
			 String Connection="jdbc:mysql://"+Url+":"+Port+"/"+Database+"?"+"user="+Username+"&password="+Password+"";
	    		System.out.println(Connection);
				Connection con = DriverManager.getConnection(Connection);
			statement = con.createStatement();
		
			

			String sql = "select * from devicecommands ,devices where devicecommands.SerialNumber = devices.SerialNumber ORDER BY CreationDate DESC";
		
			resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
				al = new ArrayList();
				al.add(resultSet.getInt("DeviceCommandId"));
				al.add(resultSet.getString("CreationDate"));
				al.add(resultSet.getString("Title"));
				al.add(resultSet.getString("Status"));
				al.add(resultSet.getString("ExecutionDate"));
				al.add(resultSet.getString("DeviceSName"));
				pid_list.add(al);

			}
			request.setAttribute("piList", pid_list);
		}catch (Exception e) {
			e.printStackTrace();
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
				<div class="datatable">
					<div class="datatable-top">
						<table width="100%">
							<tr>
								<td width="20%">Device Commands List </td>

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




					<div class="datatable-middle">
						<table class="Table table-bordered table-striped " id="mytable"
							style="margin: 0; padding: 0" ; align="center" cellpadding="5"
							cellspacing="5" border="0" width="100% ">
							<thead>
								<tr>
								   <td style="display: none;"><b></b></td>
									<td><b>Creation Date</b></td>
									<td><b>Command</b></td>
									<td><b>Status</b></td>
									<td><b>Execution Date</b></td>
									<td><b>Device Name</b></td>
									<td></td>
									
    							</tr>
							 </thead>
							
					     <tbody>

									<c:forEach items="${piList}" var="theme" varStatus="status">
									<tr>
									
										<td style="display: none;">${theme.get(0)}</td>
										<td>${theme.get(1)}</td>
										<td>${theme.get(2)}</td>
										<td>${theme.get(3)}</td>
										<td>${theme.get(4)}</td>
										<td>${theme.get(5)}</td>

										<td>
											<button type="button" id="deleteBtn" class=" far fa-trash-alt  delete" data-toggle="modal"data-target="#exampleModalCenter1"></button></td>

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
							'scrollY': 350,
							 "order": [[ 1, "desc" ]]
						})
						
					});
			
		</script>
		 <!------------------------------------- About Modal -------------------------------------->
<div class="modal fade bd-example-modal" id="DatabasModal" tabindex="-1" role="dialog" aria-labelledby="DatabasModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered " role="document">
            <div class="modal-content" style="width:700px;">
                <div class="modal-header">
                    <h5 class="modal-title" id="DatabaseModalLabel" style="font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;">About eBioServer</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">&times;</span>
      </button>
                </div>
                <div class="modal-body">
                    <form id="DatabaseForm" action="" method="post">
                        <table class="ModalTable" border="0">
                            <tr>
                                <td> Version:</td>
                                <td><input type="text" disabled name="databasetype" id="databasetype" value="eBioServer 1.0" required /></td>

                            </tr>
                            <tr>
                                <td>Activation Code:</td>
                                <td><input type="text"  disabled name="ActivationCode"   id="ActivationCode" required/></td>
                            </tr>
                            <tr>
                                <td>License Key:</td>
                                <td><input type="text" name="LicenseKey" id="LicenseKey"  Required/></td>
                            </tr>
                            </table>
                    
                 <p style="font-size: 11px;"> eBioServer is a enterprise grade web based software designed developed and maintained by enterprise Software solutions Lab private Limited (eSSL Security). 
   </p>
                <div class="modal-footer">
              
                    <button type="button" style="padding: 3px 12px;font-size: 13px;" class="Custombtn btn-outline-dark" data-dismiss="modal">Close</button>
                    <input type="submit"  style="padding: 3px 12px;font-size: 13px;"  class="Custombtn btn-outline-dark" value="Save">
                
              
                </div>
                
                </form>
            </div>
        </div>
    </div>
    </div>
    
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