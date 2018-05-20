<template id="imagen-template">
  <div>
    <input type="hidden" :name="name + '.id'" :value="id">
    <input type="hidden" :name="name + '.accion'" :value="accion">

    <div v-if="enableFile">
      <input ref="imagen" type="file" :name="name + '.file'" @change="processFile"
          accept=".jpg, .jpeg, .png" style="display: none !important;">
    </div>

    <div class="input-group">

      <span class="input-group-btn">
        <button class="btn btn-default" type="button" @click="selectImage">
          <i class="fa fa-upload"></i>
          <span class="hidden-xs hidden-sm">
            Seleccionar imagen
          </span>
        </button>
      </span>

      <input type="text" class="form-control" :name="name + '.nombre'" :value="value"
          placeholder="${g.message(code:'contenido.articulo.imagen')}" readonly>

      <span class="input-group-btn">
        <button class="btn btn-danger" type="button" @click="deleteImage">
          <i class="fa fa-trash"></i>
          <span class="hidden-xs hidden-sm">
            Borrar
          </span>
        </button>
      </span>

    </div>
    <p class="help-block">
      El archivo no debe exceder los 15MB.
      <button v-if="preview" type="button" class="btn btn-default btn-xs" @click="previewFile = !previewFile">
        <i class="fa fa-image"></i>
        <span class="hidden-xs hidden-sm">
          Vista Previa
        </span>
      </button>
    </p>

    <transition name="slide-fade">
      <div v-if="previewFile">
        <img :src="link" width="150" height="150" class="img-thumbnail"></img>
      </div>
    </transition>

  </div>
</template>

<script>
Vue.component('imagen', {
  template: '#imagen-template',
  props: ['id', 'name', 'value', 'link'],
  data: function() {
    return {
      id: this.id,
      accion: 'none',
      value: this.value,
      enableFile: false,
      previewFile: false,
      preview: this.id ? true : false
    }
  },
  created: function() {
    this.enableFile = true;
  },
  methods: {
    processFile: function(event) {
      let file = event.target.files[0];
      this.value = file.name;
      this.accion = 'upload';
    },
    selectImage: function() {
      this.$refs.imagen.click();
    },
    deleteImage: function() {
      this.preview = false;
      this.value = '';
      this.accion = 'delete';
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
