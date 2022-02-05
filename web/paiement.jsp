<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@include file="include/head.jsp" %>
<%
    if(request.getParameter("add")!=null)
    {
    String postnom = request.getParameter("postnom");
    String nom = request.getParameter("nom");
    String prenom = request.getParameter("prenom");
    String lieu = request.getParameter("lieu");
    String date = request.getParameter("date");
    String pere = request.getParameter("pere");
    String mere = request.getParameter("mere");
    String profession = request.getParameter("profession");
    String telephone = request.getParameter("telephone");
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspecole","root","");
       PreparedStatement ps = conn.prepareStatement("INSERT INTO t_eleve(NomEleve, PostnomEleve, PrenomEleve, DateNaissance, LieuNaissance, NomPere, NomMere, ProfessionPere, TelephoneTutelle)VALUES(?,?,?,?,?,?,?,?,?)");
       ps.setString(1, nom);
       ps.setString(2, postnom);
       ps.setString(3, prenom);
       ps.setString(4, date);
       ps.setString(5, lieu);
       ps.setString(6, pere);
       ps.setString(7, mere);
       ps.setString(8, profession);
       ps.setString(9, telephone);
      int x=ps.executeUpdate();
%>
<script>
    alert("Bien enregiste");
</script>
<%
    }catch(Exception e){
        out.println(e);
    }
    
    }
  %>  

<%@include file="include/header_aside.jsp" %>%>
    
    <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-th-list"></i> Eleves</h1>
          <!-- <p>Un outil pour faciliter les ITEMS aux élèves</p> -->
        </div>
        <ul class="app-breadcrumb breadcrumb side">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item active"><a href="home.jsp">Acceuil</a></li>
        </ul>
      </div>

      <div class="row">
        <div class="col-md-12">
          <div class="tile">
                 <div class="box-header with-border" style="margin-bottom: 8px;">
                    <a href="#addeleve" data-toggle="modal" class="btn btn-primary btn-sm btn-flat"><i class="fa fa-plus"></i> Nouveau</a>
                </div>
            <div class="tile-body">
              <div class="table-responsive">
                <table class="table table-hover table-bordered" id="sampleTable">
                  <thead>
                    <tr>
                      <th>Nom</th>
                      <th>Classe</th>
                      <th>Pere</th>
                      <th>Mere</th>
                      <th>Profession pere</th>
                      <th>Telephone tutelle</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody>
                         <%
                            ResultSet rs;
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspecole","root","");
                            String query = ("SELECT * FROM t_eleve LEFT JOIN t_classe ON t_eleve.CodeClasse=t_classe.CodeClasse");
                            Statement st = conn.createStatement();
                            rs = st.executeQuery(query);
                            while(rs.next())
                            {
                                String id = rs.getString("CodeEleve");
                                %>
                                            <tr>
                                                <td><%=rs.getString("NomEleve")+' '+rs.getString("PostnomEleve")+' '+rs.getString("PrenomEleve") %></td>
                                                <td><%=rs.getString("Classe") %></td>
                                                <td><%=rs.getString("NomPere") %></td>
                                                <td><%=rs.getString("NomMere") %></td>
                                                <td><%=rs.getString("ProfessionPere") %></td>
                                                <td><%=rs.getString("TelephoneTutelle") %></td>
                                                
                                                <td>
                                                    <a href='somme.jsp?id=<%=id %>' class='btn btn-primary btn-sm btn-flat'><i class='fa fa-edit'>paiement</i></a>
                                                </td>
                                            </tr>
                                <%
                            } %>
                  </tbody>
                </table>
              </div>
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
    
    <script>
$(function(){

  $(document).on('click', '.edit', function(e){
    e.preventDefault();
    $('#editer').modal('show');
    var id = $(this).data('id');
    getRow(id);
  });

  $(document).on('click', '.delete', function(e){
    e.preventDefault();
    $('#delete').modal('show');
    var id = $(this).data('id');
    getRow(id);
  });


});

function getRow(id){
  $.ajax({
    type: 'POST',
    url: 'operation/eleve_row.php',
    data: {id:id},
    dataType: 'json',
    success: function(response){
      $('#id').val(response.IdMenage);
      $('.client').html(response.ResponsableMenage+' ?');
    }
  });
}
</script>

