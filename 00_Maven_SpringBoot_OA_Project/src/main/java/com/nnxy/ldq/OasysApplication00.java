package com.nnxy.ldq;

import javax.servlet.annotation.WebListener;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;


@ServletComponentScan //扫描session监听器
@EnableAsync //开启异步任务
@EnableScheduling //开启基于注解的定时任务
@SpringBootApplication
@MapperScan({"com.nnxy.ldq.mappers"}) //扫描mabatis的数据库接口在那里
public class OasysApplication00 {
	public static void main(String[] args) {
		SpringApplication.run(OasysApplication00.class, args);	
	}
}


