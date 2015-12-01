package com.blueshit.cookshow.common.mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MailAuthenticator extends Authenticator {

	private String username;
	private String password;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	/**
	 * 初始化邮箱密码
	 * @param username
	 * @param password
	 */
	public MailAuthenticator(String username,String password){
		this.username=username;
		this.password=password;
	}
	
	/**
	 * 复写父类方法，当需要邮箱授权登录的时候被调用
	 */
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication(username,password);
	}
	
	
}
