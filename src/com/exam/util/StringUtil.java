package com.exam.util;

import java.io.UnsupportedEncodingException;

/**
 * �ַ�����ز���������
 */
public class StringUtil {

	/**
	 * �����ʽת��
	 * @param str ��ת�����ַ���
	 * @return
	 */
	public static String convert(String str) {
		try {
			return (str == null) ? "" : new String(str.getBytes("ISO8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			System.err.println("UnsupportedEncodingException:" + e.getMessage());
			return "";
		}
	}
}
