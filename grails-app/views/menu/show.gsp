<!DOCTYPE html>
<html lang="en-US">
<head>
  <meta name="layout" content="admin"/>
  <title>${org.nombre} - <g:message code="contenido.cabecera"/></title>
  <g:render template="components/destino_menu"/>
</head>
<body>
  <br>
  <g:render template="/components/panel_resumen"/>

  <g:errores value="${cabecera}"/>

  <div class="row">
    <div class="col-lg-12">

      <g:set var="nuevo" value="${!cabecera?.id}" />
      <div class="panel panel-default">
        <div class="panel-heading">
          <h4>
            <g:if test="${nuevo && !command}">
              <g:message code="contenido.cabecera.nuevo"/>
            </g:if>
            <g:else>
              <g:message code="contenido.cabecera.modificar"/>
            </g:else>
          </h4>
        </div>

        <g:form name="cabecera" action="actualizar" useToken="true">
          <g:if test="${!nuevo}">
            <g:hiddenField name="id" value="${cabecera.id}" />
          </g:if>
          <g:elseif test="${command}">
            <g:hiddenField name="id" value="${command.id}" />
          </g:elseif>

          <g:hiddenField name="orgId" value="${org.id}" />

          <div class="panel-body">

            <div class="form-group">
              <label for="nombre"> <g:message code="contenido.cabecera.nombre"/>* </label>
              <input type="text" class="form-control" name="nombre" required
                  value="${command?.nombre ?: cabecera?.nombre}"
                  placeholder="${g.message(code:'contenido.cabecera.nombre')}">
            </div>

            <div class="form-group">
              <label for="titulo"> <g:message code="contenido.cabecera.titulo"/>* </label>
              <input type="text" class="form-control" name="titulo" required
                  value="${command?.titulo ?: cabecera?.titulo}"
                  placeholder="${g.message(code:'contenido.cabecera.titulo')}">
            </div>
            <div class="form-group">
              <label for="prioridad"> <g:message code="contenido.cabecera.prioridad"/>* </label>
              <input type="number" class="form-control" name="prioridad" required min="1" max="10"
                  value="${command?.prioridad ?: cabecera?.prioridad}"
                  placeholder="${g.message(code:'contenido.cabecera.prioridad')}">
            </div>

            <div class="form-group">
              <label> <g:message code="contenido.cabecera.destino"/> </label>
              <destino-menu link="${command?.link ?: cabecera?.link}">
                <div slot="link">
                  <input type="text" class="form-control" name="link"
                      value="${command?.link ?: cabecera?.link}"
                      placeholder="${g.message(code:'contenido.cabecera.destino.link')}">
                </div>
                <div slot="articulo">
                  <g:selectArticulos name="contenidoId" class="form-control"
                      org="${org}" value="${command?.contenidoId ?: cabecera?.contenido?.id}"/>
                </div>
              </destino-menu>
            </div>
          </div>

          <div class="panel-footer text-right">
              <button type="submit" class="btn btn-primary">
                <g:message code="label.aceptar"/>
              </button>
              <g:link controller="menu" class="btn btn-default">
                <g:message code="label.cancelar"/>
              </g:link>
          </div>

        </g:form>

      </div>
    </div>
  </div>

</body>
</html>
