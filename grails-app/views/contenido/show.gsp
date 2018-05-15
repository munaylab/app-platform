<!DOCTYPE html>
<html lang="en-US">
<head>
  <meta name="layout" content="admin"/>
  <title>${org.nombre} - <g:message code="label.plataforma.nombre"/></title>
</head>
<body>
  <br>

  <g:render template="/components/panel_resumen"/>

  <div class="row">
    <div class="col-lg-12">
      <g:render template="components/articulo"/>
    </div>
  </div>
</body>
</html>
