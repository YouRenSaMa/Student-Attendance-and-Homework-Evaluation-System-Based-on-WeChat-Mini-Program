package com.cl.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.cl.utils.PageUtils;
import com.cl.entity.WeidakashuomingEntity;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Param;
import com.cl.entity.view.WeidakashuomingView;


/**
 * 未打卡说明
 *
 * @author 
 * @email 
 * @date 2025-03-12 22:29:29
 */
public interface WeidakashuomingService extends IService<WeidakashuomingEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<WeidakashuomingView> selectListView(Wrapper<WeidakashuomingEntity> wrapper);
   	
   	WeidakashuomingView selectView(@Param("ew") Wrapper<WeidakashuomingEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<WeidakashuomingEntity> wrapper);
   	
   
}

