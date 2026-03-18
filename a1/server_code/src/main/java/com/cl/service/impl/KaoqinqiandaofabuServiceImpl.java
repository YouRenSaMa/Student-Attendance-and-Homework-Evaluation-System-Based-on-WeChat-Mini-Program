package com.cl.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import java.util.List;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.cl.utils.PageUtils;
import com.cl.utils.Query;


import com.cl.dao.KaoqinqiandaofabuDao;
import com.cl.entity.KaoqinqiandaofabuEntity;
import com.cl.service.KaoqinqiandaofabuService;
import com.cl.entity.view.KaoqinqiandaofabuView;

@Service("kaoqinqiandaofabuService")
public class KaoqinqiandaofabuServiceImpl extends ServiceImpl<KaoqinqiandaofabuDao, KaoqinqiandaofabuEntity> implements KaoqinqiandaofabuService {

    	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<KaoqinqiandaofabuEntity> page = this.selectPage(
                new Query<KaoqinqiandaofabuEntity>(params).getPage(),
                new EntityWrapper<KaoqinqiandaofabuEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<KaoqinqiandaofabuEntity> wrapper) {
		  Page<KaoqinqiandaofabuView> page =new Query<KaoqinqiandaofabuView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
	@Override
	public List<KaoqinqiandaofabuView> selectListView(Wrapper<KaoqinqiandaofabuEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public KaoqinqiandaofabuView selectView(Wrapper<KaoqinqiandaofabuEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}
	
	


}
