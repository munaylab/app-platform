<template id="editor-template">
  <div>
    <div class="form-group">
      <label for="contenido">
        <g:message code="contenido.articulo.contenido"/> *
      </label>
      <textarea class="form-control" rows="10" :name="name" :value="value" @input="update" required></textarea>

      <p class="help-block">
        <span class="pull-right" v-html="value.length + '/5000'"></span>
        <g:message code="contenido.articulo.text10.help"/>
        <button type="button" class="btn btn-default btn-xs visible-xs-block visible-sm-block"
            data-toggle="modal" data-target="#modalEditorMarkdown">
          <i class="fa fa-image"></i> <g:message code="label.preview"/>
        </button>
      </p>
    </div>

    <transition name="slide-fade">
      <div v-if="value">
        <div class="panel panel-default visible-md-block visible-lg-block">
          <div class="panel-heading" @click="enablePreview = !enablePreview">
            <i class="fa fa-1x fa-angle-double-down pull-right"></i>
            <g:message code="contenido.articulo.markdown.preview"/>
          </div>
          <div class="panel-body" v-html="preview" v-if="enablePreview"></div>
        </div>
      </div>
    </transition>

    <div id="modalEditorMarkdown" class="modal fade" tabindex="-1" role="dialog"
        aria-labelledby="titleModalEditorMarkdown">
      <div class="modal-dialog" role="document">
        <div class="modal-content modal-lg">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
              <span aria-hidden="true">&times;</span>
            </button>
            <h4 class="modal-title" id="titleModalEditorMarkdown">
              <g:message code="contenido.articulo.markdown.preview"/>
            </h4>
          </div>
          <div class="modal-body" v-html="preview"></div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">
              <g:message code="label.cerrar"/>
            </button>
          </div>
        </div>
      </div>
    </div>

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
