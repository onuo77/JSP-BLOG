package com.sb.util;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class CommonUtils {

	private static String INPUT_DATE_FORMAT_PATTERN = "yyyy-MM-dd'T'HH:mm";
	private static String DATE_FORMAT_PATTERN = "yyyy-MM-dd HH:mm:ss";
	private static String NUMBER_FORMAT_PATTERN = "##,###";
	
	private static SimpleDateFormat INPUT_DATE_FORMAT = new SimpleDateFormat(INPUT_DATE_FORMAT_PATTERN);
	private static SimpleDateFormat DATE_FORMAT = new SimpleDateFormat(DATE_FORMAT_PATTERN);
	private static DecimalFormat NUMBER_FORMAT = new DecimalFormat(NUMBER_FORMAT_PATTERN);
	
	/**
	 * 문자열을 숫자로 변환해서 반환한다.
	 * @param str 문자열
	 * @return 정수값, str이 null이거나 str을 숫자로 변환중 예외가 발생하면 0을 반환한다.
	 */
	public static int stringToInt(String str) {
		return stringToInt(str, 0);
	}
	
	/**
	 * 문자열을 숫자로 변환해서 반환한다.
	 * @param str 문자열
	 * @param defaultValue 문자열이 올바르지 않을 경우 반환하는 기본값 
	 * @return 정수값, str이 null이거나 str을 숫자로 변환중 예외가 발생하면 지정된 기본값을 반환한다.
	 */
	public static int stringToInt(String str, int defaultValue) {
		if(str == null) {
			return defaultValue;
		}
		
		try {
			return Integer.parseInt(str);
		} catch (NumberFormatException e) {
			return defaultValue;
		}
	}
	
	/**
	 * 날짜를 yyyy-MM-dd 형식의 문자열로 변환해서 반환한다.
	 * @param date 날짜
	 * @return yyyy-MM-dd 형식의 텍스트
	 */
	public static String dateToString(Date date) {
		if(date == null) {
			return "";
		}
		return DATE_FORMAT.format(date);
	}
	
	
	/**
	 * 날짜를 yyyy-MM-dd'T'HH:mm 형식의 문자열로 변환해서 반환한다.
	 * @param date 날짜
	 * @return yyyy-MM-dd'T'HH:mm 형식의 텍스트
	 */
	public static String dateToDateLocal(Date date) {
		if(date == null) {
			return "";
		}
		return INPUT_DATE_FORMAT.format(date);
	}
	
	/**
	 * Date로 변환해서 반환한다.
	 * @param date String타입의 날짜
	 * @return 
	 */
	public static Date StringtoDate(String date) throws ParseException{
		Date parsedDate = INPUT_DATE_FORMAT.parse(date);
		String formattedDate = DATE_FORMAT.format(parsedDate);
		return DATE_FORMAT.parse(formattedDate);
	}
	
	/**
	 * 숫자를 3자리마다 ","가 추가된 문자열로 변환해서 반환한다.
	 * @param number 숫자
	 * @return 자리수가 표시된 텍스트
	 */
	public static String numberToString(int number) {
		return NUMBER_FORMAT.format(number);
	}
	
	/**
	 * 숫자를 3자리마다 ","가 추가된 문자열로 변환해서 반환한다.
	 * @param number 숫자
	 * @return 자리수가 표시된 텍스트
	 */
	public static String numberToString(long number) {
		return NUMBER_FORMAT.format(number);
	}
}
