package com.wipro.music.AdminMusic.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wipro.music.AdminMusic.entity.Admin;
import com.wipro.music.AdminMusic.repository.AdminRepository;

@Service
public class AdminService {
    @Autowired
    private AdminRepository adminRepository;

    public Admin registerAdmin(Admin admin) {
        return adminRepository.save(admin);// after registering saving the data
    }

    public Admin loginAdmin(String email, String password) {
        Optional<Admin> admin = adminRepository.findByEmail(email);
        if (admin.isPresent() && admin.get().getPassword().equals(password)) {
        	//checking whether those credentials are matched or not
            return admin.get();
        }
        return null;
    }
}