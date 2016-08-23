package com.jshop.common;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.ResourceBundle;

import cn.emay.sdk.client.api.Client;

public class SmsClient {

	private static Client client = null;

	public synchronized static Client getClient() {
		if (client == null) {
			ResourceBundle bundle = ResourceBundle.getBundle("application");
			try {
				client = new Client(bundle.getString("sms.softwareSerialNo"),
						bundle.getString("sms.key"));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return client;
	}

	public static String string2Unicode(String string) {

		StringBuffer unicode = new StringBuffer();

		for (int i = 0; i < string.length(); i++) {

			// 取出每一个字符
			char c = string.charAt(i);

			// 转换为unicode
			unicode.append("\\u" + Integer.toHexString(c));
		}

		return unicode.toString();
	}

	public static Boolean sendSmsByUrl(String phoneNo, String Content)
			throws UnsupportedEncodingException {
		String url = "http://mt.10690404.com/send.do?Account=gpjj&Password=gpjj123456&Mobile="
				+ phoneNo
				+ "&Content="
				+ java.net.URLEncoder.encode(Content, "utf-8")
				+ "&Exno=0&Fmt=json";
		System.out.println(url);
		StringBuilder json = new StringBuilder();
		try {
			URL oracle = new URL(url);
			URLConnection yc = oracle.openConnection();
			BufferedReader in = new BufferedReader(new InputStreamReader(
					yc.getInputStream()));
			String inputLine = null;
			/*
			 * while ( (inputLine = in.readLine()) != null) {
			 * json.append(inputLine); }
			 */
			in.close();
		} catch (MalformedURLException e) {
		} catch (IOException e) {
		}
		System.out.println(json.toString());
		return null;
	}
}
