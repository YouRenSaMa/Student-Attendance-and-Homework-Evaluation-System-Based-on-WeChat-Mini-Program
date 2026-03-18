package com.cl.dao;

import com.cl.entity.WeidakashuomingEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.cl.entity.view.WeidakashuomingView;


/**
 * 未打卡说明
 * 
 * @author 
 * @email 
 * @date 2025-03-12 22:29:29
 */
public interface WeidakashuomingDao extends BaseMapper<WeidakashuomingEntity> {
	
	List<WeidakashuomingView> selectListView(@Param("ew") Wrapper<WeidakashuomingEntity> wrapper);

	List<WeidakashuomingView> selectListView(Pagination page,@Param("ew") Wrapper<WeidakashuomingEntity> wrapper);
	
	WeidakashuomingView selectView(@Param("ew") Wrapper<WeidakashuomingEntity> wrapper);


}
