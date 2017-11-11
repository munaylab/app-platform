<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta name="layout" content="admin"/>
    <title>Admin</title>

</head>
<body>
  <g:render template="/components/panel_resumen"/>

  <div class="row">
    <div class="col-lg-8">
      <g:render template="/components/org/panel_pendientes"/>
      <g:render template="/components/org/panel_registradas"/>
    </div>
    <div class="col-lg-4">
      <g:render template="/components/org/panel_direccion"/>
      <g:render template="/components/panel_notificaciones"/>
      <g:render template="/components/panel_mensajes"/>
    </div>
  </div>
</body>
</html>
