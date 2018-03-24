<div class="panel panel-default">
  <div class="panel-heading">
    <i class="fa fa-list fa-fw"></i>
    <g:message code="planificacion.proximos.eventos"/>
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

        <g:link action="evento" id="${evento.id}" class="list-group-item ${evento.publicado ? 'list-group-item-success' : 'list-group-item-danger'}">
          <h5 class="list-group-item-heading">
            <i class="fa ${evento.publicado ? 'fa-calendar-check-o' : 'fa-calendar-times-o' }" aria-hidden="true"></i>
            ${evento.nombre}
          </h5>

          <div class="hidden-lg">
            <p class="list-group-item-text">
              <g:message code="label.fecha"/>: ${evento.fechaIni.format('dd/MM/yyyy')} <g:message code="label.hora"/>: ${evento.fechaIni.format('HH:mm')}
            </p>
          </div>

          <div class="visible-lg-block">
            <p class="list-group-item-text">
              <g:message code="label.fecha"/>: ${evento.fechaIni.format('dd/MM/yyyy')}
            </p>
            <p class="list-group-item-text">
              <g:message code="label.hora"/>: ${evento.fechaIni.format('HH:mm')}
            </p>
          </div>

        </g:link>

      </g:each>

    </div>

  </div>
</div>
