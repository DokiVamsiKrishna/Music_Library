package com.wipro.music.AdminMusic.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.wipro.music.AdminMusic.entity.Admin;
import com.wipro.music.AdminMusic.entity.AdminPrinciple;
import com.wipro.music.AdminMusic.repository.AdminRepository;

@Service
public class MyAdminDetailsService implements UserDetailsService {

	@Autowired
	private AdminRepository userRepo;

	@Override
	public UserDetails loadUserByUsername(String name) throws UsernameNotFoundException {
		Admin user = userRepo.findByName(name);
		if (user == null) {
			System.out.println("User Not Found");
			throw new UsernameNotFoundException("user not found");
		}

		return new AdminPrinciple(user);
	}
}
