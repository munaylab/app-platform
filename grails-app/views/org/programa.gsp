<!DOCTYPE html>
<html lang="en-US">
<head>
  <meta name="layout" content="admin-org"/>
  <title>${org.nombre} - <g:message code="label.plataforma.nombre"/></title>
</head>
<body>

  <div class="row">
    <div class="col-lg-12">
      <!-- <span class="chat-img pull-left"><img src="http://placehold.it/40/55C1E7/fff" alt="avatar" class="img-circle" /></span> -->
      <h1 class="page-header">&nbsp;${org.nombre}</h1>
    </div>
  </div>

  <g:render template="/components/panel_resumen"/>

  <div class="row">
    <div class="col-lg-12">

      <div class="panel panel-default">
        <div class="panel-heading">
          <i class="fa fa-archive fa-fw"></i>
          <g:message code="label.programa"/>
        </div>
        <div class="panel-body">
          <g:formPlanificacion object="${valor}"/>
        </div>
      </div>
    </div>
  </div>

</body>
</html>
