<g:form controller="org" action="programa" method="POST" useToken="true">

  <g:if test="${programa}">
    <input type="hidden" name="id" value="${programa.id}">
  </g:if>
  <input type="hidden" name="orgId" value="${org.id}">


  <div class="modal-body row">

    <div class="form-group col-sm-12">
      <label for="nombrePrograma">
        <g:message code="label.nombre"/>
      </label>
      <input id="nombrePrograma" name="nombre" value="${programa?.nombre}"
          class="form-control" type="text" required/>
    </div>

    <div class="form-group col-sm-12">
      <label for="descripcionPrograma">
        <g:message code="label.descripcion"/>
      </label>
      <textarea id="descripcionPrograma" name="descripcion"
          class="form-control" rows="8" cols="80" required>${programa?.descripcion}</textarea>
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
