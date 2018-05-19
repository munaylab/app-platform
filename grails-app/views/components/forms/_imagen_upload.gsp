<template id="imagen-template">
  <div>
    <input type="hidden" :name="name + '.id'" :value="id">
    <input type="hidden" :name="name + '.accion'" :value="accion">
    <div class="input-group">
      <span class="input-group-btn">
        <button class="btn btn-default" type="button" @click="selectImage">
          <i class="fa fa-image"></i>
        </button>
      </span>
      <input type="text" class="form-control" :name="name + '.nombre'" :value="value"
          placeholder="${g.message(code:'contenido.articulo.imagen')}">
      <div v-if="enableFile">
        <input ref="imagen" type="file" :name="name + '.file'" @change="processFile"
            accept=".jpg, .jpeg, .png" style="display: none !important;">
      </div>
    </div>
    <p class="help-block">El archivo no debe exceder los 15MB.</p>
  </div>
</template>

<script>
Vue.component('imagen', {
  template: '#imagen-template',
  props: ['id', 'name', 'value'],
  data: function() {
    return {
      accion: 'none',
      value: this.value,
      enableFile: false
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
    }
  }
});
</script>

<style>

</style>
