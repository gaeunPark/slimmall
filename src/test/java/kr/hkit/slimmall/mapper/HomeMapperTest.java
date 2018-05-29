package kr.hkit.slimmall.mapper;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
        "classpath:spring/context-*.xml", 
        "file:src/main/webapp/WEB-INF/config/springmvc/dispatcher-servlet.xml"})
@WebAppConfiguration
public class HomeMapperTest {
	
	@Autowired
	private HomeMapper homeMapper;
	
	@Test
	public void test() {
//		String keyword = "코알라";
//		List<ProductVO> productVOs = homeMapper.selectProductVOs(keyword);
//		System.out.println("list size: " + productVOs.size()); 
		
		int categoryIdx = 5;
		String keyword = "원피스";
		List<ProductVO> productVOs = homeMapper.selectProductVO(categoryIdx, keyword);
		assertNotNull(productVOs);
		System.out.println("list size: " + productVOs.size()); 
	}

}
