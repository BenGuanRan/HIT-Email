<template>
  <div class="login">
    <el-form
      ref="loginFormRef"
      label-width="100px"
      :rules="loginRules"
      :model="loginData"
      style="max-width: 460px"
    >
      <el-form-item label="账号" prop="username">
        <el-input
          placeholder="Please input username"
          v-model="loginData.username"
        />
      </el-form-item>
      <el-form-item label="密码" prop="password">
        <el-input
          type="password"
          placeholder="Please input password"
          show-password
          v-model="loginData.password"
        />
      </el-form-item>
      <el-form-item class="login_button--container" style="margin-top: 50px">
        <div class="login_button--container">
          <el-button @click="login">登录</el-button>
          <el-button @click="reset">重置</el-button>
        </div>
      </el-form-item>
    </el-form>
  </div>
</template>

<script setup>
import { reactive, ref, defineProps, watch } from "vue";
import { useRouter } from "vue-router";
import request from "@/utils/request";
import { ElMessage } from "element-plus";

const props = defineProps({
  changeUsername: String,
});
watch(
  () => props.changeUsername,
  (newValue) => {
    if (newValue) {
      loginData.username = newValue;
    }
  }
);

const loginFormRef = ref(null);
const router = useRouter();
const loginRules = reactive({
  username: [
    { required: true, message: "请输入邮箱！", trigger: "blur" },
    {
      pattern: /^([a-zA-Z]|[0-9])(\w)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/,
      message: "请输入正确邮箱格式",
      trigger: "blur",
    },
  ],
  password: [
    { required: true, message: "请输入密码！", trigger: "blur" },
    { min: 6, max: 15, message: "密码长度6-15位", trigger: "change" },
  ],
});
const loginData = reactive({
  username: "",
  password: "",
});

// 登录
const login = () => {
  loginFormRef.value.validate((valid) => {
    if (valid) {
      request
        .post("/api/login", loginData)
        .then((res) => {
          if (res.data === "账号不存在或密码错误！") {
            loginData.password = "";
          } else {
            router.push("/");
            sessionStorage.setItem("token", res.data.token);
            sessionStorage.setItem("username", loginData.username);
            sessionStorage.setItem("IMAP", res.data.IMAP);
            ElMessage({
              showClose: true,
              message: "登录成功！",
              type: "success",
            });
            console.log(res);
          }
          console.log(res);
        })
        .catch((err) => {
          console.log(err);
        });
    } else {
      return false;
    }
  });
};

// 重置
const reset = () => {
  loginFormRef.value.resetFields();
};
</script>

<style lang='scss' scoped>
.login {
  position: relative;
  height: 100%;
  .el-form {
    width: 100%;
    position: absolute;
    top: 25%;
    left: 50%;
    transform: translateX(-60%);
  }
  .login_button--container {
    text-align: center;
    padding-left: 50px;
  }
}
</style>