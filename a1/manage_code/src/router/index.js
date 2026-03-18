	import {
		createRouter,
		createWebHashHistory
	} from 'vue-router'
	import kechengzuoye from '@/views/kechengzuoye/list'
	import xuesheng from '@/views/xuesheng/list'
	import zuoyepigai from '@/views/zuoyepigai/list'
	import tijiaozuoye from '@/views/tijiaozuoye/list'
	import qiandao from '@/views/qiandao/list'
	import weidakashuoming from '@/views/weidakashuoming/list'
	import kaoqinqiandaofabu from '@/views/kaoqinqiandaofabu/list'
	import config from '@/views/config/list'
	import users from '@/views/users/list'

export const routes = [{
		path: '/login',
		name: 'login',
		component: () => import('../views/login.vue')
	},{
		path: '/',
		name: '首页',
		component: () => import('../views/index'),
		children: [{
			path: '/',
			name: '首页',
			component: () => import('../views/HomeView.vue'),
			meta: {
				affix: true
			}
		}, {
			path: '/updatepassword',
			name: '修改密码',
			component: () => import('../views/updatepassword.vue')
		}
		
		,{
			path: '/kechengzuoye',
			name: '课程作业',
			component: kechengzuoye
		}
		,{
			path: '/xuesheng',
			name: '学生',
			component: xuesheng
		}
		,{
			path: '/zuoyepigai',
			name: '作业批改',
			component: zuoyepigai
		}
		,{
			path: '/tijiaozuoye',
			name: '提交作业',
			component: tijiaozuoye
		}
		,{
			path: '/qiandao',
			name: '签到',
			component: qiandao
		}
		,{
			path: '/weidakashuoming',
			name: '未打卡说明',
			component: weidakashuoming
		}
		,{
			path: '/kaoqinqiandaofabu',
			name: '考勤签到发布',
			component: kaoqinqiandaofabu
		}
		,{
			path: '/config',
			name: '轮播图',
			component: config
		}
		,{
			path: '/users',
			name: '管理员',
			component: users
		}
		]
	},
]

const router = createRouter({
	history: createWebHashHistory(process.env.BASE_URL),
	routes
})

export default router
