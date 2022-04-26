<template>
  <div class="common-layout">
    <el-container>
      <el-header class="email_header">
        <div class="title">HIT-Email</div>
        <div class="IMAP">
          想通过自己的邮箱发送邮件?&nbsp;<el-link
            type="primary"
            @click="drawer = true"
            >绑定IMAP</el-link
          >
        </div>
        <el-drawer
          v-model="drawer"
          direction="ttb"
          title="I am the title"
          :with-header="false"
          size="10%"
        >
          <div class="IMAP_container">
            <div class="IMAP_container--left"></div>
            <div class="IMAP_container--center">
              <el-input
                placeholder="请输入您的IMAP"
                v-model="IMAPForm.IMAP"
              ></el-input>
            </div>
            <div class="IMAP_container--right">
              <el-button @click="saveIMAP">
                <span v-if="!isLoading">保存</span>
                <el-icon v-else class="is-loading"> <loading /> </el-icon
              ></el-button>
            </div>
          </div>
        </el-drawer>
        <el-button class="email_header--button" @click="logout"
          >退出登录</el-button
        >
      </el-header>
      <el-container>
        <el-aside @collapse="handelCollapse" :width="asideWidth"
          ><AsideMenu @collapse="handelCollapse"></AsideMenu
        ></el-aside>
        <el-main>
          <router-view style="height: 100%; overflow: hidden"></router-view>
        </el-main>
      </el-container>
    </el-container>
  </div>
</template>

<script setup>
import { reactive, ref } from "vue";
import AsideMenu from "@/components/Aside/AsideMenu.vue";
import { useRouter } from "vue-router";
import request from "@/utils/request";
import { ElMessage } from "element-plus";
import { Loading } from "@element-plus/icons-vue";

const router = useRouter();
const IMAPForm = reactive({
  IMAP: "",
});

const drawer = ref(false);
const isLoading = ref(false);
const logout = () => {
  router.push("/login");
};

const asideWidth = ref("80px");
const handelCollapse = (val) => {
  if (val) asideWidth.value = "80px";
  else asideWidth.value = "200px";
};
const saveIMAP = () => {
  if (IMAPForm.IMAP === "")
    return ElMessage({
      showClose: true,
      message: "IMAP不能为空！",
      type: "error",
    });
  isLoading.value = true;
  const data = {
    username: sessionStorage.getItem("username"),
    IMAP: IMAPForm.IMAP,
  };
  request
    .post("/api/saveIMAP", data)
    .then((res) => {
      isLoading.value = false;
      if (res.data === "Illegal IMAP!") {
        ElMessage({
          showClose: true,
          message: "非法的IMAP！",
          type: "error",
        });
        IMAPForm.IMAP = "";
      }

      if (res.data === "Success!") {
        ElMessage({
          showClose: true,
          message: "IMAP绑定成功！",
          type: "success",
        });
        drawer.value = false;
        sessionStorage.setItem("IMAP", IMAPForm.IMAP);
      }
    })
    .catch((err) => {
      console.log(err);
    });
};
</script>

<style lang='scss' scoped>
.common-layout,
.el-container {
  height: 100%;
}
.email_header {
  position: relative;
  .email_header--button {
    margin-top: 20px;
    margin-right: 20px;
    float: right;
  }
  div {
    display: inline-block;
  }
  .title {
    height: 60px;
    line-height: 60px;
    font-size: 30px;
    font-weight: 600;
    color: #409eff;
  }
  .IMAP {
    font-size: 14px;
    font-weight: 500;
    position: absolute;
    height: 60px;
    display: inline-block;
    right: 0;
    top: 50%;
    transform: translate(-70%, -50%);
    padding-top: 50px;
  }
  .IMAP_container {
    display: flex;
    width: 100%;
    div {
      flex: 1;
    }
    .IMAP_container--center {
      height: 100%;
      margin-right: 20px;
    }
  }
}
.el-main {
  padding: 0 20px 0 0;
}

.el-main ::-webkit-scrollbar {
  /*滚动条整体样式*/
  width: 6px; /*高宽分别对应横竖滚动条的尺寸*/
  height: 1px;
}
/*滚动条里面小方块*/
.el-main ::-webkit-scrollbar-thumb {
  /*滚动条里面小方块*/
  border-radius: 5px;
  background-color: rgb(72, 162, 255);
}
/*滚动条里面小方块*/
/*.el-main ::-webkit-scrollbar-thumb {
  border-radius: 3px;
  box-shadow   : inset 0 0 4px rgba(100, 169, 169, 0.48);
  background   : #AAE9E5;
}*/
/*滚动条里面轨道*/
.el-main ::-webkit-scrollbar-track {
  border-radius: 6px;
}
</style>