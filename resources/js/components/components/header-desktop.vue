<template>
  <div>
    <header class="header-desktop">
      <div class="section__content section__content--p30">
        <div class="container-fluid">
          <div class="header-wrap">
            <form class="form-header" action method="POST">
              <!-- <input
                class="au-input au-input--xl"
                type="text"
                name="search"
                placeholder="Search for datas &amp; reports..."
              />
              <button class="au-btn--submit" type="submit">
                <i class="zmdi zmdi-search"></i>
              </button> -->
            </form>
            <div class="header-button">
              <div class="noti-wrap"></div>
              <div class="account-wrap">
                <div class="account-item clearfix js-item-menu">
                  <div class="image">
                    <img :src="'../' + 'assets/images/icon/avatar-01.jpg'" />
                  </div>
                  <div class="content">
                    <a class="js-acc-btn" href="#">{{ user.name }}</a>
                  </div>
                  <div class="account-dropdown">
                    <div class="info clearfix">
                      <div class="image">
                        <a href="#">
                          <img :src="'../' + 'assets/images/icon/avatar-01.jpg'" />
                        </a>
                      </div>
                      <div class="content">
                        <h5 class="name">
                          <a href="#">{{ user.name }}</a>
                        </h5>
                        <span class="email"
                          ><a href="javascript:void(0)" class="__cf_email__">{{
                            user.email
                          }}</a></span
                        >
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </header>
  </div>
</template>
<script>
export default {
  props: ["user"],
};
</script>
