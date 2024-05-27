package com.wymbmrj.mota.zdemo.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.wymbmrj.mota.common.entity.Result;
import com.wymbmrj.mota.zdemo.entity.ZDemo;
import com.wymbmrj.mota.zdemo.service.ZDemoService;

@RestController
@RequestMapping(path = "/demo")
public class ZDemoController {
	
	@Autowired
	private ZDemoService zDemoService;
	
	@GetMapping
	public Result<ZDemo> find(@RequestParam Map<String, Object> map){
		try {
			zDemoService.findByParams(map);
			return Result.ok();
		} catch (Exception e) {
			e.printStackTrace();
			return Result.fail();
		}
	}
}
