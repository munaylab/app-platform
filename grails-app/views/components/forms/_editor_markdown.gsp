<template id="editor-template">
  <div>
    <div class="form-group">
      <label for="contenido">
        <g:message code="contenido.articulo.contenido"/> *
      </label>
      <textarea class="form-control" rows="10" :name="name" :value="value" @input="update" required></textarea>
      <p class="help-block">
        Debe contener más de 10 caracteres.
        <span class="pull-right" v-html="value.length + '/5000'"></span>
      </p>
    </div>
    <transition name="slide-fade">
      <div v-if="value">
        <div class="panel panel-default visible-md-block visible-lg-block">
          <div class="panel-heading" @click="enablePreview = !enablePreview">
            <i class="fa fa-1x fa-angle-double-down pull-right"></i>
            Vista previa del contenido
          </div>
          <div class="panel-body" v-html="preview" v-if="enablePreview"></div>
        </div>
      </div>
    </transition>
  </div>
</template>

<script>
Vue.component('editorMarkdown', {
  template: '#editor-template',
  props: ['name', 'content'],
  data: function() {
    return {
      value: this.content,
      enablePreview: true
    }
  },
  computed: {
    preview: function () {
      return marked(this.value, { sanitize: true })
    }
  },
  methods: {
    update: _.debounce(function (e) {
      this.value = e.target.value
    }, 300)
  }
});
</script>
