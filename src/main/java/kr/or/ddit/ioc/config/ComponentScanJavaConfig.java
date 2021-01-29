package kr.or.ddit.ioc.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;



//문자열로 전체 package 를 써줘도 되고, interface(해당 인터페이스가 속한 패키지 정보만 추출해서 )를 만들어서 (basePackage 용) 
// interface이름.class 로 써줘도 된다 
@ComponentScan(basePackages = {"kr.or.ddit"})
@Configuration
public class ComponentScanJavaConfig {

}
