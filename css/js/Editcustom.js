//=============for Add Device List================================================
$(document).ready(function() {
	$("#save11q").click(function(e) {
		
		if(document.getElementById("DeviceFName1").value == "")
		{
			alertMsg("please enter DeviceName");
		}
		else if(document.getElementById("DeviceSName1").value == "")
			{
			alertMsg("please enter ShortName");
			}
		else if(document.getElementById("SerialNumber1").value == "")
		{
			alertMsg("please enter SerialNumber");
		}
		else
			{
			
	    e.preventDefault();
	    $.ajax({
	        type: "POST",
	        url: "AddDeviceList1",
	        data: { 
	            id: $(this).val(), // < note use of 'this' here
	            locationInput : $('#displayValue1').val(),
	            SerialNumber1 : $('#SerialNumber1').val(),
				DeviceFName1 : $('#DeviceFName1').val(),
				DeviceSName1 : $('#DeviceSName1').val(),
				ConnectionType1 : $('#ConnectionType1').val(),
				IpAddress1 : $('#IpAddress1').val(),
				TimeZone1 : $('#TimeZone1').val(),
				TimeOut1: $('#TimeOut1').val(),
				DeviceDirection1 : $('#DeviceDirection1').val(),
				DeviceType11 : $('#radioone1').val()
				
	        },


	        success : function(responseText) {
				console.log(responseText);
				if(responseText == "isExist..DeviceName")
				{
					alertMsg("Device Name already Exist....!!");
					
					}
				else if(responseText == "isExist..ShortName")
					{
					
					alertMsg("Short Name already Exist!!");
					}
				else if(responseText == "isExist..SerialNumber")
				{
				
					alertMsg("Serial Number already Exist!!");
				}
				else
					{
					
					alertMsg(" Update sucessfully");
					
					setTimeout(function () { window.location = 'deviceList.jsp'; }, 1500);
					
					}
	        },
			error: function(xhr, ajaxOptions, thrownError) {
				alert("Update failed. error code "+xhr.status);
		   }
	       
	    });
			}
	});
	});
// ==============for Edit Device List==============================================
	$(document).ready(function() {
			$("#save11").click(function(e) {
				if(document.getElementById("DeviceFName").value == "")
					{
					alertMsg("please enter DeviceName");
					}
					else if(document.getElementById("ShortNamet").value == "")
						{
						alertMsg("please enter ShortName");
						}
					else if(document.getElementById("SerialNumber").value == "")
					{
						alertMsg("please enter SerialNumber");
					}
					
					
					else
						{
					    e.preventDefault();
					    $.ajax({
					        type: "POST",
					        url: "DeviceFnameExist",
					        data: { 
					            id: $(this).val(), // < note use of 'this' here
					          
					            locationInput1 : $('#displayValue').val(),
					            DeviceId : $('#deviceId').val(),
								SerialNumber : $('#SerialNumber').val(),
								DeviceFName : $('#DeviceFName').val(),
								DeviceSName : $('#ShortNamet').val(),
								ConnectionType : $('#ConnectionType').val(),
								IpAddress : $('#IpAddress').val(),
								TimeZone : $('#TimeZone').val(),
								TimeOut : $('#TimeOut').val(),
								DeviceDirection : $('#DeviceDirection').val(),
								DeviceType1 : $('#radioone').val()
								
					        },


					        success : function(responseText) {
								console.log(responseText);
								if(responseText == "isExists..DeviceName")
								{
									
									alertMsg("Device Name already Exist ..!!")
									}
								else if(responseText == "isExists..ShortName")
									{
									
									alertMsg("Short Name already Exist!!");
									}
								else if(responseText == "isExists..SerialNumber")
								{
								
									alertMsg("Serial Number already Exist!!");
								}
							
								else
									{
									alertMsg(" Update sucessfully");
									
									setTimeout(function () { window.location = 'deviceList.jsp'; }, 1500);
									
									}
							
							},
							error: function(xhr, ajaxOptions, thrownError) {
								alert("Update failed. error code "+xhr.status);
						   }
					       
					    });
						}
						});
					});


			
			