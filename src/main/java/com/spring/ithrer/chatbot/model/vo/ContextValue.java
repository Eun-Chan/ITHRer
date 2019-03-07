package com.spring.ithrer.chatbot.model.vo;

import java.util.Map;

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
public class ContextValue {
	private String name;
	private int lifeSpan;
	private Map<String,String> params;
}
