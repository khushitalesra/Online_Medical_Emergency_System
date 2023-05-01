<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="header.html"%>
<%@ page import="Project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>
#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 95%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}
</style>
</head>
<body>
<br>

<table id="customers">
<tr>
<th>Name</th>
<th>Blood Group</th>
<th>Phone</th>
<th>Done</th>
<th>Delete</th>
</tr>
<tr>
<%
try {
	Connection conn = ConnectionProvider.getConn();
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery("select * from bloodreq where status='pending'");
	while (rs.next())
	{
	%>
	<td><%=rs.getString(1) %></td>
	<td><%=rs.getString(2) %></td>
	<td><%=rs.getString(3) %></td>
	<td><a href="requestDone.jsp?phonenumber=<%=rs.getString(3)%>" >Done</a></td>
	<td><a href="requestDelete.jsp?phonenumber=<%=rs.getString(3)%>" >Delete</a></td>
	</tr>
	<%
	}
	}
catch(Exception e)
	{
	System.out.println(e);
	}%>
	
</table>
<br>
<br>
<br>
<br>
<h3 class="centerAlign">Lets Bring A Life Back To Power</h3>
</body>
</html>