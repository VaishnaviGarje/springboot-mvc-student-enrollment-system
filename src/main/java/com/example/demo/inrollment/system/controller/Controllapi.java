package com.example.demo.inrollment.system.controller;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.inrollment.system.model.Login;
import com.example.demo.inrollment.system.model.Student;
import com.example.demo.inrollment.system.model.Subject;

@Controller
public class Controllapi{
    
	@Autowired
	SessionFactory sf;
	
	
	@RequestMapping("home")
	public String home() {
		return "home";
	}
	@RequestMapping("userlogin")
	public String login() {
		return"login";
	}
	@PostMapping("login")
	public String loginuser(Model model,Login lg) {
		Session s=sf.openSession();
		String msg=null;
		String page = "login";
		Login dblogin=s.get(Login.class,lg.getPassword());
		if(dblogin!=null) {
			if("student.user".equals(dblogin.getUsername())) {
				page="dashboard";
			}else if("invalid.user".equals(dblogin.getUsername())) {
				msg="invalid username and password";
			}else {
				msg="invalid username and password";
			}
		}
		model.addAttribute("msg", msg);
		return page;
	}
	
	@PostMapping("enroll")
	public String enrollstudent(Model model ,Student stu){
		Session ss=sf.openSession();
		Transaction t=ss.beginTransaction();
		ss.save(stu);
		t.commit();
		String msg="you are enrolled for the subject";
		model.addAttribute("msg",msg);
		return "dashboard";
	}
	@RequestMapping("adminlogin")
	public String adminlogin() {
		return"adminlogin";
	}
	@PostMapping("adminlogin")
	public String loginadmin(Model model,Login l) {
		Session s=sf.openSession();
		String msg=null;
		String page = "adminlogin";
		Login dblogin=s.get(Login.class,l.getPassword());
		if(dblogin!=null) {
			if("admin.user".equals(dblogin.getUsername())) {
				page="viewstudents";
			}else {
				msg="invalid username and password";
			}
		}
		model.addAttribute("msg", msg);
		return page;
	}
	@RequestMapping("viewstudents")
	public String savestudent() {
		return "viewstudents";
		}
	@PostMapping("Saveuser")
	public String savestudent(Student s) {
		Session ss = sf.openSession();
		Transaction t = ss.beginTransaction();
		ss.save(s);
		t.commit();
		return "viewstudents";

	}
	@RequestMapping("viewsubjects")
	public String savesubject() {
		return "viewsubjects";
		}
	@PostMapping("viewsubjects")
	public String savesubject(Subject s) {
		Session ss = sf.openSession();
		Transaction t = ss.beginTransaction();
		ss.save(s);
		t.commit();
		return "viewsubjects";

	}
}
