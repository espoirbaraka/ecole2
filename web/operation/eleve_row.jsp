<%@page import="java.sql.*"%>
<%@page import="org.json.simple.JSONObject"%>
<%
    if(request.getParameter("id")!=null)
    {
        String id = request.getParameter("id");
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspecole","root","");
        PreparedStatement ps = conn.prepareStatement("INSERT INTO t_eleve(NomEleve, PostnomEleve, PrenomEleve, LieuNaissance, NomPere, NomMere, ProfessionPere)VALUES(?,?,?,?,?,?,?)");
        ps.setString(1, id);
      int x=ps.executeUpdate();
      while(x.next())
      {
          
      }
      
      
    }
   
%>
<%
    JSONObject json = new JSONObject();
    json.put("title", "TITLE_TEST");
    json.put("link", "LINK_TEST");
    out.print(json);
    out.flush();
%>