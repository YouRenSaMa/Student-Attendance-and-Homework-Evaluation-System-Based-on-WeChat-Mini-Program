package com.cl.dao;

import com.cl.entity.KaoqinqiandaofabuEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.cl.entity.view.KaoqinqiandaofabuView;


/**
 * 考勤签到发布
 * 
 * @author 
 * @email 
 * @date 2025-03-12 22:29:29
 */
public interface KaoqinqiandaofabuDao extends BaseMapper<KaoqinqiandaofabuEntity> {
	
	List<KaoqinqiandaofabuView> selectListView(@Param("ew") Wrapper<KaoqinqiandaofabuEntity> wrapper);

	List<KaoqinqiandaofabuView> selectListView(Pagination page,@Param("ew") Wrapper<KaoqinqiandaofabuEntity> wrapper);
	
	KaoqinqiandaofabuView selectView(@Param("ew") Wrapper<KaoqinqiandaofabuEntity> wrapper);


}
