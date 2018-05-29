<div class="panel panel-default">
  <div class="panel-heading">
    <i class="fa fa-list fa-fw"></i> <g:message code="planificacion.listado"/>
  </div>

  <div class="panel-body">
    <div class="list-group">

      <g:if test="${!programas}">
        <div class="text-center">
          <i class="fa fa-list fa-3x" aria-hidden="true"></i>
          <p><i><g:message code="label.sindatos"/></i></p>
        </div>
      </g:if>

      <g:each in="${programas}" var="programa">

        <g:link action="programa" id="${programa.id}" class="list-group-item">
          <g:if test="${!programa.publicado}">
            <span class="label label-default"><g:message code="label.pendiente"/></span>
          </g:if>
          <h4 class="list-group-item-heading">${programa.nombre}</h4>
          <p class="list-group-item-text">${programa.descripcion}</p>
        </g:link>

        <g:each in="${programa.proyectos}" var="proyecto">

          <g:link action="proyecto" id="${proyecto.id}" class="list-group-item" style="padding-left: 3em;">
            <g:if test="${!proyecto.publicado}">
              <span class="label label-default"><g:message code="label.pendiente"/></span>
            </g:if>
            <h4 class="list-group-item-heading">${proyecto.nombre}</h4>
            <p class="list-group-item-text">${proyecto.descripcion}</p>
          </g:link>

          <g:each in="${proyecto.actividades}" var="actividad">

            <g:link action="actividad" id="${actividad.id}" class="list-group-item" style="padding-left: 6em;">
              <g:if test="${!actividad.publicado}">
                <span class="label label-default"><g:message code="label.pendiente"/></span>
              </g:if>
              <h4 class="list-group-item-heading">${actividad.nombre}</h4>
              <p class="list-group-item-text">${actividad.descripcion}</p>
            </g:link>

          </g:each>
        </g:each>
      </g:each>
    </div>

  </div>
</div>
