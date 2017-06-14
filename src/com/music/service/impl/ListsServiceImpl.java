package com.music.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.music.entity.Lists;
import com.music.persistence.ListsMapper;
import com.music.service.ListsService;

@Service
@Transactional
public class ListsServiceImpl implements ListsService{

	@Resource
	private ListsMapper mapper;

	public List<Lists> findAll() {
		List<Lists> findAllList=mapper.findAll();
		return findAllList;
	}

	public void add(Lists lists) {
		mapper.add(lists);
	}


	public boolean update(Lists lists) {
		return mapper.update(lists);
	}

	public boolean delete(int id) {
		return mapper.delete(id);
	}

	public List<Lists> selectOne(Integer id) {
		List<Lists> selectOneLists=mapper.selectOne(id);
		return selectOneLists;
	}

	public List<Lists> findSort() {
		List<Lists> sortLists=mapper.findSort();
		return sortLists;
	}

	public List<Lists> findById(int id) {
		List<Lists> singleLists=mapper.findById(id);
		return singleLists;
	}

}
