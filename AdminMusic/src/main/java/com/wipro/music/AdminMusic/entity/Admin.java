package com.wipro.music.AdminMusic.entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
@Table(name = "admins")
public class Admin {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String email;

    @Column(nullable = false)
    private String password;

    private String name;

    public Admin() {}

    public Admin(String email, String password, String name) {
        this.email = email;
        this.password = password;
        this.name = name;
    }
}