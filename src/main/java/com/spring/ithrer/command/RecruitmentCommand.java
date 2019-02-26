package com.spring.ithrer.command;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.spring.ithrer.company.model.vo.Recruitment;
import com.spring.ithrer.index.model.service.IndexService;

public class RecruitmentCommand implements ICommand{
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	IndexService indexService;
	
	@Override
	public String execute() {
		
		String result = "";
		
		// 최근 공고 6개 가져오기
		List<Recruitment> recruitment = indexService.selectListRecruitment("");
		
		for(int i = 0 ; i < recruitment.size(); i++) {
			Recruitment rec = recruitment.get(i);
			result += i+". " + rec.getCompName()
				    + "모집분야 : " + rec.getRecruitmentTitle() + "\n"
				    + "지원자격" + "\n"
				    + "(하트)(하트)(하트)\n"
				    + "경력 : " + rec.getCareer() + "\n"
				    + "고용형태 : " + rec.getEmploymentType() + "\n"
				    + "학력 : " + rec.getEducation() + "\n"
				    + "급여 : " + rec.getPayCondition() + "\n"
				    + "우대 : " + rec.getEmploymentPreference() + "\n"
				    + "지역 : " + rec.getLocation() + "\n"
				    + "접수 시작일 : " + rec.getOpeningDate() + "\n"
				    + "접수 마감일 : " + rec.getClosingDate() + "\n"
				    + "ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ\n\n";
		}
		
		result = result.replace("null" ,"");
		
		return result;
	}
	
}
