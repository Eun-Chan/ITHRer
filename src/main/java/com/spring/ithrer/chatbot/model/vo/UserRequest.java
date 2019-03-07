package com.spring.ithrer.chatbot.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class UserRequest {
	private String timezone;
	private Block block;
	private String utterance;
	private String lang;
	private User user;
}
