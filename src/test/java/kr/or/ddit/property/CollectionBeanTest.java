package kr.or.ddit.property;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.or.ddit.ioc.CollectionBean;

@ContextConfiguration("classpath:/kr/or/ddit/ioc/ioc.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class CollectionBeanTest {

	@Resource(name="collectionBean")
	private CollectionBean collectionBean; 
	//collectionBean 스프링 빈이 정상저그올 생성 되었는지 
	@Test
	public void CollectionBeanTest() {

	assertNotNull(collectionBean);
	
	}
	
	@Test
	public void CollectionBeanTest2() {

	assertNotNull(collectionBean.getList());
	assertEquals(collectionBean.getList().size(), 3);
	assertEquals(collectionBean.getList().get(1), "sally");
	assertEquals(collectionBean.getMap().get("usernm"), "브라운");
	
	}

}
