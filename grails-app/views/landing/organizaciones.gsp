<!DOCTYPE html>
<html lang="en-US">
<head>
  <meta name="layout" content="organizacion_landing"/>
  <title><g:message code="label.plataforma.full"/></title>
</head>
<body>
  <g:if test="${from == 'registro'}">
    <g:render template="/landing/osc/header"/>
  </g:if>
  <g:elseif test="${from == 'confirmacion'}">
    <g:render template="/landing/osc/confirmacion"/>
  </g:elseif>
  <g:else>
    <g:render template="/landing/osc/header"/>
  </g:else>
</body>
</html>
