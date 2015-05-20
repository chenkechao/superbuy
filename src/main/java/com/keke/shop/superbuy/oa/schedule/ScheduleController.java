package com.keke.shop.superbuy.oa.schedule;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/oa/schedule")
public class ScheduleController {
	
	private static Logger logger = LoggerFactory.getLogger(ScheduleController.class);

	@RequestMapping(value = {"/showCalendar" , ""})
	public String showCalendar() {
		return "oa/schedule/showCalendar";
	}
	
}
