<select name="${attrs.name}" class="${attrs.'class'}" required>
  <option value="" disabled selected>-</option>

  <g:each var="item" in="${items}">
    <g:if test="${item}">
      <option value="${item.id}" ${item.id == attrs.value ? 'selected' : ''}>
        ${item.titulo}
      </option>
    </g:if>
  </g:each>

</select>
