<!DOCTYPE html>
<html lang="en-US">
<head>
  <meta name="layout" content="admin"/>
  <title>${org.nombre} - <g:message code="label.plataforma.nombre"/></title>

  <g:render template="components/destino_menu"/>
</head>
<body>
  <br>

  <g:render template="/components/panel_resumen"/>

  <g:hasErrors bean="${command}">
    <div class="alert alert-danger" role="alert">
      <g:renderErrors bean="${command}" />
    </div>
  </g:hasErrors>

  <g:hasErrors bean="${cabecera}">
    <div class="alert alert-danger" role="alert">
      <g:renderErrors bean="${cabecera}" />
    </div>
  </g:hasErrors>

  <div class="row">
    <div class="col-lg-12">

      <g:set var="nuevo" value="${!cabecera?.id}" />
      <div class="panel panel-default">
        <div class="panel-heading">
          <h4>
            <g:if test="${nuevo}"> Nuevo Menu </g:if>
            <g:else> Modificar Menu #${cabecera.id} </g:else>
          </h4>
        </div>

        <g:form name="cabecera" action="actualizar" useToken="true">
          <g:if test="${!nuevo}">
            <g:hiddenField name="id" value="${cabecera.id}" />
          </g:if>
          <g:hiddenField name="orgId" value="${org.id}" />

          <div class="panel-body">

            <div class="form-group">
              <label for="nombre"> <g:message code="contenido.cabecera.nombre"/>* </label>
              <input type="text" class="form-control" name="nombre" value="${command?.nombre ?: cabecera?.nombre}"
                  placeholder="${g.message(code:'contenido.cabecera.nombre')}" required>
            </div>

            <div class="form-group">
              <label for="titulo"> <g:message code="contenido.cabecera.titulo"/>* </label>
              <input type="text" class="form-control" name="titulo" value="${command?.titulo ?: cabecera?.titulo}"
                  placeholder="${g.message(code:'contenido.cabecera.titulo')}" required>
            </div>
            <div class="form-group">
              <label for="prioridad"> <g:message code="contenido.cabecera.prioridad"/>* </label>
              <input type="number" class="form-control" name="prioridad" value="${command?.prioridad ?: cabecera?.prioridad}"
                  placeholder="${g.message(code:'contenido.cabecera.prioridad')}" required min="1" max="10">
            </div>

            <div class="form-group">
              <label> <g:message code="contenido.cabecera.destino"/> </label>
              <destino-menu>
                <div slot="link">
                  <input type="text" class="form-control" name="link" value="${command?.link ?: cabecera?.link}"
                      placeholder="${g.message(code:'contenido.cabecera.destino.link')}">
                </div>
                <div slot="articulo">
                  <g:select name="contenidoId" class="form-control"
                      from="${articulos}" value="${command?.contenidoId ?: cabecera?.contenido?.id}"
                      optionValue="titulo" optionKey="id"/>
                </div>
              </destino-menu>
            </div>

          </div>

          <div class="panel-footer text-right">
              <button type="submit" class="btn btn-primary">
                <g:message code="label.aceptar"/>
              </button>
              <g:link controller="contenido" class="btn btn-default">
                <g:message code="label.cancelar"/>
              </g:link>
          </div>

        </g:form>

      </div>
    </div>
  </div>

</body>
</html>
