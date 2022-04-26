<template>
  <div
    class="email_item"
    :class="{ 'email_item--actived': ifActived }"
    @mouseover="changeToActived"
    @mouseout="changeToUnctived"
  >
    <span style="text-align: left" class="email_item--sender"
      >收件人：{{ itemData.sender }}</span
    >
    <span class="email_item--title">{{ itemData.title }}</span>
    <span class="email_item--content">{{ itemData.content }}</span>
    <span
      ><el-button @click="getDetails" type="primary"
        ><el-icon><more-filled /></el-icon></el-button
    ></span>
    <span style="border-right: none" class="email_item--date">{{
      itemData.date
    }}</span>
  </div>
</template>

<script setup>
import { defineProps, reactive, ref } from "vue";
import { ElMessageBox } from "element-plus";
import { MoreFilled } from "@element-plus/icons-vue";

const ifActived = ref(false);
const props = defineProps({
  data: Object,
});

const changeToActived = () => {
  ifActived.value = true;
};
const changeToUnctived = () => {
  ifActived.value = false;
};
const itemData = reactive({ ...props.data });

const getDetails = () => {
  ElMessageBox.alert(itemData.content, itemData.title);
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
    flex: 1;
    border-right: 1px solid rgb(64, 158, 255);
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