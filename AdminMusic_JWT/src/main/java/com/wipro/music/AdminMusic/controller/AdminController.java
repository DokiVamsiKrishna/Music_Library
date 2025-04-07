package com.wipro.music.AdminMusic.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.wipro.music.AdminMusic.entity.Admin;
import com.wipro.music.AdminMusic.service.AdminService;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;

	@PostMapping("/register")
	public Admin register(@RequestBody Admin admin) {
		return adminService.register(admin);

	}

	@PostMapping("/login")
	public String login(@RequestBody Admin admin) {

		return adminService.verify(admin);
	}

	@GetMapping("/all")
	public List<Admin> getAllAdmins() {
		return adminService.getAllAdmins();
	}

	@GetMapping("/home")
	public String dashboard() {
		return "This is the dashboard page";
	}

	@GetMapping("/logout")
	public String logout() {
		return "logout successfully";
	}

	@GetMapping("/{id}")
	public Admin getAdminById(@PathVariable Long id) {
		return adminService.getAdminById(id);
	}
}
