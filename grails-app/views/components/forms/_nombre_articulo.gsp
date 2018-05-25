<template id="nombre-articulo-template">
  <div>
    <input type="text" class="form-control" :name="name" :value="value" v-model="value"
        placeholder="${g.message(code:'contenido.articulo.titulo')}"
        required pattern=".{5,100}" required title="${g.message(code:'contenido.articulo.titulo.help')}">
    <p class="help-block"><g:message code="contenido.articulo.titulo.help"/></p>

    <transition name="slide-fade">
      <div v-if="value">
        <label><g:message code="contenido.articulo.url.preview"/></label>
        <div class="input-group">
          <span class="input-group-addon" v-html="url"></span>
          <input type="text" class="form-control" :value="urlPreview" name="url" readonly>
        </div>
      </div>
    </transition>

  </div>
</template>

<script>
Vue.component('nombreArticulo', {
  template: '#nombre-articulo-template',
  props: ['url', 'name', 'value'],
  data: function() {
    return {
      value: this.value
    }
  },
  computed: {
    urlPreview: function (e) {
      return this.value.toLowerCase()
              .replace(/ /g,'-')
              .replace(/á/g,'a')
              .replace(/é/g,'e')
              .replace(/í/g,'i')
              .replace(/ó/g,'o')
              .replace(/ú/g,'u')
              .replace(/[_[\]{}()°%*+=&/'"!¡¿?.,;:\\^$|#\s]/g,'');
    }
  }
});
</script>

<style>
.slide-fade-enter-active {
  transition: all .4s ease;
}
.slide-fade-leave-active {
  transition: all .2s ease;
}
.slide-fade-enter, .slide-fade-leave-to {
  transform: translateY(10px);
  opacity: 0;
}
</style>
