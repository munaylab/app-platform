<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta name="layout" content="admin-org"/>
    <title>Preview</title>

</head>
<body>
  <div class="row">
    <div class="col-lg-12">
      <!-- <span class="chat-img pull-left">
        <img src="http://placehold.it/40/55C1E7/fff" alt="User Avatar" class="img-circle" />
      </span> -->
      <h1 class="page-header">&nbsp;Nombre Fundacion</h1>
    </div>
  </div>
  
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
