<g:form controller="org" action="proyecto" method="POST" useToken="true">

  <g:if test="${object}">
    <input type="hidden" name="id" value="${object.id}">
  </g:if>
  <input type="hidden" name="orgId" value="${org.id}">

  <div class="modal-body row">

    <div class="form-group col-sm-12">
      <label for="nombreProyecto">
        <g:message code="label.nombre"/>
      </label>
      <input id="nombreProyecto" name="nombre" value="${object?.nombre}"
          class="form-control" type="text" required />
    </div>

    <div class="form-group col-sm-12">
      <label for="descripcionProyecto">
        <g:message code="label.descripcion"/>
      </label>
      <textarea id="descripcionProyecto" name="descripcion" class="form-control"
          rows="8" cols="80" required>${object?.descripcion}</textarea>
    </div>

    <div class="form-group col-sm-12">
      <label for="programa">
        <g:message code="label.programa"/>
      </label>
      <div class="input-group">
        <g:selectProgramas id="programa" org="${org}" parent="${object?.programa?.id}"
            name="programaId" class="form-control" />
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
