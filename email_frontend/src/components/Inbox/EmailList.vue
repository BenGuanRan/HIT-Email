<template>
  <div class="email_list">
    <ul
      v-if="inboxData.length"
      class="emial_list--infinite"
      style="overflow: auto"
    >
      <EmailItem
        v-for="item in inboxData"
        :data="item"
        :key="item.id"
      ></EmailItem>
    </ul>
    <div v-else class="nobg_container"></div>
  </div>
</template>

<script setup>
import { onMounted, reactive } from "vue";
import request from "@/utils/request";
import EmailItem from "./EmailItem.vue";

const inboxData = reactive([]);

onMounted(() => {
  const username = sessionStorage.getItem("username");
  request
    .get("/api/getEmails", { username: username })
    .then((res) => {
      inboxData.push(...res.data.reverse());
    })
    .catch((err) => {
      console.log(err);
    });
});
</script>

<style lang='scss' scoped>
.email_list {
  width: 100%;
  height: 100%;
  .emial_list--infinite {
    padding: 0 0 0 20px;
    height: 100%;
  }
  li {
    height: 200px;
  }
  .nobg_container {
    height: 100%;
    background-image: url(../../assets/no.png);
    background-position: center;
    background-size: contain;
  }
}
</style>