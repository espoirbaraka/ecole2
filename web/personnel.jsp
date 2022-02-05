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
    String adresse = request.getParameter("adresse");
    String fonction = request.getParameter("fonction");
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspecole","root","");
       PreparedStatement ps = conn.prepareStatement("INSERT INTO t_personnel(NomPersonnel, PostnomPersonnel, PrenomPersonnel, DateNaissance, LieuNaissance, Fonction, AdressePersonnel)VALUES(?,?,?,?,?,?,?)");
       ps.setString(1, nom);
       ps.setString(2, postnom);
       ps.setString(3, prenom);
       ps.setString(4, date);
       ps.setString(5, lieu);
       ps.setString(6, fonction);
       ps.setString(7, adresse);
      int x=ps.executeUpdate();
%>
<script>
    alert("Personnel bien enregiste");
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
          <h1><i class="fa fa-th-list"></i> Personnel</h1>
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
                    <a href="#addpersonnel" data-toggle="modal" class="btn btn-primary btn-sm btn-flat"><i class="fa fa-plus"></i> Nouveau</a>
                </div>
            <div class="tile-body">
              <div class="table-responsive">
                <table class="table table-hover table-bordered" id="sampleTable">
                  <thead>
                    <tr>
                      <th>Nom</th>
                      <th>Lieu de naissance</th>
                      <th>Fonction</th>
                      <th>Username</th>
                      <th>Password</th>
                      <th>Classe</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody>
                         <%
                            ResultSet rs;
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspecole","root","");
                            String query = ("SELECT * FROM t_personnel INNER JOIN t_privilege ON t_personnel.Fonction=t_privilege.CodePrivilege LEFT JOIN t_compte ON t_personnel.CodePersonnel=t_compte.CodeEnseignant LEFT JOIN t_classe ON t_personnel.CodeClasse=t_classe.CodeClasse");
                            Statement st = conn.createStatement();
                            rs = st.executeQuery(query);
                            while(rs.next())
                            {
                                String id = rs.getString("CodePersonnel");
                                String priv = rs.getString("Fonction");
                                %>
                                            <tr>
                                                <td><%=rs.getString("NomPersonnel")+' '+rs.getString("PostnomPersonnel")+' '+rs.getString("PrenomPersonnel") %></td>
                                                
                                                <td><%=rs.getString("LieuNaissance") %></td>
                                                <td><%=rs.getString("Abbrev")+' '+rs.getString("Classe") %></td>
                                                <td><%=rs.getString("Username") %></td>
                                                <td><%=rs.getString("Password") %></td>
                                                
                                                <td style="">
                                                    <%
                                                        if(rs.getInt("Fonction")==4)
                                                        {
                                                            %>
                                                    <a href='affect.jsp?id=<%=id %>' class='btn btn-primary btn-sm btn-flat'><i class='fa fa-user'></i>Affect</a>
                                                    
                                                    <%
                                                        }
                                                    %>
                                                </td>
                                                <td>
                                                    <a href='createuser.jsp?id=<%=id %>&priv=<%=priv %>' class='btn btn-primary btn-sm btn-flat'><i class='fa fa-user'></i></a>
                                                    
                                                    <a href='editpersonnel.jsp?id=<%=id %>' class='btn btn-info btn-sm btn-flat'><i class='fa fa-edit'></i></a>
                                                    <a href='deleteeleve.jsp?id=<%=id %>' class='btn btn-danger delete btn-sm btn-flat'><i class='fa fa-remove'></i></a>
<!--                                                    <a href='#' class='btn btn-info edit btn-sm btn-flat' data-id='<%=id %>'><i class='fa fa-edit'></i></a>
                                                    <a href='#' class='btn btn-danger delete btn-sm btn-flat' data-id='<%=id %>'><i class='fa fa-remove'></i></a>-->
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
    

  
    <!-- Add -->
<div class="modal fade" id="addpersonnel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            <h4 class="modal-title" style="text-align: center;"><b>Ajouter un eleve</b></h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
              
            </div>
            <div class="modal-body">
              <form class="form-horizontal" method="POST" action="">
                <div class="form-group">
                    <div class="col-sm-9">
                        <div class="form-group">
                            <input type="text" class="form-control" name="nom" placeholder="Nom" required>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="postnom" placeholder="Post-nom" required>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="prenom" placeholder="Prénom" required>
                        </div>
                        <div class="form-group">
                            <input type="date" class="form-control" name="date" placeholder="Date de naissance" required>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="lieu" placeholder="Lieu de naissance" required>
                        </div>
                        <div class="form-group">
                            <textarea class="form-control" name="adresse" placeholder="Adresse"></textarea>
                        </div>
                        <div class="form-group">
                            <select class="form-control" name="fonction">
                            <%
                            ResultSet rs2;
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conn2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspecole","root","");
                            String query2 = ("SELECT * FROM t_privilege");
                            Statement st2 = conn2.createStatement();
                            rs2 = st2.executeQuery(query2);
                            while(rs2.next())
                            {
                            %>
                            <option value="<%=rs2.getString("CodePrivilege") %>"><%=rs2.getString("Privilege") %></option>
                            <%
                                }
                                %>
                            </select>
                        </div>
                    </div>
                </div>
                
            <div class="modal-footer">
              <button type="button" class="btn btn-default btn-flat pull-left" data-dismiss="modal"><i class="fa fa-close"></i> Fermer</button>
              <button type="submit" class="btn btn-primary btn-flat" name="add"><i class="fa fa-save"></i> Enregistrer</button>
              </form>
            </div>
        </div>
    </div>
</div>

    
    
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
    window.confirm("Voulez-vous supprimer ce personnel");
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
