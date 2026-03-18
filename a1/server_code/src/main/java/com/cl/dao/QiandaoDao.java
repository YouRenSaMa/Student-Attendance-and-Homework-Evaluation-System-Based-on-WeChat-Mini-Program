package com.cl.dao;

import com.cl.entity.QiandaoEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.cl.entity.view.QiandaoView;


/**
 * 签到
 * 
 * @author 
 * @email 
 * @date 2025-03-12 22:29:29
 */
public interface QiandaoDao extends BaseMapper<QiandaoEntity> {
	
	List<QiandaoView> selectListView(@Param("ew") Wrapper<QiandaoEntity> wrapper);

	List<QiandaoView> selectListView(Pagination page,@Param("ew") Wrapper<QiandaoEntity> wrapper);
	
	QiandaoView selectView(@Param("ew") Wrapper<QiandaoEntity> wrapper);


    List<Map<String, Object>> selectValue(@Param("params") Map<String, Object> params,@Param("ew") Wrapper<QiandaoEntity> wrapper);

    List<Map<String, Object>> selectTimeStatValue(@Param("params") Map<String, Object> params,@Param("ew") Wrapper<QiandaoEntity> wrapper);

    List<Map<String, Object>> selectGroup(@Param("params") Map<String, Object> params,@Param("ew") Wrapper<QiandaoEntity> wrapper);



}
