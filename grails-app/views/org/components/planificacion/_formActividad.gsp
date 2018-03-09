<g:form controller="org" action="actividad" method="POST" useToken="true">

  <g:if test="${object}">
    <input type="hidden" name="id" value="${object.id}">
  </g:if>
  <input type="hidden" name="orgId" value="${org.id}">

  <div class="modal-body row">

    <div class="form-group col-sm-12">
      <label for="nombreActividad">
        <g:message code="label.nombre"/>
      </label>
      <input id="nombreActividad" name="nombre" value="${object?.nombre}"
          class="form-control" type="text" required />
    </div>

    <div class="form-group col-sm-12">
      <label for="descripcionActividad">
        <g:message code="label.descripcion"/>
      </label>
      <textarea id="descripcionActividad" name="descripcion" class="form-control"
          rows="8" cols="80" required>${object?.descripcion}</textarea>
    </div>

    <div class="form-group col-sm-5">
      <label for="proyecto">
        <g:message code="label.proyecto"/>
      </label>
      <div class="input-group">
        <g:selectProyectos org="${org}" id="proyecto" parent="${object?.proyecto?.id}"
            name="proyectoId" class="form-control"/>
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
