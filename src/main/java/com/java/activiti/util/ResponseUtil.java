package com.java.activiti.util;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletResponse;

//import com.alibaba.fastjson.JSON;
//import com.alibaba.fastjson.JSONObject;
//import com.alibaba.fastjson.serializer.SerializerFeature;
//import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

//import net.sf.json.JSONArray;
//import net.sf.json.JSONObject;
//import net.sf.json.JsonConfig;


public class ResponseUtil {

	public static void write(HttpServletResponse response,Object o)throws Exception{
		
//		fastjson
		
//		String json = JSON.toJSONStringWithDateFormat(o, "yyyy-MM-dd HH:mm:ss");
		
//		String json2 = JSON.toJSONString(o, SerializerFeature.WriteDateUseDateFormat);
//		String json = JSON.toJSONStringWithDateFormat(o, "yyyy-MM-dd HH:mm:ss", SerializerFeature.WriteDateUseDateFormat);
//		All of it ok
		
		
//		jackson
		
//		ObjectMapper objectMapper = new ObjectMapper();
//		
//		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		
//		objectMapper.setDateFormat(simpleDateFormat);
		

//		json-lib
		
//		JsonConfig jsonConfig = new JsonConfig();
//		
//			jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
//			
//				JSONObject jsonObject = new JSONObject();
//				
//					JSONArray jsonArray = new JSONArray();	
		
		
//		gson
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
						
		
		response.setContentType("text/html;charset=utf-8");
		
			PrintWriter out = response.getWriter();
			
//			String json = objectMapper.writeValueAsString(o);
//			This could save o.toString()
			
//				out.println(jsonArray.fromObject(o, jsonConfig));
				
//				out.write(gson.toJson(o));
				out.println(gson.toJson(o));
//				write && println == same
				
//				println && write almost same , write just for String
				
					out.flush();
						out.close();
	}
}
