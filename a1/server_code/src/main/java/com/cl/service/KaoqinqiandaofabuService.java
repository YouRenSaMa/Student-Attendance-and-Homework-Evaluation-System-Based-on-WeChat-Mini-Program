package com.cl.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.cl.utils.PageUtils;
import com.cl.entity.KaoqinqiandaofabuEntity;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Param;
import com.cl.entity.view.KaoqinqiandaofabuView;


/**
 * 考勤签到发布
 *
 * @author 
 * @email 
 * @date 2025-03-12 22:29:29
 */
public interface KaoqinqiandaofabuService extends IService<KaoqinqiandaofabuEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<KaoqinqiandaofabuView> selectListView(Wrapper<KaoqinqiandaofabuEntity> wrapper);
   	
   	KaoqinqiandaofabuView selectView(@Param("ew") Wrapper<KaoqinqiandaofabuEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<KaoqinqiandaofabuEntity> wrapper);
   	
   
}

