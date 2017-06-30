package kr.madison.util;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Method;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import kr.madison.common.controller.CommonController;
import kr.madison.common.vo.CommonVO;
import au.com.bytecode.opencsv.CSVReader;
import au.com.bytecode.opencsv.bean.ColumnPositionMappingStrategy;
import au.com.bytecode.opencsv.bean.CsvToBean;

public class Util extends CommonController{
	public static String getDateString(Date objDate, String strFormat) {
		String strResult = "";
		SimpleDateFormat formatter;
		
		try {
			formatter = new SimpleDateFormat(strFormat);
			
			if (objDate == null) {
				strResult = formatter.format(getCurrentTime());
			} else {
				strResult = formatter.format(objDate);
			}
		} catch(Exception e) {
			printErrorMessage(e);
		}
		
		return strResult;
	}
	
	public static Date parseDateString(String strDate, String strFormat) {
		Date objResult = null;
		SimpleDateFormat formatter = null;
		
		try {
			formatter = new SimpleDateFormat(strFormat);
			objResult = formatter.parse(strDate);
		} catch (Exception e) {
			printErrorMessage(e);
		}
		
		return objResult;
	}
	
	public static Timestamp getCurrentTime() {
		Timestamp tsResult = null;
		SimpleDateFormat formatter;
		Calendar cal;
		String strToday;
		
		try {
			formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			cal = Calendar.getInstance();
			strToday = formatter.format(cal.getTime());
			tsResult = Timestamp.valueOf(strToday);
		} catch(Exception e) {
			printErrorMessage(e);
		}
		
		return tsResult;
	}
	
	public static String getDate() {
		String strResult = "";
		
		try {
			strResult = getDateString(getCurrentTime(), "yyyy-MM-dd");
		} catch(Exception e) {
			printErrorMessage(e);
		}
		
		return strResult;
	}
	
	
	
	public static String getTime() {
		String strResult = "";
		
		try {
			strResult = getDateString(getCurrentTime(), "HH:mm:ss");
		} catch(Exception e) {
			printErrorMessage(e);
		}
		
		return strResult;
	}
	
	
	public static String getCurrentYear() {
		String strResult = "";
		
		try {
			strResult = getCurrentTime().toString().substring(0, 4);
		} catch(Exception e) {
			printErrorMessage(e);
		}
		
		return strResult;
	}
	
	public static String getCurrentMonth() {
		String strResult = "";
		
		try {
			strResult = getCurrentTime().toString().substring(5, 7);
		} catch(Exception e) {
			printErrorMessage(e);
		}
		
		return strResult;
	}
	
	public static String getCurrentDay() {
		String strResult = "";
		
		try {
			strResult = getCurrentTime().toString().substring(8, 10);
		} catch(Exception e) {
			printErrorMessage(e);
		}
		
		return strResult;
	}
	
	public static int getNumberOfDays(int year, int month) {
		int result = 0;
		
		try {
			Calendar mycal = new GregorianCalendar(year, month, 1);

			result = mycal.getActualMaximum(Calendar.DAY_OF_MONTH); 
		} catch(Exception e) {
			printErrorMessage(e);
		}
		
		return result;
	}
	
	public static String getCurrentHour() {
		String strResult = "";
		
		try {
			strResult = getCurrentTime().toString().substring(11, 13);
		} catch(Exception e) {
			printErrorMessage(e);
		}
		
		return strResult;
	}
	
	public static String getCurrentWeek() {
		String strResult = "";
		
		try {
			Calendar cal = Calendar.getInstance();
			cal.setTime(new Date());
			strResult = Integer.toString(cal.get(Calendar.WEEK_OF_MONTH)); 
		} catch(Exception e) {
			printErrorMessage(e);
		}
		
		return strResult;
	}
	public static String getCurrentDayOfWeek() {
		String strResult = "";
		
		try {
			strResult = getDateString(getCurrentTime(), "F");
		} catch(Exception e) {
			printErrorMessage(e);
		}
		
		return strResult;
	}
	
	public static String changeDateFormat(String strDate, String srcFormat, String destFormat) {
		
		Date date = null;
		SimpleDateFormat sdf = null;
		try {
			DateFormat format = new SimpleDateFormat(srcFormat);		
			date = (Date)format.parse(strDate);
			sdf = new SimpleDateFormat(destFormat);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return sdf.format(date);
	}
	
	public static String getStrDateByUnixTimestamp(String uts, String format) {
		format = nvl(format, "yyyy-MM-dd");
		Date date = new Date(Long.parseLong(uts) * 1000);
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		
		return sdf.format(date);
	}
	
	public static String getRandomString(int iLength) {
		Random random = new Random();
		long r1 = random.nextLong();
		long r2 = random.nextLong();
		String hash1 = Long.toHexString(r1);
		String hash2 = Long.toHexString(r2);
		
		return (hash1 + hash2).substring(0, iLength);
	}
	public static String getRandomString() {
		return getRandomString(32);
	}
	
	public static String encryptSHA256(String strParameter) throws Exception {
		StringBuilder sb = new StringBuilder();
		
		MessageDigest sha = MessageDigest.getInstance("SHA-256");
		sha.update(strParameter.getBytes("UTF-8"));

		byte[] digest = sha.digest();
		for (int i=0; i < digest.length; i++) {
			sb.append(Integer.toString((digest[i] & 0xff) + 0x100, 16).substring(1));
		}
		
		return sb.toString();
	}
	public static String nvl(Object objParameter) {
		String strResult = "";

		try {
			if (objParameter == null) {
				strResult = "";
			} else {
				strResult = objParameter.toString();
			}

		} catch (Exception e) {
			e.printStackTrace();
			printErrorMessage(e);
		}

		return strResult;
	}
	
	public static String nvl(String strParameter) {
		String strResult = "";

		try {
			if (strParameter == null) {
				strResult = "";
			} else {
				strResult = strParameter;
			}

		} catch (Exception e) {
			e.printStackTrace();
			printErrorMessage(e);
		}

		return strResult;
	}
	
	public static String nvl(Object objParameter, String strReplace) {
		String strResult = "";

		try {
			if (objParameter == null || objParameter.equals("")) {
				strResult = strReplace;
			} else {
				strResult = objParameter.toString();
			}
		} catch (Exception e) {
			e.printStackTrace();
			printErrorMessage(e);
		}

		return strResult;
	}
	public static int nvl(Object objParameter, int iReplace) {
		int iResult = 0;

		try {
			if (objParameter == null || objParameter.equals("")) {
				iResult = iReplace;
			} else {
				iResult = Integer.parseInt(objParameter.toString());
			}

		} catch (Exception e) {
			e.printStackTrace();
			printErrorMessage(e);
		}

		return iResult;
	}

	public static String nvl(String strParameter, String strReplace) {
		String strResult = "";

		try {
			if (strParameter == null || strParameter.equals("")) {
				strResult = strReplace;
			} else {
				strResult = strParameter;
			}

		} catch (Exception e) {
			e.printStackTrace();
			printErrorMessage(e);
		}

		return strResult;
	}
	
	public static int nvl(String strParameter, int iReplace) {
		int iResult = 0;

		try {
			if (strParameter == null || strParameter.equals("")) {
				iResult = iReplace;
			} else {
				iResult = Integer.parseInt(strParameter);
			}

		} catch (Exception e) {
			e.printStackTrace();
			printErrorMessage(e);
		}

		return iResult;
	}
	
	public static String getComma(Number nNum, int iPointCount) {
		StringBuffer sb = new StringBuffer();
		sb.append("#,###");
		
		// Double형일 경우 소수점 처리
		if (iPointCount < 0) iPointCount = 0;
		if (iPointCount>0)
		{
			sb.append(".");
			for (int i=0; i<iPointCount; i++) sb.append("0");
		}
		
		DecimalFormat dFm = new DecimalFormat(sb.toString());
		return dFm.format(nNum);
	}
	public static String getComma(Number nNum) {
		return getComma(nNum, 0);
	}
	public static String intFormat(int iNum, int n) {
		if (n<0) n = 0;

		StringBuffer sb = new StringBuffer();		
		
		if (n>0)
		{
			for (int i=0; i<n; i++) sb.append("0");
		}
		DecimalFormat iFm = new DecimalFormat(sb.toString());
		return iFm.format(iNum);
	}
	public static String intFormat(String strNum, int n) {
		try{
			int iNum = Integer.parseInt(strNum);
			return intFormat(iNum, n);		
		}
		catch(Exception e)
		{
			return strNum;
		}
	}
	
	public static String doubleFormat(Double dNum, int n) {
		if (n<0) n = 0;

		StringBuffer sb = new StringBuffer();		
		sb.append("0");
		
		if (n>0)
		{
			sb.append(".");
			for (int i=0; i<n; i++) sb.append("0");
		}
		DecimalFormat dFm = new DecimalFormat(sb.toString());
		return dFm.format(dNum);
	}
	public static void printErrorMessage(Exception e) {
		String strClassName = "";
		String strMethodName = "";
		int iLineNumber = 0;
		StringBuffer strLog = new StringBuffer();
		
		StackTraceElement[] stacks = e.getStackTrace();
		StackTraceElement currentStack = stacks[ 0 ];
		
		strClassName = currentStack.getClassName();
		strMethodName = currentStack.getMethodName();
		iLineNumber = currentStack.getLineNumber();
		
		e.printStackTrace();
		
		strLog.append("[Error Log]\n");
		strLog.append("\tClassName : " + strClassName + "\n");
		strLog.append("\tMethodName : " + strMethodName + "\n");
		strLog.append("\tLineNumber : " + iLineNumber + "\n");
		strLog.append("\tError Message : " + e.getMessage());
		
		System.out.println(strLog.toString());
	}
	
	public static String escapeSql(String strParameter) {
		String strResult = null;
		
		try {
			if (strParameter != null) {
				strResult = strParameter.replaceAll("'", "")
									   .replaceAll("-", "")
									   .replaceAll(";", "")
									   .replaceAll("\"", "");
			}
		} catch (Exception e) {
			printErrorMessage(e);
		}
		
		return strResult;
	}
	
	public static boolean isView(HttpServletRequest request) {
		try {
			String strAccept = request.getHeader("Accept");
			
			if (strAccept != null && strAccept.indexOf("text/html") >= 0) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			printErrorMessage(e);
		}
		
		return false;
	}
	
	public static String getBrowser(HttpServletRequest request) {
		try {
			String header = request.getHeader("User-Agent");

			if (header.indexOf("MSIE") > -1) {
				return "MSIE";
			} else if (header.indexOf("Chrome") > -1) {
				return "Chrome";
			} else if (header.indexOf("Opera") > -1) {
				return "Opera";
			} else if (header.indexOf("Firefox") > -1) {
				return "Firefox";
			}
		} catch (Exception e) {
			printErrorMessage(e);
		}
		
		return "MSIE";
	}
	public static String getDisposition(String filename, String browser) throws UnsupportedEncodingException {
		String dispositionPrefix = "attachment;filename=";
		String encodedFilename = null;
		
		try {
			if (browser.equals("MSIE")) {
				encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
			} else if (browser.equals("Firefox")) {
				encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
			} else if (browser.equals("Opera")) {
				encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
			} else if (browser.equals("Chrome")) {
				StringBuffer sb = new StringBuffer();
				for (int i = 0; i < filename.length(); i++) {
					char c = filename.charAt(i);
					if (c > '~') {
						sb.append(URLEncoder.encode("" + c, "UTF-8"));
					} else {
						sb.append(c);
					}
				}
				encodedFilename = sb.toString();
			} else {
				encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
			}
		} catch (Exception e) {
			printErrorMessage(e);
		}
		
		return dispositionPrefix + encodedFilename;
	}
	
	public static int diffDay(Date startDate, Date endDate, boolean bExcludeWeekend) {
		int dayCount = 0;
		
		try {
			Calendar startCal = Calendar.getInstance();
			Calendar endCal = Calendar.getInstance();
			startCal.setTime(startDate);
			endCal.setTime(endDate);
			
			if (startCal.getTimeInMillis() > endCal.getTimeInMillis()) {
				startCal.setTime(endDate);
				endCal.setTime(startDate);
			}
		 
			do {
				startCal.add(Calendar.DAY_OF_MONTH, 1);
				if (bExcludeWeekend) {
					if (startCal.get(Calendar.DAY_OF_WEEK) != Calendar.SATURDAY && startCal.get(Calendar.DAY_OF_WEEK) != Calendar.SUNDAY) {
						dayCount++;
					}
				} else {
					dayCount++;
				}
			} while (startCal.getTimeInMillis() <= endCal.getTimeInMillis());
			
			if (dayCount > 0) {
				dayCount -= 1;
			}
		} catch (Exception e) {
			printErrorMessage(e);
		}
		
		return dayCount;
	}
	public static int diffWeek(Date startDate, Date endDate) {
		int weekCount = 0;
		
		try {
			Calendar startCal = Calendar.getInstance();
			Calendar endCal = Calendar.getInstance();
			startCal.setTime(startDate);
			endCal.setTime(endDate);
			
			if (startCal.getTimeInMillis() > endCal.getTimeInMillis()) {
				startCal.setTime(endDate);
				endCal.setTime(startDate);
			}
			
			weekCount = (int)((float)(endCal.getTimeInMillis() - startCal.getTimeInMillis()) / (60 * 60 * 24 * 1000) / 7);
		} catch (Exception e) {
			printErrorMessage(e);
		}
		
		return weekCount;
	}
	public static int diffMonth(Date startDate, Date endDate) {
		int monthCount = 0;
		
		try {
			Calendar startCal = Calendar.getInstance();
			Calendar endCal = Calendar.getInstance();
			startCal.setTime(startDate);
			endCal.setTime(endDate);
			
			if (startCal.getTimeInMillis() > endCal.getTimeInMillis()) {
				startCal.setTime(endDate);
				endCal.setTime(startDate);
			}
		 
			monthCount = (endCal.get(Calendar.YEAR) * 12 + endCal.get(Calendar.MONTH) + 1) - (startCal.get(Calendar.YEAR) * 12 + startCal.get(Calendar.MONTH) + 1);
		} catch (Exception e) {
			printErrorMessage(e);
		}
		
		return monthCount;
	}
	public static int diffSecond(Date startDate, Date endDate) {
		int second = 0;
		
		try {
			Calendar startCal = Calendar.getInstance();
			Calendar endCal = Calendar.getInstance();
			startCal.setTime(startDate);
			endCal.setTime(endDate);
			
			if (startCal.getTimeInMillis() > endCal.getTimeInMillis()) {
				startCal.setTime(endDate);
				endCal.setTime(startDate);
			}
			
			second = (int)((endCal.getTimeInMillis() - startCal.getTimeInMillis()) / 1000);
		} catch (Exception e) {
			printErrorMessage(e);
		}
		
		return second;
	}
	public static Date addDay(Date date, int day, boolean bExcludeWeekend) {
		Calendar cal = Calendar.getInstance();
		
		try {
			cal.setTime(date);
			for (int i = 0; i < Math.abs(day); i++) {
				if (day > 0) {
					// 정방향
					cal.add(Calendar.DAY_OF_MONTH, 1);
					if (bExcludeWeekend) {
						if (cal.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY) {
							cal.add(Calendar.DAY_OF_MONTH, 2);
						} else if (cal.get(Calendar.DAY_OF_WEEK) == Calendar.SUNDAY) {
							cal.add(Calendar.DAY_OF_MONTH, 1);
						}
					}
				} else {
					// 역방향
					cal.add(Calendar.DAY_OF_MONTH, -1);
					if (bExcludeWeekend) {
						if (cal.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY) {
							cal.add(Calendar.DAY_OF_MONTH, -1);
						} else if (cal.get(Calendar.DAY_OF_WEEK) == Calendar.SUNDAY) {
							cal.add(Calendar.DAY_OF_MONTH, -2);
						}
					}
				}
			}
		} catch (Exception e) {
			printErrorMessage(e);
		}
		
		return cal.getTime();
	}
	public static Date addWeek(Date date, int week) {
		Calendar cal = Calendar.getInstance();
		
		try {
			cal.setTime(date);
			for (int i = 0; i < Math.abs(week); i++) {
				if (week > 0) {
					// 정방향
					cal.add(Calendar.WEEK_OF_YEAR, 1);
				} else {
					// 역방향
					cal.add(Calendar.WEEK_OF_YEAR, -1);
				}
			}
		} catch (Exception e) {
			printErrorMessage(e);
		}
		
		return cal.getTime();
	}
	public static Date addMonth(Date date, int month) {
		Calendar cal = Calendar.getInstance();
		
		try {
			cal.setTime(date);
			for (int i = 0; i < Math.abs(month); i++) {
				if (month > 0) {
					// 정방향
					cal.add(Calendar.MONTH, 1);
				} else {
					// 역방향
					cal.add(Calendar.MONTH, -1);
				}
			}
		} catch (Exception e) {
			printErrorMessage(e);
		}
		
		return cal.getTime();
	}
	public static String getDurationString(int seconds) {
		String strResult = "";
		try {
			int hours = seconds / 3600;
			int remainder = seconds % 3600;
			int minutes = remainder / 60;
			seconds = remainder % 60;
			
			strResult = ((hours < 10 ? "0":"") + hours
					+ ":" + (minutes < 10 ? "0":"") + minutes
					+ ":" + (seconds< 10 ? "0":"") + seconds);
		} catch (Exception e) {
			printErrorMessage(e);
		}
		
		return strResult;
	}
	public static String getDurationStringHHMM(int seconds) {
		String strResult = "";
		try {
			int hours = seconds / 3600;
			int remainder = seconds % 3600;
			int minutes = remainder / 60;
			seconds = remainder % 60;
			
			strResult = ((hours < 10 ? "0":"") + hours
					+ ":" + (minutes < 10 ? "0":"") + minutes);
		} catch (Exception e) {
			printErrorMessage(e);
		}
		
		return strResult;
	}
	public static String getFileExtension(String fileName) {
		String strResult = "";
		try {
			if (fileName != null) {
				strResult = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length());
			}
		} catch (Exception e) {
			printErrorMessage(e);
		}
		
		return strResult;
	}
	
	public static String ListToCSV(String headerList[][], List<?> objList) {
		StringBuilder sb = new StringBuilder();
		
		try {
			for (int i = 0; i < headerList.length; i++) {
				sb.append("\"" + headerList[i][1] + "\"");
				if (i < headerList.length - 1) {
					sb.append(",");
				}
			}
			sb.append("\n");
			for (Object vo : objList) {
				for (int i = 0; i < headerList.length; i++) {
					String fieldName = headerList[i][0];
					try {
						Method method = vo.getClass().getMethod("get" + Capitalize(fieldName), null);
						String retVal = (String)method.invoke(vo);
						if (retVal != null) {
							retVal = retVal.replaceAll("\"", "\"\"");
						}
						sb.append("\"" + retVal  + "\"");
						if (i < headerList.length - 1) {
							sb.append(",");
						}
					} catch (Exception e) {
					}
				}
				sb.append("\n");
			}
		} catch (Exception e) {
			printErrorMessage(e);
		}
		
		return sb.toString();
	}
	public static List<?> CSVToList(String headerList[], Class<?> voType, InputStream csv) {
		List<?> list = null;
		
		try {
			CSVReader reader = new CSVReader(new InputStreamReader(csv, "UTF-8"));
			ColumnPositionMappingStrategy cpms = new ColumnPositionMappingStrategy();
			cpms.setType(voType);
			cpms.setColumnMapping(headerList);
			CsvToBean ctb = new CsvToBean();
			list = ctb.parse(cpms, reader);
			list.remove(0); // Header Column 제거
		} catch (Exception e) {
			printErrorMessage(e);
		}
		
		return list;
	}
	public static String Capitalize(String str) {
		String result = "";
		
		try {
			result = str.substring(0, 1).toUpperCase() + str.substring(1);
		} catch (Exception e) {
			result = str;
			printErrorMessage(e);
		}
		
	    return result;
	}
	
	public static void setPaging(CommonVO paramVO, int totalcount, int pageRow) {
		int pagegroup = 5;	// 페이징 그룹의 수 [1][2][3][4][5] - [6][7][8][9][10]....
		int mypage = paramVO.getMypage();	//현재 페이지
		
		if (mypage == 0) {	// 최초 진입 시 mypage가 0이므로 1으로 세팅
			mypage = 1;
		}
		
		int skiprow = (mypage * pageRow) - pageRow;	// DB에 SKIP 속성에 사용할 변수 
		int block = totalcount / pageRow;			// block = 총 게시글 수 / 한 페이지의 게시글 수 ==> 총 페이지 수 
		int startpage = (((mypage - 1)/pagegroup) * pagegroup) + 1;			//페이지 그룹의 시작점
		int endpage = ((mypage + pagegroup - 1) / pagegroup) * pagegroup;	//페이지 그룹의 끝점
		if ((totalcount % pageRow) > 0) {			// ex) 총 게시글 개수 72개면 2개가 남으므로 총 페이지 수 + 1
			block++;
		}
		
		//페이지 그룹의 끝 번호가 최종 끝 번호보다 클 경우 
		if (endpage > block) {
			endpage = block;
		}
		paramVO.setMypage(mypage);
		paramVO.setBlock(block);
		paramVO.setSkiprow(skiprow);
		paramVO.setStartpage(startpage);
		paramVO.setEndpage(endpage);
		paramVO.setPagerow(pageRow);
	}
}