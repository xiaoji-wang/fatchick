package com.fatchick.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fatchick.dao.ArticleDao;
import com.fatchick.dao.SectionDao;
import com.fatchick.service.ArticleService;

@Service("articleService")
public class ArticleServiceImpl implements ArticleService {

	@Resource(name = "articleDao")
	private ArticleDao articleDao;
	@Resource(name = "sectionDao")
	private SectionDao sectionDao;

}
