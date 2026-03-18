package com.cl.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.cl.utils.PageUtils;
import com.cl.entity.TijiaozuoyeEntity;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Param;
import com.cl.entity.view.TijiaozuoyeView;


/**
 * 提交作业
 *
 * @author 
 * @email 
 * @date 2025-03-12 22:29:29
 */
public interface TijiaozuoyeService extends IService<TijiaozuoyeEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<TijiaozuoyeView> selectListView(Wrapper<TijiaozuoyeEntity> wrapper);
   	
   	TijiaozuoyeView selectView(@Param("ew") Wrapper<TijiaozuoyeEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<TijiaozuoyeEntity> wrapper);
   	
   
    List<Map<String, Object>> selectValue(Map<String, Object> params,Wrapper<TijiaozuoyeEntity> wrapper);

    List<Map<String, Object>> selectTimeStatValue(Map<String, Object> params,Wrapper<TijiaozuoyeEntity> wrapper);

    List<Map<String, Object>> selectGroup(Map<String, Object> params,Wrapper<TijiaozuoyeEntity> wrapper);



}

