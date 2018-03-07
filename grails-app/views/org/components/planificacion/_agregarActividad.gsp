<div class="modal fade" id="agregarActividad" tabindex="-1" role="dialog" aria-labelledby="actividadLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">

      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
          <span aria-hidden="true">&times;</span>
        </button>
        <h4 class="modal-title" id="actividadLabel">
          <g:message code="admin.sidebar.planificacion.agregar.actividad"/>
        </h4>
      </div>

      <g:form controller="org" action="planificar" method="POST" useToken="true">
        <input type="hidden" name="orgId" value="${org.id}">

        <div class="modal-body row">
          <div class="form-group col-sm-12">
            <label for="nombreActividad">
              <g:message code="label.nombre"/>
            </label>
            <input id="nombreActividad" name="nombre" class="form-control" type="text" required />
          </div>

          <div class="form-group col-sm-12">
            <label for="descripcionActividad">
              <g:message code="label.descripcion"/>
            </label>
            <textarea id="descripcionActividad" name="descripcion" class="form-control" rows="8" cols="80" required></textarea>
          </div>

          <div class="form-group col-sm-5">
            <label for="proyecto">
              <g:message code="label.proyecto"/>
            </label>
            <div class="input-group">
              <g:selectProyectos org="${org}" id="proyecto" name="proyecto.id" class="form-control"/>
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
