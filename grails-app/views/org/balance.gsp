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
    <div class="col-md-6">
      <g:render template="components/balanceEgresos"/>
      <g:render template="components/clasificacionEgresos"/>
    </div>
    <div class="col-md-6">
      <g:render template="components/balanceIngresos"/>
      <g:render template="components/clasificacionIngresos"/>
    </div>
    <div class="col-md-12">
      <g:render template="components/balanceTotal"/>
    </div>
  </div>
</body>
</html>
