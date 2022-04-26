<template>
  <div class="register">
    <el-form
      ref="registerFormRef"
      label-width="100px"
      :model="registerData"
      :rules="registerRules"
      style="max-width: 460px"
    >
      <el-form-item label="邮箱" prop="username">
        <el-input placeholder="username" v-model="registerData.username" />
      </el-form-item>
      <el-form-item label="密码" prop="password">
        <el-input
          type="password"
          placeholder="password"
          show-password
          v-model="registerData.password"
        />
      </el-form-item>
      <el-form-item label="验证码" prop="verifyCode">
        <el-input
          style="width: 100px"
          placeholder="verifyCode"
          v-model="registerData.verifyCode"
        />
        <el-button
          v-if="!ifHasSendVerifyCode"
          style="margin-left: 10px"
          @click="sendVerifyCode"
          >发送验证码</el-button
        >
        <div v-else class="time_count">{{ time }} S</div>
      </el-form-item>
      <el-form-item class="register_button--container" style="margin-top: 50px">
        <div class="register_button--container">
          <el-button @click="register">注册</el-button>
          <el-button @click="reset">重置</el-button>
        </div>
      </el-form-item>
    </el-form>
  </div>
</template>

<script setup>
import { reactive, ref, defineEmits, onMounted } from "vue";
import request from "@/utils/request";
import { ElMessage } from "element-plus";

onMounted(() => {
  time.value = localStorage.getItem("time");
  if (time.value < 60) {
    ifHasSendVerifyCode.value = true;
    const timer = setInterval(() => {
      time.value = localStorage.getItem("time");
      time.value--;
      localStorage.setItem("time", time.value);
      if (time.value < 0) {
        ifHasSendVerifyCode.value = false;
        time.value = 60;
        localStorage.setItem("time", time.value);
        clearInterval(timer);
      }
    }, 1000);
  }
});
const emit = defineEmits(["toLogin"]);
const registerFormRef = ref(null);
const time = ref(60);
const registerData = reactive({
  username: "",
  password: "",
  verifyCode: "",
});
const registerRules = reactive({
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
  verifyCode: [
    { required: true, message: "验证码不能为空！", trigger: "blur" },
  ],
});
const ifHasSendVerifyCode = ref(false);
const sendVerifyCode = () => {
  ifHasSendVerifyCode.value = true;
  if (
    !/^([a-zA-Z]|[0-9])(\w)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/.test(
      registerData.username
    )
  ) {
    ElMessage({
      showClose: true,
      message: "邮箱填写异常！",
      type: "error",
    });
    ifHasSendVerifyCode.value = false;
    return;
  }
  request
    .post("/api/sendVerifyCode ", {
      username: registerData.username,
    })
    .then((res) => {
      if (res.data === "Error!") {
        ElMessage({
          showClose: true,
          message: "验证码发送失败",
          type: "error",
        });
      } else {
        ElMessage({
          showClose: true,
          message: "验证码已发送，请查收 ~ ",
          type: "success",
        });

        localStorage.setItem("time", time.value);
        const timer = setInterval(() => {
          time.value = localStorage.getItem("time");
          time.value--;
          localStorage.setItem("time", time.value);
          if (time.value < 0) {
            ifHasSendVerifyCode.value = false;
            time.value = 60;
            localStorage.setItem("time", time.value);
            clearInterval(timer);
          }
        }, 1000);
      }
      console.log(res);
    })
    .catch((err) => {
      console.log(err);
    });
};

// 注册
const register = () => {
  registerFormRef.value.validate((valid) => {
    if (valid) {
      request
        .post("/api/register", registerData)
        .then((res) => {
          if (res.data !== "Success!") {
            ElMessage({
              showClose: true,
              message: res.data,
              type: "error",
            });
            if (res.data === "验证码错误！") {
              registerData.verifyCode = "";
            }
            ifHasSendVerifyCode.value = false;
          } else {
            ElMessage({
              showClose: true,
              message: "恭喜你注册成功 ~",
              type: "success",
            });
            localStorage.setItem("time", 60);
            // 跳转到登录
            emit("toLogin", registerData.username);
          }
        })
        .catch((err) => {
          console.log(err);
          ElMessage({
            showClose: true,
            message: "服务器错误。请联系开发人员！",
            type: "error",
          });
        });
    } else {
      return false;
    }
  });
};

const reset = () => {
  registerFormRef.value.resetFields();
};
</script>

<style lang='scss' scoped>
.register {
  position: relative;
  height: 100%;
  .el-form {
    width: 100%;
    position: absolute;
    top: 20%;
    left: 50%;
    transform: translateX(-60%);
  }
  .register_button--container {
    text-align: center;
    padding-left: 50px;
  }
  .time_count {
    margin-left: 10px;
    text-align: center;
    width: 30px;
    color: rgb(88, 170, 255);
  }
}
</style>