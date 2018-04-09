<nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">

    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Navegación</span> <i class="fa fa-2x fa-bars"></i>
      </button>
      <a class="navbar-brand page-scroll" href="#page-top">
        ${org.nombre}
      </a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav navbar-right">

        <li>
          <a class="page-scroll" href="#mision">
            <g:message code="label.mision"/>
          </a>
        </li>

        <li>
          <a class="page-scroll" href="#nosotros">
            <g:message code="label.nosotros"/>
          </a>
        </li>

        <li>
          <a class="page-scroll" href="#programas">
            <g:message code="label.programas"/>
          </a>
        </li>

        <li>
          <a class="page-scroll" href="#contacto">
            <g:message code="label.contacto"/>
          </a>
        </li>

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
