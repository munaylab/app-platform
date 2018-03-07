<select id="${attrs.id}" name="${attrs.name}" class="${attrs.'class'}" required>
  <option value="" disabled selected>-</option>

  <g:each var="planificacion" in="${planificaciones}">
    <option value="${planificacion.id}">
      ${planificacion.nombre}
    </option>
  </g:each>

</select>
