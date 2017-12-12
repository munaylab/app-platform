<div class="modal fade" id="agregarIngreso" tabindex="-1" role="dialog" aria-labelledby="ingresoLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
          <span aria-hidden="true">&times;</span>
        </button>
        <h4 class="modal-title" id="ingresoLabel">
          <g:message code="balance.ingreso.agregar"/>
        </h4>
      </div>

      <g:form controller="org" action="asiento" method="POST" useToken="true">
        <input type="hidden" name="esIngreso" value="true">
        <input type="hidden" name="categoria.tipo" value="INGRESO">
        <div class="modal-body row">
          <div class="form-group col-sm-4">
            <label for="fechaIngreso"><g:message code="label.fecha"/></label>
            <input id="fechaIngreso" name="fecha" class="form-control" type="date" required
                value="${new Date().format('yyyy-MM-dd')}"/>
          </div>
          <div class="form-group col-sm-3">
            <label for="montoIngreso"><g:message code="label.importe"/></label>
            <input id="montoIngreso" name="monto" class="form-control" type="number" required/>
          </div>
          <div class="form-group col-sm-5">
            <label for="categoriaIngreso">Categoría</label>
            <div class="input-group">
              <g:selectCategorias id="categoriaIngreso" name="categoria.id" class="form-control" tipo="ingreso"/>
              <div role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseIngreso"
                  aria-expanded="true" aria-controls="collapseIngreso" class="input-group-addon">+</div>
            </div>
          </div>

          <div class="form-group col-sm-12">
            <label for="detalleIngreso"><g:message code="label.detale"/></label>
            <input id="detalleIngreso" name="detalle" class="form-control" type="text"/>
          </div>
        </div>

        <div id="collapseIngreso" class="panel-collapse collapse col-sm-12" role="tabpanel"
            aria-labelledby="headingOne">
          <div class="panel panel-default">
            <div class="panel-heading">Agregar nueva categoría</div>
            <div class="panel-body">
              <div class="form-group col-sm-6">
                <label for="nombreCategoriaIngreso">Nombre</label>
                <input id="nombreCategoriaIngreso" name="categoria.nombre" class="form-control"/>
              </div>
              <div class="form-group col-sm-6">
                <label for="categoriaPadreIngreso">Categoría Padre</label>
                <g:selectCategorias id="categoriaPadreIngreso" name="categoria.idCategoriaPadre"
                    class="form-control" tipo="egreso"/>
              </div>
              <div class="form-group col-sm-12">
                <label for="detalleCategoriaIngreso">Detalle</label>
                <input id="detalleCategoriaIngreso" name="categoria.detalle" class="form-control"/>
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
