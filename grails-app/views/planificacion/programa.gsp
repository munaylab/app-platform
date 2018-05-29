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
  <g:set var="nuevo" value="${!programa?.id}" />

  <div class="row">
    <div class="col-lg-12">
      <div class="panel panel-default">
        <div class="panel-heading">
          <i class="fa fa-archive fa-fw"></i>
          <g:message code="label.programa"/>
        </div>

        <g:form controller="planificacion" action="guardarPrograma" method="POST" useToken="true">
          <g:if test="${!nuevo}">
            <input type="hidden" name="id" value="${programa.id}">
          </g:if>
          <input type="hidden" name="orgId" value="${org.id}">

          <div class="panel-body">
            <div class="form-group">
              <label for="nombrePrograma"><g:message code="label.nombre"/></label>
              <input id="nombrePrograma" name="nombre" class="form-control" type="text"
                  pattern=".{5,500}" title="${g.message(code:'planificacion.nombre.help')}"
                  value="${command?.nombre ?: programa?.nombre}" required/>
            </div>

            <div class="form-group">
              <label for="descripcionPrograma"><g:message code="label.descripcion"/></label>
              <input id="descripcionPrograma" name="descripcion" class="form-control" type="text"
                  pattern=".{5,1000}" title="${g.message(code:'planificacion.descripcion.help')}"
                  value="${command?.descripcion ?: programa?.descripcion}" required/>
            </div>

            <editor-markdown content="${command?.contenido ?: programa?.contenido}" name="contenido"/>
          </div>
          <div class="panel-footer">
            <div class="col-sm-6 text-left">
              <g:if test="${!nuevo}">
                <g:link controller="planificacion" action="borrar" id="${programa.id}"
                    class="btn btn-danger">
                  <g:message code="label.borrar"/>
                </g:link>
              </g:if>
            </div>
            <div class="col-sm-6 text-right">
              <button type="submit" class="btn btn-primary">
                <g:message code="label.aceptar"/>
              </button>
              <g:link controller="planificacion" class="btn btn-default">
                <g:message code="label.cancelar"/>
              </g:link>
            </div>
            <div class="clearfix"></div>
          </div>
        </g:form>
      </div>
    </div>
  </div>

</body>
</html>
