package com.example.demo.inrollment.system.model;

import java.util.List;

import jakarta.persistence.*;

@Entity
public class Subject {
@Id
private int s_id;
 private String subject;
 @ManyToMany(mappedBy = "subject")
 private List<Student> student;
public Subject() {
	super();
	// TODO Auto-generated constructor stub
}
public Subject(int s_id, String subject, List<Student> student) {
	super();
	this.s_id = s_id;
	this.subject = subject;
	this.student = student;
}
public int getS_id() {
	return s_id;
}
public void setS_id(int s_id) {
	this.s_id = s_id;
}
public String getSubject() {
	return subject;
}
public void setSubject(String subject) {
	this.subject = subject;
}
public List<Student> getStudent() {
	return student;
}
public void setStudent(List<Student> student) {
	this.student = student;
}
@Override
public String toString() {
	return "Subject [s_id=" + s_id + ", subject=" + subject + ", student=" + student + "]";
}
 
}
