package com.fssa.projectprovision;

public class CalendarModel {
    private int year;
    private int month;
    private int daysInMonth;
    private int firstDayOfWeek;

    public CalendarModel(int year, int month, int daysInMonth, int firstDayOfWeek) {
        this.year = year;
        this.month = month;
        this.daysInMonth = daysInMonth;
        this.firstDayOfWeek = firstDayOfWeek;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public int getDaysInMonth() {
        return daysInMonth;
    }

    public void setDaysInMonth(int daysInMonth) {
        this.daysInMonth = daysInMonth;
    }

    public int getFirstDayOfWeek() {
        return firstDayOfWeek;
    }

    public void setFirstDayOfWeek(int firstDayOfWeek) {
        this.firstDayOfWeek = firstDayOfWeek;
    }
}
