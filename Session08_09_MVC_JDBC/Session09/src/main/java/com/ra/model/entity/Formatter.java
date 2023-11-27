package com.ra.model.entity;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Formatter {
    public static Date formatDate(String dateStr) throws ParseException {
        SimpleDateFormat dt = new SimpleDateFormat("yyyyy-mm-dd");
        Date date = dt.parse(dateStr);
        return date;
    }
}
