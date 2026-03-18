<template>
	<div class="menu_wrapper">
		<el-scrollbar wrap-class="scrollbar-wrapper" class="menu_scrollbar">
			<el-menu :default-openeds="[]" :unique-opened="true" default-active="0" class="menu_view"
				:collapse="collapse">
				<el-menu-item class="first-item" :index="0" @click="menuHandler('')">
					<i class="iconfont icon-zhuye2" v-if="collapse?false:true"></i>
					<template #title>
						<span>首页</span>
					</template>
				</el-menu-item>
                <template v-for=" (item,index) in menuList.backMenu">
                    <el-sub-menu v-if="item.child.length>1"  class="first-item" :index="index+2+''">
                        <template #title>
                            <i class="iconfont" :class="item.fontClass" v-if="collapse?false:true"></i>
                            <span>{{ item.menu }}</span>
                        </template>
                        <el-menu-item class="second-item" v-for=" (child,sort) in item.child" :key="sort"
                            :index="(index+2)+'-'+sort"
                            @click="menuHandler(child.classname||child.tableName,child.menuJump)">{{ child.menu }}
                        </el-menu-item>
                    </el-sub-menu>
                    <el-menu-item v-else class="first-item" :index="index+2+''" @click="menuHandler(item.child[0].classname||item.child[0].tableName,item.child[0].menuJump)">
                        <i class="iconfont" :class="item.fontClass" v-if="collapse?false:true"></i>
                        <template #title>
                            <span>{{ item.child[0].menu }}</span>
                        </template>
                    </el-menu-item>
                </template>
			</el-menu>
		</el-scrollbar>
	</div>
</template>

<script setup>
	import menu from '@/utils/menu'
	import {
		ref,
		toRefs,
		getCurrentInstance,
		nextTick
	} from 'vue';
	import { useStore } from 'vuex'
	const store = useStore()
	const context = getCurrentInstance()?.appContext.config.globalProperties;
	//props
	const props = defineProps({
		collapse: Boolean
	})
	const {
		collapse
	} = toRefs(props)
	//data
	const menuList = ref([])
	const role = ref('')
	//权限验证
	const btnAuth = (e,a)=>{
		return context?.$toolUtil.isAuth(e,a)
	}
	const init = () => {
		const menus = menu.list()
		if (menus) {
			menuList.value = menus
		}
		role.value = context?.$toolUtil.storageGet('role')

		for (let i = 0; i < menuList.value.length; i++) {
			if (menuList.value[i].roleName == role.value) {
				menuList.value = menuList.value[i];
				break;
			}
		}
	}
	const menuHandler = (name,menuJump) => {
        if(name == 'center'){
            context.$router.push(`/${role.value}Center`)
        }else if(name == 'storeup'){
            context.$router.push(`/storeup?type=${menuJump}`)
        }else if(name == 'exampaper' && menuJump == '12'){
            context.$router.push('/exampaperlist')
        }else if(name == 'examrecord' && menuJump == '22'){
            context.$router.push('/examfailrecord')
        }else{
            context.$router.push(`/${name}${menuJump?'?menuJump='+menuJump:''}`)
        }
	}
	init()
</script>

<style lang="scss" scoped>
	// 总盒子
	:deep(.menu_scrollbar) {

		// 菜单盒子-展开样式
		.menu_view {
			border: none;
			padding: 0 0 100px;
			display: flex;
			width: 100%;
			align-items: flex-start;
			flex-wrap: wrap;

			// 无二级菜单
			.el-menu-item {
				border-radius: 0 0 10px 10px;
				padding: 10px 0;
				flex-direction: column;
				color: #fff;
				display: flex;
				line-height: 1.5;
				justify-content: center;
				align-items: center;
				position: relative;
				flex-wrap: wrap;
				height: auto;
				.iconfont {
					width: 30px;
					font-size: 30px;
					line-height: 1;
				}
			}

			// 无二级悬浮
			.el-menu-item:hover {
				background: #f8c39b;
			}

			// 无二级选中
			.el-menu-item.is-active {
				border-radius: 0 0 10px 10px;
				background: #f8c39b;
			}

			// 有二级盒子
			.el-sub-menu {
				border-radius: 0 0 10px 10px;

				// 有二级item
				.el-sub-menu__title {
					border-radius: 0 0 10px 10px;
					padding: 10px 0;
					flex-direction: column;
					color: #fff;
					display: flex;
					line-height: 1.5;
					justify-content: center;
					align-items: center;
					position: relative;
					flex-wrap: wrap;
					height: auto;
					.iconfont {
						width: 30px;
						font-size: 30px;
						line-height: 1;
					}
					.el-sub-menu__icon-arrow{
						display: none;
						position: absolute;
						right: 10px;
					}
				}

				// 有二级item悬浮
				.el-sub-menu__title:hover {
					background: #f8c39b;
				}
			}
			//二级选中
			.is-active {
				.el-sub-menu__title {
					border-radius: 0 0 10px 10px;
					background: #f8c39b;
				}
			}
			// 二级盒子
			.el-menu--inline {
				padding: 10px 0 0;
				background: #fff;
				width: 100%;
				// 二级菜单
				.second-item {
					padding: 0 0 0 30px;
					margin: 0 0 10px;
					color: #333;
					background: #fff;
					border-color: #f8c39b;
					border-width: 0px;
					line-height: 30px;
					border-style: solid;
					height: 30px;
				}
				// 二级悬浮
				.second-item:hover {
					color: #A17B32;
					background: none;
				}
				// 二级选中
				.is-active.second-item {
					color: #A17B32;
					background: none;
					line-height: 30px;
					height: 30px;
				}
			}
		}
		// 菜单盒子-关闭样式
		.el-menu--collapse {
			padding: 0;
			background: none;
			height: 100%;

			// 无二级菜单
			.el-menu-item {
				border: none;
				padding: 0 10px;
				color: #ccc;
				background: none;
				line-height: 50px;
				height: 50px;
			}

			// 无二级悬浮
			.el-menu-item:hover {
				padding: 0 10px;
				color: #ccc;
				background: none;
				line-height: 50px;
				height: 50px;
			}

			// 无二级选中
			.el-menu-item.is-active {
				padding: 0 10px;
				color: #ccc;
				background: none;
				line-height: 50px;
				height: 50px;
			}

			// 有二级盒子
			.el-sub-menu {
				cursor: pointer;
				padding: 0 0;
				white-space: nowrap;
				background: none;
				position: relative;

				// 有二级item
				.el-sub-menu__title {
					border: none;
					padding: 0 10px;
					color: #ccc;
					background: none;
					line-height: 50px;
					height: 50px;
					.el-sub-menu__icon-arrow{
						margin: -3px 0 0 8px;
						color: inherit;
						vertical-align: middle;
						font-size: 12px;
						position: static;
					}
				}

				// 有二级item悬浮
				.el-sub-menu__title:hover {
					padding: 0 10px;
					color: #ccc;
					background: none;
					line-height: 50px;
					height: 50px;
				}
			}
			//二级选中
			.is-active {
				.el-sub-menu__title {
					padding: 0 10px;
					color: #ccc;
					background: none;
					line-height: 50px;
					height: 50px;
				}
			}
			// 二级盒子
			.el-menu--inline {
				border: none;
				padding: 0px;
				background: none;
				// 二级菜单
				.second-item {
					padding: 0 40px;
					color: #666;
					background: none;
					line-height: 50px;
					height: 50px;
				}
				// 二级悬浮
				.second-item:hover {
					padding: 0 40px;
					color: #f00;
					background: greenyellow;
					line-height: 50px;
					height: 50px;
				}
				// 二级选中
				.is-active.second-item {
					padding: 0 40px;
					color: #000;
					background: none;
					line-height: 50px;
					height: 50px;
				}
			}
		}
	}
</style>
<style lang="scss">
	.el-menu-item .el-menu-tooltip__trigger {
		padding: 0;
	}
	.el-popper{
		.el-menu--popup-container {
			.el-menu--popup{
				border: none;
				padding: 0px;
				background: none;
				// 二级菜单
				.second-item {
					padding: 0 40px;
					color: #666;
					background: none;
					line-height: 50px;
					height: 50px;
				}
				// 二级悬浮
				.second-item:hover {
					padding: 0 40px;
					color: #f00;
					background: greenyellow;
					line-height: 50px;
					height: 50px;
				}
				// 二级选中
				.is-active.second-item {
					padding: 0 40px;
					color: #000;
					background: none;
					line-height: 50px;
					height: 50px;
				}
			}
		}
	}
</style>
<style>
/* 菜单展开样式 */
/* 中间内容总盒子 */
.main-container{
    margin: 0px 0px 0px 250px;
    padding: 104px 0px 0px !important;
    background: rgba(255,255,255,1);
    overflow: hidden;
}

/* 总盒子 */
.menu_wrapper{
    width: 250px;
    background: #fff;
    height: 100%;
    overflow: hidden;
    position: fixed;
    top: 110px;
    left: 10px;
    border-width: 0 0px 0 0;
    border-style: solid;
    border-color: rgb(82, 147, 211);
    padding: 28px 10px 80px 0;
    transition: all 0.3s ease-in-out 0s;
    box-shadow: 0px 0 0px 0 rgba(69, 90, 100, 0.2);
    z-index:9;
}

/* item */
.menu_view li{
    width: 45%;
    margin:0 2.5% 20px;
    background:#f8c39b;
    border-top:4px solid #A17B32;
}

.el-sub-menu.is-opened .el-sub-menu__title{
    border-radius:0 0 10px 10px;
}

</style>