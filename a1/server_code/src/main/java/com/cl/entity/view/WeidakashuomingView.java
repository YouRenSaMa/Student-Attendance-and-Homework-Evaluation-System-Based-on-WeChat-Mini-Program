package com.cl.entity.view;

import com.cl.entity.WeidakashuomingEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;

import java.io.Serializable;
import com.cl.utils.EncryptUtil;
 

/**
 * 未打卡说明
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2025-03-12 22:29:29
 */
@TableName("weidakashuoming")
public class WeidakashuomingView  extends WeidakashuomingEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public WeidakashuomingView(){
	}
 
 	public WeidakashuomingView(WeidakashuomingEntity weidakashuomingEntity){
 	try {
			BeanUtils.copyProperties(this, weidakashuomingEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}



}
