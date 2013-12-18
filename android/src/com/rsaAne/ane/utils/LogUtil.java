package com.rsaAne.ane.utils;

import java.io.FileWriter;
import java.io.IOException;
import java.util.Date;

/**
 * 日志工具
 * @author xujianxin
 * @time 2013-9-28 5:18:41
 */
public class LogUtil {

	public static void log(String content){
		try {
			FileWriter fw = new FileWriter("/mnt/sdcard/log.txt", true);
			fw.write(content + "----"+" ["+new Date()+"]\n");
			fw.flush();
			fw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
