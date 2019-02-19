package com.spring.ithrer.company.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.spring.ithrer.company.model.service.CompanyService;
import com.spring.ithrer.company.model.vo.Company;
import com.spring.ithrer.company.model.vo.HRManager;
import com.spring.ithrer.company.model.vo.Location;
import com.spring.ithrer.company.model.vo.Sales;

@RestController
@RequestMapping("/company")
public class CompanyController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	CompanyService companyService;
	
	@GetMapping("/info.ithrer")
	public ModelAndView selectCompanyOne(@RequestParam("compId") String compId, ModelAndView mav) {
		
		// 회사, 인사담당자, 매출액 정보 가져오기
		Map<String, Object> companyMap = companyService.selectCompanyOne(compId);
		
		
		mav.addObject("companyMap",companyMap);
		
		mav.setViewName("company/companyInfo");
		
		return mav;
	}
	
	@DeleteMapping("/hrManager")
	public Map<String, Object> deleteHrManager(@RequestParam("no") int no, @RequestParam("compId") String compId){
		return companyService.deleteHrManager(no, compId);
	}
	
	@PostMapping("/hrManager")
	public Map<String, Object> insertHrManager(HRManager hrManager){
		return companyService.insertHrManager(hrManager);
	}
	
	@PutMapping("/hrManager")
	public Map<String, Object> updateHrManager(HRManager hrManager){
		logger.debug(""+hrManager);
		return companyService.updateHrManager(hrManager);
	}
	
	@PutMapping("/info")
	public Map<String, Object> updateCompany(Company company){
		logger.debug(""+company);
		return companyService.updateCompany(company);
	}
	
	@GetMapping("/info")
	public Map<String, Object> selectCompanyOne(@RequestParam("compId") String compId){
		return companyService.selectCompanyOne(compId);
	}
	
	@PutMapping("/sales")
	public Map<String, Object> updateSales(Sales sales){
		logger.debug(""+sales);
		return companyService.updateSales(sales);
	}
	
	@PostMapping("/sales")
	public Map<String, Object> insertSales(Sales sales){
		return companyService.insertSales(sales);
	}
	
	@DeleteMapping("/sales")
	public Map<String, Object> deleteSales(Sales sales){
		return companyService.deleteSales(sales);
	}
	
	@PostMapping("/location")
	public Map<String, Object> insertLocation(Location location){
		logger.debug(""+location);
		return companyService.insertLocation(location);
	}
	
	@DeleteMapping("/location")
	public Map<String, Object> deleteLocation(Location location){
		logger.debug(""+location);
		return companyService.deleteLocation(location);
	}
	
	@PutMapping("/location")
	public Map<String, Object> updateLocation(Location location){
		logger.debug(""+location);
		return companyService.updateLocation(location);
	}
	
	@GetMapping("/recruitmentAdd.ithrer")
	public ModelAndView recruitmentAddView(ModelAndView mav) {
		mav.setViewName("company/recruitmentAdd");
		return mav;
	}
	
}
