<!DOCTYPE html>
<html lang="en-US">
<head>
  <meta name="layout" content="admin"/>
  <title>${org.nombre} - <g:message code="label.plataforma.nombre"/></title>

  <asset:javascript src="marked.js"/>
  <asset:javascript src="lodash.min.js"/>

  <g:render template="/components/forms/editor_markdown"/>
  <g:render template="/components/forms/switch_button"/>
</head>

<body>
  <br>
  <g:render template="/components/panel_resumen"/>

  <g:hasErrors bean="${command}">
    <div class="alert alert-danger" role="alert">
      <g:renderErrors bean="${command}" />
    </div>
  </g:hasErrors>

  <g:hasErrors bean="${programa}">
    <div class="alert alert-danger" role="alert">
      <g:renderErrors bean="${programa}" />
    </div>
  </g:hasErrors>

  <div class="row">
    <div class="col-lg-12">
      <div class="panel panel-default">

        <div class="panel-heading">
          <i class="fa fa-archive fa-fw"></i>
          <g:message code="label.programa"/>
        </div>

        <g:render template="components/planificacion"
            model="[planificacion: programa, action: 'guardarPrograma']"/>

      </div>
    </div>
  </div>

</body>
</html>
