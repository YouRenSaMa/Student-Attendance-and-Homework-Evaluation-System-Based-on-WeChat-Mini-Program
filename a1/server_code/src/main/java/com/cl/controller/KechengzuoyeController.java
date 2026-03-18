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

import com.cl.entity.KechengzuoyeEntity;
import com.cl.entity.view.KechengzuoyeView;

import com.cl.service.KechengzuoyeService;
import com.cl.service.TokenService;
import com.cl.utils.PageUtils;
import com.cl.utils.R;
import com.cl.utils.MPUtil;
import com.cl.utils.MapUtils;
import com.cl.utils.CommonUtil;

/**
 * 课程作业
 * 后端接口
 * @author 
 * @email 
 * @date 2025-03-12 22:29:29
 */
@RestController
@RequestMapping("/kechengzuoye")
public class KechengzuoyeController {
    @Autowired
    private KechengzuoyeService kechengzuoyeService;









    /**
     * 后台列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,KechengzuoyeEntity kechengzuoye,
                                                                                HttpServletRequest request){
                                    EntityWrapper<KechengzuoyeEntity> ew = new EntityWrapper<KechengzuoyeEntity>();
                                                                                                                    
        
        
        PageUtils page = kechengzuoyeService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, kechengzuoye), params), params));
        return R.ok().put("data", page);
    }







    /**
     * 前端列表
     */
	@IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,KechengzuoyeEntity kechengzuoye,
		HttpServletRequest request){
        EntityWrapper<KechengzuoyeEntity> ew = new EntityWrapper<KechengzuoyeEntity>();

		PageUtils page = kechengzuoyeService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, kechengzuoye), params), params));
        return R.ok().put("data", page);
    }

	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( KechengzuoyeEntity kechengzuoye){
       	EntityWrapper<KechengzuoyeEntity> ew = new EntityWrapper<KechengzuoyeEntity>();
      	ew.allEq(MPUtil.allEQMapPre( kechengzuoye, "kechengzuoye")); 
        return R.ok().put("data", kechengzuoyeService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(KechengzuoyeEntity kechengzuoye){
        EntityWrapper< KechengzuoyeEntity> ew = new EntityWrapper< KechengzuoyeEntity>();
 		ew.allEq(MPUtil.allEQMapPre( kechengzuoye, "kechengzuoye")); 
		KechengzuoyeView kechengzuoyeView =  kechengzuoyeService.selectView(ew);
		return R.ok("查询课程作业成功").put("data", kechengzuoyeView);
    }
	
    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        KechengzuoyeEntity kechengzuoye = kechengzuoyeService.selectById(id);
		kechengzuoye = kechengzuoyeService.selectView(new EntityWrapper<KechengzuoyeEntity>().eq("id", id));
        return R.ok().put("data", kechengzuoye);
    }

    /**
     * 前端详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        KechengzuoyeEntity kechengzuoye = kechengzuoyeService.selectById(id);
		kechengzuoye = kechengzuoyeService.selectView(new EntityWrapper<KechengzuoyeEntity>().eq("id", id));
        return R.ok().put("data", kechengzuoye);
    }
    



    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody KechengzuoyeEntity kechengzuoye, HttpServletRequest request){
    	//ValidatorUtils.validateEntity(kechengzuoye);
        kechengzuoyeService.insert(kechengzuoye);
        return R.ok();
    }
    
    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody KechengzuoyeEntity kechengzuoye, HttpServletRequest request){
    	//ValidatorUtils.validateEntity(kechengzuoye);
        kechengzuoyeService.insert(kechengzuoye);
        return R.ok();
    }



    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody KechengzuoyeEntity kechengzuoye, HttpServletRequest request){
        //ValidatorUtils.validateEntity(kechengzuoye);
        kechengzuoyeService.updateById(kechengzuoye);//全部更新
        return R.ok();
    }



    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        kechengzuoyeService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
    
	









}
