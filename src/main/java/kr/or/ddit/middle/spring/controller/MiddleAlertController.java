package kr.or.ddit.middle.spring.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.middle.spring.service.RecipeService;
import kr.or.ddit.middle.spring.service.UserService;
import kr.or.ddit.middle.spring.vo.RecipeReviewVO;
import kr.or.ddit.middle.spring.vo.RecipeVO;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.activation.CommandMap;
import javax.activation.MailcapCommandMap;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;



@RequestMapping("middleAlert")
@Controller
public class MiddleAlertController {
	
	@Resource(name="RecipeServiceImpl")
	private RecipeService recipeService; 
	
	@Resource(name="UserServiceImpl")
	private UserService userService;
	
	//�Ű� 
	   
	   @RequestMapping("alert")
	   public String recipealert(String id4 , String rbcod , Model model ){
		   //�ش� �����ǿ� ���ؼ� �Ű��ϸ� alert �÷��� 'x' ǥ�� 
		  int res = recipeService.alertRecipe(rbcod); 
		  String result = ""; 
		  //������ ���ڵ� 
		  final String bodyEncoding = "UTF-8";

			

			String subject = "�����ڴ�"  + rbcod + "�����ǿ� ����  �Ű� ���Խ��ϴ�.";

			//���� �̸��� �ּ�: . 

			String fromEmail = "leesujung0527@gmail.com"; 

			String fromUsername = "Cooke Market Manager";

			//���� �̸��� �ּ� : �����ڵ��� �̸����� , �� �����ؼ� �������� ���� ���� "�̸���1, �̸���2 "; 

			String toEmail = "leesujung0527@gmail.com";

			//���� ���� 

			final String username = "leesujung0527@gmail.com";

			//�߱޹��� ��й�ȣ

			final String password = "ofcu fcfs viuz nagc"; 

			

			

			//���Ͽ� ����� �ؽ�Ʈ

			

			StringBuffer sb = new StringBuffer();

			sb.append("<h1>�ȳ��ϼ��� �����ڴ� �˶��� �Խ��ϴ�.</h1>\n");

			sb.append("<h4>" + rbcod + "�Խñ��� �Ű� ���Խ��ϴ�. Ȯ�κ�Ź�����</h4>\n" + id4 + "���� �ۼ��Ͻ� �Խñ��Դϴ�. " );
			

			String html = sb.toString();

			

			//���� �ɼ� ����

			

			Properties props = new Properties();

			props.put("mail.transport.protocol", "smtp");

			 props.put("mail.smtp.host", "smtp.gmail.com");

		    props.put("mail.smtp.port", "465");

		    props.put("mail.smtp.auth", "true");

		 

		    props.put("mail.smtp.quitwait", "false");

		    props.put("mail.smtp.socketFactory.port", "465");

		    props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

		    props.put("mail.smtp.socketFactory.fallback", "false");

		    

		    try {

		      // ���� ����  ���� ���� ����]

		    	//import �� ã�ƺ��� 

		      Authenticator auth = new Authenticator() {

		        protected PasswordAuthentication getPasswordAuthentication() {

		          return new PasswordAuthentication(username, password);

		        }

		      };

		      

		      // ���� ���� ����

		      Session session = Session.getInstance(props, auth);

		      

		      // ���� ��/���� �ɼ� ����

		      Message message = new MimeMessage(session);

		      message.setFrom(new InternetAddress(fromEmail, fromUsername));

		      message.setRecipients(RecipientType.TO, InternetAddress.parse(toEmail, false));

		      message.setSubject(subject);

		      message.setSentDate(new Date());

		      

		      // ���� ������ ����

		      Multipart mParts = new MimeMultipart();

		      MimeBodyPart mTextPart = new MimeBodyPart();

		      MimeBodyPart mFilePart = null;

		 

		      // ���� ������ - ����

		      mTextPart.setText(html, bodyEncoding, "html");

		      mParts.addBodyPart(mTextPart);

		            

		      // ���� ������ ����

		      message.setContent(mParts);

		      

		      // MIME Ÿ�� ����

		      MailcapCommandMap MailcapCmdMap = (MailcapCommandMap) CommandMap.getDefaultCommandMap();

		      MailcapCmdMap.addMailcap("text/html;; x-java-content-handler=com.sun.mail.handlers.text_html");

		      MailcapCmdMap.addMailcap("text/xml;; x-java-content-handler=com.sun.mail.handlers.text_xml");

		      MailcapCmdMap.addMailcap("text/plain;; x-java-content-handler=com.sun.mail.handlers.text_plain");

		      MailcapCmdMap.addMailcap("multipart/*;; x-java-content-handler=com.sun.mail.handlers.multipart_mixed");

		      MailcapCmdMap.addMailcap("message/rfc822;; x-java-content-handler=com.sun.mail.handlers.message_rfc822");

		      CommandMap.setDefaultCommandMap(MailcapCmdMap);

		 

		      // ���� �߼�

		      Transport.send( message );

		      

		    } catch ( Exception e ) {

		      e.printStackTrace();

		    }

		    if(res > 0) {
		    	result = "�Ű�Ǿ����ϴ�. �������� Ȯ�����Դϴ�."; 
		    }else {
		    	result = "������ �߻��߽��ϴ�. �ٽ� �õ����ּ���"; 
		    	
		    }
		    model.addAttribute("result", result); 
		    RecipeVO oneRecipe = recipeService.viewOneRecipe(rbcod); 
			
			//���õ� ��� 1�� ���� �������� 
			List<RecipeReviewVO> replylist = recipeService.viewRecipeReply(rbcod); 
			
			model.addAttribute("oneRecipe", oneRecipe); 
			model.addAttribute("replyList", replylist);
			
			
			return "middleSpring/recipe/recipeone";
		    
	   }

}
