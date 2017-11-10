<!DOCTYPE html>
<html lang="en-US">
<head>
  <meta name="layout" content="main"/>

  <asset:javascript src="landing.min.js"/>
  <asset:stylesheet src="css/landing.min.css"/>
  <title><g:message code="label.plataforma.full"/></title>
</head>
<body>
  <g:render template="/landing/main/nav"/>

  <header>
    <div class="header-content">
      <div class="header-content-inner">
        <g:render template="/landing/main/osc"/>
      </div>
    </div>
  </header>

  <g:render template="/landing/main/beneficios"/>
  <g:render template="/landing/main/registro"/>

</body>
</html>
