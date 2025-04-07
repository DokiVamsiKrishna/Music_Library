package com.wipro.music.AdminMusic;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient
public class AdminMusicApplication {

	public static void main(String[] args) {
		SpringApplication.run(AdminMusicApplication.class, args);
	}

}
