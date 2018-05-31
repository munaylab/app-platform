<g:set var="nuevo" value="${!planificacion?.id}" />

<g:form controller="planificacion" action="${action}" method="POST" useToken="true">
  <g:if test="${!nuevo}">
    <input type="hidden" name="id" value="${planificacion.id}">
  </g:if>
  <input type="hidden" name="orgId" value="${org.id}">

  <div class="panel-body">

    <g:if test="${proyecto}">
      <div class="form-group">
        <label for="programa"><g:message code="label.programa"/></label>
        <g:selectProgramas id="programa" name="programaId" class="form-control" org="${org}"
            parent="${command?.programaId ?: planificacion?.programa?.id}"/>
      </div>
    </g:if>

    <g:if test="${actividad}">
      <div class="form-group">
        <label for="proyecto"><g:message code="label.proyecto"/></label>
        <g:selectProyectos id="proyecto" name="proyectoId" class="form-control" org="${org}"
            parent="${command?.proyectoId ?: planificacion?.proyecto?.id}"/>
      </div>
    </g:if>

    <div class="form-group">
      <label for="nombre"><g:message code="label.nombre"/></label>
      <input id="nombre" name="nombre" class="form-control" type="text"
          pattern=".{5,500}" title="${g.message(code:'planificacion.nombre.help')}"
          value="${command?.nombre ?: planificacion?.nombre}" required/>
    </div>

    <div class="form-group">
      <label for="descripcion"><g:message code="label.descripcion"/></label>
      <input id="descripcion" name="descripcion" class="form-control" type="text"
          pattern=".{5,1000}" title="${g.message(code:'planificacion.descripcion.help')}"
          value="${command?.descripcion ?: planificacion?.descripcion}" required/>
    </div>

    <editor-markdown content="${command?.contenido ?: planificacion?.contenido}" name="contenido"/>
  </div>

  <div class="panel-footer">
    <div class="col-sm-6 text-left">
      <g:if test="${!nuevo}">
        <g:link controller="planificacion" action="borrar" id="${planificacion.id}" class="btn btn-danger">
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
