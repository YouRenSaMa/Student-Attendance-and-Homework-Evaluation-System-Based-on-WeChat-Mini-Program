// pages/edit/edit.js

const {
detail,
option,
update,
add,
list,
follow,
faceMatch,
session,
rubbish,
levelOption,
baiduIdentify
} = require("../../api/index.js")

const des = require('../../utils/des.js')
const utils = require("../../utils/index.js")

Page({

/**
* 页面的初始数据
*/
data: {
imgIcon: "../../static/upload.png",
editStatus: false,
baseURL:'',
sessionReadArr:[],

detailList: null,
id: "",
cross:"",
ruleForm:{},
userid:getApp().globalData.userInfo.id,
userInfo:getApp().globalData.userInfo,
ro:{
},

kechengmingcheng:"",
xuehao:"",
xueshengxingming:"",
banji:"",
kechengtupian:"",
shenqingshijian:"请选择时间",
showshenqingshijian:false,
sfsh:"",
shuoming:"",
},


/**
* 生命周期函数--监听页面加载
*/
async onLoad(options) {
let userid
if (options?.id) {
this.setData({
editStatus: true
})

}
let nowTable = wx.getStorageSync("nowTable");
const res = await session(nowTable)
if(res.data.code==0){
getApp().globalData.userInfo=res?.data
userid = res?.data.id
this.setData({
userid
})

}
let baseURL =wx.getStorageSync('baseURL') + '/'
const id = getApp().globalData.detailId
this.setData({
refid:id,
baseURL
})
//人脸识别
let  ro=this.data.ro
if(options?.cross){
var obj = wx.getStorageSync('crossObj');
let refobjempty={}
for (var o in obj){
if(o=='kechengmingcheng'){
    refobjempty["kechengmingcheng"]=obj[o]
ro.kechengmingcheng = true;
continue;
}else{
}

if(o=='xuehao'){
    refobjempty["xuehao"]=obj[o]
ro.xuehao = true;
continue;
}else{
}

if(o=='xueshengxingming'){
    refobjempty["xueshengxingming"]=obj[o]
ro.xueshengxingming = true;
continue;
}else{
}

if(o=='banji'){
    refobjempty["banji"]=obj[o]
ro.banji = true;
continue;
}else{
}

if(o=='kechengtupian'){
 refobjempty['kechengtupian']=obj[o];
 refobjempty['kechengtupianPath']=baseURL+ obj[o].split(",")[0];
ro.kechengtupian = true;
continue;
}else{
}

if(o=='shuoming'){
    refobjempty["shuoming"]=obj[o]
ro.shuoming = true;
continue;
}else{
}

if(o=='shenqingshijian'){
    refobjempty["shenqingshijian"]=obj[o]
ro.shenqingshijian = true;
continue;
}else{
}

}

let  statusColumnName=wx.getStorageSync('statusColumnName');
statusColumnName=statusColumnName.replace('[',"").replace(']',"");
this.setData({
ro,
cross:options?.cross,
statusColumnName
})
this.setData(refobjempty)
}
if(id){
// 如果上一级页面传递了id，获取改id数据信息
const data=getApp().globalData.detailList;
let dataEmpty={};
for (var o in data){
if(o=='kechengmingcheng') {
dataEmpty["kechengmingcheng"] = data[o]
}
if(o=='xuehao') {
dataEmpty["xuehao"] = data[o]
}
if(o=='xueshengxingming') {
dataEmpty["xueshengxingming"] = data[o]
}
if(o=='banji') {
dataEmpty["banji"] = data[o]
}
if(o=='kechengtupian') {
dataEmpty['kechengtupian'] = data[o];
dataEmpty['kechengtupianPath'] = baseURL + data[o].split(",")[0];
}
if(o=='shuoming') {
dataEmpty["shuoming"] = data[o]
}
if(o=='shenqingshijian') {
dataEmpty["shenqingshijian"] = data[o]
}
}
const url = wx.getStorageSync("baseURL") + "/"
const detailList = data
let  objtemp= {
detailList,
 kechengtupian:data?.kechengtupian?.split(',')[0],
 kechengtupianPath:baseURL+data?.kechengtupian?.split(',')[0],
 shenqingshijian:utils.getCurrentDate("yMDhms"),
}
this.setData(objtemp);

let h = this.data
let c = this.data
let d1 = this.data
let d2 = this.data
this.setData({
});
this.setData(dataEmpty)
}else {
this.setData({
})
}
// ss读取
let sessionReadArr=[]
 if(!this.data.xuehao&&getApp().globalData.userInfo.xuehao){
 let xuehao= getApp().globalData.userInfo.xuehao
 ro.xuehao=true
 this.setData({
   xuehao,
  })
 sessionReadArr.push('xuehao')
 }
 if(!this.data.xueshengxingming&&getApp().globalData.userInfo.xueshengxingming){
 let xueshengxingming= getApp().globalData.userInfo.xueshengxingming
 ro.xueshengxingming=true
 this.setData({
   xueshengxingming,
  })
 sessionReadArr.push('xueshengxingming')
 }
 if(!this.data.banji&&getApp().globalData.userInfo.banji){
 let banji= getApp().globalData.userInfo.banji
 ro.banji=true
 this.setData({
   banji,
  })
 sessionReadArr.push('banji')
 }
ro.shenqingshijian=true
this.setData({
cross:options?.cross,
ro,
id,
})

if (wx.getStorageSync('raffleType') ) {
 wx.removeStorageSync('raffleType')
 setTimeout(() => {
  this.submit()
 }, 300)
}







this.setData({
shenqingshijian:utils.getCurrentDate("yMDhms")
})



},
getUUID () {
return new Date().getTime();
},
onUnload: function () {
getApp().globalData.editorContent = ''
},
onShow() {

},
 commentScore(e){
 if(this.data?.commentScore){
  this.setData({
   commentScore:e.detail
  })
 }
 },


































uploadkechengtupian() {
wx.chooseImage({
count: 1,
sizeType: ['compressed'],
sourceType: ['album', 'camera'],
success: async (res) => {
const tempFilePaths = res.tempFilePaths;
// 本地临时图片的路径
this.setData({
 kechengtupianPath: tempFilePaths[0]
})
let _this = this;
// 上传网络图片
const baseURL = wx.getStorageSync('baseURL')
wx.uploadFile({
url: `${baseURL}/file/upload`,
filePath: res.tempFilePaths[0],
name: 'file',
header: {
 'Token': wx.getStorageSync('token')
},
success: (uploadFileRes) => {
 let result = JSON.parse(uploadFileRes.data);
// result.file是上传成功为网络图片的名称
 if (result.code == 0) {
  this.setData({
    kechengtupian: 'file/' + result.file
  })
 } else {
  wx.showToast({
   title: result.msg,
   icon: 'none',
   duration: 2000
  });
 }
}
})

this.setData({
face: tempFilePaths[0]
});

}
})
},




shuomingInput(e){
this.setData({
shuoming: e.detail.value // 每次输入变化时更新文本框的值
});},




shuomingInput(e) {
this.setData({
shuoming: e.detail.value // 每次输入变化时更新文本框的值
});
},







 onshenqingshijianTap(){
this.setData({
showshenqingshijian: true,
})
let c = this.data;
},
shenqingshijianTap(e) {
this.setData({
shenqingshijian: e.detail.data
})

let c = this.data;
},




shhfInput(e){
this.setData({
shhf: e.detail.value // 每次输入变化时更新文本框的值
});},




shhfInput(e) {
this.setData({
shhf: e.detail.value // 每次输入变化时更新文本框的值
});
},


async submit() {
let that = this
var query = wx.createSelectorQuery();

// 在 Page 中的某个方法中调用
query.select('#shuoming').boundingClientRect();
query.exec(function (res) {
//res就是 所有标签为v1的元素的信息 的数组
that.setData({
shuoming: res[0]?.dataset?.info
})
})
if(this.data.shenqingshijian?.includes("请选择") || this.data.shenqingshijian==""){
wx.showToast({
icon: "none",
title: `申请时间不能为空`,
})
return
}

const baseURL = wx.getStorageSync('baseURL') + "/"
const regex = new RegExp(baseURL, "g");
const obj={
kechengmingcheng: this.data. kechengmingcheng,
xuehao: this.data. xuehao,
xueshengxingming: this.data. xueshengxingming,
banji: this.data. banji,
kechengtupian:this.data.kechengtupian?.replace(regex, ""),
shuoming: this.data. shuoming,
shenqingshijian: this.data. shenqingshijian,
shhf:this.data.shhf,
}
const detailId= getApp().globalData.detailId
const tableName= `weidakashuoming`
//跨表计算判断
var obj2;
var  ruleForm=obj
obj2 = ruleForm
this.data.refid==""? ruleForm['refid']= getApp().globalData.detailId:""
ruleForm['userid']=getApp().globalData.userInfo.id;
var userInfo=getApp().globalData.userInfo
const sessionReadArr=this.data.sessionReadArr
const phonePattern = /^\(?\d{3}\)?[-.\s]?\d{3}[-.\s]?\d{4}$/;
const mobilePattern = /^(?:\+?86)?1[3-9]\d{9}$/;
const emailPattern = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
const idPattern = /^[1-9]\d{5}(18|19|20)\d{2}(0[1-9]|1[0-2])(0[1-9]|[1-2]\d|3[0-1])\d{3}[\dxX]$/;
const urlPattern = /^(http|https):\/\/[\w\-]+(\.[\w\-]+)+[/#?]?.*$/;




















 if(!this.data.shuoming ){
  wx.showToast({
   icon: "none",
   title: `说明不能为空`,
  })
  return
 }

















//更新跨表属性
var crossuserid;
var crossrefid;
var crossoptnum;
if(this.data.cross) {
wx.setStorageSync('crossCleanType', true);
var statusColumnName = wx.getStorageSync('statusColumnName');
var statusColumnValue = wx.getStorageSync('statusColumnValue');
if (statusColumnName != '') {
obj2 = wx.getStorageSync('crossObj');
if (!statusColumnName.startsWith("[")) {
for (var o in obj2) {
if (statusColumnName==o){
obj2[o] = statusColumnValue;
}

}
var table = wx.getStorageSync('crossTable');

await update(table, obj2)
} else {

crossuserid =getApp().globalData.userInfo.id
crossrefid =  this.data.id
crossoptnum = wx.getStorageSync('statusColumnName');
crossoptnum = crossoptnum.replace(/\[/, "").replace(/\]/, "");
}
}
}
this.data.cross ? (crossrefid = obj2.id, crossuserid =getApp().globalData.userInfo.id) : ""
ruleForm?.crossrefid==undefined? ( ruleForm["crossrefid"] = obj2.id, ruleForm["crossuserid"] =getApp().globalData.userInfo.id ): "";
ruleForm?.shhf?ruleForm.shhf=this.data.shhf:''
if(crossrefid && crossuserid) {
ruleForm['crossuserid'] =getApp().globalData.userInfo.id;
ruleForm['crossrefid'] =obj2.id;
this.setData({
ruleForm
})
let params = {
page: 1,
limit: 10,
crossuserid: crossuserid,
crossrefid: crossrefid,
}
const tips = wx.getStorageSync('tips')
let corssRes = await list(`weidakashuoming`, params)
crossoptnum = wx.getStorageSync('statusColumnName');
crossoptnum = crossoptnum.match(/\d+/g);
if (corssRes?.data?.total >= parseInt(crossoptnum)) {
wx.showToast({
icon: "none",
title: tips,
})
wx.removeStorageSync('crossCleanType');
return ;
}
else {
//跨表计算
if (ruleForm.id ) {
await update(`weidakashuoming`, ruleForm)
}
else {
 this.data?.commentScore?ruleForm['score']= this.data.commentScore:'';
 await add(`weidakashuoming`, ruleForm)
}
}
}
else {
//跨表计算
if (ruleForm.id || this.data.editStatus) {
this.data.editStatus?ruleForm['id']= getApp().globalData.detailId:""
await update(`weidakashuoming`, ruleForm)
}
else {
 this.data?.commentScore?ruleForm['score']= this.data.commentScore:'';
await add(`weidakashuoming`, ruleForm)
}
}
getApp().globalData.editorContent=''
wx.showToast({
title: '提交成功',
icon: "none"
})
const preId = getApp().globalData.detailId

if(table){
let res = await detail(table, preId)
if(res.code==0){
getApp().globalData.detailList = res.data
}

}
wx.navigateBack({
delta: 1,
complete: () => {
// 触发事件通知，传递需要更新的数据
const pages = getCurrentPages();
if (pages.length >= 1) {
const prePage = pages[pages.length - 1];
prePage.onLoad(); //
}
}
})

},
onHide() {

},


/**
* 生命周期函数--监听页面卸载
*/
onUnload() {

},


/**
* 页面相关事件处理函数--监听用户下拉动作
*/
onPullDownRefresh() {

},

/**
* 页面上拉触底事件的处理函数
*/
onReachBottom() {

},

/**
* 用户点击右上角分享
*/
onShareAppMessage() {

}
})