package com.cl.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.cl.utils.PageUtils;
import com.cl.entity.QiandaoEntity;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Param;
import com.cl.entity.view.QiandaoView;


/**
 * 签到
 *
 * @author 
 * @email 
 * @date 2025-03-12 22:29:29
 */
public interface QiandaoService extends IService<QiandaoEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<QiandaoView> selectListView(Wrapper<QiandaoEntity> wrapper);
   	
   	QiandaoView selectView(@Param("ew") Wrapper<QiandaoEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<QiandaoEntity> wrapper);
   	
   
    List<Map<String, Object>> selectValue(Map<String, Object> params,Wrapper<QiandaoEntity> wrapper);

    List<Map<String, Object>> selectTimeStatValue(Map<String, Object> params,Wrapper<QiandaoEntity> wrapper);

    List<Map<String, Object>> selectGroup(Map<String, Object> params,Wrapper<QiandaoEntity> wrapper);



}

