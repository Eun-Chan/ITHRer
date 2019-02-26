package com.spring.ithrer.chatbot.model.vo;

public class Message {
	
	private String text;
	private Photo photo;
	private MessageButton message_button;
	
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public Photo getPhoto() {
		return photo;
	}
	public void setPhoto(Photo photo) {
		this.photo = photo;
	}
	public MessageButton getMessage_button() {
		return message_button;
	}
	public void setMessage_button(MessageButton message_button) {
		this.message_button = message_button;
	}
}
