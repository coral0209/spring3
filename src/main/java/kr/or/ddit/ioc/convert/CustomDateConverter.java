package kr.or.ddit.ioc.convert;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

public class CustomDateConverter implements Converter<String, Date> {

	
	//source ex : 2021.01-11 , yyyy-mm-dd
	//문자를 날ㅉ따로 만들기 
	private String dateFormat ; 
	
	


	public void setDateFormat(String dateFormat) {
		this.dateFormat = dateFormat;
	}



	@Override
	public Date convert(String source) {

	SimpleDateFormat sdf = new SimpleDateFormat(dateFormat);
	
	Date date = null; 
	try {
		date = sdf.parse(source);
	} catch (ParseException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} 
		
		
		return date;
	}

}
