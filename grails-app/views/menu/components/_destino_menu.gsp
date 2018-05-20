<template id="destino-menu-template">
  <div>
    <div class="select-destino text-center">
      <label class="radio-inline">
        <input type="radio" name="destino" @click="usarArticulo = false" :checked="!usarArticulo">
        <g:message code="contenido.cabecera.destino.link"/>
      </label>
      <label class="radio-inline">
        <input type="radio" name="destino" @click="usarArticulo = true" :checked="usarArticulo">
        <g:message code="contenido.cabecera.destino.articulo"/>
      </label>
    </div>

    <transition name="slide-fade" mode="out-in">
      <div v-if="!usarArticulo" key="link">
        <slot name="link"></slot>
      </div>
      <div v-if="usarArticulo" key="articulo">
        <slot name="articulo"></slot>
      </div>
    </transition>
  </div>
</template>

<script>
Vue.component('destinoMenu', {
  template: '#destino-menu-template',
  data: function() {
    return { usarArticulo: true }
  },
});
</script>

<style>
.select-destino {
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
