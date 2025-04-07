package com.wipro.musiclibrary.User_Music.entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
@Table(name = "users")
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(nullable = false, unique = true)
	private String email;

	@Column(nullable = false)
	private String password;

	private String name;
	private String phone;

	public User() {
	}

	public User(String email, String password, String name, String phone) {
		this.email = email;
		this.password = password;
		this.name = name;
		this.phone = phone;
	}
}