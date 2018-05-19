<template id="nombre-articulo-template">
  <div>
    <input type="text" class="form-control" :name="name" :value="value" v-model="value"
        placeholder="${g.message(code:'contenido.articulo.titulo')}"
        required pattern=".{5,100}" required title="Debe contener entre 5 a 100 caracteres.">
    <p class="help-block">Debe contener entre 5 a 100 caracteres.</p>

    <transition name="slide-fade">
      <div v-if="value">
        <label>Vista previa de URL del articulo</label>
        <div class="input-group">
          <span class="input-group-addon" v-html="url"></span>
          <input type="text" class="form-control" :value="urlPreview" disabled readonly>
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
              .replace(/ /g,'_')
              .replace(/á/g,'a')
              .replace(/é/g,'e')
              .replace(/í/g,'i')
              .replace(/ó/g,'o')
              .replace(/ú/g,'u');
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
