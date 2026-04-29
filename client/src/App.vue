<script setup lang="ts">
import { mdiGithub } from '@mdi/js';
import MaterialDesignIcon from './components/MaterialDesignIcon.vue';
import AuthLogin from './components/AuthLogin.vue';



</script>

<template>
  <header class="border-bottom border-1 border-dark">
    <div class="container">
      <div class="row">
        <div class="col-12">
          <div class="d-flex justify-content-between align-items-center py-2">
            <RouterLink :to="{ name: 'Home' }">
              Home
            </RouterLink>
            <AuthLogin />
          </div>
        </div>
      </div>
    </div>
  </header>

  <main>
    <RouterView />
  </main>

  <footer class="border-top border-1 border-dark">
    <div class="container">
      <div class="row">
        <div class="col-12">
          <div class="text-center py-2">
            <a href="https://github.com/jeremy-fowler" target="_blank" title="Check out my github!" class="github-link">
              <MaterialDesignIcon :icon="mdiGithub" />
            </a>
          </div>
        </div>
      </div>
    </div>
  </footer>
</template>

<style lang="scss">
.github-link {
  text-decoration: none;
  color: unset;
}
</style>
