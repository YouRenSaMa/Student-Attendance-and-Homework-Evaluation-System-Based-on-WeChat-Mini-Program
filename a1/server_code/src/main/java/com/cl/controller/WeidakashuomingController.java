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

import com.cl.entity.WeidakashuomingEntity;
import com.cl.entity.view.WeidakashuomingView;

import com.cl.service.WeidakashuomingService;
import com.cl.service.TokenService;
import com.cl.utils.PageUtils;
import com.cl.utils.R;
import com.cl.utils.MPUtil;
import com.cl.utils.MapUtils;
import com.cl.utils.CommonUtil;

/**
 * 未打卡说明
 * 后端接口
 * @author 
 * @email 
 * @date 2025-03-12 22:29:29
 */
@RestController
@RequestMapping("/weidakashuoming")
public class WeidakashuomingController {
    @Autowired
    private WeidakashuomingService weidakashuomingService;









    /**
     * 后台列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,WeidakashuomingEntity weidakashuoming,
                                                                                                                                            HttpServletRequest request){
                    String tableName = request.getSession().getAttribute("tableName").toString();
                                                                        if(tableName.equals("xuesheng")) {
                    weidakashuoming.setXuehao((String)request.getSession().getAttribute("username"));
                                    }
                                                                                                                                                                                                                                                                    EntityWrapper<WeidakashuomingEntity> ew = new EntityWrapper<WeidakashuomingEntity>();
                                                                                                                                                                                                                        
        
        
        PageUtils page = weidakashuomingService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, weidakashuoming), params), params));
        return R.ok().put("data", page);
    }







    /**
     * 前端列表
     */
	@IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,WeidakashuomingEntity weidakashuoming,
		HttpServletRequest request){
        EntityWrapper<WeidakashuomingEntity> ew = new EntityWrapper<WeidakashuomingEntity>();

		PageUtils page = weidakashuomingService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, weidakashuoming), params), params));
        return R.ok().put("data", page);
    }

	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( WeidakashuomingEntity weidakashuoming){
       	EntityWrapper<WeidakashuomingEntity> ew = new EntityWrapper<WeidakashuomingEntity>();
      	ew.allEq(MPUtil.allEQMapPre( weidakashuoming, "weidakashuoming")); 
        return R.ok().put("data", weidakashuomingService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(WeidakashuomingEntity weidakashuoming){
        EntityWrapper< WeidakashuomingEntity> ew = new EntityWrapper< WeidakashuomingEntity>();
 		ew.allEq(MPUtil.allEQMapPre( weidakashuoming, "weidakashuoming")); 
		WeidakashuomingView weidakashuomingView =  weidakashuomingService.selectView(ew);
		return R.ok("查询未打卡说明成功").put("data", weidakashuomingView);
    }
	
    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        WeidakashuomingEntity weidakashuoming = weidakashuomingService.selectById(id);
		weidakashuoming = weidakashuomingService.selectView(new EntityWrapper<WeidakashuomingEntity>().eq("id", id));
        return R.ok().put("data", weidakashuoming);
    }

    /**
     * 前端详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        WeidakashuomingEntity weidakashuoming = weidakashuomingService.selectById(id);
		weidakashuoming = weidakashuomingService.selectView(new EntityWrapper<WeidakashuomingEntity>().eq("id", id));
        return R.ok().put("data", weidakashuoming);
    }
    



    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody WeidakashuomingEntity weidakashuoming, HttpServletRequest request){
    	//ValidatorUtils.validateEntity(weidakashuoming);
        weidakashuomingService.insert(weidakashuoming);
        return R.ok();
    }
    
    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody WeidakashuomingEntity weidakashuoming, HttpServletRequest request){
    	//ValidatorUtils.validateEntity(weidakashuoming);
        weidakashuomingService.insert(weidakashuoming);
        return R.ok();
    }



    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody WeidakashuomingEntity weidakashuoming, HttpServletRequest request){
        //ValidatorUtils.validateEntity(weidakashuoming);
        weidakashuomingService.updateById(weidakashuoming);//全部更新
        return R.ok();
    }

    /**
     * 审核
     */
    @RequestMapping("/shBatch")
    @Transactional
    public R update(@RequestBody Long[] ids, @RequestParam String sfsh, @RequestParam String shhf){
        List<WeidakashuomingEntity> list = new ArrayList<WeidakashuomingEntity>();
        for(Long id : ids) {
            WeidakashuomingEntity weidakashuoming = weidakashuomingService.selectById(id);
            weidakashuoming.setSfsh(sfsh);
            weidakashuoming.setShhf(shhf);
            list.add(weidakashuoming);
        }
        weidakashuomingService.updateBatchById(list);
        return R.ok();
    }


    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        weidakashuomingService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
    
	









}
