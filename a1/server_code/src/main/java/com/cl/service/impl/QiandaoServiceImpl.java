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


import com.cl.dao.QiandaoDao;
import com.cl.entity.QiandaoEntity;
import com.cl.service.QiandaoService;
import com.cl.entity.view.QiandaoView;

@Service("qiandaoService")
public class QiandaoServiceImpl extends ServiceImpl<QiandaoDao, QiandaoEntity> implements QiandaoService {

    	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<QiandaoEntity> page = this.selectPage(
                new Query<QiandaoEntity>(params).getPage(),
                new EntityWrapper<QiandaoEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<QiandaoEntity> wrapper) {
		  Page<QiandaoView> page =new Query<QiandaoView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
	@Override
	public List<QiandaoView> selectListView(Wrapper<QiandaoEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public QiandaoView selectView(Wrapper<QiandaoEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}
	
	

    @Override
    public List<Map<String, Object>> selectValue(Map<String, Object> params, Wrapper<QiandaoEntity> wrapper) {
        return baseMapper.selectValue(params, wrapper);
    }

    @Override
    public List<Map<String, Object>> selectTimeStatValue(Map<String, Object> params, Wrapper<QiandaoEntity> wrapper) {
        return baseMapper.selectTimeStatValue(params, wrapper);
    }

    @Override
    public List<Map<String, Object>> selectGroup(Map<String, Object> params, Wrapper<QiandaoEntity> wrapper) {
        return baseMapper.selectGroup(params, wrapper);
    }




}
