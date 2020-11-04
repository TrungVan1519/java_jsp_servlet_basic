package com.example.model;

public class CheckingString {
	private String string;
	
	public CheckingString(String string){
		this.string = string;
	}
	
	public String makeItLower() {
		return string.toLowerCase();
	}
}
