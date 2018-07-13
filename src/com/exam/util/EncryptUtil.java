package com.exam.util;

import java.math.BigInteger;
import java.security.MessageDigest;

/**
 * 使用SHA(安全散列算法)对数据进行加密
 */
public class EncryptUtil {
	
	public static final String KEY_SHA = "SHA";

	/**
	 * 获取加密结果
	 * @param inputStr 待加密的数据
	 * @return 加密结果
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
