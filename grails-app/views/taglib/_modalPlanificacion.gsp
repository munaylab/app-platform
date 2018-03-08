<div class="modal fade" id="${modalId}" tabindex="-1" role="dialog" aria-labelledby="${modalLabel}">
  <div class="modal-dialog" role="document">
    <div class="modal-content">

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
          <span aria-hidden="true">&times;</span>
        </button>
        <h4 class="modal-title" id="${modalLabel}">
          <g:message code="${modalTitle}"/>
        </h4>
      </div>

      <g:render template="/org/components/planificacion/${modalForm}"/>

    </div>
  </div>
</div>
