<!DOCTYPE html>
<html lang="en-US">
<head>
  <meta name="layout" content="admin-org"/>
  <title>${org.nombre} - <g:message code="label.plataforma.nombre"/></title>
</head>
<body>

  <br>

  <g:render template="/components/panel_resumen"/>

  <div class="row">
    <g:if test="${listado}">
      <div class="col-lg-8">
        <g:render template="components/planificacion/listadoPlanificacion"/>
      </div>
      <div class="col-lg-4">
        <g:render template="components/planificacion/listadoEventos"/>
      </div>
    </g:if>
    <g:else>
      <div class="col-lg-12">
        <div class="panel panel-default">
          <div class="panel-heading">
            <g:if test="${form == 'formPrograma'}">
              <i class="fa fa-archive fa-fw"></i>
              <g:message code="label.programa"/>
            </g:if>
            <g:elseif test="${form == 'formProyecto'}">
              <i class="fa fa-folder fa-fw"></i>
              <g:message code="label.proyecto"/>
            </g:elseif>
            <g:elseif test="${form == 'formActividad'}">
              <i class="fa fa-clone fa-fw"></i>
              <g:message code="label.actividad"/>
            </g:elseif>
            <g:elseif test="${form == 'formEvento'}">
              <i class="fa fa-calendar fa-fw"></i>
              <g:message code="label.evento"/>
            </g:elseif>
            <g:else>
              <i class="fa fa-cubes fa-fw"></i>
              <g:message code="sidebar.planificacion"/>
            </g:else>
          </div>
          <div class="panel-body">
            <g:formPlanificacion object="${valor}" form="${form}"/>
          </div>
        </div>
      </div>
    </g:else>

  </div>

</body>
</html>
