package com.wipro.musiclibrary.User_Music;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient
public class UserMusicApplication {

	public static void main(String[] args) {
		SpringApplication.run(UserMusicApplication.class, args);
	}

}
