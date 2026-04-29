<script setup lang="ts">
import { useAuth0 } from '@auth0/auth0-vue'
import MaterialDesignIcon from './MaterialDesignIcon.vue'
import { mdiLoading } from '@mdi/js'


const {
  isLoading,
  isAuthenticated,
  error,
  loginWithRedirect,
  logout: auth0Logout,
  user
} = useAuth0()

const signup = () =>
  loginWithRedirect({ authorizationParams: { screen_hint: 'signup' } })

const login = () => loginWithRedirect()

const logout = () =>
  auth0Logout({ logoutParams: { returnTo: window.location.origin } })

</script>


<template>
  <div v-if="isLoading" title="Loading...">
    <MaterialDesignIcon :icon="mdiLoading" spin size="40" />
  </div>

  <div v-else-if="isAuthenticated && user" class="dropdown">
    <button type="button" data-bs-toggle="dropdown" aria-expanded="false" class="stripped-button"
      title="Account Settings">
      <img v-if="isAuthenticated && user" :src="user.picture" alt="Your profile picture">
    </button>
    <ul class="dropdown-menu">
      <li>
        <RouterLink :to="{ name: 'Account' }" class="dropdown-item">
          Account Page
        </RouterLink>
      </li>
      <li>
        <button @click="logout" class="dropdown-item" type="button">
          Logout
        </button>
      </li>
    </ul>
  </div>

  <div v-else class="d-flex gap-2">
    <p v-if="error">Error: {{ error.message }}</p>

    <button @click="signup" class="btn btn-outline-dark" type="button">
      Signup
    </button>

    <button @click="login" class="btn btn-outline-dark" type="button">
      Login
    </button>
  </div>

</template>


<style scoped lang="scss">
img {
  height: 2.5rem;
  aspect-ratio: 1/1;
  border-radius: 50%;
  object-fit: cover;
}

.stripped-button {
  all: unset;
  cursor: pointer;
}
</style>
