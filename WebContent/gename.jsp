<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>


<%
String n=request.getParameter("val");
if(n.length()>0){
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/paymentbilling", "root", "root");

PreparedStatement ps=con.prepareStatement("select * from student2 where name like '"+n+"%'");
//ps.setString(1,n);
out.print("<br>");
ResultSet rs=ps.executeQuery();

out.print("<table border='5' cellspacing=5 cellpadding=2 id='myTable'>");
out.print("<tr><td><a href='#' name='ID' onmouseover='javascript:getGenInfo(this.name)'><B>ID</B></a></td><td><B>Name</B></td><td><B>Mobile</B></td></tr>");
while(rs.next()){
out.print("<tr><td><a href='#' name='"+rs.getString(1)+"' onmouseover='javascript:sendGenInfo(this.name)'>"+rs.getString(1)+"</a></td>");
out.print("<td>"+rs.getString(2)+"</td>");
out.print("<td>"+rs.getString(4)+"</td>");
out.print("</tr>");
}
out.print("</table>");
con.close();
}catch(Exception e){e.printStackTrace();}
}//end of if
%>