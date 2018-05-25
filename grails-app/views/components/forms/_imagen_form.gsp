<template id="imagen-form-template">
  <div>
    <div class="select-imagen text-center">
      <label class="radio-inline">
        <input type="radio" name="select.imagen" @click="usarLink = true" :checked="usarLink">
        <g:message code="contenido.landing.select.imagen.link"/>
      </label>
      <label class="radio-inline">
        <input type="radio" name="select.imagen" @click="usarLink = false" :checked="!usarLink">
        <g:message code="contenido.landing.select.imagen.archivo"/>
      </label>
    </div>

    <transition name="slide-fade" mode="out-in">
      <div v-if="usarLink" key="link">
        <slot name="link"></slot>
      </div>
      <div v-if="!usarLink" key="archivo">
        <slot name="archivo"></slot>
      </div>
    </transition>
  </div>
</template>

<script>
Vue.component('imagenForm', {
  template: '#imagen-form-template',
  props: ['link'],
  data: function() {
    return {
      usarLink: !!this.link
    }
  }
});
</script>

<style>
.select-imagen {
  padding-bottom: 10px;
}
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
