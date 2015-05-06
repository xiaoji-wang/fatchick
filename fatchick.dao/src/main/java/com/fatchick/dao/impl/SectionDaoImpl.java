package com.fatchick.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.fatchick.base.dao.impl.BaseDaoImpl;
import com.fatchick.dao.SectionDao;
import com.fatchick.model.Section;

@Repository("sectionDao")
public class SectionDaoImpl extends BaseDaoImpl<Section> implements SectionDao {

	@Override
	public List<Section> get(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected List<String> getConditions() {
		List<String> conditions = new ArrayList<String>();
		return conditions;
	}

}
