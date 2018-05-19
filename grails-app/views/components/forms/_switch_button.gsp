<template id="switch-button-template">
  <div>
    <input ref="toggle" type="checkbox" class="pull-left switch-button"
        :name="name" @change="onChange">
    <transition name="fade" mode="out-in">
      <div v-if="isChecked" key="checked" @click="toggle">
        <slot name="on"></slot>
      </div>

      <div v-if="!isChecked" key="unchecked" @click="toggle">
        <slot name="off"></slot>
      </div>
    </transition>
  </div>
</template>

<script>
Vue.component('switchButton', {
  template: '#switch-button-template',
  props: ['name', 'value'],
  data: function() {
    return { value: this.value }
  },
  computed: {
    isChecked: function () {
      return this.value;
    }
  },
  methods: {
    onChange: function() {
      this.value = this.$refs.toggle.checked;
    },
    toggle: function() {
      this.$refs.toggle.checked = !this.value;
      this.onChange();
    }
  }
});
</script>

<style>
input.switch-button {
  margin-right: 10px;
  margin-top: 2px;
}
.fade-enter-active, .fade-leave-active {
  transition: opacity .2s;
}
.fade-enter, .fade-leave-to {
  opacity: 0;
}
</style>
