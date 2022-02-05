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
//    String date = request.getParameter("date");
    String pere = request.getParameter("pere");
    String mere = request.getParameter("mere");
    String profession = request.getParameter("profession");
    String telephone = request.getParameter("telephone");
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspecole","root","");
       PreparedStatement ps = conn.prepareStatement("INSERT INTO t_eleve(NomEleve, PostnomEleve, PrenomEleve, LieuNaissance, NomPere, NomMere, ProfessionPere)VALUES(?,?,?,?,?,?,?)");
       ps.setString(1, nom);
       ps.setString(2, postnom);
       ps.setString(3, prenom);

       ps.setString(4, lieu);

       ps.setString(5, pere);
      ps.setString(6, mere);
      ps.setString(7, profession);
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
          <h1><i class="fa fa-th-list"></i> Menages</h1>
          <!-- <p>Un outil pour faciliter les ITEMS aux élèves</p> -->
        </div>
        <ul class="app-breadcrumb breadcrumb side">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item active"><a href="hpme.php">Acceuil</a></li>
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
                      <th>Post-nom</th>
                      <th>Prenom</th>
                      <th>Lieu de naissance</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody>
                         <%
                            ResultSet rs;
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspecole","root","");
                            String query = ("SELECT * FROM t_eleve");
                            Statement st = conn.createStatement();
                            rs = st.executeQuery(query);
                            while(rs.next())
                            {
                                String id = rs.getString("CodeEleve");
                                %>
                                            <tr>
                                                <td><%=rs.getString("NomEleve") %></td>
                                                <td><%=rs.getString("PostnomEleve") %></td>
                                                <td><%=rs.getString("PrenomEleve") %></td>
                                                <td><%=rs.getString("LieuNaissance") %></td>
                                                <td>
                                                    <a href='editeleve.jsp?id=<%=id %>' class='btn btn-info btn-sm btn-flat'><i class='fa fa-edit'></i></a>
                                                    <a href='deleteeleve.jsp?id=<%=id %>' class='btn btn-danger btn-sm btn-flat'><i class='fa fa-remove'></i></a>
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
    
 <!-- edit -->
<div class="modal fade" id="editer" style="">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            <h4 class="modal-title"><b>Modification</b></h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">
              <form class="form-horizontal" method="POST" action="operation/quartier_update.php">
                <input type="hidden" class="quartier" name="id">
                <input type="hidden" class="commune" name="commune">
                <div class="form-group">
                  <input type="text" class="form-control" name="quartier" id="quartier">
                </div>
                <div class="form-group">
                    <label for="prevision">Prevision mensuelle</label>
                  <input type="text" class="form-control" name="prevision" id="prevision">
                </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default btn-flat pull-left" data-dismiss="modal"><i class="fa fa-close"></i> Fermer</button>
              <button type="submit" class="btn btn-success btn-flat" name="update"><i class="fa fa-trash"></i> Modifier</button>
              </form>
            </div>
        </div>
    </div>
</div>



<!-- remove -->
<div class="modal fade" id="delete">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title"><b>Suppression...</b></h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
              
            </div>
            <div class="modal-body">
              <form class="form-horizontal" method="POST" action="operation/quartier_delete.php">
                <input type="hidden" class="quartier" name="id">
                <input type="hidden" class="commune" name="commune">
                <div class="text-center">
                    <p>SUPPRIMER LE QUARTIER</p>
                    <h2 class="bold quartiername"></h2>
                </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default btn-flat pull-left" data-dismiss="modal"><i class="fa fa-close"></i> Fermer</button>
              <button type="submit" class="btn btn-danger btn-flat" name="delete"><i class="fa fa-trash"></i> Supprimer</button>
              </form>
            </div>
        </div>
    </div>
</div>
  
    <!-- Add -->
<div class="modal fade" id="addeleve">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            <h4 class="modal-title" style="text-align: center;"><b>Ajouter un cours</b></h4>
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
                            <input type="text" class="form-control" name="pere" placeholder="Nom du père" required>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="mere" placeholder="Nom de la mère" required>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="profession" placeholder="Profession du père">
                        </div>
                        <div class="form-group">
                            <input type="number" class="form-control" name="telephone" placeholder="Telephone du tutelle">
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

