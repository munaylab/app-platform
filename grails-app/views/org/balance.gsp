<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta name="layout" content="org"/>
    <title>Balance</title>
</head>
<body>
  <div class="row">
    <div class="col-md-6">
      <g:render template="components/balanceEgresos"/>
      <g:render template="components/clasificacionEgresos"/>
    </div>
    <div class="col-md-6">
      <g:render template="components/balanceIngresos"/>
      <g:render template="components/clasificacionIngresos"/>
    </div>
    <div class="col-md-12">
      <g:render template="/components/panel_balance"/>
    </div>
  </div>
</body>
</html>
