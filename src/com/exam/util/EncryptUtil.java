package com.exam.util;

import java.math.BigInteger;
import java.security.MessageDigest;

/**
 * ʹ��SHA(��ȫɢ���㷨)�����ݽ��м���
 */
public class EncryptUtil {
	
	public static final String KEY_SHA = "SHA";

	/**
	 * ��ȡ���ܽ��
	 * @param inputStr �����ܵ�����
	 * @return ���ܽ��
	 */
	public static String getResult(String inputStr) {
		BigInteger sha =null;
		byte[] inputData = inputStr.getBytes();
		try {
			MessageDigest messageDigest = MessageDigest.getInstance(KEY_SHA);
			messageDigest.update(inputData);
			sha = new BigInteger(messageDigest.digest());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sha.toString(32);
	}
}
