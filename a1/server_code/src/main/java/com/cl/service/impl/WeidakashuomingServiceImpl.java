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


import com.cl.dao.WeidakashuomingDao;
import com.cl.entity.WeidakashuomingEntity;
import com.cl.service.WeidakashuomingService;
import com.cl.entity.view.WeidakashuomingView;

@Service("weidakashuomingService")
public class WeidakashuomingServiceImpl extends ServiceImpl<WeidakashuomingDao, WeidakashuomingEntity> implements WeidakashuomingService {

    	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<WeidakashuomingEntity> page = this.selectPage(
                new Query<WeidakashuomingEntity>(params).getPage(),
                new EntityWrapper<WeidakashuomingEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<WeidakashuomingEntity> wrapper) {
		  Page<WeidakashuomingView> page =new Query<WeidakashuomingView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
	@Override
	public List<WeidakashuomingView> selectListView(Wrapper<WeidakashuomingEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public WeidakashuomingView selectView(Wrapper<WeidakashuomingEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}
	
	


}
