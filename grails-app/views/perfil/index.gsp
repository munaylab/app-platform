<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta name="layout" content="admin"/>
    <title>${org.nombre} - <g:message code="label.plataforma.nombre"/></title>
</head>
<body>
  <br>

  <g:hasErrors bean="${command}">
    <div class="alert alert-danger" role="alert">
      <g:renderErrors bean="${command}" />
    </div>
  </g:hasErrors>

  <g:render template="components/datos" />

  <g:render template="components/contacto" />

</body>
</html>
