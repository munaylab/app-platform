<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
  <meta charset="utf-8">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <meta name="robots" content="noindex,follow">
  <link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
  <link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
  <link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">

  <meta name="description" content="">
  <meta name="author" content="team@munaylab.org">
  <title><g:layoutTitle default="Panel de Administración"/></title>

  <asset:stylesheet src="css/morris.css"/>
  <asset:stylesheet src="css/bootstrap.min.css"/>
  <asset:stylesheet src="css/metisMenu.min.css"/>
  <asset:stylesheet src="css/font-awesome.min.css"/>
  <asset:stylesheet src="css/master-panel.min.css"/>

  <asset:javascript src="jquery.min.js"/>
  <asset:javascript src="morris.min.js"/>
  <asset:javascript src="raphael.min.js"/>
  <asset:javascript src="bootstrap.min.js"/>
  <asset:javascript src="metisMenu.min.js"/>
  <asset:javascript src="master-panel.min.js"/>

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
  <![endif]-->

  <g:layoutHead/>
</head>

<body>
  <div id="wrapper">
    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
          <span class="sr-only">Navegación</span> <i class="fa fa-2x fa-bars"></i>
        </button>
        <a class="navbar-brand" href="index.html">
          <g:message code="label.plataforma.nombre"/>
        </a>
      </div>
      <!-- /.navbar-header -->

      <ul class="nav navbar-top-links navbar-right">
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">
            <i class="fa fa-envelope fa-fw"></i> <i class="fa fa-caret-down"></i>
          </a>
          <ul class="dropdown-menu dropdown-messages">
            <li>
              <a href="#">
                <div>
                    <strong>John Smith</strong>
                    <span class="pull-right text-muted">
                        <em>Yesterday</em>
                    </span>
                </div>
                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
              </a>
            </li>
            <li class="divider"></li>
            <li>
                <a class="text-center" href="#">
                    <strong>Read All Messages</strong>
                    <i class="fa fa-angle-right"></i>
                </a>
            </li>
          </ul>
          <!-- /.dropdown-messages -->
        </li>
        <!-- /.dropdown -->
        <!--
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">
            <i class="fa fa-tasks fa-fw"></i> <i class="fa fa-caret-down"></i>
          </a>
          <ul class="dropdown-menu dropdown-tasks">
            <li>
              <a href="#">
                <div>
                  <p>
                    <strong>Task 1</strong>
                    <span class="pull-right text-muted">40% Complete</span>
                  </p>
                  <div class="progress progress-striped active">
                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                      <span class="sr-only">40% Complete (success)</span>
                    </div>
                  </div>
                </div>
              </a>
            </li>
            <li class="divider"></li>
          </ul>
        </li>
        -->
        <!-- /.dropdown -->
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">
            <i class="fa fa-bell fa-fw"></i> <i class="fa fa-caret-down"></i>
          </a>
          <ul class="dropdown-menu dropdown-alerts">
            <li>
              <a href="#">
                <div>
                  <i class="fa fa-comment fa-fw"></i> New Comment
                  <span class="pull-right text-muted small">4 minutes ago</span>
                </div>
              </a>
            </li>
            <li class="divider"></li>
          </ul>
          <!-- /.dropdown-alerts -->
        </li>
        <!-- /.dropdown -->
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">
            <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
          </a>
          <ul class="dropdown-menu dropdown-user">
            <li>
              <a href="#">
                <i class="fa fa-gear fa-fw"></i> Settings
              </a>
            </li>
            <li class="divider"></li>
            <li>
              <a href="login.html">
                <i class="fa fa-sign-out fa-fw"></i> Logout
              </a>
            </li>
          </ul>
          <!-- /.dropdown-user -->
        </li>
        <!-- /.dropdown -->
      </ul>
      <!-- /.navbar-top-links -->

      <!-- SIDE-BAR -->
      <div class="navbar-default sidebar" role="navigation">
        <div class="sidebar-nav navbar-collapse">
          <ul class="nav" id="side-menu">
            <li class="sidebar-search">
              <div class="input-group custom-search-form">
                <input type="text" class="form-control" placeholder="Search..." />
                <span class="input-group-btn">
                  <button class="btn btn-default" type="button">
                    <i class="fa fa-search"></i>
                  </button>
                </span>
              </div>
            </li>

            <li>
              <a href="${createLink(controller:'org', action: 'index')}">
                <i class="fa fa-dashboard fa-fw"></i> Dashboard
              </a>
            </li>
            <li>
              <a href="${createLink(controller:'org', action: 'perfil')}">
                <i class="fa fa-users fa-fw"></i> Perfil
              </a>
            </li>
            <li>
              <a href="${createLink(controller:'org', action: 'balance')}">
                <i class="fa fa-users fa-fw"></i> Balance
              </a>
            </li>
            <li>
              <a href="${createLink(controller:'org', action: 'donaciones')}">
                <i class="fa fa-users fa-fw"></i> Donaciones
              </a>
            </li>
            <li>
              <a href="${createLink(controller:'org', action: 'voluntarios')}">
                <i class="fa fa-users fa-fw"></i> Voluntarios
              </a>
            </li>

            <!-- <li>
              <a href="#">
                <i class="fa fa-sitemap fa-fw"></i> Multi-Level Dropdown<span class="fa arrow"></span>
              </a>
              <ul class="nav nav-second-level">
                <li> <a href="#">Second Level Item</a> </li>
                <li>
                  <a href="#">Third Level <span class="fa arrow"></span></a>
                  <ul class="nav nav-third-level">
                    <li> <a href="#">Third Level Item</a> </li>
                  </ul>
                </li>
              </ul>
            </li> -->
          </ul>
        </div>

      </div>

    </nav>

    <div id="page-wrapper">
      <g:layoutBody/>
    </div>
  </div>

</body>

</html>
