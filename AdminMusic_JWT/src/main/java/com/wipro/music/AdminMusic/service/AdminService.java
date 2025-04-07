package com.wipro.music.AdminMusic.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.wipro.music.AdminMusic.entity.Admin;
import com.wipro.music.AdminMusic.repository.AdminRepository;

@Service
public class AdminService {
	@Autowired
	private JWTService jwtService;

	@Autowired
	AuthenticationManager authManager;

	@Autowired
	private AdminRepository repo;

	private BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(12);

	public Admin register(Admin admin) {
		admin.setPassword(encoder.encode(admin.getPassword()));
		repo.save(admin);
		return admin;
	}

	public String verify(Admin admin) {
		Authentication authentication = authManager
				.authenticate(new UsernamePasswordAuthenticationToken(admin.getName(), admin.getPassword()));
		if (authentication.isAuthenticated()) {
			return jwtService.generateToken(admin.getName());
		} else {
			return "fail";
		}
	}

	public List<Admin> getAllAdmins() {
		return repo.findAll();
	}

	// Fetch admin by ID
	public Admin getAdminById(Long id) {
		return repo.findById(id).orElse(null);
	}

	// Fetch admin by name
	public Admin getAdminByName(String name) {
		return repo.findByName(name);
	}
}
