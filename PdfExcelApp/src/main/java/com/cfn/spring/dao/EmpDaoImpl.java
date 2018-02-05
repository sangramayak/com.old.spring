package com.cfn.spring.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class EmpDaoImpl {

	@Autowired
	private JdbcTemplate jt;
	
	public List getEmployeesList(){
		List list=jt.query("select * from emp", new EmployeeMapper());
		return list;
	}
}
