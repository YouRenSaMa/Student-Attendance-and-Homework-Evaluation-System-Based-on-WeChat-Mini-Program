const {
list,
autoSort,
autoSort2,
save,
swiperData,
info,detail
} = require("../../api/index.js")
const utils = require('../../utils/index.js')
const menu = require('../../utils/menu.js')
Page({
data: {
value: null,
baseURL: wx.getStorageSync('baseURL') + "/",
    
homekaoqinqiandaofabuList:[],
homekechengzuoyeList:[],
isIndex: false,
forumArr: [],
swiperList:[],
frontMenuList: [],
swiperUrl:"",
},


onSwiperTap(e){

},
checkMoreTap(e) {
const tableName = e.currentTarget.dataset.tablename;
const tabar = getApp().globalData.tabarList;
wx.removeStorage({
key: 'isAuth',
})
if(tabar.includes(tableName)){
 wx.switchTab({
     url: `/pages/${tableName}/list`,
 })
}else{
 wx.navigateTo({
     url: `/pages/${tableName}/list`,
 })
}


},
async onLoad(options) {
    this.getData()
    },
async onShow() {
this.onLoad()
},
onSwiperTap(e){
const item= e.currentTarget.dataset.item
this.setData({
swiperUrl:item.url
})
},

    selectTap(e) {
        const item = e.currentTarget.dataset.item;
                utils.menuTap(item.child[0].classname)
        this.setData({
            childItem: item.child
        })
    },
    cancelShow() {
        this.selectComponent('#bottomFrame').hideFrame();
    },
    menuTap(e) {
        const item = e.currentTarget.dataset.item;
                const tableName = item.child[0].classname;
                utils.menuTap(tableName)

    },
    async toDetail(e) {
                const item = e.currentTarget.dataset.item;
        const tablename = e.currentTarget.dataset.tablename;
     getApp().globalData.detailId = item.id
    getApp().globalData.detailList=item
    wx.navigateTo({
        url: `/pages/${tablename}/detail`
    })
},
async toDetail(e) {
                const item = e.currentTarget.dataset.item;
        const tablename = e.currentTarget.dataset.tablename;
     getApp().globalData.detailId = item.id
    getApp().globalData.detailList=item
    wx.navigateTo({
        url: `/pages/${tablename}/detail`
    })
},


    onSearch() {},

    onHide() {

    },

    onUnload() {

    },
    imageErrorHandler(e) {
        console.log('图片加载失败:', e)
        // 在这里可以进行错误处理，例如显示加载失败的提示文字或设置默认图片
    },
    onPullDownRefresh() {

    },


    onReachBottom() {

    },
    onShareAppMessage() {
    },

    async getData() {
 let baseURL=wx.getStorageSync("baseURL")+"/"
        this.setData({
            baseURL
        })
const role=  wx.getStorageSync("role");
const menus = menu.default.list()
const frontMenuList=[]
menus[0].frontMenu.forEach((item2,key2) => {
if(item2.child[0]?.buttons?.indexOf("查看")>-1) {
    frontMenuList.push(item2);
}
})
this.setData({
    frontMenuList
})



    const swiperRes = await swiperData(1, 5)
    const swiperList = swiperRes?.data?.list.filter(item=>(item.value)).map(item => {
            return {
                img: baseURL + item.value,
                title: item.name,
                id: item.id,
                ...item
            };
    })
    this.setData({
        swiperList
    })



    const kaoqinqiandaofabu = await list("kaoqinqiandaofabu",
{
page: 1,
                }


    )
    const kaoqinqiandaofaburesult = kaoqinqiandaofabu.data?.list?.map(item => {
    item.kechengtupian = baseURL +
        item.kechengtupian.split(",")[0];

        item.price = item?.price?.toFixed(2);
        item.vipprice = item?.vipprice?.toFixed(2);
        return item;
    });
    this.setData({
        homekaoqinqiandaofabuList:  kaoqinqiandaofaburesult
    })
    const kechengzuoye = await list("kechengzuoye",
{
page: 1,
                }


    )
    const kechengzuoyeresult = kechengzuoye.data?.list?.map(item => {
    item.fengmian = baseURL +
        item.fengmian.split(",")[0];

        item.price = item?.price?.toFixed(2);
        item.vipprice = item?.vipprice?.toFixed(2);
        return item;
    });
    this.setData({
        homekechengzuoyeList:  kechengzuoyeresult
    })


    }
})