package com.cl.controller;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.text.ParseException;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

import com.cl.utils.ValidatorUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.cl.annotation.IgnoreAuth;

import com.cl.entity.KaoqinqiandaofabuEntity;
import com.cl.entity.view.KaoqinqiandaofabuView;

import com.cl.service.KaoqinqiandaofabuService;
import com.cl.service.TokenService;
import com.cl.utils.PageUtils;
import com.cl.utils.R;
import com.cl.utils.MPUtil;
import com.cl.utils.MapUtils;
import com.cl.utils.CommonUtil;

/**
 * 考勤签到发布
 * 后端接口
 * @author 
 * @email 
 * @date 2025-03-12 22:29:29
 */
@RestController
@RequestMapping("/kaoqinqiandaofabu")
public class KaoqinqiandaofabuController {
    @Autowired
    private KaoqinqiandaofabuService kaoqinqiandaofabuService;









    /**
     * 后台列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,KaoqinqiandaofabuEntity kaoqinqiandaofabu,
                                                                                HttpServletRequest request){
                                    EntityWrapper<KaoqinqiandaofabuEntity> ew = new EntityWrapper<KaoqinqiandaofabuEntity>();
                                                                                                                    
        
        
        PageUtils page = kaoqinqiandaofabuService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, kaoqinqiandaofabu), params), params));
        return R.ok().put("data", page);
    }







    /**
     * 前端列表
     */
	@IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,KaoqinqiandaofabuEntity kaoqinqiandaofabu,
		HttpServletRequest request){
        EntityWrapper<KaoqinqiandaofabuEntity> ew = new EntityWrapper<KaoqinqiandaofabuEntity>();

		PageUtils page = kaoqinqiandaofabuService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, kaoqinqiandaofabu), params), params));
        return R.ok().put("data", page);
    }

	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( KaoqinqiandaofabuEntity kaoqinqiandaofabu){
       	EntityWrapper<KaoqinqiandaofabuEntity> ew = new EntityWrapper<KaoqinqiandaofabuEntity>();
      	ew.allEq(MPUtil.allEQMapPre( kaoqinqiandaofabu, "kaoqinqiandaofabu")); 
        return R.ok().put("data", kaoqinqiandaofabuService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(KaoqinqiandaofabuEntity kaoqinqiandaofabu){
        EntityWrapper< KaoqinqiandaofabuEntity> ew = new EntityWrapper< KaoqinqiandaofabuEntity>();
 		ew.allEq(MPUtil.allEQMapPre( kaoqinqiandaofabu, "kaoqinqiandaofabu")); 
		KaoqinqiandaofabuView kaoqinqiandaofabuView =  kaoqinqiandaofabuService.selectView(ew);
		return R.ok("查询考勤签到发布成功").put("data", kaoqinqiandaofabuView);
    }
	
    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        KaoqinqiandaofabuEntity kaoqinqiandaofabu = kaoqinqiandaofabuService.selectById(id);
		kaoqinqiandaofabu = kaoqinqiandaofabuService.selectView(new EntityWrapper<KaoqinqiandaofabuEntity>().eq("id", id));
        return R.ok().put("data", kaoqinqiandaofabu);
    }

    /**
     * 前端详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        KaoqinqiandaofabuEntity kaoqinqiandaofabu = kaoqinqiandaofabuService.selectById(id);
		kaoqinqiandaofabu = kaoqinqiandaofabuService.selectView(new EntityWrapper<KaoqinqiandaofabuEntity>().eq("id", id));
        return R.ok().put("data", kaoqinqiandaofabu);
    }
    



    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody KaoqinqiandaofabuEntity kaoqinqiandaofabu, HttpServletRequest request){
    	//ValidatorUtils.validateEntity(kaoqinqiandaofabu);
        kaoqinqiandaofabuService.insert(kaoqinqiandaofabu);
        return R.ok();
    }
    
    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody KaoqinqiandaofabuEntity kaoqinqiandaofabu, HttpServletRequest request){
    	//ValidatorUtils.validateEntity(kaoqinqiandaofabu);
        kaoqinqiandaofabuService.insert(kaoqinqiandaofabu);
        return R.ok();
    }



    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody KaoqinqiandaofabuEntity kaoqinqiandaofabu, HttpServletRequest request){
        //ValidatorUtils.validateEntity(kaoqinqiandaofabu);
        kaoqinqiandaofabuService.updateById(kaoqinqiandaofabu);//全部更新
        return R.ok();
    }



    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        kaoqinqiandaofabuService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
    
	









}
