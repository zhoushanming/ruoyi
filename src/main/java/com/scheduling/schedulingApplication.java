package com.scheduling;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * 启动程序
 *
 * @author scheduling
 */
@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })
public class schedulingApplication
{
    public static void main(String[] args)
    {
        // System.setProperty("spring.devtools.restart.enabled", "false");
        SpringApplication.run(schedulingApplication.class, args);
        System.out.println("智慧排班系统启动成功");
    }
}
