<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta name="layout" content="org"/>
    <title>Preview</title>

</head>
<body>
  <g:render template="/components/panel_resumen"/>

  <div class="row">
    <div class="col-lg-8">
      <g:render template="/components/panel_voluntarios"/>
      <g:render template="/components/panel_balance"/>
    </div>
    <div class="col-lg-4">
      <g:render template="/components/panel_notificaciones"/>
      <g:render template="/components/panel_mensajes"/>
    </div>
  </div>
</body>
</html>
