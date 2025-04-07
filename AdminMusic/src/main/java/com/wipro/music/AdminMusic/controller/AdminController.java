package com.wipro.music.AdminMusic.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wipro.music.AdminMusic.dto.SongDTO;
import com.wipro.music.AdminMusic.entity.Admin;
import com.wipro.music.AdminMusic.service.AdminService;
import com.wipro.music.AdminMusic.service.SongService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminService adminService;
	@Autowired
	private SongService songService;

	@GetMapping("/login")
	public String showLoginPage() {
		return "login";
		// to show the login.jsp page for admin to login
	}

	@PostMapping("/login")
	public String login(@RequestParam String email, @RequestParam String password, HttpSession session, Model model) {
		Admin admin = adminService.loginAdmin(email, password);
		if (admin != null) {
			session.setAttribute("admin", admin);
			return "redirect:/admin/dashboard";
			// if the credentials are correct then it redirects to dashboard page
		} else {
			model.addAttribute("error", "Invalid email or password");
			return "login";
			// if there is invalid credentials then again displays the login.jsp page
		}
	}

	@GetMapping("/register")
	public String showRegisterPage() {
		return "register";
		// to show the register.jsp page for admin to register
	}

	@PostMapping("/register")
	public String register(@RequestParam String email, @RequestParam String password, @RequestParam String name,
			Model model) {
		Admin newAdmin = new Admin(email, password, name);
		adminService.registerAdmin(newAdmin);
		return "redirect:/admin/login";
		// after successfully filled the registration form then it redirects to login
		// page to sign in
	}

	@GetMapping("/dashboard")
	public String showDashboard(HttpSession session, Model model) {
		Admin admin = (Admin) session.getAttribute("admin");
		if (admin == null) {
			return "redirect:/admin/login";
			// checking whether admin is null if null then redirects to login
		}
		List<SongDTO> songs = songService.getAllSongs();
		model.addAttribute("songs", songs);
		return "home";
		// if successful login displays the home.jsp page
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/admin/login";
		// after logout it is redirected to login.jsp page
	}
}