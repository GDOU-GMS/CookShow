package com.blueshit.cookshow.common.mail;

import com.blueshit.cookshow.shiro.ShiroMD5;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.mail.internet.MimeUtility;

/**
 * 邮箱工具类.
 * 
 * @author Seven.
 * @since 1.0
 */
public class MailUtils {
	/**
	 * 发送者邮箱账户.
	 */
	private static  String username = "740972287@qq.com";
	/**
	 * 发送者邮箱密码.
	 */
	private static  String password = "13729438225";
	private static  String IMAP_SMTP = "ivfjgysdmkzobcjg";
	private static  String POP3_SMTP = "pigqxfeukunibajf";

    //加密的盐
    public static final String SALT = "14(1)*%*^H5687Ijioj";

	/**
	 * 初始化并获得message对象.
	 * 
	 * @return message.
	 */
	private static  Message getMessage() {
		// 设置属性值
		Properties properties = new Properties();
		properties.put("mail.transport.protocol", "smtp");		// 邮件传输协议
		properties.put("mail.smtp.host", "smtp.qq.com");	    // smtp主机名
		properties.put("mail.smtp.port", "25");		            // 邮件服务器的端口号为指定的协议。如果没有指定使用协议的默认端口号。
        properties.put("mail.smtp.auth", "true");				// 获得授权
		
		// 获得邮箱认证器
		MailAuthenticator mailAutenticator = new MailAuthenticator(username,
                IMAP_SMTP);
		Session session = Session.getDefaultInstance(properties,
				mailAutenticator);
		Message message = new MimeMessage(session);
		return message;
	}

	/**
	 * 发送邮件.
	 * @param receiverEmail 接收邮箱
	 * @param nick	昵称
	 * @param url - 验证衔接.
	 * @throws javax.mail.MessagingException	-
	 * @throws java.io.UnsupportedEncodingException	-
	 */
	public static final void sendVerifyMail(final String receiverEmail, final String nick, 
			final String url) throws MessagingException, UnsupportedEncodingException {

		Message message = getMessage();
		//设置发信人的名称
		String senderNick = MimeUtility.encodeText("CookShow秀厨网");
		message.setFrom(new InternetAddress(senderNick + "<" + username + ">"));
		message.setRecipient(RecipientType.TO, new InternetAddress(receiverEmail));
		message.setSentDate(new Date());

		message.setSubject("CookShow请求确认您的电子邮件");
		
		message.setContent(getVerifyContent(nick, url), "text/html;charset=utf-8");

		Transport.send(message);
	}
	
	/**
	 * 格式化邮箱内容.
	 * @param nick	- 客户的昵称
	 * @param url - 验证的url
	 * @return	-
	 */
	public static final String getVerifyContent(final String nick, final String url) {
        String targetUrl = url + "?token="+getToken(nick)+"&username="+nick;
		String content =  "<font face=\"微软雅黑\">"
							+ "<div>"
								+ "<center>"
									+ "<h2>亲爱的" + nick + ",感谢您注册了cookShow网站</h2>"
									+ "<p>点击以下链接完成验证</p>"
									+ "<div style=\"width:500px;color: #5cb85c\">"
										+ "<a href=\"" + targetUrl + "\">→_点_我_验_证_←</a>"
									+ "</div>"
									+ "<div>或者</div>"
									+ "<div><a href=\""+targetUrl+"\"><pre>"+targetUrl+"</pre></div>"
									+ "<p>如果以上网址不可点击，请将它复制到浏览地址栏直接访问。</p>"
								+ "</center>"
							+ "</div>"
						+ "</font>";
		return content;
	}
	
	/**
	 * 群发邮件.
	 * @param usernames	- 收信人列表
	 * @param content	-
	 * @param subject	-
	 * @throws java.io.UnsupportedEncodingException	-
	 * @throws javax.mail.MessagingException	-
	 */
	public static final void groupSending(final List<String> usernames,
			final String content, final String subject) 
			throws UnsupportedEncodingException, MessagingException {
		    // 获得message
			Message message = getMessage();
		    // 设置发信人
			String senderNick = MimeUtility.encodeText("cookshow");	//设置发信人的名称
			message.setFrom(new InternetAddress(senderNick + "<" + username + ">"));
		
		    // 设置收件人们
		    final int num = usernames.size();
		    InternetAddress[] addresses = new InternetAddress[num];
		    for (int i = 0; i < num; i++) {
		        addresses[i] = new InternetAddress(usernames.get(i));
		    }
		    message.setRecipients(RecipientType.TO, addresses);
		    // 设置主题
		    message.setSubject(subject);
		    // 设置邮件内容
		    message.setContent(content, "text/html;charset=utf-8");
		    // 发送
		    Transport.send(message);
	}

	/**
	 * 发送忘记密码的邮箱.
	 * @param receiverEmail
	 * @param nick
	 * @param url
	 * @throws java.io.UnsupportedEncodingException
	 * @throws javax.mail.MessagingException
	 * @throws javax.mail.internet.AddressException
	 */
	public static final void sendForgetPasswordMail(final String receiverEmail, final String nick, 
			final String url) throws UnsupportedEncodingException, AddressException, MessagingException{
        String targetUrl =  url + "?token="+getToken(nick)+"&username="+nick;
		Message message = getMessage();
		//设置发信人的名称
		String senderNick = MimeUtility.encodeText("cookshow");
		message.setFrom(new InternetAddress(senderNick + "<" + username + ">"));
		message.setRecipient(RecipientType.TO, new InternetAddress(receiverEmail));
		message.setSentDate(new Date());

		message.setSubject("cookShow接收到您修改密码的请求！");
		
		message.setContent(getForgetPasswordMail(nick, targetUrl), "text/html;charset=utf-8");

		Transport.send(message);
	}
	/**
	 * 格式化邮箱
	 * @param nick
	 * @param url
	 * @return
	 */
	public static final String getForgetPasswordMail(String nick,String url){
		String content =  "<font face=\"微软雅黑\">"
				+ "<div>"
					+ "<center>"
						+ "<h2>亲爱的" + nick + ",您修改密码的请求已经接收到</h2>"
						+ "<p>点击以下链接完成密码修改</p>"
						+ "<div style=\"width:500px;color: #5cb85c\">"
							+ "<a href=\"" + url + "\">→_点_我_重_置_密_码←</a>"
						+ "</div>"
						+ "<div>或者</div>"
						+ "<div><a href=\""+url+"\"><pre>"+url+"</pre></div>"
						+ "<p>如果以上网址不可点击，请将它复制到浏览地址栏直接访问。</p>"
					+ "</center>"
				+ "</div>" 
			+ "</font>";
		return content; 
	}

    /**
     * 获取token
     * @param username
     * @return
     */
    private static String getToken(String username){
        return ShiroMD5.getMd5WithSalt(username,SALT);
    }

    public static void main(String[] args) throws Exception{
        sendVerifyMail("690793583@qq.com","ziliang","http://localhost:8080");
    }
}
