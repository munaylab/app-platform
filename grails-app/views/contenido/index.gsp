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
    <div class="col-lg-4">
      <g:render template="components/landingPanel"/>
      <g:render template="components/listadoMenu" model="[menu: menu]"/>
    </div>
    <div class="col-lg-8">
      <g:render template="components/listadoArticulos" model="[articulos: articulos]"/>
    </div>
  </div>
</body>
</html>
