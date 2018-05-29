package kr.hkit.slimmall.admin.mapper;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
        "classpath:spring/context-*.xml", 
        "file:src/main/webapp/WEB-INF/config/springmvc/dispatcher-servlet.xml"})
@WebAppConfiguration
public class AdminMapperTest {

	@Autowired
	private AdminMapper adminMapper;

	@Transactional
	@Test
	public void test() {
//		AdminVO adminVO = new AdminVO();
//		adminVO.setTableName("category");
//		adminVO.setIdx(0);
//		adminVO.setName("categoryName");
//		adminMapper.deleteAdminVO(adminVO);
		AdminVO adminVO = new AdminVO();
		adminVO.setTableName("order");
		adminVO.setIdx(4);
		adminMapper.deleteAdminVO(adminVO);
		assertNotNull(adminVO);
	}

}
