package com.codebrew.moana.test.statistics;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.codebrew.moana.service.domain.Festival;
import com.codebrew.moana.service.domain.Party;
import com.codebrew.moana.service.domain.Purchase;
import com.codebrew.moana.service.domain.QRCode;
import com.codebrew.moana.service.domain.Statistics;
import com.codebrew.moana.service.domain.User;
import com.codebrew.moana.service.purchase.PurchaseDAO;
import com.codebrew.moana.service.statistics.StatisticsDAO;

/*
 *	FileName :  UserServiceTest.java
 * ㅇ JUnit4 (Test Framework) 과 Spring Framework 통합 Test( Unit Test)
 * ㅇ Spring 은 JUnit 4를 위한 지원 클래스를 통해 스프링 기반 통합 테스트 코드를 작성 할 수 있다.
 * ㅇ @RunWith : Meta-data 를 통한 wiring(생성,DI) 할 객체 구현체 지정
 * ㅇ @ContextConfiguration : Meta-data location 지정
 * ㅇ @Test : 테스트 실행 소스 지정
 */
@RunWith(SpringJUnit4ClassRunner.class)

// ==> Meta-Data 를 다양하게 Wiring 하자...
@ContextConfiguration(locations = { "classpath:config/context-*.xml" })

// @ContextConfiguration(locations = { "classpath:config/context-common.xml" })
public class StatisticsServiceTest {

	@Autowired
	@Qualifier("statisticsDAOImpl")
	StatisticsDAO statisticsDAO;

	@Test
	public void getDailyTotalAmount() {
		
		List<Statistics> list = statisticsDAO.getDailyTotalSaleAmountStat();
		
		Assert.assertEquals(4, list.size());
	}
}