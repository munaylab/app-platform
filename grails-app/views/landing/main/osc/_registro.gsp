<section id="registro" class="bg-primary">

  <div class="container">
    <div class="row text-center">
      <div class="col-lg-12">
        <h2 class="section-heading">
          <g:message code="main.org.registro.full"/>
        </h2>
        <hr class="light">
      </div>
      <p><g:message code="main.org.registro.descripcion"/></p>
    </div>
  </div>

  <div class="container">
    <g:form controller="org" action="registro" method="POST">

      <div class="form-group">
        <label for="denominacion">
          <g:message code="main.org.registro.nombre.label"/>:
        </label>
        <input id="denominacion" name="denominacion" class="form-control" type="text" placeholder="${g.message(code:'main.org.registro.nombre.placeholder')}"/>
      </div>

      <div class="form-group">
        <label for="">
          <g:message code="main.org.registro.tipo.label"/>:
        </label>
        <div class="checkbox">
          <label class="col-md-3">
            <input type="checkbox" name="tipo" value="FUNDACION">
            <g:message code="main.org.registro.tipo.valor1"/>
          </label>
          <label class="col-md-4">
            <input type="checkbox" name="tipo" value="ASOCIACION_CIVIL">
            <g:message code="main.org.registro.tipo.valor2"/>
          </label>
          <label class="col-md-5">
            <input type="checkbox" name="tipo" value="ASOCIACION_SIMPLE">
            <g:message code="main.org.registro.tipo.valor3"/>
          </label>
        </div>
      </div>

      <div class="form-group">
        <label for="objeto">
          <g:message code="main.org.registro.objeto.label"/>:
        </label>
        <textarea id="objeto" name="objeto" rows="3" class="form-control"></textarea>
      </div>

      <div class="form-group">
        <label for="nombre">
          <g:message code="main.org.registro.representante.label"/>:
        </label>
        <div class="row">
          <div class="col-sm-6">
            <input id="nombre" name="nombre" class="form-control" type="text" placeholder="${g.message(code: 'main.org.registro.representante.nombre')}" required/>
          </div>
          <div class="col-sm-6">
            <input id="apellido" name="apellido" class="form-control" type="text" placeholder="${g.message(code: 'main.org.registro.representante.apellido')}" required/>
          </div>
        </div>
      </div>

      <div class="form-group">
        <div class="row">
          <div class="col-sm-6">
            <input id="email" name="email" class="form-control" type="email" placeholder="${g.message(code: 'main.org.registro.representante.email')}" required/>
          </div>
          <div class="col-sm-6">
            <input id="telefono" name="telefono" class="form-control" type="text" placeholder="${g.message(code: 'main.org.registro.representante.telefono')}" required/>
          </div>
        </div>
      </div>

      <div class="form-group">
        <button type="submit" class="btn btn-default btn-xl page-scroll pull-right">
          <g:message code="main.org.registro.boton"/>
        </button>
      </div>

    </g:form>
  </div>

</section>
