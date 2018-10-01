<nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">

    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Navegación</span> <i class="fa fa-2x fa-bars"></i>
      </button>
      <a class="navbar-brand page-scroll" href="#page-top">
        <g:message code="label.plataforma.nombre"/>
      </a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav navbar-right">

        <g:if test="${verBeneficio}">
        <li>
          <a class="page-scroll" href="#beneficios">
            <g:message code="main.org.beneficio.titulo"/>
          </a>
        </li>
        </g:if>

        <g:if test="${verRegistroOsc}">
        <li>
          <a class="page-scroll" href="#registro">
            <g:message code="label.signup"/>
          </a>
        </li>
        </g:if>

        <g:if test="${verFAQ}">
        <li>
          <a class="page-scroll" href="#faq">
            <g:message code="label.faq"/>
          </a>
        </li>
        </g:if>

        <g:if test="${verContacto}">
        <li>
          <a class="page-scroll" href="#contacto">
            <g:message code="label.contacto"/>
          </a>
        </li>
        </g:if>

        <sec:ifNotLoggedIn>
        <li>
          <button type="button" data-toggle="modal" data-target="#signin-osc"
              class="btn btn-primary btn-sm btn-block navbar-btn">
            <g:message code="label.signin"/>
          </button>
        </li>
        </sec:ifNotLoggedIn>
      </ul>
    </div>

  </div>
</nav>
