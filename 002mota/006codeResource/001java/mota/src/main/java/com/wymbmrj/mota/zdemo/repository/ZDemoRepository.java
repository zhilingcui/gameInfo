package com.wymbmrj.mota.zdemo.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;

import com.wymbmrj.mota.zdemo.entity.ZDemo;

public interface ZDemoRepository extends CrudRepository<ZDemo, Long> {

	Page<ZDemo> findByNameContaining(String name, Pageable pageable);
}
