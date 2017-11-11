<!DOCTYPE html>
<html lang="en-US">
<head>
  <meta name="layout" content="main"/>

  <asset:javascript src="landing.min.js"/>
  <asset:stylesheet src="css/landing.min.css"/>
  <title><g:message code="label.plataforma.full"/></title>
</head>
<body>

  <g:render template="/landing/osc/nav"/>
  <g:render template="/landing/osc/header"/>
  <g:render template="/landing/osc/beneficios"/>
  <g:render template="/landing/osc/registro"/>
  <g:render template="/landing/osc/faq"/>
  <g:render template="/landing/login"/>

  <g:if test="${from == 'registro'}">
    <script type="text/javascript">
      $(document).ready(function() {location.href = '#registro';});
    </script>
  </g:if>

</body>
</html>
