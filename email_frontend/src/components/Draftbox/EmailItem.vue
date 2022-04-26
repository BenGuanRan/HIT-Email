<template>
  <div
    v-loading="loading"
    class="email_item"
    :class="{ 'email_item--actived': ifActived }"
    @mouseover="changeToActived"
    @mouseout="changeToUnctived"
  >
    <span style="text-align: left" class="email_item--sender"
      >收件人：{{ itemData.receiver }}</span
    >
    <span class="email_item--title">{{ itemData.title }}</span>
    <span class="email_item--content">{{ itemData.content }}</span>
    <span class="email_item--date">{{ itemData.date }}</span>
    <span style="border-right: none">
      <el-tooltip
        class="box-item"
        effect="light"
        content="编辑"
        placement="top"
      >
        <el-button @click="editEmail" circle type="primary"
          ><el-icon><edit /></el-icon
        ></el-button>
      </el-tooltip>
      <el-tooltip
        class="box-item"
        effect="light"
        content="删除"
        placement="top"
      >
        <el-button @click="deleteEmail" circle type="danger"
          ><el-icon><circle-close-filled /></el-icon
        ></el-button>
      </el-tooltip>
      <el-tooltip
        class="box-item"
        effect="light"
        content="发送"
        placement="top"
      >
        <el-button @click="sendEmail" circle type="success"
          ><el-icon><pointer /></el-icon
        ></el-button>
      </el-tooltip>
    </span>
    <el-dialog v-model="dialogFormVisible" title="修改邮件">
      <el-form :model="itemData" label-width="120px">
        <el-form-item label="标题" prop="title" style="width: 450px">
          <el-input v-model="itemData.title"></el-input>
        </el-form-item>
        <el-form-item label="收件人" prop="title" style="width: 270px">
          <el-input v-model="itemData.receiver"></el-input>
        </el-form-item>
        <el-form-item label="内容" prop="title">
          <el-input
            :autosize="{ minRows: 20 }"
            v-model="itemData.content"
            type="textarea"
          ></el-input>
        </el-form-item>
        <el-form-item style="text-align: center; margin-top: 50px">
          <el-button type="primary" @click="editSubmit">修改</el-button>
          <el-button @click="editBack">取消</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>
  </div>
</template>

<script setup>
import { defineProps, reactive, ref } from "vue";
import { ElMessage } from "element-plus";
import { CircleCloseFilled, Edit, Pointer } from "@element-plus/icons-vue";
import request from "@/utils/request.js";

const ifActived = ref(false);
const props = defineProps({
  data: Object,
});
const loading = ref(false);

const changeToActived = () => {
  ifActived.value = true;
};
const changeToUnctived = () => {
  ifActived.value = false;
};
const itemData = reactive({ ...props.data });

const dialogFormVisible = ref(false);
const editEmail = () => {
  dialogFormVisible.value = true;
};
const editSubmit = () => {
  console.log({ ...itemData });
  request
    .post("/api/editDraftbox", { ...itemData })
    .then((res) => {
      console.log(res);
      dialogFormVisible.value = false;
    })
    .catch((err) => {
      console.log(err);
    });
};
const editBack = () => {
  dialogFormVisible.value = false;
  history.go(0);
};
const deleteEmail = () => {
  request
    .post("/api/deleteEmail", {
      id: itemData.id,
      user: sessionStorage.getItem("username"),
    })
    .then((res) => {
      if (res.data === "Success!") {
        history.go(0);
      }
    })
    .catch((err) => {
      console.log(err);
    });
};
const saveHasSend = () => {
  request
    .post("/api/saveHasSend", { ...itemData })
    .then((res) => {
      loading.value = false;
      console.log(res);
    })
    .catch((err) => {
      console.log(err);
    });
};

const sendEmail = () => {
  loading.value = true;
  const sendData = { ...itemData };
  if (sessionStorage.getItem("IMAP"))
    sendData.IMAP = sessionStorage.getItem("IMAP");
  request
    .post("/api/sendEmail", sendData)
    .then((res) => {
      if (res.data === "Success!") {
        ElMessage({
          showClose: true,
          message: "邮件发送成功！",
          type: "success",
        });
        saveHasSend();
        deleteEmail();
      }
    })
    .catch((err) => {
      console.log(err);
    });
};
</script>

<style lang='scss' scoped>
.email_item {
  padding: 0 20px;
  display: flex;
  height: 80px;
  line-height: 80px;
  border-bottom: 1px solid rgb(64, 158, 255);
  span {
    padding: 0 8px;
    border-right: 1px solid rgb(64, 158, 255);
    flex: 1;
    text-align: center;
    width: 200px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
  }
}
.email_item--actived {
  background-color: rgb(236, 245, 255);
}
</style>