<!DOCTYPE html>
<html lang="en-US">
<head>
  <meta name="layout" content="admin-org"/>
  <title>${org.nombre} - <g:message code="label.plataforma.nombre"/></title>
</head>
<body>
  <br>

  <g:render template="/components/panel_resumen"/>

  <div class="row">
    <div class="col-lg-8">
      <g:render template="/components/panel_voluntarios"/>
    </div>
    <div class="col-lg-4">
      <g:render template="/components/panel_notificaciones"/>
      <g:render template="/components/panel_mensajes"/>
    </div>
  </div>
</body>
</html>
