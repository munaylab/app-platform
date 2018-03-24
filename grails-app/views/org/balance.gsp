<!DOCTYPE html>
<html lang="en-US">
<head>
  <meta name="layout" content="admin-org"/>
  <title>${org.nombre} - <g:message code="label.plataforma.nombre"/></title>
</head>
<body>
  <br>
  <div class="row">
    <div class="col-md-6">
      <g:render template="components/balanceEgresos"/>
      <g:render template="components/clasificacionEgresos"/>
    </div>
    <div class="col-md-6">
      <g:render template="components/balanceIngresos"/>
      <g:render template="components/clasificacionIngresos"/>
    </div>
    <div class="col-md-7">
      <g:render template="components/ultimosMovimientos"/>
    </div>
    <div class="col-md-5">
      <g:render template="components/balanceTotal"/>
    </div>
  </div>
</body>
</html>
