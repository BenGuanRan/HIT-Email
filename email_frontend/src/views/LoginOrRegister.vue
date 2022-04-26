<template>
  <div class="login_or_register">
    <el-card class="login_container" shadow="hover">
      <h1 class="lr_title" style="color: #409eff">HIT-Email</h1>

      <div class="lr_header">
        <el-button-group>
          <el-button
            @click="login"
            :type="whichComponent === 'Login' ? 'primary' : ''"
            >登录</el-button
          >
          <el-button
            @click="register"
            :type="whichComponent === 'Login' ? '' : 'primary'"
            >注册</el-button
          >
        </el-button-group>
      </div>
      <div class="lr_body">
        <keep-alive>
          <component
            :changeUsername="changeUsername"
            @toLogin="toLogin"
            :is="loginOrRegister"
          ></component>
        </keep-alive>
      </div>
    </el-card>
  </div>
</template>

<script setup>
import { computed, ref } from "vue";
import Login from "../components/LoginOrRegister/Login.vue";
import Register from "../components/LoginOrRegister/Register.vue";

const whichComponent = ref("Login");
const loginOrRegister = computed(() => {
  if (whichComponent.value === "Login") return Login;
  if (whichComponent.value === "Register") return Register;
  return Login;
});
const changeUsername = ref("");

const login = () => {
  whichComponent.value = "Login";
};

const toLogin = (un) => {
  login();
  changeUsername.value = un;
};

const register = () => {
  whichComponent.value = "Register";
};
</script>

<style lang='scss' scoped>
.login_or_register {
  background-size: cover;
  background-image: url(../assets/hit.png);
  background-repeat: no-repeat;
  background-position: center;
  height: 100%;
  position: relative;
  .lr_title {
    z-index: 1;
    position: absolute;
    left: 50%;
    top: 0;
    color: #000;
    font-size: 40px;
    transform: translateX(-50%);
  }
}
/deep/.el-card__body {
  height: 100%;
  padding: 0;
}
.login_container {
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
  width: 600px;
  height: 370px;
  .lr_header {
    text-align: center;
  }
  .lr_body {
    height: 100%;
  }
}
</style>