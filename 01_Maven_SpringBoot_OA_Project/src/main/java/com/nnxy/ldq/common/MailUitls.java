/*package cn.itcast.shop.utils;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

 *//**
 * 邮件发送工具类
 * 
 * @author 传智.郭嘉
 * 
 */
/*
 public class MailUitls {
 *//**
 * 发送邮件的方法
 * 
 * @param to
 *            :收件人
 * @param code
 *            :激活码
 */
/*
 public static void sendMail(String to, String code) {
 *//**
 * 1.获得一个Session对象. 2.创建一个代表邮件的对象Message. 3.发送邮件Transport
 */
/*
 // 1.获得连接对象
 Properties props = new Properties();
 props.setProperty("mail.host", "localhost"); 
 Session session = Session.getInstance(props, new Authenticator() {

 @Override
 protected PasswordAuthentication getPasswordAuthentication() {
 return new PasswordAuthentication("service@lty.com", "111");
 }

 });
 // 2.创建邮件对象:
 Message message = new MimeMessage(session);
 // 设置发件人:
 try {
 message.setFrom(new InternetAddress("service@lty.com"));
 // 设置收件人:
 message.addRecipient(RecipientType.TO, new InternetAddress(to));
 // 抄送 CC 密送BCC
 // 设置标题
 message.setSubject("来自购物天堂传智商城官方激活邮件");
 // 设置邮件正文:
 message.setContent(
 "<h1>购物天堂传智商城官方激活邮件!点下面链接完成激活操作!</h1><h3><a href='http://192.168.0.104:8080/shop/user_active.action?code="
 + code
 + "'>http://192.168.36.103:8080/shop/user_active.action?code="
 + code + "</a></h3>", "text/html;charset=UTF-8");
 // 3.发送邮件:
 Transport.send(message);
 } catch (AddressException e) {
 e.printStackTrace();
 } catch (MessagingException e) {
 e.printStackTrace();
 }

 }

 public static void main(String[] args) {
 sendMail("aaa@lty.com", "11111111111111");
 }
 }
 */

package com.nnxy.ldq.common;

import java.io.IOException;
import java.io.InputStream;
import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.util.Date;
import java.util.Enumeration;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * 网络发送邮箱信息
 * 
 * @author lty
 * 
 */
public class MailUitls {

	// get all local ips

	// 获取本地计算机ipv4地址
	public String addr() {
		String str = null;
		try {
			str = null;
			Enumeration<NetworkInterface> interfs = NetworkInterface
					.getNetworkInterfaces();
			int i = 0;
			str = "";
			while (interfs.hasMoreElements()) {
				NetworkInterface interf = interfs.nextElement();
				Enumeration<InetAddress> addres = interf.getInetAddresses();

				while (addres.hasMoreElements()) {

					InetAddress in = addres.nextElement();
					if (in instanceof Inet4Address) {
						String hostAddress = in.getHostAddress();
						i += 1;
						if (i == 3) {
							str = hostAddress;
						}
					}
				}
			}
		} catch (SocketException e2) {
			e2.printStackTrace();
		}
		return str;

	}

	/**
	 * 发送邮件激活提醒注册用户
	 * 
	 * @param mail
	 * @param code
	 */
	public void sendMail(String mail, String code) {

		String addr = addr(); //此处后去失败
		//System.out.println("这他妈的是addr="+addr);
		
		//获取配置文件的发信人的邮箱账户信息
		InputStream is = this.getClass().getResourceAsStream(
				"/mailInfo.properties");
		Properties prop = new Properties();
		
		try {
			prop.load(is);// 加载资源文件
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		String smtpHost = prop.get("smtpHost").toString();// SMTP服务器名
		String from = prop.get("mailName").toString();// 发信人地址
		String pwd = prop.get("pwd").toString();// 密码
		
		System.out.println("获取读取到的配置文件信息："+smtpHost+from+pwd);
		
		String to = mail;// 收信人地址
		
		// 创建properties对象
		Properties props = new Properties();
		// 创建邮件服务器
		props.put("mail.smtp.host", smtpHost);
		
		props.put("mail.smtp.auth", "true");
		
		// 取得默认的Session
		Session session = Session.getDefaultInstance(props, null);
		System.out.println("执行到这里了呢");
		// 创建一条信息，并定义发信人地址和收信人地址
		MimeMessage message = new MimeMessage(session);
		System.out.println("执行到这里了呢");
		try {
			message.setFrom(new InternetAddress(from));
			//这里注意，要抄送一份给自己，否则发的次数多了会报错了
			//InternetAddress[] address = { new InternetAddress(to),new InternetAddress(from) };
			InternetAddress[] address = { new InternetAddress(to)};
			message.setRecipients(Message.RecipientType.TO, address);

			message.setSubject("刘大庆科技有限公司");// 设定主题

			message.setSentDate(new Date());// 设定发送时间
			// 设置邮件正文:
			message.setContent(
					"<h1>OA软件办公系统官方账号激活邮件!点下面链接完成激活操作即可登录!</h1>"
					+ "<h3>"
					+ 		"<a href='http://"
							+ "localhost"
							+ ":8888/emailcontroller"
							+ "'> 点我激活哈账号哈哈哈： "
							+ code + 
							"</a>"
					+ "</h3>", "text/html;charset=UTF-8");

			message.saveChanges(); // implicit with send()
			// 协议
			Transport transport = session.getTransport("smtp");
			
			// 发信人地址，用户名，授权码
			transport.connect(smtpHost, from, pwd);
			
			//发送邮件
			transport.sendMessage(message, message.getAllRecipients());
			
			transport.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 发送邮件重置用户密码
	 * 
	 * @param mail
	 */
	public void sendMailFindUser(String mail) {
		String addr = addr();
		InputStream is = this.getClass().getResourceAsStream(
				"/mailInfo.properties");
		Properties prop = new Properties();
		try {
			prop.load(is);// 加载资源文件
		} catch (IOException e1) {
			e1.printStackTrace();
		}

		String smtpHost = prop.get("smtpHost").toString();// SMTP服务器名
		String from = prop.get("mailName").toString();// 发信人地址
		String pwd = prop.get("pwd").toString();// 密码
		String to = mail;// 收信人地址
		// 创建properties对象
		Properties props = new Properties();
		// 创建邮件服务器
		props.put("mail.smtp.host", smtpHost);
		props.put("mail.smtp.auth", "true");

		// 取得默认的Session
		Session session = Session.getDefaultInstance(props, null);

		// 创建一条信息，并定义发信人地址和收信人地址
		MimeMessage message = new MimeMessage(session);

		try {
			message.setFrom(new InternetAddress(from));

			InternetAddress[] address = { new InternetAddress(to) };

			message.setRecipients(Message.RecipientType.TO, address);

			message.setSubject("巨人科技有限公司");// 设定主题

			message.setSentDate(new Date());// 设定发送时间
			// 设置邮件正文:
			/*message.setContent(
					"<h1>OA软件办公系统官方重置密码邮件!点下面链接完成密码重置操作!</h1><h3><a href='http://"
							+ addr + ":8080/ssm_OAManager/findUser.jsp"
							+ "'>http://" + addr
							+ ":8080/ssm_OAManager/findUser.jsp" + "</a></h3>",
					"text/html;charset=UTF-8");*/

			message.saveChanges(); // implicit with send()
			// 协议
			Transport transport = session.getTransport("smtp");
			// 发信人地址，用户名，密码
			transport.connect(smtpHost, from, pwd);
			transport.sendMessage(message, message.getAllRecipients());
			transport.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
