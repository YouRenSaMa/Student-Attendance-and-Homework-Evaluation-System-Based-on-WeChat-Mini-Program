<template>
	<div>
		<div class="forget_view">
			<el-form :model="forgetForm" class="forget_box">
				<div class="forget_title">基于微信小程序学生考勤和作业评价系统{{pageType==1?'找回密码':pageType==2?'输入密保':'重置密码'}}</div>
				<div class="tab_line">
					<div class="line"></div>
					<div class="num_line">
						<div class="line_number" :class="pageType==1?'line_number1':'',pageType>1?'line_number2':''"><div class="number" v-if="pageType<2">1</div><el-icon v-else><Check /></el-icon></div>
						<div class="line_number" :class="pageType==2?'line_number1':'',pageType>2?'line_number2':''"><div class="number" v-if="pageType<3">2</div><el-icon v-else><Check /></el-icon></div>
						<div class="line_number" :class="pageType==3?'line_number1':''"><div class="number">3</div></div>
					</div>
				</div>
			</el-form>
		</div>
	</div>
</template>
<script setup>
	import {
		ref,
		getCurrentInstance,
		nextTick,
        onMounted,
	} from 'vue';
    import { useRoute } from 'vue-router'
    const route = useRoute()
	const context = getCurrentInstance()?.appContext.config.globalProperties;
    onMounted(()=>{
    })
	const pageType = ref(1)
	const forgetForm = ref({})
	const userForm = ref({})
	//返回登录
	const close = () => {
		context?.$router.push({
			path: "/login"
		});
	}
</script>

<style lang="scss" scoped>
	.forget_view {
        background-image: url("http://clfile.zggen.cn/20250102/dcf9fb34bc254ddf8703902af088ed44.jpg");
		// 表单盒子
		.forget_box {
			// 标题
			.forget_title {
			}
			// tab
			// 盒子
			.tab_line{
				padding: 30px 0;
				flex-direction: column;
				display: flex;
				width: 100%;
				align-items: center;
				// 中间线
				.line{
				background: #ccc;
				width: 80%;
				height: 1px;
				}
				// item盒子
				.num_line{
					margin: -20px 0 0;
					display: flex;
					width: 80%;
					justify-content: space-between;
					align-items: center;
					height: 40px;
					// 默认样式
					.line_number{
						border: 4px solid #ddd;
						border-radius: 50%;
						color: #aaa;
						background: #fff;
						display: flex;
						width: 40px;
						font-size: 18px;
						justify-content: center;
						align-items: center;
						height: 40px;
					}
					// 选中样式
					.line_number1{
						color: var(--theme);
						font-size: 22px;
						border-color: var(--theme);
					}
					// 完成样式
					.line_number2{
						color: rgba(0, 170, 0, 1.0);
						border-color: rgba(0, 170, 0, 1.0);
					}
				}
			}
			// item
			.list_item {
				// label
				.item_label {
				}
				// 输入框
				:deep(.list_inp) {
				}
				//下拉框样式
				:deep(.list_sel) {
					//去掉默认样式
					.select-trigger{
						height: 100%;
						.el-input{
							height: 100%;
						}
					}
				}
			}
			// 按钮盒子
			.list_btn {
				// 获取密保
				:deep(.el-button--success) {
				}
				// 获取密保悬浮
				:deep(.el-button--success:hover) {
				}
				// 确认密保
				:deep(.el-button--primary) {
				}
				// 确认密保悬浮
				:deep(.el-button--primary:hover) {
				}
				// 重置密码
				:deep(.el-button--warning) {
				}
				// 重置密码悬浮
				:deep(.el-button--warning:hover) {
				}
				.r-login {
				}
			}
		}
	}

	
</style>
<style>
.forget_view {
    min-height: 100vh;
    position: relative;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    background-image: url(http://clfile.zggen.cn/20250102/dcf9fb34bc254ddf8703902af088ed44.jpg);
    background-position: center center;
    background-size: 100% 100% !important;
    background-repeat: no-repeat;
    background-attachment: initial;
    background-origin: initial;
    background-clip: initial;
    background-color: initial;
}


.forget_view .forget_box{ width:600px; margin:0 auto; padding:30px 50px 40px 50px; background:#fff; font-size:16px; border-radius:0px; transform:scale(1); -webkit-transform:scale(1); -ms-transform:scale(1); z-index:5;  border-top:4px solid var(--theme2); }
.forget_view .forget_box:before { content: ""; width: 100%; height: 0px; border-radius: 10px;  position: absolute;  top: -10px; background: rgba(255, 255, 255, .6);  left: 0; transform: scale(.95); -webkit-transform: scale(.95);  -ms-transform: scale(.95);  z-index: -1;  }


.forget_view .forget_title{ width:calc(100% + 0px); float:left; line-height:46px; font-size:22px; font-weight:600; letter-spacing:0.5px; background:none;  color:#333; position:relative; margin-bottom:20px; margin-left:0px; padding-left:0px; text-align:center;  }

.forget_view .forget_title:before { content: "";  width: 0px; height: 100%;  position: absolute;  top: 0; left: -50px; background: #8b5c7e; }


.forget_view .list_item{  width: 100%; padding:0 10px; display: flex; align-items: center;   justify-content: flex-start;  margin: 0 0 20px;  border:1px solid #ddd;  }
.forget_view .list_item .item_label { margin-right:10px; white-space: nowrap;  font-size: 16px; }
.forget_view .list_item .item_label i {  font-size:24px; color:#999;  }
.forget_view .list_item .list_inp{ width:100%; border:none; border-bottom:0px solid #ddd; height:40px; line-height:40px; font-size: 16px;  }
.forget_view .list_item .el-select{  width:100%; border-bottom:0px solid #ddd; height:40px; line-height:40px; font-size: 16px;  color:#999;  }
.forget_view .list_item .el-select .el-input__inner{ font-size: 16px;  color:#999;  }

.forget_view .list_type{ margin-bottom:20px;  }


.forget_view .list_btn{ margin-top:20px;  text-align:left;  }

.forget_view .list_btn .get_btn{ width: auto; height: 42px; line-height: 42px; background: var(--theme); border: 0px solid #ccc; font-weight: 500; font-size: 18px; color: #fff; margin-bottom:20px; padding:0 20px; border-radius:0px; min-width:120px;  float:left;  } 
.forget_view .list_btn .get_btn:hover {  } 

.forget_view .list_btn .valid_btn{  width: auto; height: 42px; line-height: 42px; background: var(--theme); border: 0px solid #ccc; font-weight: 500; font-size: 18px; color: #fff; margin-bottom:20px; padding:0 20px; border-radius:0px; min-width:120px;  float:left;  } 
.forget_view .list_btn .valid_btn:hover {  } 

.forget_view .list_btn .update_btn{  width: auto; height: 42px; line-height: 42px; background: var(--theme); border: 0px solid #ccc; font-weight: 500; font-size: 18px; color: #fff; margin-bottom:20px;  padding:0 20px; border-radius:0px; min-width:120px;  float:left;  } 
.forget_view .list_btn .update_btn:hover {  } 

.forget_view .list_btn .r-login{  font-size: 16px; color: #999; height: 42px; line-height: 42px; float:right;  } 
.forget_view .list_btn .r-login:hover{ cursor:pointer; color: var(--theme);  } 
.forget_view .el-select,.forget_view .el-input {
  border: none;
}

</style>