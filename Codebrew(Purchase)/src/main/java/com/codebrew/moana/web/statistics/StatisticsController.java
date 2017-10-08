package com.codebrew.moana.web.statistics;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/statistics/*")
public class StatisticsController {

	public StatisticsController() {
		System.out.println(this.getClass());
	}

}
