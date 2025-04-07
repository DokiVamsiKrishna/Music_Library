package com.wipro.musiclibrary.User_Music.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.wipro.musiclibrary.User_Music.dto.SongDTO;
import com.wipro.musiclibrary.User_Music.entity.Song;
import com.wipro.musiclibrary.User_Music.entity.User;
import com.wipro.musiclibrary.User_Music.service.SongService;
import com.wipro.musiclibrary.User_Music.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private SongService songService;

	@GetMapping("/login")
	public String showLoginPage() {
		//returning the login.jsp page
		return "login";
	}

	@PostMapping("/login")
	public String login(@RequestParam String email, @RequestParam String password, HttpSession session, Model model) {
		User user = userService.loginUser(email, password);
		if (user != null) {
			session.setAttribute("user", user);
			return "redirect:/user/dashboard";//if the valid user it returns to dashboard
			// return "redirect:/user/home";
		} else {
			model.addAttribute("error", "Invalid email or password");
			return "login";//invalid credentials again displays the loginpage
		}
	}

	@GetMapping("/register")
	public String showRegisterPage() {
		//displaying the register.jsp page
		return "register";
	}

	@PostMapping("/register")
	public String register(@RequestParam String email, @RequestParam String password, @RequestParam String name,
			@RequestParam String phone, Model model) {
		User newUser = new User(email, password, name, phone);
		userService.registerUser(newUser);
		return "redirect:/user/login";
	}

	@GetMapping("/dashboard")
	public String showDashboard(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "redirect:/user/login";
		}
		List<SongDTO> songs = songService.getVisibleSongs();
		model.addAttribute("songs", songs);

		return "home";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		//logout from the session
		session.invalidate();
		return "redirect:/user/login";
	}
}
