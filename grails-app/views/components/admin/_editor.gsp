<template id="editor-template">
  <div class="form-group row">
    <div class="col-sm-12 col-md-6">
      <label for="contenido">Contenido</label>
      <textarea class="form-control" rows="5" :value="texto" @input="update"></textarea>
    </div>
    <div class="col-md-6 visible-md-block visible-lg-block">
      <label>Vista Previa</label>
      <div v-html="vistaPrevia"></div>
    </div>
  </div>
</template>

<script>
Vue.component('editorMarkdown', {
  template: '#editor-template',
  props: ['texto'],
  data: function() {
    return { texto: this.texto }
  },
  computed: {
    vistaPrevia: function () {
      return marked(this.texto, { sanitize: true })
    }
  },
  methods: {
    update: _.debounce(function (e) {
      this.texto = e.target.value
    }, 300)
  }
});
</script>
