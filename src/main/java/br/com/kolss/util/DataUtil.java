package br.com.kolss.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

import org.apache.log4j.Logger;


public class DataUtil {

	private static final String DATA_FORMATO = "yyyy/MM/dd";
	private final static SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
	
	private final static SimpleDateFormat ONLY_DATE_FORMAT = new SimpleDateFormat("dd/MM/yyyy");
	private final static SimpleDateFormat ONLY_TIME_FORMAT = new SimpleDateFormat("HH:mm");
	private static String pattern = "yyyy-MM-dd hh:mm";


	public static Date formataData(String dataHora){

		Date data = null;
		try {
			data = DATE_FORMAT.parse(dataHora);
		} catch (final ParseException e) {
			e.getMessage();
			data = new Date();
		}

		return data;
	}

	/**
	 * Formata uma data para ser exibido em forma de String.
	 * 
	 * @param dataHora
	 * 
	 * @return
	 */
	public static String formataData(Date dataHora) {
		if(dataHora==null){
			return null;
		}
		return DATE_FORMAT.format(dataHora);
	}
	
	public static String getSomenteData(Date dataHora) {
		return ONLY_DATE_FORMAT.format(dataHora);
	}
	
	public static String getSomenteHora(Date dataHora) {
		return ONLY_TIME_FORMAT.format(dataHora);
	}

	public static Date dataAtual() {

		SimpleDateFormat  simpleDateFormat = new  SimpleDateFormat(DATA_FORMATO);

		try {
			return simpleDateFormat.parse(new Date().toString());

		} catch (ParseException e) {

		}
		return null;
	}

	public static long unixTimeNow()
			throws ParseException
	{
		Calendar calendar = Calendar.getInstance();
		calendar.setTimeInMillis(System.currentTimeMillis());

		return strToUnixTime(
				new SimpleDateFormat("yyyyMMddHHmm").format(calendar.getTime()), 
				"yyyyMMddHHmm");
	}

	public static long strToUnixTime(String time, String pattern)
			throws ParseException
	{
		DateFormat dfm = new SimpleDateFormat(pattern);
		dfm.setTimeZone(TimeZone.getTimeZone("America/Sao_Paulo"));

		long unixtime = dfm.parse(time).getTime();

		return unixtime / 1000L;
	}

	public static Calendar unixTimeToDate(long unixTime)
	{
		Calendar calendar = Calendar.getInstance();
		calendar.setTimeInMillis(unixTime * 1000L);
		calendar.setTimeZone(TimeZone.getTimeZone("America/Sao_Paulo"));

		return calendar;
	}

	private static Calendar resolution(Calendar calendar, int resolution)
	{
		switch (resolution)
		{
		case 1: 
			calendar.set(2, 0);
		case 2: 
			calendar.set(5, 0);
		case 5: 
			calendar.set(11, 0);
		case 11: 
			calendar.set(12, 0);
		case 12: 
			calendar.set(13, 0);
		case 13: 
			calendar.set(14, 0);
		}
		return calendar;
	}

	public static int compareDate(Date dateBegin, Date dateEnd)
	{
		Calendar calBegin = Calendar.getInstance();
		calBegin.setTime(dateBegin);

		Calendar calEnd = Calendar.getInstance();
		calEnd.setTime(dateEnd);

		return calBegin.compareTo(calEnd);
	}

	public static Calendar resolutionYear(Calendar calendar)
	{
		return resolution(calendar, 1);
	}

	public static Calendar resolutionMonth(Calendar calendar)
	{
		return resolution(calendar, 2);
	}

	public static Calendar resolutionDay(Calendar calendar)
	{
		return resolution(calendar, 5);
	}

	public static Calendar resolutionHour(Calendar calendar)
	{
		return resolution(calendar, 11);
	}

	public static Calendar resolutionMinute(Calendar calendar)
	{
		return resolution(calendar, 12);
	}

	public static Calendar resolutionSecond(Calendar calendar)
	{
		return resolution(calendar, 13);
	}

	private static Date resolution(Date date, int resolution)
	{
		return resolution(getCalendar(date), resolution).getTime();
	}

	public static Date resolutionYear(Date date)
	{
		return resolution(date, 1);
	}

	public static Date resolutionMonth(Date date)
	{
		return resolution(date, 2);
	}

	public static Date resolutionDay(Date date)
	{
		return resolution(date, 5);
	}

	public static Date resolutionHour(Date date)
	{
		return resolution(date, 11);
	}

	public static Date resolutionMinute(Date date)
	{
		return resolution(date, 12);
	}

	public static Date resolutionSecond(Date date)
	{
		return resolution(date, 13);
	}

	public static Calendar getCalendar(Date date)
	{
		Calendar calendar = getCalendar();
		calendar.setTime(date);

		return calendar;
	}

	public static Calendar getCalendar()
	{
		return Calendar.getInstance();
	}

	public static Calendar incrementDay(Calendar calendar)
	{
		return addDays(calendar, 1);
	}

	public static Date incrementDay(Date date)
	{
		return addDays(date, 1);
	}

	public static Calendar decrementDay(Calendar calendar)
	{
		return addDays(calendar, -1);
	}

	public static Date decrementDay(Date date)
	{
		return addDays(date, -1);
	}

	public static Calendar addDays(Calendar calendar, int days)
	{
		calendar.add(5, days);
		return calendar;
	}

	public static Date addYears(Date date, int years)
	{
		Calendar calendar = getCalendar(date);
		calendar.add(1, years);
		return calendar.getTime();
	}

	public static Date addDays(Date date, int days)
	{
		Calendar calendar = getCalendar(date);
		calendar.add(5, days);
		return calendar.getTime();
	}

	public static Calendar subtractDays(Calendar calendar, int days)
	{
		return addDays(calendar, -1);
	}

	public static Date addMinutes(Date date, int minutes)
	{
		Calendar calendar = getCalendar(date);
		calendar.add(12, minutes);
		return calendar.getTime();
	}

	public static Date addSeconds(Date date, int seconds)
	{
		Calendar calendar = getCalendar(date);
		calendar.add(13, seconds);
		return calendar.getTime();
	}

	public static int getDayOfWeek(Calendar calendar)
	{
		return calendar.get(7) - 1;
	}

	public static int getDayOfWeek(Date date)
	{
		return getDayOfWeek(getCalendar(date));
	}

	public static int getHour(Calendar calendar)
	{
		return calendar.get(11);
	}

	public static int getHour(Date date)
	{
		return getHour(getCalendar(date));
	}

	public static int getMinutes(Calendar calendar)
	{
		return calendar.get(12);
	}

	public static int getMinutes(Date date)
	{
		return getMinutes(getCalendar(date));
	}

	public static Date subtractMinutes(Date date, int minutes)
	{
		Calendar calendar = getCalendar(date);
		calendar.add(12, minutes * -1);
		return calendar.getTime();
	}

	public static Date subtractSeconds(Date date, int seconds)
	{
		Calendar calendar = getCalendar(date);
		calendar.add(13, seconds * -1);
		return calendar.getTime();
	}

	public static String formatDate(Calendar data, String formato)
	{
		if ((data == null) || (formato == null) || (formato.trim().isEmpty())) {
			throw new IllegalArgumentException();
		}
		SimpleDateFormat formatador = new SimpleDateFormat();
		formatador.applyPattern(formato);
		return formatador.format(data.getTime());
	}

	public static Date parser(String dateString)
			throws Exception
	{
		try
		{
			return new SimpleDateFormat(pattern).parse(dateString);
		}
		catch (ParseException e)
		{
			throw new Exception(
					"Erro ao parsear data. Verifique formato (yyyy-MM-dd hh:mm)");
		}
	}

	public static Date setHours(Date date, int hour)
	{
		Calendar calendar = getCalendar(date);
		calendar.set(11, hour);
		return calendar.getTime();
	}

	public static Date setMinutes(Date date, int minutes)
	{
		Calendar calendar = getCalendar(date);
		calendar.set(12, minutes);
		return calendar.getTime();
	}

	public static Date setHoursAndMinutes(Date date, int hour, int minutes)
	{
		Calendar calendar = getCalendar(date);
		calendar.set(11, hour);
		calendar.set(12, minutes);
		return calendar.getTime();
	}
	
	public static Date setHoursAndMinutesAndSeconds(Date date, int hour, int minutes, int seconds)
	{
		Calendar calendar = getCalendar(date);
		calendar.set(11, hour);
		calendar.set(12, minutes);
		calendar.set(13,seconds);
		return calendar.getTime();
	}

	public static Long converteDataDeStringISOParaLong(String date)
	{
		date = date.substring(0, date.length() - 5);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
		Calendar c = Calendar.getInstance();
		try
		{
			c.setTime(sdf.parse(date));
		}
		catch (ParseException e1)
		{
			e1.printStackTrace();
		}
		return Long.valueOf(c.getTimeInMillis());
	}

}

