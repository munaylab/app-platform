<!DOCTYPE html>
<html lang="en-US">
<head>
  <meta name="layout" content="main"/>

  <asset:javascript src="landing.min.js"/>
  <asset:stylesheet src="css/landing.min.css"/>
  <title>Plataforma Kolla</title>

  <script type="text/javascript">
  $('input[type="checkbox"]').on('change', function() {
    $(this).siblings('input[type="checkbox"]').prop('checked', false);
  });
  </script>
</head>
<body id="organizaciones">
  <nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
          <span class="sr-only">Toggle navigation</span> <i class="fa fa-2x fa-bars"></i>
        </button>
        <a class="navbar-brand page-scroll" href="#page-top">Kolla</a>
      </div>
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav navbar-right">
            <li><a href="/#nosotros">Nosotros</a></li>
            <li><a href="/#ciudadania">Cuidadanía</a></li>
            <li><a href="/organizaciones">Organizaciones</a></li>
            <li><a href="/#empresas">Empresas</a></li>
            <li><a href="/#datospublicos">Datos Públicos</a></li>
            <li><a href="/#contacto">Contacto</a></li>
        </ul>
      </div>
    </div>
  </nav>

  <header>
    <div class="header-content">
      <div class="header-content-inner">
          <div class="col-sm-6">
            <h3>Organizaciones de la Sociedad Civil</h3>
            <h3>${model?.errors}</h3>
            <hr>
            <div class="header-item row">
              <i class="fa fa-2x fa-building col-sm-2 col-xs-12 text-center"></i>
              <span class="col-sm-10 col-xs-12">
                Crea un perfil de tu institución para que las personas puedan encontrarte, saber lo que haces y colaborar contigo.
              </span>
            </div>
            <div class="header-item row">
              <i class="fa fa-2x fa-handshake-o col-sm-2 col-xs-12 text-center"></i>
              <span class="col-sm-10 col-xs-12">
                Describe las actividades que realizas para que otras instituciones puedan articular contigo.
              </span>
            </div>
            <div class="header-item row">
              <i class="fa fa-2x fa-bar-chart col-sm-2 col-xs-12 text-center"></i>
              <span class="col-sm-10 col-xs-12">
                Carga datos tu institución para poder generar informes avanzados.
              </span>
            </div>
            <div class="header-item row">
              <i class="fa fa-2x fa-calendar col-sm-2 col-xs-12 text-center"></i>
              <span class="col-sm-10 col-xs-12">
                Organiza y comparte eventos de tu institución para captar personas interesadas.
              </span>
            </div>
            <div class="header-item row">
              <i class="fa fa-2x fa-cogs col-sm-2 col-xs-12 text-center"></i>
              <span class="col-sm-10 col-xs-12">
                Accede a un kit de herramientas que automatizan varias tareas.
              </span>
            </div>
            <div class="header-item row">
              <i class="fa fa-2x fa-tachometer col-sm-2 col-xs-12 text-center"></i>
              <span class="col-sm-10 col-xs-12">
                Visualiza todos los beneficios y sus resultados en un panel interactivo.
              </span>
            </div>
            <div class="header-item row">
              <i class="fa fa-2x fa-newspaper-o col-sm-2 col-xs-12 text-center"></i>
              <span class="col-sm-10 col-xs-12">
                Accede a información y capacitación de nivel internacional.
              </span>
            </div>
            <div class="header-item row">
              <i class="fa fa-2x fa-line-chart col-sm-2 col-xs-12 text-center"></i>
              <span class="col-sm-10 col-xs-12">
                Accede a una herramienta de control de gastos privada para mejorar tus finanzas.
              </span>
            </div>
          </div>
          <div class="col-sm-6 container header-form">
            <h3 class="text-center">Registro</h3>
            <br>
            <g:form controller="org" action="registro" method="POST">
              <div class="form-group">
                <label for="denominacion">Denominación:</label>
                <input id="denominacion" name="denominacion" class="form-control" type="text" placeholder="Nombre de la Organización"/>
              </div>
              <div class="form-group">
                <label for="">Tipo de Organización:</label>
                <div class="checkbox">
                  <label class="col-md-3"><input type="checkbox" name="tipo" value="FUNDACION"> Fundación</label>
                  <label class="col-md-4"><input type="checkbox" name="tipo" value="ASOCIACION_CIVIL"> Asociación Civil</label>
                  <label class="col-md-5"><input type="checkbox" name="tipo" value="ASOCIACION_SIMPLE"> Asociación Simple</label>
                </div>
              </div>
              <div class="form-group">
                <label for="objeto">Objeto Social:</label>
                <textarea id="objeto" name="objeto" rows="3" class="form-control"></textarea>
              </div>
              <div class="form-group">
                <label for="nombre">Datos del Representante:</label>
                <div class="row">
                  <div class="col-md-6">
                    <input id="nombre" name="nombre" class="form-control" type="text" placeholder="Nombre" required/>
                  </div>
                  <div class="col-md-6">
                    <input id="apellido" name="apellido" class="form-control" type="text" placeholder="Apellido" required/>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <div class="row">
                  <div class="col-md-6">
                    <input id="email" name="email" class="form-control" type="email" placeholder="Email" required/>
                  </div>
                  <div class="col-md-6">
                    <input id="telefono" name="telefono" class="form-control" type="text" placeholder="Teléfono" required/>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <!-- <button id="prev" type="button" class="btn btn-primary btn-xl page-scroll pull-left" style="display: none">Anterior</button> -->
                <button type="submit" class="btn btn-primary btn-xl page-scroll pull-right">Continuar</button>
              </div>
            </g:form>

          </div>
        </div>
    </div>
  </header>

  <section>
    <div class="container">
      <h2 class="text-center">Preguntas Frecuentes</h2><hr><br>
      <div class="panel-group" id="accordion">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse1">
                ¿Cómo acceder a los beneficios?
                <i class="fa fa-chevron-up pull-right"></i>
                <i class="fa fa-chevron-down pull-right"></i>
              </a>
            </h4>
          </div>
          <div id="collapse1" class="panel-collapse collapse">
            <div class="panel-body">
              Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
            </div>
          </div>
        </div>

        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse2">
                ¿Es totalmente gratis?
                <i class="fa fa-chevron-up pull-right"></i>
                <i class="fa fa-chevron-down pull-right"></i>
              </a>
            </h4>
          </div>
          <div id="collapse2" class="panel-collapse collapse">
            <div class="panel-body">
              Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
            </div>
          </div>
        </div>

        <div class="panel panel-default">
          <div class="panel-heading">
            <h4 class="panel-title">
              <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse2">
                ¿Cómo registro mi organización?
                <i class="fa fa-chevron-up pull-right"></i>
                <i class="fa fa-chevron-down pull-right"></i>
              </a>
            </h4>
          </div>
          <div id="collapse2" class="panel-collapse collapse">
            <div class="panel-body">
              Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
            </div>
          </div>
        </div>
      </div>
    </div>

  </section>
</body>
</html>
