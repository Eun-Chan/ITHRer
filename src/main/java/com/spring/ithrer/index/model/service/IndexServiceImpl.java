package com.spring.ithrer.index.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ithrer.index.model.dao.IndexDao;

@Service
public class IndexServiceImpl implements IndexService{

	@Autowired
	IndexDao indexDao;

	
	
	
}
