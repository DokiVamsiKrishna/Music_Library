package com.wipro.music.AdminMusic.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.wipro.music.AdminMusic.entity.Admin;

@Repository
public interface AdminRepository extends JpaRepository<Admin, Long> {
	Admin findByEmail(String email);

	Admin findByName(String name);
}
