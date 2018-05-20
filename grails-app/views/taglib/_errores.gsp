<g:hasErrors bean="${command}">
  <div class="alert alert-danger" role="alert">
    <g:renderErrors bean="${command}" />
  </div>
</g:hasErrors>

<g:hasErrors bean="${value}">
  <div class="alert alert-danger" role="alert">
    <g:renderErrors bean="${value}" />
  </div>
</g:hasErrors>
