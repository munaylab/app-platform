<div class="modal fade" id="agregarEgreso" tabindex="-1" role="dialog" aria-labelledby="egresoLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
          <span aria-hidden="true">&times;</span>
        </button>
        <h4 class="modal-title" id="egresoLabel">
          <g:message code="balance.egreso.agregar"/>
        </h4>
      </div>

      <div class="modal-body row">
        <div class="form-group col-sm-6">
          <label for="fechaEgreso"><g:message code="label.fecha"/></label>
          <input id="fechaEgreso" name="fecha" class="form-control" type="date" required/>
        </div>
        <div class="form-group col-sm-6">
          <label for="montoEgreso"><g:message code="label.importe"/></label>
          <input id="montoEgreso" name="monto" class="form-control" type="number" required/>
        </div>
        <div class="form-group col-sm-12">
          <label for="detalleEgreso"><g:message code="label.detale"/></label>
          <input id="detalleEgreso" name="detalle" class="form-control" type="text" required/>
        </div>
      </div>
      <br>

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">
          <g:message code="label.cerrar"/>
        </button>
        <button type="button" class="btn btn-primary">
          <g:message code="label.agregar"/>
        </button>
      </div>

    </div>
  </div>
</div>
