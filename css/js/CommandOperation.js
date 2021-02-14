//=========================for OPStamp==============================
$(document).ready(function() {
	$("#ResetOpStamp").click(function(e) {
e.preventDefault();
    $.ajax({
        type:"Post",
        url: "DevicceComOperation",
       
        data: { 
            id: $(this).val(), // < note use of 'this' here
            methodcall :"Opstamp",
            onClickSerialNumber:$('#onClickSerialNumber').val(),
		},
         success : function(responseText) {
			console.log(responseText);
			if(responseText == "isExist")
			{
				alertMsg("Sucess Reset OpStamp")
				setTimeout(function () { window.location = 'deviceList.jsp'; }, 1500);
				
			 }
           },
         error: function(xhr, ajaxOptions, thrownError) {
			alert("Update failed. error code ");
	       }
        });
      });
//=========for-Tstamp=================================

	$("#ResetTStamp").click(function(e) {
		
		e.preventDefault();
		    $.ajax({
		    	
		        type:"Post",
		        url: "DevicceComOperation",
		       
		        data: { 
		            id: $(this).val(), // < note use of 'this' here
		            methodcall :"Tstamp",
		            onClickSerialNumber:$('#onClickSerialNumber').val(),
		        },
				
		         success : function(responseText) {
					console.log(responseText);
					if(responseText == "isExist")
					{
						alertMsg("Sucess Reset Transaction Stamp")
						setTimeout(function () { window.location = 'deviceList.jsp'; }, 1500);
						
					 }
		           },
		         error: function(xhr, ajaxOptions, thrownError) {
					alert("Update failed. error code ");
			       }
		        
		    });
		     });

//=========for-ClearLogs=================================

	$("#ClearLog").click(function(e) {
		e.preventDefault();
		    $.ajax({
		        type:"Post",
		        url: "DevicceComOperation",
		       
		        data: { 
		            id: $(this).val(), // < note use of 'this' here
		            methodcall :"ClearLogsDevice",
		            onClickSerialNumber:$('#onClickSerialNumber').val(),
				},
		         success : function(responseText) {
					console.log(responseText);
					if(responseText == "isExist")
					{
						alertMsg("Sucess Clear Logs from Device")
						setTimeout(function () { window.location = 'deviceList.jsp'; }, 1500);
						
					 }
		           },
		         error: function(xhr, ajaxOptions, thrownError) {
					alert("Update failed. error code ");
			       }
		        });
		      });
	
//=========for-WedServerIp=================================

	$("#WebServerIPbtn").click(function(e) {
		if(document.getElementById("WebServerIP").value == "")
		{
		alert("please enter WebServerIP");
		}
	else{
		e.preventDefault();
		    $.ajax({
		        type:"Post",
		        url: "DevicceComOperation",
		       
		        data: { 
		            id: $(this).val(), // < note use of 'this' here
		            methodcall :"WebServerIP",
		            WebServerIP : $('#WebServerIP').val(),
		            onClickSerialNumber:$('#onClickSerialNumber').val(),
				},
		         success : function(responseText) {
					console.log(responseText);
					if(responseText == "isExist")
					{
						alertMsg("Sucess WebServerIp")
						setTimeout(function () { window.location = 'deviceList.jsp'; }, 1500);
						
					 }
		           },
		         error: function(xhr, ajaxOptions, thrownError) {
					alert("Update failed. error code ");
			       }
		        });
	} 
	});
	

//=========for-WedServerPort=================================

	$("#WebServerPortbtn").click(function(e) {
		if(document.getElementById("WebServerPort").value == "")
		{
		alert("please enter WebServerPort");
		}
	else{
		e.preventDefault();
		    $.ajax({
		        type:"Post",
		        url: "DevicceComOperation",
		       
		        data: { 
		            id: $(this).val(), // < note use of 'this' here
		            methodcall :"WebServerPort",
		            WebServerPort : $('#WebServerPort').val(),
		            onClickSerialNumber:$('#onClickSerialNumber').val(),
				},
		         success : function(responseText) {
					console.log(responseText);
					if(responseText == "isExist")
					{
						alertMsg("Sucess WebServerPort")
						setTimeout(function () { window.location = 'deviceList.jsp'; }, 1500);
						
					 }
		           },
		         error: function(xhr, ajaxOptions, thrownError) {
					alert("Update failed. error code ");
			       }
		        });
	} 
	});
	
	//=========for-Restart=================================

	$("#RestartDevice").click(function(e) {
		e.preventDefault();
		    $.ajax({
		        type:"Post",
		        url: "DevicceComOperation",
		       
		        data: { 
		            id: $(this).val(), // < note use of 'this' here
		            methodcall :"Restart",
		            onClickSerialNumber:$('#onClickSerialNumber').val(),
				},
		         success : function(responseText) {
					console.log(responseText);
					if(responseText == "isExist")
					{
						alertMsg("Device is Restart")
						setTimeout(function () { window.location = 'deviceList.jsp'; }, 1500);
						
					 }
		           },
		         error: function(xhr, ajaxOptions, thrownError) {
					alert("Update failed. error code ");
			       }
		        });
	
	});
	//=========for-GateWay=================================

	$("#GateWaybtn").click(function(e) {
		if(document.getElementById("GateWay").value == "")
		{
		alert("please enter GateWay");
		}
	else{
		e.preventDefault();
		    $.ajax({
		        type:"Post",
		        url: "DevicceComOperation",
		       
		        data: { 
		            id: $(this).val(), // < note use of 'this' here
		            methodcall :"GATEWay",
		            GateWay: $('#GateWay').val(),
		            onClickSerialNumber:$('#onClickSerialNumber').val(),
				},
		         success : function(responseText) {
					console.log(responseText);
					if(responseText == "isExist")
					{
						alertMsg("Change GateWay SucessFully")
						setTimeout(function () { window.location = 'deviceList.jsp'; }, 1500);
						
					 }
		           },
		         error: function(xhr, ajaxOptions, thrownError) {
					alert("Update failed. error code ");
			       }
		        });
	}
	});
	//=========for-SubNetMask=================================

	$("#SubNetMaskbtn").click(function(e) {
		if(document.getElementById("SubNetMask").value == "")
		{
		alert("please enter SubNetMask");
		}
	else{
		e.preventDefault();
		    $.ajax({
		        type:"Post",
		        url: "DevicceComOperation",
		       
		        data: { 
		            id: $(this).val(), // < note use of 'this' here
		            methodcall :"SubNetMask",
		            SubNetMask: $('#SubNetMask').val(),
		            onClickSerialNumber:$('#onClickSerialNumber').val(),
				},
		         success : function(responseText) {
					console.log(responseText);
					if(responseText == "isExist")
					{
						alertMsg("Change SubNetMask SucessFully")
						setTimeout(function () { window.location = 'deviceList.jsp'; }, 1500);
						
					 }
		           },
		         error: function(xhr, ajaxOptions, thrownError) {
					alert("Update failed. error code ");
			       }
		        });
	}
	});
	
	
		
});

//=====================================================
