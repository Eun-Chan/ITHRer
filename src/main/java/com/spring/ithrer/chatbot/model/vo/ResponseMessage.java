package com.spring.ithrer.chatbot.model.vo;

public class ResponseMessage {

	private Message message;
	private Keyboard keyboard;
	
	public Message getMessage() {
		return message;
	}
	public void setMessage(Message message) {
		this.message = message;
	}
	public Keyboard getKeyboard() {
		return keyboard;
	}
	public void setKeyboard(Keyboard keyboard) {
		this.keyboard = keyboard;
	}
}
