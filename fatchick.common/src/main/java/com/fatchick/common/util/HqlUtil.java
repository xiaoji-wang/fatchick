package com.fatchick.common.util;

import java.util.List;
import java.util.Map;

public class HqlUtil {
	public static String generateHql(String hql, List<String> conditions, Map<String, Object> params) {
		if (conditions.isEmpty() || params.isEmpty()) {
			return hql;
		}
		StringBuffer sb = new StringBuffer(hql);
		sb.append(" where ");
		int count = 0;
		for (String key : params.keySet()) {
			for (String condition : conditions) {
				if (condition.contains(key)) {
					if (count > 0) {
						sb.append(" and ");
						sb.append(" (");
						sb.append(condition);
						sb.append(") ");
					} else {
						sb.append(" (");
						sb.append(condition);
						sb.append(") ");
					}
					count++;
					break;
				}
			}
		}
		return sb.toString();
	}
}
