<template>
  <div>
    <header class="header-mobile d-block d-lg-none">
      <div class="header-mobile__bar">
        <div class="container-fluid">
          <div class="header-mobile-inner">
            <routerLink class="logo" :to="{ name: 'home' }">
              <img :src="'../../' + 'assets/images/icon/logo.png'" alt="CoolAdmin" />
            </routerLink>
            <button class="hamburger hamburger--slider" type="button">
              <span class="hamburger-box">
                <span class="hamburger-inner"></span>
              </span>
            </button>
          </div>
        </div>
      </div>
      <nav class="navbar-mobile">
        <div class="container-fluid">
          <ul class="navbar-mobile__list list-unstyled">
            <li class="has-sub">
              <routerLink class="js-arrow" :to="{ name: 'home' }">
                <i class="fas fa-tachometer-alt"></i>Dashboard
              </routerLink>
            </li>
            <li>
              <routerLink :to="{ name: 'invoices' }">
                <i class="fas fa-chart-bar"></i>Invoices
              </routerLink>
            </li>
            <li>
              <routerLink :to="{ name: 'logout' }">
                <i class="zmdi zmdi-power"></i>Logout
              </routerLink>
            </li>
          </ul>
        </div>
      </nav>
    </header>
  </div>
</template>
<script>
export default {};
</script>
