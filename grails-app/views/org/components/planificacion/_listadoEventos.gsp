<div class="panel panel-default">
  <div class="panel-heading">
    <i class="fa fa-list fa-fw"></i>
    <g:message code="planificacion.eventos"/>
  </div>

  <div class="panel-body">
    <div class="list-group">

      <g:if test="${!eventos}">
        <div class="text-center">
          <i class="fa fa-list fa-3x" aria-hidden="true"></i>
            <p><i><g:message code="label.sindatos"/></i></p>
        </div>
      </g:if>

      <g:each in="${eventos}" var="evento">

        <g:link action="evento" id="${evento.id}" class="list-group-item">
          <g:if test="${!evento.publicado}">
            <span class="label label-default">
              <g:message code="label.pendiente"/>
            </span>
          </g:if>
          <h5 class="list-group-item-heading">
            ${evento.nombre}
          </h5>
        </g:link>

      </g:each>

    </div>

  </div>
</div>
