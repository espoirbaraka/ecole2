<%@page import="java.sql.*"%>
<body class="app sidebar-mini">    
<!-- Navbar-->
    <header class="app-header"><a class="app-header__logo" href="home.jsp" style="font-weight: bold; font-family: Lato;">ECOLE</a>
      <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar" aria-label="Hide Sidebar"></a>
      <!-- Navbar Right Menu-->
      <ul class="app-nav">
        <li class="app-search">
          <input class="app-search__input" type="search" placeholder="Search">
          <button class="app-search__button"><i class="fa fa-search"></i></button>
        </li>
        <!-- User Menu-->
        <li class="dropdown"><a class="app-nav__item" href="#" data-toggle="dropdown" aria-label="Open Profile Menu"><i class="fa fa-user fa-lg"></i></a>
          <ul class="dropdown-menu settings-menu dropdown-menu-right">
            <li><a class="dropdown-item" href="#"><i class="fa fa-cog fa-lg"></i> Settings</a></li>
            <li><a class="dropdown-item" href="#"><i class="fa fa-user fa-lg"></i> Profile</a></li>
            <li><a class="dropdown-item" href="index.jsp"><i class="fa fa-sign-out fa-lg"></i> Logout</a></li>
          </ul>
        </li>
      </ul>
    </header>
          <% 
    String code2 = (String)session.getAttribute("code");
//int code = 5;
//    int privilege = (int)session.getAttribute("privilege");
    try{
        ResultSet rs;
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspecole","root","");
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM t_compte INNER JOIN t_privilege ON t_compte.CodePrivilege=t_privilege.CodePrivilege WHERE CodeCompte=?");
        ps.setString(1, code2);
        rs = ps.executeQuery();
       while(rs.next())
       {
           %>
           <!-- Sidebar menu-->
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    <aside class="app-sidebar">
      <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="images/user.png" alt="User Image" style="width: 100%; max-width: 45px; height: auto;">
        <div>
            <p class="app-sidebar__user-name" style="text-transform: lowercase; font-weight: bold;"><%=rs.getString("Username") %> : <%=rs.getString("Abbrev") %></p>
        </div>
      </div>
      <ul class="app-menu">
          
          <li><a class="app-menu__item" href="home.jsp"><i class="app-menu__icon fa fa-dashboard"></i><span class="app-menu__label">Dashboard</span></a></li>
          <%
            int privilege = rs.getInt("CodePrivilege");
            if(privilege ==1 )
            {
                %>
        <li><a class="app-menu__item" href="eleve.jsp"><i class="app-menu__icon fa fa-user"></i><span class="app-menu__label">Eleve</span></a></li>
        <li><a class="app-menu__item" href="personnel.jsp"><i class="app-menu__icon fa fa-users"></i><span class="app-menu__label">Personnel</span></a></li>
        <li><a class="app-menu__item" href="cours.jsp"><i class="app-menu__icon fa fa-cogs"></i><span class="app-menu__label">Parametrer de cours</span></a></li>       
        <%
            }else if(privilege ==2 )
            {
            %>
        <li><a class="app-menu__item" href="eleve.jsp"><i class="app-menu__icon fa fa-dashboard"></i><span class="app-menu__label">Eleve</span></a></li>
        <%
            }else if(privilege ==3 ){
        %>
        <li><a class="app-menu__item" href="paiement.jsp"><i class="app-menu__icon fa fa-money"></i><span class="app-menu__label">Paiement</span></a></li>
        <%
                    }else if(privilege ==4 ){
        %>
        <li><a class="app-menu__item" href="cotation.jsp"><i class="app-menu__icon fa fa-money"></i><span class="app-menu__label">Cotation</span></a></li>
        <%
        }else if(privilege ==5 ){
        %>
        <li><a class="app-menu__item" href="eleve.jsp"><i class="app-menu__icon fa fa-user"></i><span class="app-menu__label">Eleve</span></a></li>
        <li><a class="app-menu__item" href="personnel.jsp"><i class="app-menu__icon fa fa-users"></i><span class="app-menu__label">Personnel</span></a></li>
        <li><a class="app-menu__item" href="classe.jsp"><i class="app-menu__icon fa fa-dashboard"></i><span class="app-menu__label">Communique aux parents</span></a></li>
        <li><a class="app-menu__item" href="paiement.jsp"><i class="app-menu__icon fa fa-money"></i><span class="app-menu__label">Paiement</span></a></li>
        <li><a class="app-menu__item" href="presence.jsp"><i class="app-menu__icon fa fa-money"></i><span class="app-menu__label">Presence</span></a></li>
        
        <%
        
        }
       }
    }catch(Exception e){
        out.println(e);
    }
%>
      
        


        
        
        
        
        
      </ul>
    </aside>
