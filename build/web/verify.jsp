<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
    if(request.getParameter("connect")!=null)
    {
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    try{
        ResultSet rs;
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspecole","root","");
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM t_compte LEFT JOIN t_personnel ON t_compte.CodeEnseignant=t_personnel.CodePersonnel WHERE Username=? AND Password=?");
        ps.setString(1, username);
        ps.setString(2, password);
        rs = ps.executeQuery();

       if(rs.next())
       {
        String code = rs.getString("CodeCompte");
        int privilege = rs.getInt("CodePrivilege");
        String user = rs.getString("Username");
        String classe = rs.getString("CodeClasse");

        session.setAttribute("code", code);
        session.setAttribute("privilege", privilege);
        session.setAttribute("username", user);
        session.setAttribute("classe", classe);
           %>
           <jsp:forward page="home.jsp" />
           <%
       }else{
        %>
           <jsp:forward page="index.jsp" />
           <%
    }
    }catch(Exception e){
        out.println(e);
    }
    }
  %>  
