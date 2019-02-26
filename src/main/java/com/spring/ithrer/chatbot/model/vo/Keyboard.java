package com.spring.ithrer.chatbot.model.vo;

import java.io.Serializable;

public class Keyboard implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private String type;
	private String[] buttons;
	
	public Keyboard(String[] buttons) {
		this.type = "buttons";
		this.buttons = buttons;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String[] getButtons() {
		return buttons;
	}

	public void setButtons(String[] buttons) {
		this.buttons = buttons;
	}
}
