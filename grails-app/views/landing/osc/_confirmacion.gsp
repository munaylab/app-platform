<header>
  <div class="header-content">
    <div class="header-content-inner">

      <div class="row">
        <div class="col-sm-12">
          <div class="col-sm-12">
            <h2><g:message code="confirmacion.titulo"/></h2>
            <hr class="left">
            <p><g:message code="confirmacion.descripcion"/></p>
          </div>
        </div>

        <g:form name="name" action="action">
          <div class="col-sm-12">
            <div class="col-sm-4 col-sm-offset-4">
                <div class="form-group">
                  <input id="codigo" name="codigo" class="form-control" type="text" required
                      placeholder="${g.message(code: 'confirmacion.placeholder')}"/>
                </div>
                <br>
            </div>
          </div>

          <div class="col-sm-12 text-center">
            <button type="submit" name="button" class="btn btn-primary btn-xl">
              <g:message code="confirmacion.boton"/>
            </button>
          </div>
        </g:form>

      </div>

    </div>
  </div>
</header>
