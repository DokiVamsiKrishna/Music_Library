package com.wipro.music.AdminMusic.entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
public class Admin {
	@Id
	private int id;
	private String email;
	private String password;
	private String name;
}