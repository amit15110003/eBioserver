//=========Edit EmployeeLog verification=====================================
$(document).ready(function() {
$("#save1").click(function(e) {
	if(document.getElementById("EmployeeCode").value == "")
	{
		alertMsg("please enter EmployeeCode");
	}
else if(document.getElementById("EmployeeName").value == "")
	{
	alertMsg("please enter EmployeeName");
	}
else if(document.getElementById("DeviceCode").value == "")
	{
	alertMsg("please enter DeviceCode");
	}
else
	{
    e.preventDefault();
    $.ajax({
        type: "POST",
        url: "editEmployeeExist",
        data: { 
            id: $(this).val(), // < note use of 'this' here
            EmployeeId : $('#EmployeeId').val(),
			EmployeeCode : $('#EmployeeCode').val(),
			EmployeeName : $('#EmployeeName').val(),
			DeviceCode : $('#DeviceCode').val(),
			CardNumber : $('#CardNumber').val()
        },


        success : function(responseText) {
			console.log(responseText);
			if(responseText == "isExist")
			{
				alertMsg("Employee Code already Exist!!");
				
				
				
				}
			else if(responseText == "isExists....")
				{
				
				alertMsg("Device Code already Exist!!");
				}
			else
				{
				alertMsg(" Update sucessfully");
				setTimeout(function () { window.location = 'EmployeeLogs.jsp'; }, 1500);
				
				}
		
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert("Update failed. error code "+xhr.status);
	   }
       
    });
	}
});
});

//=========================== Add Employee Logs verification===================================
$(document).ready(function() {
	$("#save").click(function(e) {
		if(document.getElementById("EmployeeCode1").value == "")
		{
			alertMsg("please enter EmployeeCode");
		}
	else if(document.getElementById("EmployeeName1").value == "")
		{
		alertMsg("please enter EmployeeName");
		}
	else if(document.getElementById("DeviceCode1").value == "")
		{
		alertMsg("please enter DeviceCode");
		}
	else
		{
	    e.preventDefault();
	    $.ajax({
	        type: "POST",
	        url: "AddEmployeeLog",
	        data: { 
	            id: $(this).val(), // < note use of 'this' here
	           
				EmployeeCode1 : $('#EmployeeCode1').val(),
				EmployeeName1 : $('#EmployeeName1').val(),
				DeviceCode1 : $('#DeviceCode1').val(),
				CardNumber1 : $('#CardNumber1').val()
	        },


	        success : function(responseText) {
				console.log(responseText);
				if(responseText == "isExist")
				{
					alertMsg("Employee Code already Exist!!");
					
					}
				else if(responseText == "isExists....")
					{
					
					alertMsg("Device Code already Exist!!");
					}
				else
					{
					alertMsg(" Add sucessfully");
					setTimeout(function () { window.location = 'EmployeeLogs.jsp'; }, 1500);
					
					}
			
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert("Update failed. error code "+xhr.status);
		   }
	       
	    });
		}
		});
	});






//============SystemUser Exist Add model===========================


$(document).ready(function() {
	$("#Add").click(function(e) {
		if(document.getElementById("LoginName1").value == "")
		{
			alertMsg("please enter Login Name");
		}
	else if(document.getElementById("Password1").value == "")
		{
		alertMsg("please enter Password");
		}
	else if(document.getElementById("RoleName1").value == "")
		{
		alertMsg("please enter RoleName");
		}	
	else
		{
	    e.preventDefault();
	    $.ajax({
	        type: "POST",
	        url: "AddSystemUsersServlet",
	        data: { 
	            id: $(this).val(), // < note use of 'this' here
	            LoginName1 : $('#LoginName1').val(),
	            Password1 : $('#Password1').val(),
	            RoleName1 : $('#RoleName1').val(),
	            permission : $('#permission').val()
				
	        },


	        success : function(responseText) {
				console.log(responseText);
				if(responseText == "isExist")
				{
					alertMsg("Login Name already Exist!!");
					
					}
				else
					{
					alertMsg(" Add sucessfully");
					setTimeout(function () { window.location = 'SystemUsers.jsp'; }, 1500);
					
					}
			
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert("Update failed. error code "+xhr.status);
		   }
	       
	    });
		}
		});
	});
//============SystemUser Exist Edit model===========================

$(document).ready(function() {
	$("#UptoDate").click(function(e) {
if(document.getElementById("LoginName").value == "")
	{
	alertMsg("please enter Login Name");
	}
else if(document.getElementById("Password").value == "")
	{
	alertMsg("please enter Password");
	}
else if(document.getElementById("RoleName").value == "")
	{
	alertMsg("please enter RoleName");
	}
else
	{

	    e.preventDefault();
	    $.ajax({
	        type: "POST",
	        url: "EditSystemUserServlet",
	        data: { 
	            id: $(this).val(), // < note use of 'this' here
	            UserId : $('#UserId').val(),
	            LoginName : $('#LoginName').val(),
	            Password : $('#Password').val(),
	            RoleName : $('#RoleName').val(),
	            permissionss1 : $('#permissionss1').val()
				
	        },


	        success : function(responseText) {
				console.log(responseText);
				if(responseText == "EditisExist")
				{
					alertMsg("Login Name already Exist!!");
					
					}
				else
					{
					alertMsg(" Update sucessfully");
					setTimeout(function () { window.location = 'SystemUsers.jsp'; }, 1500);
					}
			
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert("Update failed. error code "+xhr.status);
		   }
	       
	    });
	}
	});
	});
