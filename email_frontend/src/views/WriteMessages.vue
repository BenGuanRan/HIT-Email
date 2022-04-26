<template>
  <div class="write_messages">
    <el-form
      v-loading="loading"
      ref="messageFormRef"
      style="margin-top: 30px"
      :model="messageData"
      :rules="messageRules"
      label-width="150px"
    >
      <el-form-item label="标题" prop="title" style="width: 480px">
        <el-input
          maxlength="30"
          show-word-limit
          v-model="messageData.title"
        ></el-input>
      </el-form-item>
      <el-form-item label="收件人" prop="receiver" style="width: 400px">
        <el-input v-model="messageData.receiver"></el-input>
      </el-form-item>
      <el-form-item maxlength="1000" label="内容" prop="content">
        <el-input
          maxlength="1000"
          show-word-limit
          v-model="messageData.content"
          type="textarea"
          :autosize="{ minRows: 16, maxRows: 18 }"
          resize="none"
        ></el-input>
      </el-form-item>
      <el-form-item style="text-align: center; margin-top: 50px">
        <el-button type="primary" @click="sendEmail">发送</el-button>
        <el-button @click="saveEmail">保存为草稿箱</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script  setup>
import { reactive, ref } from "vue";
import { ElMessage } from "element-plus";
import request from "@/utils/request.js";
import { useRouter } from "vue-router";

const loading = ref(false);
const router = useRouter();
const messageData = reactive({
  title: "",
  receiver: "",
  content: "",
});
const messageFormRef = ref(null);
const saveHasSend = () => {
  request
    .post("/api/saveHasSend", {
      ...messageData,
      sender: sessionStorage.getItem("username"),
    })
    .then((res) => {
      if (res.data === "Success!") router.push("/Outbox");
      console.log(res);
    })
    .catch((err) => {
      console.log(err);
    });
};

const messageRules = reactive({
  title: [{ required: true, message: "请输入标题！", trigger: "blur" }],
  content: [{ required: true, message: "内容不能为空！", trigger: "blur" }],
  receiver: [
    { required: true, message: "收件人不能为空！", trigger: "blur" },
    {
      pattern: /^([a-zA-Z]|[0-9])(\w)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/,
      message: "请输入正确邮箱格式",
      trigger: "blur",
    },
  ],
});

const sendEmail = () => {
  messageFormRef.value.validate((valid) => {
    if (!valid) return;
    loading.value = true;
    const sendData = { ...messageData };
    sendData["sender"] = sessionStorage.getItem("username");
    if (sessionStorage.getItem("IMAP"))
      sendData.IMAP = sessionStorage.getItem("IMAP");
    request
      .post("/api/sendEmail", sendData)
      .then((res) => {
        console.log(res);
        if (res.data === "Success!") {
          ElMessage({
            showClose: true,
            message: "邮件发送成功！",
            type: "success",
          });
          loading.value = true;
          saveHasSend();
        }
      })
      .catch((err) => {
        console.log(err);
      });
  });
};

const saveEmail = () => {
  messageFormRef.value.validate((valid) => {
    if (!valid) return;
    const sendData = { ...messageData };
    sendData["sender"] = sessionStorage.getItem("username");
    request
      .post("/api/saveEmail", sendData)
      .then((res) => {
        if (res.data === "Success!") {
          ElMessage({
            showClose: true,
            message: "邮件保存成功！",
            type: "success",
          });
        } else
          ElMessage({
            showClose: true,
            message: "异常！",
            type: "error",
          });
        router.push("/Draftbox");
      })
      .catch((err) => {
        console.log(err);
      });
  });
};
</script>

<style lang='scss' scoped>
.write_messages {
  overflow: auto;
}
</style>    