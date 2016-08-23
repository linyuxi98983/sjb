package com.jshop.common;

public class TestSms {

	/**
	 * 发送短信、可以发送定时和即时短信 sendSMS(String[] mobiles,String smsContent, String
	 * addSerial, int smsPriority) 1、mobiles 手机数组长度不能超过1000 2、smsContent
	 * 最多500个汉字或1000个纯英文
	 * 、请客户不要自行拆分短信内容以免造成混乱、亿美短信平台会根据实际通道自动拆分、计费以实际拆分条数为准、亿美推荐短信长度70字以内
	 * 3、addSerial 附加码(长度小于15的字符串) 用户可通过附加码自定义短信类别,或添加自定义主叫号码( 联系亿美索取主叫号码列表)
	 * 4、优先级范围1~5，数值越高优先级越高(相对于同一序列号) 5、其它短信发送请参考使用手册自己尝试使用
	 */
	public static void testSendSMS() {
		try {
			// int i=SmsClient.getClient().sendSMS(new String[] {"15000000000"},
			// "即时短信","",5);//带扩展码
			String s = "【优品美妆】万物复苏，相思蔓延！思念礼包含200-20圈、95-5充值券及免运费券，9.30前上优品美妆官网回TD退订";
			String s1 = "再试试哈哈";
			int i = SmsClient.getClient().sendSMS(
					new String[] { "13148956524" }, s + s1, "", 5);// 带扩展码
			System.out.println("testSendSMS=====" + i);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 发送定时短信 sendScheduledSMSEx(String[] mobiles, String smsContent,String
	 * sendTime,String srcCharset) 1、mobiles 手机数组长度不能超过1000 2、smsContent
	 * 最多500个汉字或1000个纯英文
	 * 、请客户不要自行拆分短信内容以免造成混乱、亿美短信平台会根据实际通道自动拆分、计费以实际拆分条数为准、亿美推荐短信长度70字以内
	 * 3、sendTime 定时短信发送时间 定时时间格式为：年年年年月月日日时时分分秒秒，例如20090801123030
	 * 表示2009年8月1日12点30分30秒该条短信会发送到用户手机 4、srcCharset 字符编码，默认为"GBK"
	 * 5、其它定时短信发送请参考使用手册自己尝试使用
	 */
	public static void testsSendScheduledSMS() {
		try {
			int i = SmsClient.getClient().sendScheduledSMSEx(
					new String[] { "15000000000" }, "定时短信", "20111206160000",
					"GBK");
			System.out.println("testsSendScheduledSMS=====" + i);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void testRegistEx() {
		int i = SmsClient.getClient().registEx("939680");
		System.out.println("testTegistEx:" + i);
	}

	public static void main(String[] args) {
		// testRegistEx();
		testSendSMS();
		/*
		 * String[] phoneno = new String[] {"13148956524","13719222282"}; String
		 * code = "123"; int i = SmsClient.getClient().sendSMS(phoneno,
		 * "【优品美妆】欢迎您注册优品美妆，您的验证码是：" + code +
		 * "。请不要把验证码泄露给其他人。如非本人操作，可不用理会！","",5);
		 * System.out.println("testsSendScheduledSMS====="+i);
		 */
	}
}
