package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/include/head.jsp");
  }

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

      out.write('\n');
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
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"font-awesome/css/font-awesome.min.css\">\n");
      out.write("    <title>Gestion Ecole</title>\n");
      out.write("    <link rel=\"shortcut icon\" href=\"img/logo_epsp.jpeg\">\n");
      out.write("<!--    <link rel=\"stylesheet\" href=\"https://pro.fontawesome.com/releases/v5.10.0/css/all.css\" integrity=\"sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p\" crossorigin=\"anonymous\"/>-->\n");
      out.write("\n");
      out.write("  </head>\n");
      out.write("\n");
      out.write("  <body>\n");
      out.write("    <section class=\"material-half-bg\">\n");
      out.write("      <div class=\"cover\"></div>\n");
      out.write("    </section>\n");
      out.write("    <section class=\"login-content\">\n");
      out.write("      <!-- <div class=\"logo\">\n");
      out.write("        <h1>EPST</h1>\n");
      out.write("      </div> -->\n");
      out.write("      <div class=\"login-box\">\n");
      out.write("        <form class=\"login-form\" method=\"POST\" action=\"verify.jsp\">\n");
      out.write("          <h3 class=\"login-head\"><i class=\"fa fa-lg fa-fw fa-user\"></i>SE CONNECTER</h3>\n");
      out.write("          \n");
      out.write("          <div class=\"form-group\">\n");
      out.write("            <label class=\"control-label\">Username</label>\n");
      out.write("            <input class=\"form-control\" type=\"text\" name=\"username\" placeholder=\"Votre username\" autofocus>\n");
      out.write("          </div>\n");
      out.write("          <div class=\"form-group\">\n");
      out.write("            <label class=\"control-label\">Mot de passe</label>\n");
      out.write("            <input class=\"form-control\" type=\"password\" name=\"password\" placeholder=\"Votre mot de passe\">\n");
      out.write("          </div>\n");
      out.write("          <div class=\"form-group\">\n");
      out.write("            <div class=\"utility\">\n");
      out.write("              <div class=\"animated-checkbox\">\n");
      out.write("              </div>\n");
      out.write("              <p class=\"semibold-text mb-2\"><a href=\"../inscription.php\">N'avez-vous pas un compte ?</a></p><br>\n");
      out.write("              <p class=\"semibold-text mb-2\"><a href=\"../index.php\">Retour</a></p>\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("          <div class=\"form-group btn-container\">\n");
      out.write("            <!-- <button class=\"btn btn-primary btn-block\" name=\"connect\"><i class=\"fa fa-sign-in fa-lg fa-fw\"></i>CONNECTER</button> -->\n");
      out.write("            <input class=\"btn btn-primary btn-block\" type=\"submit\" name=\"connect\" class=\"btn login_btn\" value=\"CONNECTER\">\n");
      out.write("          </div>\n");
      out.write("        </form>\n");
      out.write("        <form class=\"forget-form\" action=\"operation/register.php\">\n");
      out.write("          <h3 class=\"login-head\"><i class=\"fa fa-lg fa-fw fa-lock\"></i>S'enregistrer</h3>\n");
      out.write("          <div class=\"form-group\">\n");
      out.write("            <label class=\"control-label\">Username</label>\n");
      out.write("            <input class=\"form-control\" type=\"text\" placeholder=\"Votre nom d'utilisateur\">\n");
      out.write("          </div>\n");
      out.write("          <div class=\"form-group\">\n");
      out.write("            <label class=\"control-label\">Quartier</label>\n");
      out.write("            <input class=\"form-control\" type=\"text\" placeholder=\"Email\">\n");
      out.write("          </div>\n");
      out.write("          <div class=\"form-group\">\n");
      out.write("            <label class=\"control-label\">Avenue</label>\n");
      out.write("            <input class=\"form-control\" type=\"text\" placeholder=\"Email\">\n");
      out.write("          </div>\n");
      out.write("          <div class=\"form-group\">\n");
      out.write("            <label class=\"control-label\">Numero</label>\n");
      out.write("            <input class=\"form-control\" type=\"text\" placeholder=\"Email\">\n");
      out.write("          </div>\n");
      out.write("          <div class=\"form-group\">\n");
      out.write("            <label class=\"control-label\">Password</label>\n");
      out.write("            <input class=\"form-control\" type=\"password\" placeholder=\"Email\">\n");
      out.write("          </div>\n");
      out.write("          <div class=\"form-group btn-container\">\n");
      out.write("            <button class=\"btn btn-primary btn-block\"><i class=\"fa fa-unlock fa-lg fa-fw\"></i>RESET</button>\n");
      out.write("          </div>\n");
      out.write("          <div class=\"form-group mt-3\">\n");
      out.write("            <p class=\"semibold-text mb-0\"><a href=\"#\" data-toggle=\"flip\"><i class=\"fa fa-angle-left fa-fw\"></i> Back to Login</a></p>\n");
      out.write("          </div>\n");
      out.write("        </form>\n");
      out.write("      </div>\n");
      out.write("    </section>\n");
      out.write("          <!-- Essential javascripts for application to work-->\n");
      out.write("    <script src=\"js/jquery-3.3.1.min.js\"></script>\n");
      out.write("    <script src=\"js/popper.min.js\"></script>\n");
      out.write("    <script src=\"js/bootstrap.min.js\"></script>\n");
      out.write("    <script src=\"js/main.js\"></script>\n");
      out.write("    <!-- The javascript plugin to display page loading on top-->\n");
      out.write("    <script src=\"js/plugins/pace.min.js\"></script>\n");
      out.write("    <script type=\"text/javascript\">\n");
      out.write("      // Login Page Flipbox control\n");
      out.write("      $('.login-content [data-toggle=\"flip\"]').click(function() {\n");
      out.write("      \t$('.login-box').toggleClass('flipped');\n");
      out.write("      \treturn false;\n");
      out.write("      });\n");
      out.write("    </script>\n");
      out.write("  </body>\n");
      out.write("\n");
      out.write("<!-- Mirrored from pratikborsadiya.in/vali-admin/page-login.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 15 Jul 2021 12:34:15 GMT -->\n");
      out.write("</html>\n");
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
