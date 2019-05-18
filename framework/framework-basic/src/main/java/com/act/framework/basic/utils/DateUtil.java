
package com.act.framework.basic.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.Month;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;

/**
 * ClassName: PageUtil <br/>
 * Function:  <br/>
 * Reason:	  <br/>
 * Date:      2016年12月9日 下午3:51:36 <br/>
 * @author   lyc
 * @version

 * @see
 */
public class DateUtil {
	public static LocalDateTime dateToLocalDateTime(Date date){
		Instant instant = Instant.ofEpochMilli(date.getTime());
		return LocalDateTime.ofInstant(instant, ZoneId.systemDefault());
	}
	public static LocalDate dateToLocalDate(Date date){
		Instant instant = Instant.ofEpochMilli(date.getTime());
		return LocalDateTime.ofInstant(instant, ZoneId.systemDefault()).toLocalDate();
	}
	public static LocalTime dateToLocalTime(Date date){
		Instant instant = Instant.ofEpochMilli(date.getTime());
		return LocalDateTime.ofInstant(instant, ZoneId.systemDefault()).toLocalTime();
	}

	public static Date localDateTimeToDate(LocalDateTime date){
		Instant instant = date.atZone(ZoneId.systemDefault()).toInstant();
		return Date.from(instant);
	}
	public static Date localDateToDate(LocalDate date){
		Instant instant = date.atStartOfDay().atZone(ZoneId.systemDefault()).toInstant();
		return Date.from(instant);
	}
	public static Date localTimeToDate(LocalTime date,int year, Month month, int dayOfMonth){
		Instant instant = date.atDate(LocalDate.of(year, month, dayOfMonth)).atZone(ZoneId.systemDefault()).toInstant();
		return Date.from(instant);
	}
	public static LocalDate localDateFromString(String dateString,String pattern){
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern(pattern);
		LocalDate date =LocalDate.parse(dateString, dtf);
		return date;
	}
	public static LocalTime localTimeFromString(String timeString,String pattern){
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern(pattern);
		LocalTime time =LocalTime.parse(timeString, dtf);
		return time;
	}
	public static LocalDateTime localDateTimeFromString(String dateTimeString,String pattern){
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern(pattern);
		LocalDateTime dateTime =LocalDateTime.parse(dateTimeString, dtf);
		return dateTime;
	}
	public static Date dateTimeFromString(String dateTimeString,String pattern){
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		Date dateTime;
		try {
			dateTime = sdf.parse(dateTimeString);
		} catch (ParseException e) {
			throw new IllegalArgumentException(e);
		}
		return dateTime;
	}
	public static Date firstDateOfMonth(Date today){
		return firstDateOfMonth(dateToLocalDate(today));
	}
	public static LocalDate firstLocalDateOfMonth(LocalDate today){
		return LocalDate.of(today.getYear(), today.getMonth(), 1);
	}
	public static Date firstDateOfMonth(LocalDate today){
		return localDateToDate(firstLocalDateOfMonth(today));
	}
	public static Date firstDateOfYear(Date today){
		return firstDateOfYear(dateToLocalDate(today));
	}
	public static LocalDate firstLocalDateOfYear(LocalDate today){
		return LocalDate.of(today.getYear(), Month.JANUARY, 1);
	}
	public static Date firstDateOfYear(LocalDate today){
		return localDateToDate(firstLocalDateOfYear(today));
	}
	public static Date firstDateOfQuarter(Date today){
		return firstDateOfQuarter(dateToLocalDate(today));
	}
	private static int[] table = {1,1,1,4,4,4,7,7,7,10,10,10};
	public static LocalDate firstLocalDateOfQuarter(LocalDate today){
		return LocalDate.of(today.getYear(), table[today.getMonthValue()-1], 1);
	}
	public static Date firstDateOfQuarter(LocalDate today){
		return localDateToDate(firstLocalDateOfQuarter(today));
	}
}

