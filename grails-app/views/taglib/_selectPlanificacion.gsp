<select id="${attrs.id}" name="${attrs.name}" class="${attrs.'class'}" required>
  <option value="" disabled selected>-</option>

  <g:each var="planificacion" in="${planificaciones}">
    <g:if test="${planificacion}">
      <option value="${planificacion?.id}" ${planificacion.id == parent ? 'selected' : ''}>
        ${planificacion?.nombre}
      </option>
    </g:if>
  </g:each>

</select>
