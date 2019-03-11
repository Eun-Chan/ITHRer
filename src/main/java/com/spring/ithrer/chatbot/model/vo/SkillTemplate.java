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
public class SkillTemplate{
	private Object[] outputs;
	private QuickReply[] quickReplies;
}
