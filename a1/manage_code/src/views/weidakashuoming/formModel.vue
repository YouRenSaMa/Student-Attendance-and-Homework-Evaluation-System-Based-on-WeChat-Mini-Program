<template>
	<div>
		<el-dialog modal-class="edit_form_modal" class="edit_form" v-model="formVisible" :title="formTitle" width="80%" destroy-on-close :fullscreen='false'>
			<el-form class="formModel_form" ref="formRef" :model="form" :rules="rules">
				<el-row >
					<el-col :span="12">
						<el-form-item label="课程名称" prop="kechengmingcheng">
							<el-input class="list_inp" v-model="form.kechengmingcheng" placeholder="课程名称"
                                type="text"
								:readonly="!isAdd||disabledForm.kechengmingcheng?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="学号" prop="xuehao">
							<el-input class="list_inp" v-model="form.xuehao" placeholder="学号"
                                type="text"
								:readonly="!isAdd||disabledForm.xuehao?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="学生姓名" prop="xueshengxingming">
							<el-input class="list_inp" v-model="form.xueshengxingming" placeholder="学生姓名"
                                type="text"
								:readonly="!isAdd||disabledForm.xueshengxingming?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="班级" prop="banji">
							<el-input class="list_inp" v-model="form.banji" placeholder="班级"
                                type="text"
								:readonly="!isAdd||disabledForm.banji?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item prop="kechengtupian"
									  label="课程图片"
						>
							<uploads
								:disabled="!isAdd||disabledForm.kechengtupian?true:false"
								action="file/upload"
								tip="请上传课程图片"
								style="width: 100%;text-align: left;"
								:fileUrls="form.kechengtupian?form.kechengtupian:''" 
								@change="kechengtupianUploadSuccess">
							</uploads>
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="申请时间" prop="shenqingshijian">
							<el-date-picker
								class="list_date"
								v-model="form.shenqingshijian"
								format="YYYY-MM-DD HH:mm:ss"
								value-format="YYYY-MM-DD HH:mm:ss"
								type="datetime"
								:readonly="!isAdd||disabledForm.shenqingshijian?true:false"
								placeholder="请选择申请时间" />
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="说明" prop="shuoming">
							<el-input v-model="form.shuoming" placeholder="说明" type="textarea"
							:readonly="!isAdd||disabledForm.shuoming?true:false"
							/>
						</el-form-item>
					</el-col>
				</el-row>
			</el-form>
			<template #footer v-if="isAdd||type=='logistics'||type=='reply'">
				<span class="formModel_btn_box">
					<el-button class="cancel_btn" @click="closeClick">取消</el-button>
					<el-button class="confirm_btn" type="primary" @click="save"
						>
						提交
					</el-button>
				</span>
			</template>
		</el-dialog>
	</div>
</template>
<script setup>
	import {
		reactive,
		ref,
		getCurrentInstance,
		nextTick,
		computed,
		defineEmits
	} from 'vue'
    import {
        useStore
    } from 'vuex';
    const store = useStore()
    const user = computed(()=>store.getters['user/session'])
	const context = getCurrentInstance()?.appContext.config.globalProperties;	
	const emit = defineEmits(['formModelChange'])
	//基础信息
	const tableName = 'weidakashuoming'
	const formName = '未打卡说明'
	//基础信息
	//form表单
	const form = ref({})
	const disabledForm = ref({
        kechengmingcheng : false,
        xuehao : false,
        xueshengxingming : false,
        banji : false,
        kechengtupian : false,
        shuoming : false,
        shenqingshijian : false,
        sfsh : false,
        shhf : false,
	})
	const formVisible = ref(false)
	const isAdd = ref(false)
	const formTitle = ref('')
    
	const rules = ref({
		kechengmingcheng: [
		],
		xuehao: [
		],
		xueshengxingming: [
		],
		banji: [
		],
		kechengtupian: [
		],
		shuoming: [
			{required: true,message: '请输入',trigger: 'blur'}, 
		],
		shenqingshijian: [
		],
		sfsh: [
		],
		shhf: [
		],
	})
	//表单验证
	
	const formRef = ref(null)
	const id = ref(0)
	const type = ref('')
	//课程图片上传回调
	const kechengtupianUploadSuccess=(e)=>{
		form.value.kechengtupian = e
	}

	//获取唯一标识
	const getUUID =()=> {
      return new Date().getTime();
    }
	//重置
	const resetForm = () => {
		form.value = {
			kechengmingcheng: '',
			xuehao: '',
			xueshengxingming: '',
			banji: '',
			kechengtupian: '',
			shuoming: '',
			shenqingshijian: '',
			shhf: '',
		}
	}
	//获取info
	const getInfo = ()=>{
		context?.$http({
			url: `${tableName}/info/${id.value}`,
			method: 'get'
		}).then(res => {
			let reg=new RegExp('../../../file','g')
			form.value = res.data.data
			formVisible.value = true
		})
	}
	const crossRow = ref('')
	const crossTable = ref('')
	const crossTips = ref('')
	const crossColumnName = ref('')
	const crossColumnValue = ref('')
	//初始化
	const init=(formId=null,formType='add',formNames='',row=null,table=null,statusColumnName=null,tips=null,statusColumnValue=null)=>{
		resetForm()
			form.value.shenqingshijian = context?.$toolUtil.getCurDateTime()
		if(formId){
			id.value = formId
			type.value = formType
		}
		if(formType == 'add'){
			isAdd.value = true
			formTitle.value = '新增' + formName
			formVisible.value = true
		}else if(formType == 'info'){
			isAdd.value = false
			formTitle.value = '查看' + formName
			getInfo()
		}else if(formType == 'edit'){
			isAdd.value = true
			formTitle.value = '修改' + formName
			getInfo()
		}
		else if(formType == 'cross'){
			isAdd.value = true
			formTitle.value = formNames
			// getInfo()
			for(let x in row){
				if(x=='kechengmingcheng'){
					form.value.kechengmingcheng = row[x];
					disabledForm.value.kechengmingcheng = true;
					continue;
				}
				if(x=='xuehao'){
					form.value.xuehao = row[x];
					disabledForm.value.xuehao = true;
					continue;
				}
				if(x=='xueshengxingming'){
					form.value.xueshengxingming = row[x];
					disabledForm.value.xueshengxingming = true;
					continue;
				}
				if(x=='banji'){
					form.value.banji = row[x];
					disabledForm.value.banji = true;
					continue;
				}
				if(x=='kechengtupian'){
					form.value.kechengtupian = row[x];
					disabledForm.value.kechengtupian = true;
					continue;
				}
				if(x=='shuoming'){
					form.value.shuoming = row[x];
					disabledForm.value.shuoming = true;
					continue;
				}
				if(x=='shenqingshijian'){
					form.value.shenqingshijian = row[x];
					disabledForm.value.shenqingshijian = true;
					continue;
				}
			}
			if(row){
				crossRow.value = row
			}
			if(table){
				crossTable.value = table
			}
			if(tips){
				crossTips.value = tips
			}
			if(statusColumnName){
				crossColumnName.value = statusColumnName
			}
			if(statusColumnValue){
				crossColumnValue.value = statusColumnValue
			}
			formVisible.value = true
		}

		context?.$http({
			url: `${context?.$toolUtil.storageGet('sessionTable')}/session`,
			method: 'get'
		}).then(res => {
			var json = res.data.data
			if(json.hasOwnProperty('xuehao')&& context?.$toolUtil.storageGet("role")!="管理员"){
				form.value.xuehao = json.xuehao
				disabledForm.value.xuehao = true;
			}
			if(json.hasOwnProperty('xueshengxingming')&& context?.$toolUtil.storageGet("role")!="管理员"){
				form.value.xueshengxingming = json.xueshengxingming
				disabledForm.value.xueshengxingming = true;
			}
			if(json.hasOwnProperty('banji')&& context?.$toolUtil.storageGet("role")!="管理员"){
				form.value.banji = json.banji
				disabledForm.value.banji = true;
			}
			if(context?.$toolUtil.storageGet("role")!="管理员" && !context?.$toolUtil.storageGet("isAdmin")) {
				disabledForm.value.shenqingshijian = true;
			}
		})
	}
	//初始化
	//声明父级调用
	defineExpose({
		init
	})
	//关闭
	const closeClick = () => {
		formVisible.value = false
	}
	//富文本
	const editorChange = (e,name) =>{
		form.value[name] = e
	}
	//提交
	const save= async ()=>{
		if(form.value.kechengtupian!=null) {
			form.value.kechengtupian = form.value.kechengtupian.replace(new RegExp(context?.$config.url,"g"),"");
		}
		var table = crossTable.value
		var objcross = JSON.parse(JSON.stringify(crossRow.value))
		let crossUserId = ''
		let crossRefId = ''
		let crossOptNum = ''
		if(type.value == 'cross'){
			if(crossColumnName.value!=''){
				if(!crossColumnName.value.startsWith('[')){
					for(let o in objcross){
						if(o == crossColumnName.value){
							objcross[o] = crossColumnValue.value
						}
					}
					//修改跨表数据
					changeCrossData(objcross)
				}else{
					crossUserId = user.value.id
					crossRefId = objcross['id']
					crossOptNum = crossColumnName.value.replace(/\[/,"").replace(/\]/,"")
				}
			}
		}
		formRef.value.validate((valid)=>{
			if(valid){
				if(crossUserId&&crossRefId){
					form.value.crossuserid = crossUserId
					form.value.crossrefid = crossRefId
					let params = {
						page: 1,
						limit: 1000, 
						crossuserid:form.value.crossuserid,
						crossrefid:form.value.crossrefid,
					}
					context?.$http({
						url: `${tableName}/page`,
						method: 'get', 
						params: params 
					}).then(res=>{
						if(res.data.data.total>=crossOptNum){
							context?.$toolUtil.message(`${crossTips.value}`,'error')
							return false
						}else{
							context?.$http({
								url: `${tableName}/${!form.value.id ? "save" : "update"}`,
								method: 'post', 
								data: form.value 
							}).then(async res=>{
								emit('formModelChange')
								context?.$toolUtil.message(`操作成功`,'success')
                                formVisible.value = false
							})
						}
					})
				}else{
					context?.$http({
						url: `${tableName}/${!form.value.id ? "save" : "update"}`,
						method: 'post', 
						data: form.value 
					}).then(async (res)=>{
						emit('formModelChange')
						context?.$toolUtil.message(`操作成功`,'success')
                        formVisible.value = false
					})
				}
			}else{
                context.$message.error('请完善信息')
            }
		})
	}
	//修改跨表数据
	const changeCrossData = async (row)=>{
        if(type.value == 'cross'){
            await context?.$http({
                url: `${crossTable.value}/update`,
                method: 'post',
                data: row
            }).then(res=>{})
        }
	}
</script>
<style lang="scss" scoped>
	// 表单
	.formModel_form{
		// form item
		:deep(.el-form-item) {
			//label
			.el-form-item__label {
			}
			// 内容盒子
			.el-form-item__content {
				// 输入框
				.list_inp {
				}
				//日期选择器
				.list_date {
				}
				// 长文本
				.el-textarea__inner {
				}
				//图片上传样式
				.el-upload-list  {
					//提示语
					.el-upload__tip {
					}
					//外部盒子
					.el-upload--picture-card {
						//图标
						.el-icon{
						}
					}
					.el-upload-list__item {
					}
				}
			}
		}
	}
	// 按钮盒子
	.formModel_btn_box {
		.cancel_btn {
		}
		.cancel_btn:hover {
		}
		
		.confirm_btn {
		}
		.confirm_btn:hover {
		}
	}
</style>
