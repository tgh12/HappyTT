<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="net.tanesha.recaptcha.ReCaptcha"%>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Add User Account</title>
<!-- Bootstrap core CSS -->
<!--Online link to include bootstrap need not include any libraries in eclipse -->
<link
	href="//netdna.bootstrapcdn.com/bootstrap/2.3.2/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>

	<div class="container">
		<h1>
			<a href="#">Add User</a>
		</h1>
		<div class="navbar">
			<div class="navbar-inner">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#">Add User</a></li>
					<li><a href="deleteUser.jsp">Delete User</a></li>
					<li><a href="transferUser.jsp">Transfer User</a></li>
				</ul>
			</div>
		</div>

		<div class="row">
			<div class="span4">
				<ul class="nav nav-list">
					<li class="nav-header">Other Links</li>
					<li>Add Links Here</li>
				</ul>
			</div>
			<div class="span8">
				<div class="container">
					<form>

						<table>
							<tr>
								<td align="right">First Name:</td>
								<td align="left"><input type="text" name="first" /></td>
							</tr>
							<tr>
								<td align="right">Last Name:</td>
								<td align="left"><input type="text" name="last" /></td>
							</tr>
							<tr>
								<td align="right">Department:</td>
								<td align="left"><select>
										<option value="Sales">Sales</option>
										<option value="IT and Technical Support">IT and
											Technical Support</option>
										<option value="Transactions Monitoring">Transactions
											Monitoring</option>
										<option value="Human Resources">Human Resources</option>
										<option value="Company Management">Company Management</option>
								</select></td>
							</tr>
							<tr>
								<td align="right">Designation:</td>
								<td align="left"><select>
										<option value="Corporate Level">Corporate Level</option>
										<option value="Department Manager">Department Manager</option>
										<option value="Regular Employees">Regular Employees</option>
										<option value="System Administrators">System
											Administrators</option>
								</select></td>
							</tr>
							<tr>
								<td align="right">User ID:</td>
								<td align="left"><input type="text" name="uid" /></td>
							</tr>

							<tr>
								<td align="right">Email:</td>
								<td align="left"><input type="text" name="email" /></td>
							</tr>
							<tr>
								<td align="right">Phone Number:</td>
								<td align="left"><input type="text" name="phone" /></td>
							</tr>
							<tr>
								<td align="right">Date of Birth:</td>
								<td align="left"><input type="text" name="dob"
									placeholder="MM/DD/YYYY" /></td>
							</tr>
							<tr>
								<td align="right">Address:</td>
								<td align="left"><textarea name="address" /></textarea></td>
							</tr>
							<tr>
								<td align="right">Identification Type</td>
								<td align="left"><input type="text" name="id"
									placeholder="Passport/License..." /></td>
							</tr>
							<tr>
								<td align="right">Identification Number</td>
								<td align="left"><input type="text" name="inum" /></td>
							</tr>
							<tr>
								<td align="right">Security Answer 1</td>
								<td align="left"><input type="text" name="sq1" /></td>
							</tr>
							<tr>
								<td align="right">Security Answer 2:</td>
								<td align="left"><input name="sq2" type="text" /></td>
							</tr>
							<tr>
								<td align="right">Security Answer 3:</td>
								<td align="left"><input type="text" name="sq3" /></td>
							</tr>
							<tr>
								<td><button class="btn btn-success" type="button"
										name="submit" value="submit">Submit</button></td>
								<td><button class="btn" type="button" name="cancel">Cancel</button></td>
							</tr>
							
						</table>
						<br> <br>
											</form>
				</div>
			</div>
		</div>
	</div>
</body>
=======
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Add User Account</title>
<!-- Bootstrap core CSS -->
<!--Online link to include bootstrap need not include any libraries in eclipse -->
<link href="//netdna.bootstrapcdn.com/bootstrap/2.3.2/css/bootstrap.min.css" rel="stylesheet">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>

</head>
<body>

<div class="container">
	<h1><a href="#">Add User</a></h1>
	<div class="navbar">
  		<div class="navbar-inner">
      	<ul class="nav nav-tabs">
      	<li class="active"><a href="#">Add User</a></li>
      	<li><a href="deleteUserPage.html">Delete User</a></li>
      	<li><a href="transferUserPage.html">Transfer User</a></li>
    	</ul>
  		</div>
	</div> 
	
	<div class="row">
         <div class="span4">
             <ul class="nav nav-list">
             	<li class="nav-header">Other Links</li>
             	<li>Add Links Here</li>
             </ul>
         </div>
         <div class="span8">
          <div class="container">
			<form:form action = "createuser.html" method ="post" commandName="user" >
               <table>
               <tr>
               <td>
               <%= session.getAttribute("UserID")%> 
               </td>
               </tr>
    			<tr>
      				<td align="right">First Name:</td>
      				<td align="left"><form:input path="firstname" type="text"  /></td>
    			</tr>
    			<tr>
      				<td align="right">Last Name:</td>
      				<td align="left"><form:input path="lastname" type="text"  /></td>
    			</tr>
    			<tr>
      				<td align="right">Department:</td>
      				<td align="left"><form:input path="deptID" type="text" /></td>
    			</tr>
    			<tr>
      				<td align="right">Designation:</td>
      				<td align="left"><form:input path="roleID" type="text" /></td>
    			</tr>
    			<tr>
      				<td align="right">User ID:</td>
      				<td align="left"><form:input path="userID" type="text"  /></td>
    			</tr>
    			
    			<tr>
      				<td align="right">Email:</td>
      				<td align="left"><form:input path="emailid" type="text"  /></td>
    			</tr>
    			<tr>
      				<td align="right">Phone Number:</td>
      				<td align="left"><form:input path="contact"  type="text" /></td>
    			</tr>
    			<tr>
      				<td align="right">Date of Birth:</td>
      				<td align="left"><form:input path="DOB" type="text" placeholder="MM/DD/YYYY" /></td>
    			</tr>
    			<tr>
      				<td align="right">Address:</td>
      				<td align="left"><form:input path="address" type="text" /></td>
    			</tr>
    			<tr>
      				<td align="right">Identification Type</td>
      				<td align="left"><form:input path="idtype" type="text"  placeholder="Passport/License..." /></td>
    			</tr>
    			<tr>
      				<td align="right">Identification Number</td>
      				<td align="left"><form:input path="idNo" type="text" /></td>
    			</tr>
    			<tr>
    				<td align="right">Security Question 1</td>
    				<td align="left"><form:input path="secureQ1" type="text"  /></td>
    			</tr>
    			<tr>
    				<td align="right">Security Answer 1</td>
    				<td align="left"><form:input path="secureA1" type="text"  /></td>
    			</tr>
    			<tr>
    				<td align="right">Security Question 2</td>
    				<td align="left"><form:input path="secureQ2" type="text"  /></td>
    			</tr>
    			<tr>
    				<td align="right">Security Answer 2</td>
    				<td align="left"><form:input path="secureA2" type="text"  /></td>
    			</tr>
    			<tr>
    				<td align="right">Security Question 3</td>
    				<td align="left"><form:input path="secureQ3" type="text" /></td>
    			</tr>
    			<tr>
    				<td align="right">Security Answer 3</td>
    				<td align="left"><form:input path="secureA3" type="text" /></td>
    			</tr>
    			
    			<tr>
    				<td><input  class="btn btn-success" type="submit" value="submit" /></td>
      				<td><input  class="btn" type="reset" value="Cancel" /></td>	
    			</tr>
    		</table>	
    		<br><br>
    		</form:form> 
		</div>
        </div>
     </div>
</div>
</body>
>>>>>>> 918040aed782d601422d8baccbe62c865c9d72e2
</html>