<%@page import="bean.GenrateLicense"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Activation Page</title>
<link rel="icon" type="image/ico" href="img/eicon.png" />
<script src="css/js/jquery.js"></script>
<style>
    canvas{
        background: white;
    }
   
   .activationDiv{
    position: fixed;
top: 50%;
left: 50%;
transform: translate(-50%, -50%);
font-family: 'Merriweather Sans', sans-serif;
height: auto;
width: 350px;
border-radius: 5px;
padding: 10px;
border: 3px solid black;
background: #e4e4e6;
   }
    
    </style>
</head>

<%String MacAdd = GenrateLicense.searchForMac();
	request.getSession().setAttribute("MacAdd",MacAdd); %>

<body>



<div id="particles-js">
<div class="activationDiv">
        <form id="DatabaseForm" action="LicenseKeySave" method="post">
        <center><h1>eBioServer Activation</h1>
        <div style="border: 2px solid black;padding: 17px;background: aliceblue;width: 280px;margin: 0;">
                        <table class="ModalTable" border="0">
                            <tr>
                                <td> Version:</td>
                                <td><input type="text" disabled name="databasetype" id="databasetype" value="eBioServer 1.0" required /></td>

                            </tr>
                            <tr>
                                <td>Mac-Address:</td>
                                <td><input type="text"  disabled name="ActivationCode"   id="ActivationCode"  value="${MacAdd}"required/></td>
                            </tr>
                            <tr>
                                <td>License Key:</td>
                                <td><input type="text" name="LicenseKey1" id="LicenseKey1"  /></td>
                            </tr>
                            <tr>
                            <td colspan="2"><span style="display:inline-flex;float:right">
                             
                    <a style="padding: 3px 12px;text-decoration: none;font-size: 13px;"  class="Custombtn btn-outline-dark"   href="index.jsp">Back to Login</a>
                    
                           
                      <input type="submit"  style=""  class="Custombtn btn-outline-dark" value="Save">
                </span>
                </td>
                            </tr>
                            </table>
                    
              
             
                    
              
                </div>
                <p style="color: Red; font-size: 12px;">${Connectionerror}</p> <c:remove var="Connectionerror" scope="session" />
                 <p style="color: Red; font-size: 12px;">${status}</p> <c:remove var="status" scope="session" />
               
                </center>
                
                </form>
                
                   
                </div>
                </div>
                
                
                
                 <script src="css/js/particles.min.js"></script>
    <script src="css/js/app.js"></script>
    <script src="http://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"></script>
    <script>
    particlesJS("particles-js", {"particles":{"number":{"value":6,"density":{"enable":true,"value_area":800}},"color":{"value":"#1b1e34"},"shape":{"type":"polygon","stroke":{"width":0,"color":"#000"},"polygon":{"nb_sides":6},"image":{"src":"img/github.svg","width":100,"height":100}},"opacity":{"value":0.3,"random":true,"anim":{"enable":false,"speed":1,"opacity_min":0.1,"sync":false}},"size":{"value":160,"random":false,"anim":{"enable":true,"speed":10,"size_min":40,"sync":false}},"line_linked":{"enable":false,"distance":200,"color":"#ffffff","opacity":1,"width":2},"move":{"enable":true,"speed":8,"direction":"none","random":false,"straight":false,"out_mode":"out","bounce":false,"attract":{"enable":false,"rotateX":600,"rotateY":1200}}},"interactivity":{"detect_on":"canvas","events":{"onhover":{"enable":false,"mode":"grab"},"onclick":{"enable":false,"mode":"push"},"resize":true},"modes":{"grab":{"distance":400,"line_linked":{"opacity":1}},"bubble":{"distance":400,"size":40,"duration":2,"opacity":8,"speed":3},"repulse":{"distance":200,"duration":0.4},"push":{"particles_nb":4},"remove":{"particles_nb":2}}},"retina_detect":true});var count_particles, stats, update; stats = new Stats; stats.setMode(0); stats.domElement.style.position = 'absolute'; stats.domElement.style.left = '0px'; stats.domElement.style.top = '0px'; document.body.appendChild(stats.domElement); count_particles = document.querySelector('.js-count-particles'); update = function() { stats.begin(); stats.end(); if (window.pJSDom[0].pJS.particles && window.pJSDom[0].pJS.particles.array) { count_particles.innerText = window.pJSDom[0].pJS.particles.array.length; } requestAnimationFrame(update); }; requestAnimationFrame(update);;
    </script>
</body>
</html>