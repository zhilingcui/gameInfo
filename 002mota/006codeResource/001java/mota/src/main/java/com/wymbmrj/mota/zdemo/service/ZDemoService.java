package com.wymbmrj.mota.zdemo.service;

import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import com.wymbmrj.mota.zdemo.entity.ZDemo;

@Service
public interface ZDemoService {
	
	// 添加、查询、修改、删除
	public ZDemo save(ZDemo zDemo);
	
	public Page<ZDemo> findByParams(Map<String, Object> map);
	
	public void update(ZDemo zDemo);
	
	public void deleteById(Long id);
}
