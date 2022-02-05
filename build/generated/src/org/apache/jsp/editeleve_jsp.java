package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.Date;

public final class editeleve_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");

    if(request.getParameter("submit")!=null)
    {
    String postnom = request.getParameter("postnom");
    String nom = request.getParameter("nom");
    String prenom = request.getParameter("prenom");
    String pere = request.getParameter("pere");
    Int id = request.getParameter("id");
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspecole","root","");
       PreparedStatement ps = conn.prepareStatement("UPDATE t_eleve SET NomEleve=?, PostnomEleve=?, PrenomEleve=?, PereEleve=? WHERE CodeEleve=?");
       ps.setString(1, nom);
       ps.setString(2, postnom);
       ps.setString(3, prenom);
       ps.setString(4, pere);
       ps.setString(4, pere);
      int x=ps.executeUpdate();

      out.write("\n");
      out.write("<script>\n");
      out.write("    alert(\"Bien enregiste\");\n");
      out.write("</script>\n");

    }catch(Exception e){
        out.println(e);
    }
    
    }
  
      out.write("  \n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<meta http-equiv=\"content-type\" content=\"text/html;charset=utf-8\" />\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"utf-8\">\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"css/main.css\">\n");
      out.write("    <link rel=\"shotcut icon\" href=\"images/armoirie.png\">\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"./maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\">\n");
      out.write("    <title>Gestion Ecole</title>\n");
      out.write("    <link rel=\"shortcut icon\" href=\"img/logo_epsp.jpeg\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://pro.fontawesome.com/releases/v5.10.0/css/all.css\" integrity=\"sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p\" crossorigin=\"anonymous\"/>\n");
      out.write("\n");
      out.write("  </head>\n");
      out.write("<body class=\"app sidebar-mini\">\n");
      out.write("    <!-- Navbar-->\n");
      out.write("    <header class=\"app-header\"><a class=\"app-header__logo\" href=\"home.php\" style=\"font-weight: bold; font-family: Inter;\">ECOLE</a>\n");
      out.write("      <!-- Sidebar toggle button--><a class=\"app-sidebar__toggle\" href=\"#\" data-toggle=\"sidebar\" aria-label=\"Hide Sidebar\"></a>\n");
      out.write("      <!-- Navbar Right Menu-->\n");
      out.write("      <ul class=\"app-nav\">\n");
      out.write("        <li class=\"app-search\">\n");
      out.write("          <input class=\"app-search__input\" type=\"search\" placeholder=\"Search\">\n");
      out.write("          <button class=\"app-search__button\"><i class=\"fa fa-search\"></i></button>\n");
      out.write("        </li>\n");
      out.write("        <!-- User Menu-->\n");
      out.write("        <li class=\"dropdown\"><a class=\"app-nav__item\" href=\"#\" data-toggle=\"dropdown\" aria-label=\"Open Profile Menu\"><i class=\"fa fa-user fa-lg\"></i></a>\n");
      out.write("          <ul class=\"dropdown-menu settings-menu dropdown-menu-right\">\n");
      out.write("            <li><a class=\"dropdown-item\" href=\"#\"><i class=\"fa fa-cog fa-lg\"></i> Settings</a></li>\n");
      out.write("            <li><a class=\"dropdown-item\" href=\"#\"><i class=\"fa fa-user fa-lg\"></i> Profile</a></li>\n");
      out.write("            <li><a class=\"dropdown-item\" href=\"logout.php\"><i class=\"fa fa-sign-out fa-lg\"></i> Logout</a></li>\n");
      out.write("          </ul>\n");
      out.write("        </li>\n");
      out.write("      </ul>\n");
      out.write("    </header>\n");
      out.write("    <!-- Sidebar menu-->\n");
      out.write("    <div class=\"app-sidebar__overlay\" data-toggle=\"sidebar\"></div>\n");
      out.write("    <aside class=\"app-sidebar\">\n");
      out.write("      <div class=\"app-sidebar__user\"><img class=\"app-sidebar__user-avatar\" src=\"images/user.png\" alt=\"User Image\" style=\"width: 100%; max-width: 45px; height: auto;\">\n");
      out.write("        <div>\n");
      out.write("          <p class=\"app-sidebar__user-name\" style=\"text-transform: lowercase; font-weight: bold;\">Espoir</p>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("      <ul class=\"app-menu\">\n");
      out.write("      \n");
      out.write("        <li><a class=\"app-menu__item\" href=\"home.jsp\"><i class=\"app-menu__icon fa fa-dashboard\"></i><span class=\"app-menu__label\">Dashboard</span></a></li>\n");
      out.write("        <li><a class=\"app-menu__item\" href=\"eleve.jsp\"><i class=\"app-menu__icon fa fa-user\"></i><span class=\"app-menu__label\">Eleve</span></a></li>\n");
      out.write("        <li><a class=\"app-menu__item\" href=\"enseignant.jsp\"><i class=\"app-menu__icon fa fa-users\"></i><span class=\"app-menu__label\">Enseignant</span></a></li>\n");
      out.write("        <li><a class=\"app-menu__item\" href=\"classe.jsp\"><i class=\"app-menu__icon fa fa-dashboard\"></i><span class=\"app-menu__label\">Classes</span></a></li>\n");
      out.write("        <li><a class=\"app-menu__item\" href=\"paiement.jsp\"><i class=\"app-menu__icon fa fa-money\"></i><span class=\"app-menu__label\">Paiement</span></a></li>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        \n");
      out.write("        \n");
      out.write("        \n");
      out.write("      </ul>\n");
      out.write("    </aside>\n");
      out.write("    \n");
      out.write("<main class=\"app-content\">\n");
      out.write("      <div class=\"app-title\">\n");
      out.write("        <div>\n");
      out.write("          <h1><i class=\"fa fa-edit\"></i> Modification</h1>\n");
      out.write("          \n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("      </div>\n");
      out.write("      <div class=\"row\">\n");
      out.write("        <div class=\"clearix\"></div>\n");
      out.write("        <div class=\"col-md-12\">\n");
      out.write("          <div class=\"tile\">\n");
      out.write("            <h3 class=\"tile-title\">Modification</h3>\n");
      out.write("            <div class=\"tile-body\">\n");
      out.write("                <form class=\"row\" method=\"POST\" action=\"\">\n");
      out.write("                  ");

        ResultSet rs;
        PreparedStatement pst;
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javacrud","root","");
        String id = request.getParameter("id");
        pst = conn.prepareStatement("SELECT * FROM t_eleve WHERE CodeEleve=?");
        pst.setString(1, id);
        rs = pst.executeQuery();
        while(rs.next())
        {
            
      out.write("\n");
      out.write("                <div class=\"form-group col-md-3\">\n");
      out.write("                    <input name=\"id\" class=\"form-control\" type=\"hidden\"  value=\"");
      out.print(rs.getInt("CodeEleve"));
      out.write("\">\n");
      out.write("                  <label class=\"control-label\">Nom</label>\n");
      out.write("                  <input name=\"nom\" class=\"form-control\" type=\"text\" placeholder=\"\" value=\"");
      out.print(rs.getString("NomEleve"));
      out.write("\">\n");
      out.write("                </div>\n");
      out.write("                <div class=\"form-group col-md-3\">\n");
      out.write("                  <label class=\"control-label\">Post-nom</label>\n");
      out.write("                  <input name=\"postnom\" class=\"form-control\" type=\"text\" placeholder=\"\" value=\"");
      out.print(rs.getString("PostnomEleve"));
      out.write("\">\n");
      out.write("                </div>\n");
      out.write("                <div class=\"form-group col-md-3\">\n");
      out.write("                  <label class=\"control-label\">Prenom</label>\n");
      out.write("                  <input name=\"prenom\" class=\"form-control\" type=\"text\" placeholder=\"\" value=\"");
      out.print(rs.getString("PrenomEleve"));
      out.write("\">\n");
      out.write("                </div>\n");
      out.write("                <div class=\"form-group col-md-3\">\n");
      out.write("                  <label class=\"control-label\">Nom du père</label>\n");
      out.write("                  <input name=\"pere\" class=\"form-control\" type=\"text\" placeholder=\"\" value=\"");
      out.print(rs.getString("NomEleve"));
      out.write("\">\n");
      out.write("                </div>\n");
      out.write("                \n");
      out.write("                <div class=\"form-group col-md-4 align-self-end\">\n");
      out.write("                  <button class=\"btn btn-primary\" name=\"submit\" type=\"submit\"><i class=\"fa fa-fw fa-lg fa-check-circle\"></i>Modifier</button>\n");
      out.write("                </div>\n");
      out.write("                 ");

        }
                    
      out.write("\n");
      out.write("              </form>\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </main>\n");
      out.write("    \n");
      out.write("    <script src=\"js/jquery-3.3.1.min.js\"></script>\n");
      out.write("    <script src=\"js/popper.min.js\"></script>\n");
      out.write("    <script src=\"js/bootstrap.min.js\"></script>\n");
      out.write("    <script src=\"js/main.js\"></script>\n");
      out.write("    <!-- The javascript plugin to display page loading on top-->\n");
      out.write("    <script src=\"js/plugins/pace.min.js\"></script>\n");
      out.write("    <!-- Page specific javascripts-->\n");
      out.write("    <script type=\"text/javascript\" src=\"js/plugins/chart.js\"></script>\n");
      out.write("    <!-- Data table plugin-->\n");
      out.write("    <script type=\"text/javascript\" src=\"js/plugins/jquery.dataTables.min.js\"></script>\n");
      out.write("    <script type=\"text/javascript\" src=\"js/plugins/dataTables.bootstrap.min.js\"></script>\n");
      out.write("    <script type=\"text/javascript\">$('#sampleTable').DataTable();</script>\n");
      out.write("\n");
      out.write(" \n");
      out.write("    <!-- Google analytics script-->\n");
      out.write("    <script type=\"text/javascript\">\n");
      out.write("      if(document.location.hostname == 'pratikborsadiya.in') {\n");
      out.write("      \t(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){\n");
      out.write("      \t(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),\n");
      out.write("      \tm=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)\n");
      out.write("      \t})(window,document,'script','../../www.google-analytics.com/analytics.js','ga');\n");
      out.write("      \tga('create', 'UA-72504830-1', 'auto');\n");
      out.write("      \tga('send', 'pageview');\n");
      out.write("      }\n");
      out.write("    </script>\n");
      out.write("    <script>\n");
      out.write("    $(function(){\n");
      out.write("        /** add active class and stay opened when selected */\n");
      out.write("        var url = window.location;\n");
      out.write("        \n");
      out.write("        // meilleure logique\n");
      out.write("        $('ul.app-menu li a').filter(function() {\n");
      out.write("            return this.href == url;\n");
      out.write("        }).addClass('active');\n");
      out.write("        // fin logique\n");
      out.write("\n");
      out.write("        // for treeview\n");
      out.write("        // $('ul.app-menu li.treeview is-expanded ul.treeview-menu ').filter(function() {\n");
      out.write("        //     return this.href == url;\n");
      out.write("        // }).parent().addClass('is-expanded');\n");
      out.write("\n");
      out.write("        // way\n");
      out.write("        // $('ul.app-menu li.treeview a').filter(function() {\n");
      out.write("        //     return this.href == url;\n");
      out.write("        // }).parent().addClass('is-expanded');\n");
      out.write("\n");
      out.write("    });\n");
      out.write("    </script>\n");
      out.write("  </body>\n");
      out.write("\n");
      out.write("<!-- Mirrored from pratikborsadiya.in/vali-admin/dashboard.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 15 Jul 2021 12:34:07 GMT -->\n");
      out.write("</html>\n");
      out.write("    \n");
      out.write("   \n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
