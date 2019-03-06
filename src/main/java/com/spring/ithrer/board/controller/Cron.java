package com.spring.ithrer.board.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class Cron {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	


    /**
     * 매일 22시에 수행
     */    
    @Scheduled(cron="0 00 22 * * ?")
    public void download() {
        System.out.println("download");
    }
}
