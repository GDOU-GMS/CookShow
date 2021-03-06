package com.blueshit.cookshow.common.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;


public class Configuration {

	private static int pageSize = 10;

	
	static{
		InputStream in = null;
		try {
			
			in = Configuration.class.getClassLoader().getResourceAsStream("configuration.properties");
			Properties props = new Properties();
			
			props.load(in);
			pageSize = Integer.parseInt(props.getProperty("pageSize"));
		} catch (IOException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}finally{
			if(in!=null){
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
					throw new RuntimeException(e);
				}
			}
		}
	}
	
	public static int getPageSize() {
		return pageSize;
	}

	public static void setPageSize(int pageSize) {
		Configuration.pageSize = pageSize;
	}
	
}
