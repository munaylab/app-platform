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
      <p>${valor}</p>
      <p>${mensaje}</p>
      <p>${error}</p>
      <p>${errores}</p>
    </div>
  </div>

</body>
</html>
