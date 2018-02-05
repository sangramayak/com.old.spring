package com.mvc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController
{
	@Autowired
	private LoginDao dao;
	
	@RequestMapping(value="/logins",method=RequestMethod.GET)
	public ModelAndView getLoginPage()
	{
		return new ModelAndView("login");
	}
	
	@RequestMapping(value="check",method=RequestMethod.POST)
	public ModelAndView checkLogin(@RequestParam("t1")String s1,@RequestParam("t2")String s2)
	{
		boolean b=dao.check(s1, s2);
		if(b)
		{
			return new ModelAndView("success");
		}
		else
		{
			return new ModelAndView("failure");
		}
	}
}