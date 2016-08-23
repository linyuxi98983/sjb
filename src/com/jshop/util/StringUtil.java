package com.jshop.util;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import org.apache.commons.lang.StringUtils;

/**
 * 字符串工具类
 * 
 * @author Jakcy Shen
 */
public class StringUtil {

	/**
	 * 字符解码 如：前台js使用encodeURIComponent加码时可使用该方法进行解码
	 * 
	 * @param str
	 * @param encoding
	 * @return
	 */
	public static String decode(String str, String encoding) {
		try {
			str = java.net.URLDecoder.decode(str, encoding);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return str;
	}

	public static String decode(String str) {
		return decode(str, "UTF-8");
	}

	/**
	 * 将数组转List
	 */
	public static <T> List<T> arrayToList(T[] arr) {
		List<T> list = new ArrayList<T>();
		for (T t : arr) {
			list.add(t);
		}
		return list;
	}

	/**
	 * 去除数组重复项
	 */
	public static <T> List<T> removeReapter(T[] arr) {
		List<T> list = arrayToList(arr);
		List<T> list2 = new ArrayList<T>();
		for (T t : list) {
			if (!list2.contains(t)) {
				list2.add(t);
			}
		}
		return list2;
	}

	/**
	 * 去除以suffix结尾的字符串str
	 */
	public static String subEnd(String str, String suffix) {
		if (StringUtils.isEmpty(str) || StringUtils.isEmpty(suffix)) {
			return str;
		}
		if (str.endsWith(suffix)) {
			str = str.substring(0, str.length() - suffix.length());
		}
		return str;
	}

	/**
	 * 去除以prefix开始的字符串str
	 */
	public static String subStart(String str, String prefix) {
		if (StringUtils.isEmpty(str) || StringUtils.isEmpty(prefix)) {
			return str;
		}
		if (str.startsWith(prefix)) {
			str = str.substring(prefix.length());
		}
		return str;
	}

	/**
	 * 去除以fix开始与结束的字符串str
	 */
	public static String subTrim(String str, String fix) {
		return (str = subStart(subEnd(str, fix), fix));
	}

	/**
	 * 随机获取UUID字符串(无中划线)
	 * 
	 * @return UUID字符串
	 */
	public static String getUUID() {
		String uuid = UUID.randomUUID().toString();
		return uuid.substring(0, 8) + uuid.substring(9, 13)
				+ uuid.substring(14, 18) + uuid.substring(19, 23)
				+ uuid.substring(24);
	}

	/**
	 * 将字符串首字母变大写
	 * 
	 * @param str
	 * @return
	 */
	public static String toFirstUpperCase(String str) {
		if (str.isEmpty()) {
			return str;
		}
		return str.substring(0, 1).toUpperCase() + str.substring(1);
	}

	/**
	 * 随机获取字符串
	 * 
	 * 
	 * @param length
	 *            随机字符串长度
	 * 
	 * 
	 * @return 随机字符串
	 */
	public static String getRandomString(int length) {
		if (length <= 0) {
			return "";
		}
		char[] randomChar = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
				'q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p', 'a', 's',
				'd', 'f', 'g', 'h', 'j', 'k', 'l', 'z', 'x', 'c', 'v', 'b',
				'n', 'm' };
		Random random = new Random();
		StringBuffer stringBuffer = new StringBuffer();
		for (int i = 0; i < length; i++) {
			stringBuffer.append(randomChar[Math.abs(random.nextInt())
					% randomChar.length]);
		}
		return stringBuffer.toString();
	}

	/**
	 * 根据指定长度 分隔字符串
	 * 
	 * 
	 * @param str
	 *            需要处理的字符串
	 * 
	 * @param length
	 *            分隔长度
	 * 
	 * @return 字符串集合
	 */
	public static List<String> splitString(String str, int length) {
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < str.length(); i += length) {
			int endIndex = i + length;
			if (endIndex <= str.length()) {
				list.add(str.substring(i, i + length));
			} else {
				list.add(str.substring(i, str.length() - 1));
			}
		}
		return list;
	}

	/**
	 * 将字符串List转化为字符串，以分隔符间隔.
	 * 
	 * @param list
	 *            需要处理的List.
	 * 
	 * @param separator
	 *            分隔符.
	 * 
	 * @return 转化后的字符串
	 */
	public static String toString(List<String> list, String separator) {
		StringBuffer stringBuffer = new StringBuffer();
		for (String str : list) {
			stringBuffer.append(separator + str);
		}
		stringBuffer.deleteCharAt(0);
		return stringBuffer.toString();
	}

	public static String[] getStrArr(String str, String split) {
		String[] strArr = str.split(",");
		return strArr;
	}

	public static Integer[] getIntArr(String str, String split) {
		String[] strArr = getStrArr(str, split);
		Integer[] intArr = new Integer[strArr.length];
		for (int i = 0; i < strArr.length; i++) {
			intArr[i] = Integer.parseInt(strArr[i].trim());
		}
		return intArr;
	}
}
