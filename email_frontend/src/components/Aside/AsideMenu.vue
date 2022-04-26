<template>
  <div class="menu">
    <el-radio-group v-model="isCollapse" style="margin-bottom: 20px">
      <el-radio-button :label="true">&nbsp;</el-radio-button>
      <el-radio-button :label="false">&nbsp;</el-radio-button>
    </el-radio-group>
    <el-menu
      @select="select"
      router
      :default-active="activePage"
      class="el-menu-vertical-demo"
      :collapse="isCollapse"
      :collapse-transition="false"
    >
      <el-menu-item index="Inbox">
        <el-icon><chat-line-square /></el-icon>
        <template #title>收件箱</template>
      </el-menu-item>
      <el-menu-item index="Outbox">
        <el-icon><check /></el-icon>
        <template #title>已发送</template>
      </el-menu-item>
      <el-menu-item index="Draftbox">
        <el-icon><credit-card /></el-icon>
        <template #title>草稿箱</template>
      </el-menu-item>
      <el-menu-item index="WriteMessages">
        <el-icon><edit-pen /></el-icon>
        <template #title>写邮件</template>
      </el-menu-item>
    </el-menu>
  </div>
</template>

<script setup>
console.log(window.location.hash);
import { ref, watch, onMounted } from "vue";
import {
  ChatLineSquare,
  CreditCard,
  Check,
  EditPen,
} from "@element-plus/icons-vue";
import { defineEmits } from "vue";

onMounted(() => {
  activePage.value = window.location.pathname.slice(1);
});
const emit = defineEmits(["collapse"]);
const activePage = ref("Inbox");
const select = () => {
  activePage.value = window.location.pathname.slice(1);
};
const isCollapse = ref(true);
watch(isCollapse, (newValue) => {
  emit("collapse", newValue);
});
</script>

<style>
.menu {
  overflow: hidden;
  height: 100%;
}
.el-menu {
  height: 100%;
}
/* .el-menu-vertical-demo:not(.el-menu--collapse) {
  width: 200px;
  min-height: 400px;
} */
</style>