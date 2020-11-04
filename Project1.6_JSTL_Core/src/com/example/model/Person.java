package com.example.model;

public class Person {
	private String fullName;
	private int age;
	private boolean goldCustomer;
	
	public Person() {
	}
	
	public Person(String fullName, int age, boolean goldCustomer) {
		super();
		this.fullName = fullName;
		this.age = age;
		this.goldCustomer = goldCustomer;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public boolean layRaThuocTinhGoldCustomer() {
		return goldCustomer;
	}

	public void setGoldCustomer(boolean goldCustomer) {
		this.goldCustomer = goldCustomer;
	}
}
