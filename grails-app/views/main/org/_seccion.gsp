<section id="organizaciones">
  <div class="container">
    <div class="row">

      <div class="col-sm-1 col-icon text-primary">
        <i class="fa fa-4x fa-cubes sr-icons"></i>
      </div>
      <div class="col-sm-11">
        <div class="col-sm-12 pull-left">
          <h2><g:message code="label.org"/></h2>
          <hr class="left">
          <p><g:message code="main.org.descripcion"/></p>
        </div>
      </div>

      <div class="col-sm-6">
        <div class="header-item row">
          <i class="fa fa-2x fa-building col-sm-2 col-xs-12 text-center"></i>
          <span class="col-sm-10 col-xs-12">
            <g:message code="main.org.beneficio.perfil"/>
          </span>
        </div>

        <div class="header-item row">
          <i class="fa fa-2x fa-handshake-o col-sm-2 col-xs-12 text-center"></i>
          <span class="col-sm-10 col-xs-12">
            <g:message code="main.org.beneficio.actividades"/>
          </span>
        </div>

        <div class="header-item row">
          <i class="fa fa-2x fa-bar-chart col-sm-2 col-xs-12 text-center"></i>
          <span class="col-sm-10 col-xs-12">
            <g:message code="main.org.beneficio.informes"/>
          </span>
        </div>

        <div class="header-item row">
          <i class="fa fa-2x fa-calendar col-sm-2 col-xs-12 text-center"></i>
          <span class="col-sm-10 col-xs-12">
            <g:message code="main.org.beneficio.compartir"/>
          </span>
        </div>
      </div>
      <div class="col-sm-6">
        <div class="header-item row">
          <i class="fa fa-2x fa-cogs col-sm-2 col-xs-12 text-center"></i>
          <span class="col-sm-10 col-xs-12">
            <g:message code="main.org.beneficio.automatizacion"/>
          </span>
        </div>

        <div class="header-item row">
          <i class="fa fa-2x fa-tachometer col-sm-2 col-xs-12 text-center"></i>
          <span class="col-sm-10 col-xs-12">
            <g:message code="main.org.beneficio.panel"/>
          </span>
        </div>

        <div class="header-item row">
          <i class="fa fa-2x fa-newspaper-o col-sm-2 col-xs-12 text-center"></i>
          <span class="col-sm-10 col-xs-12">
            <g:message code="main.org.beneficio.capacitacion" args="[]" default=""/>
          </span>
        </div>

        <div class="header-item row">
          <i class="fa fa-2x fa-line-chart col-sm-2 col-xs-12 text-center"></i>
          <span class="col-sm-10 col-xs-12">
            <g:message code="main.org.beneficio.balance"/>
          </span>
        </div>
      </div>

      <g:render template="/main/org/registro" />

      <div class="col-sm-6 container header-form">
        <h3 class="text-center">Registro</h3>
        <br>

        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>
        <!-- <button type="submit" class="btn btn-primary btn-xl page-scroll pull-right">Continuar</button> -->

      </div>
    </div>
  </div>
</section>
