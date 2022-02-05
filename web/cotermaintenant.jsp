<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@include file="include/head.jsp" %>
<%
    if(request.getParameter("coter")!=null)
    {
    String cote = request.getParameter("cote");
    String id = request.getParameter("id");
    String cours = request.getParameter("cours");
    String classe = (String)session.getAttribute("classe");
    try{
       Class.forName("com.mysql.jdbc.Driver");
       Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspecole","root","");
       PreparedStatement ps = conn.prepareStatement("INSERT INTO t_cotation(CodeEleve,CodeCours,CodeClasse,Cote) VALUES(?,?,?,?)");
       ps.setString(1, id);
       ps.setString(2, cours);
       ps.setString(3, classe);
       ps.setString(4, cote);
      int x=ps.executeUpdate();
%>
<script>
    alert("Eleve cote");
</script>
<%
    }catch(Exception e){
        out.println(e);
    }
    
    }
  %>  
<%@include file="include/header_aside.jsp" %>%>
    
<main class="app-content">
<!--      <div class="app-title">
        <div>
          <h1><i class="fa fa-edit"></i> Modification</h1>
          
        </div>
        
      </div>-->
        <div class="row" style="width: 500px; margin: 0px auto;">
        <div class="col-md-12">
          <div class="tile">
            <h3 class="tile-title">Ajouter une cote</h3>
            <div class="tile-body">
                <form method="POST" action="">
                <div class="form-group">
                  <label class="control-label">Cote</label>
                 <input name="cote" class="form-control" type="number">
                </div>
                
                
                 <div class="form-group">
                     <input class="btn btn-primary" name="coter" type="submit" value="Coter">
                </div>
                
              </form>
            </div>
          </div>
        </div>
       </div>


    </main>
    
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="js/plugins/pace.min.js"></script>
    <!-- Page specific javascripts-->
    <script type="text/javascript" src="js/plugins/chart.js"></script>
    <!-- Data table plugin-->
    <script type="text/javascript" src="js/plugins/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="js/plugins/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript">$('#sampleTable').DataTable();</script>

 
    <!-- Google analytics script-->
    <script type="text/javascript">
      if(document.location.hostname == 'pratikborsadiya.in') {
      	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      	})(window,document,'script','../../www.google-analytics.com/analytics.js','ga');
      	ga('create', 'UA-72504830-1', 'auto');
      	ga('send', 'pageview');
      }
    </script>
    <script>
    $(function(){
        /** add active class and stay opened when selected */
        var url = window.location;
        
        // meilleure logique
        $('ul.app-menu li a').filter(function() {
            return this.href == url;
        }).addClass('active');
        // fin logique

        // for treeview
        // $('ul.app-menu li.treeview is-expanded ul.treeview-menu ').filter(function() {
        //     return this.href == url;
        // }).parent().addClass('is-expanded');

        // way
        // $('ul.app-menu li.treeview a').filter(function() {
        //     return this.href == url;
        // }).parent().addClass('is-expanded');

    });
    </script>
  </body>

<!-- Mirrored from pratikborsadiya.in/vali-admin/dashboard.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 15 Jul 2021 12:34:07 GMT -->
</html>
    
   

