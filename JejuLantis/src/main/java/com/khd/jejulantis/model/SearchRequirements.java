package com.khd.jejulantis.model;

import java.util.Date;
import java.util.List;

import org.joda.time.DateTime;
import org.joda.time.Days;
import org.joda.time.Hours;
import org.joda.time.Minutes;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

public class SearchRequirements {
	
	DateTime rent_reserve_start;
	DateTime rent_reserve_end;
	String car_name;
	List<String> car_manufacturer;
	List<String> car_fuel;
	List<String> car_type;
	String car_kind_navi;
	String car_kind_sensor;
	String car_kind_blackbox;
	String car_kind_bluetooth;
	String car_kind_sunroof;
	String car_kind_camera;
	String car_kind_nonsmoke;
	String car_kind_resist;
	boolean searchFlag;
	String sort;
//	boolean errorFlag;
	String errorMsg;
	
	public SearchRequirements() {}
	public SearchRequirements(Date rent_reserve_start,String sort) {
		this.rent_reserve_start = new DateTime(rent_reserve_start);
		this.rent_reserve_end = this.rent_reserve_start.plusDays(1);
		this.sort = sort;
		this.searchFlag=false;
	}
	public SearchRequirements(String Checkindate,String checkintime,String checkoutdate,String checkouttime,String car_name) {
		DateTimeFormatter fmt = DateTimeFormat.forPattern("yyyy-MM-dd HH:mm");
		this.rent_reserve_start = DateTime.parse(Checkindate+" "+checkintime, fmt);
		this.rent_reserve_end = DateTime.parse(checkoutdate+" "+checkouttime, fmt);
		this.car_name = car_name;
		this.searchFlag=true;
	}
	public SearchRequirements(String CheckindateTime,String checkoutdateTime,String car_name,List<String> car_manufacturer,List<String> car_fuel,List<String> car_type,List<String> car_option) {
		DateTimeFormatter fmt = DateTimeFormat.forPattern("yyyy-MM-dd HH:mm");
		this.rent_reserve_start = DateTime.parse(CheckindateTime, fmt);
		this.rent_reserve_end = DateTime.parse(checkoutdateTime, fmt);
		this.car_name = car_name;
		this.car_manufacturer = car_manufacturer;
		this.car_fuel = car_fuel;
		this.car_type = car_type;
		if(car_option != null)setOptionList(car_option);
		this.searchFlag = true;
	}
	public SearchRequirements(DateTime rent_reserve_start, DateTime rent_reserve_end, String car_name,
			List<String> car_manufacturer, List<String> car_fuel, List<String> car_type, String car_kind_navi,
			String car_kind_sensor, String car_kind_blackbox, String car_kind_bluetooth, String car_kind_sunroof,
			String car_kind_camera, String car_kind_nonsmoke, String car_kind_resist, boolean searchFlag, String sort,
			boolean errorFlag, String errorMsg) {
		super();
		this.rent_reserve_start = rent_reserve_start;
		this.rent_reserve_end = rent_reserve_end;
		this.car_name = car_name;
		this.car_manufacturer = car_manufacturer;
		this.car_fuel = car_fuel;
		this.car_type = car_type;
		this.car_kind_navi = car_kind_navi;
		this.car_kind_sensor = car_kind_sensor;
		this.car_kind_blackbox = car_kind_blackbox;
		this.car_kind_bluetooth = car_kind_bluetooth;
		this.car_kind_sunroof = car_kind_sunroof;
		this.car_kind_camera = car_kind_camera;
		this.car_kind_nonsmoke = car_kind_nonsmoke;
		this.car_kind_resist = car_kind_resist;
		this.searchFlag = searchFlag;
		this.sort = sort;
//		this.errorFlag = errorFlag;
		this.errorMsg = errorMsg;
	}
	public DateTime getRent_reserve_start() {
		return rent_reserve_start;
	}
	public void setRent_reserve_start(DateTime rent_reserve_start) {
		this.rent_reserve_start = rent_reserve_start;
	}
	public DateTime getRent_reserve_end() {
		return rent_reserve_end;
	}
	public void setRent_reserve_end(DateTime rent_reserve_end) {
		this.rent_reserve_end = rent_reserve_end;
	}
	public String getCar_name() {
		return car_name;
	}
	public void setCar_name(String car_name) {
		this.car_name = car_name;
	}
	public List<String> getCar_manufacturer() {
		return car_manufacturer;
	}
	public void setCar_manufacturer(List<String> car_manufacturer) {
		this.car_manufacturer = car_manufacturer;
	}
	public List<String> getCar_fuel() {
		return car_fuel;
	}
	public void setCar_fuel(List<String> car_fuel) {
		this.car_fuel = car_fuel;
	}
	public List<String> getCar_type() {
		return car_type;
	}
	public void setCar_type(List<String> car_type) {
		this.car_type = car_type;
	}
	public String getCar_kind_navi() {
		return car_kind_navi;
	}
	public void setCar_kind_navi(String car_kind_navi) {
		this.car_kind_navi = car_kind_navi;
	}
	public String getCar_kind_sensor() {
		return car_kind_sensor;
	}
	public void setCar_kind_sensor(String car_kind_sensor) {
		this.car_kind_sensor = car_kind_sensor;
	}
	public String getCar_kind_blackbox() {
		return car_kind_blackbox;
	}
	public void setCar_kind_blackbox(String car_kind_blackbox) {
		this.car_kind_blackbox = car_kind_blackbox;
	}
	public String getCar_kind_bluetooth() {
		return car_kind_bluetooth;
	}
	public void setCar_kind_bluetooth(String car_kind_bluetooth) {
		this.car_kind_bluetooth = car_kind_bluetooth;
	}
	public String getCar_kind_sunroof() {
		return car_kind_sunroof;
	}
	public void setCar_kind_sunroof(String car_kind_sunroof) {
		this.car_kind_sunroof = car_kind_sunroof;
	}
	public String getCar_kind_camera() {
		return car_kind_camera;
	}
	public void setCar_kind_camera(String car_kind_camera) {
		this.car_kind_camera = car_kind_camera;
	}
	public String getCar_kind_nonsmoke() {
		return car_kind_nonsmoke;
	}
	public void setCar_kind_nonsmoke(String car_kind_nonsmoke) {
		this.car_kind_nonsmoke = car_kind_nonsmoke;
	}
	public String getCar_kind_resist() {
		return car_kind_resist;
	}
	public void setCar_kind_resist(String car_kind_resist) {
		this.car_kind_resist = car_kind_resist;
	}
	public boolean isSearchFlag() {
		return searchFlag;
	}
	public void setSearchFlag(boolean searchFlag) {
		this.searchFlag = searchFlag;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public boolean isErrorFlag() {
		if(errorMsg!=null) {
			return true;
		}else {
			return false;
		}
//		return errorFlag;
	}
//	public void setErrorFlag(boolean errorFlag) {
//		this.errorFlag = errorFlag;
//	}
	public String getErrorMsg() {
		return errorMsg;
	}
	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}
	public String getRent_reserve_startDateTime() {
		return rent_reserve_start.toString("yyyy-MM-dd HH:mm");
	}
	public String getRent_reserve_endDateTime() {
		return rent_reserve_end.toString("yyyy-MM-dd HH:mm");
	}
	public String getRent_reserve_startDate() {
		return rent_reserve_start.toString("yyyy-MM-dd");
	}
	public String getRent_reserve_endDate() {
		return rent_reserve_end.toString("yyyy-MM-dd");
	}
	public String getRent_reserve_startTime() {
		return rent_reserve_start.toString("HH:mm");
	}
	public String getRent_reserve_endTime() {
		return rent_reserve_end.toString("HH:mm");
	}
	public int getRent_reserve_periodDate() {
		return Days.daysBetween(this.rent_reserve_start, this.rent_reserve_end).getDays();
	}
	public int getRent_reserve_periodHours() {
		return Hours.hoursBetween(this.rent_reserve_start, this.rent_reserve_end).getHours();
	}
	void setOptionList(List<String> option) {
		
		for(int i=0;i<option.size();i++) {
			String name = option.get(i);
			if(name.equals("car_kind_blackbox")) {
				this.car_kind_blackbox="Y";
			}else if(name.equals("car_kind_bluetooth")) {
				this.car_kind_bluetooth="Y";
			}else if(name.equals("car_kind_camera")) {
				this.car_kind_camera="Y";
			}else if(name.equals("car_kind_navi")) {
				this.car_kind_navi="Y";
			}else if(name.equals("car_kind_nonsmoke")) {
				this.car_kind_nonsmoke="Y";
			}else if(name.equals("car_kind_sensor")) {
				this.car_kind_sensor="Y";
			}else if(name.equals("car_kind_sunroof")) {
				this.car_kind_sunroof="Y";
			}
		}
	}	
	public void checkTime(Date date) {
		DateTime today = new DateTime(date);
		errorMsg = null;
		if(Minutes.minutesBetween(today, this.rent_reserve_start).getMinutes()<0) {
			errorMsg = "현재 시각 이후부터 검색 가능합니다.";
		}else if(today.getDayOfYear()==this.rent_reserve_start.getDayOfYear()&&
				today.getDayOfMonth()==this.rent_reserve_start.getDayOfMonth()&&
				today.getDayOfWeek()==this.rent_reserve_start.getDayOfWeek()){
			if(this.rent_reserve_start.getHourOfDay()<14) {
				errorMsg = "당일 예약은 14시 이후부터 가능합니다.";
			}
		}else if(Minutes.minutesBetween(this.rent_reserve_start, this.rent_reserve_end).getMinutes()<0) {
			errorMsg = "예약 종료시간이 시작 시간보다 빠릅니다.";
		}else if(Hours.hoursBetween(this.rent_reserve_start, this.rent_reserve_end).getHours()<24) {
			errorMsg = "최소 예약 시간은 24시간입니다.";
		}else if(Hours.hoursBetween(this.rent_reserve_start, this.rent_reserve_end).getHours()>180) {
			errorMsg = "최대 예약 시간은 180시간 입니다.";
		}
	}
}