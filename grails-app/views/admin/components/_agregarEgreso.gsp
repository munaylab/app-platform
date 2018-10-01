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

      <g:form controller="admin" action="asiento" method="POST" useToken="true">
        <input type="hidden" name="esIngreso" value="false">
        <input type="hidden" name="categoria.tipo" value="EGRESO">
        <div class="modal-body row">
          <div class="form-group col-sm-4">
            <label for="fechaEgreso"><g:message code="label.fecha"/></label>
            <input id="fechaEgreso" name="fecha" class="form-control" type="date" required
                value="${new Date().format('yyyy-MM-dd')}"/>
          </div>
          <div class="form-group col-sm-3">
            <label for="montoEgreso"><g:message code="label.importe"/></label>
            <input id="montoEgreso" name="monto" class="form-control" type="number" required/>
          </div>
          <div class="form-group col-sm-5">
            <label for="categoriaEgreso">Categoría</label>
            <div class="input-group">
              <g:selectCategorias id="categoriaEgreso" name="categoria.id" class="form-control" tipo="egreso"/>
              <div role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseEgreso"
                  aria-expanded="true" aria-controls="collapseEgreso" class="input-group-addon">+</div>
            </div>
          </div>

          <div class="form-group col-sm-12">
            <label for="detalleEgreso"><g:message code="label.detale"/></label>
            <input id="detalleEgreso" name="detalle" class="form-control" type="text"/>
          </div>

          <div id="collapseEgreso" class="panel-collapse collapse col-sm-12" role="tabpanel"
              aria-labelledby="headingOne">
            <div class="panel panel-default">
              <div class="panel-heading">Agregar nueva categoría</div>
              <div class="panel-body">
                <div class="form-group col-sm-6">
                  <label for="nombreCategoriaEgreso">Nombre</label>
                  <input id="nombreCategoriaEgreso" name="categoria.nombre" class="form-control"/>
                </div>
                <div class="form-group col-sm-6">
                  <label for="categoriaPadreEgreso">Categoría Padre</label>
                  <g:selectCategorias id="categoriaPadreEgreso" name="categoria.idCategoriaPadre"
                      class="form-control" tipo="egreso"/>
                </div>
                <div class="form-group col-sm-12">
                  <label for="detalleCategoriaEgreso">Detalle</label>
                  <input id="detalleCategoriaEgreso" name="categoria.detalle" class="form-control"/>
                </div>
              </div>
            </div>
          </div>

        </div>
        <br>

        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">
            <g:message code="label.cerrar"/>
          </button>
          <button type="submit" class="btn btn-primary">
            <g:message code="label.agregar"/>
          </button>
        </div>
      </g:form>

    </div>
  </div>
</div>
