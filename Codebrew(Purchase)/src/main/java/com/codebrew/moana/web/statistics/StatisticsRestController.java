package com.codebrew.moana.web.statistics;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/statisticsRest/*")
public class StatisticsRestController {

	public StatisticsRestController() {
		System.out.println(this.getClass());
	}

	@RequestMapping(value="json/getStatistics/{statisticsFlag}")
	public String getSatistics(@PathVariable("statisticsFlag") String statitsticsFlag) {
		
		switch(statitsticsFlag) {
			case "1":
				break;
			case "2":
				break;
			case "3":
				break;
		}
		
		return null;
	}
}
