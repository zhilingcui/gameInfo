package com.wymbmrj.mota.zdemo.service.imp;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.wymbmrj.mota.zdemo.entity.ZDemo;
import com.wymbmrj.mota.zdemo.repository.ZDemoRepository;
import com.wymbmrj.mota.zdemo.service.ZDemoService;

@Service
public class ZDemoServiceImp implements ZDemoService {

	@Autowired
	private ZDemoRepository zDemoRepository;
	
	@Override
	public ZDemo save(ZDemo zDemo) {
		return zDemoRepository.save(zDemo);
	}

	@Override
	public Page<ZDemo> findByParams(Map<String, Object> map) {
		String name = (String) map.get("name");
		int pageNumber = Integer.valueOf((String) map.get("pageNumber"));
		int pageSize = Integer.valueOf((String) map.get("pageSize"));
		PageRequest pageRequest = PageRequest.of(pageNumber, pageSize);
		return zDemoRepository.findByNameContaining(name, pageRequest);
	}

	@Override
	public void update(ZDemo zDemo) {
		zDemoRepository.save(zDemo);
	}

	@Override
	public void deleteById(Long id) {
		zDemoRepository.deleteById(id);
	}

}
