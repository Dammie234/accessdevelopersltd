<template>
    <div>
        <aside class="menu-sidebar d-none d-lg-block">
            <div class="logo">
                <a href="#">
                    <img :src="'../../' + 'assets/images/access-developers.png'" />
                </a>
            </div>
            <div class="menu-sidebar__content js-scrollbar1">
                <nav class="navbar-sidebar">
                    <ul class="list-unstyled navbar__list">
                        <li :class="{ active: page == 'dashboard' }">
                            <routerLink class="js-arrow" :to="{ name: 'home' }">
                                <i class="fas fa-tachometer-alt"></i>Dashboard
                            </routerLink>
                        </li>
                        <li :class="{ active: page == 'invoices' }">
                            <routerLink :to="{ name: 'invoices' }">
                                <i class="fas fa-chart-bar"></i>Invoices
                            </routerLink>
                        </li>
                        <li :class="{ active: page == 'organizations' }">
                            <routerLink :to="{ name: 'organizations' }">
                                <i class="fas fa-chart-bar"></i>Organizations
                            </routerLink>
                        </li>

                        <li>
                            <routerLink :to="{ name: 'logout' }">
                                <i class="zmdi zmdi-power"></i>Logout
                            </routerLink>
                        </li>
                    </ul>
                </nav>
            </div>
        </aside>
    </div>
</template>
<script>
export default {
  props: ["page"],
};
</script>
