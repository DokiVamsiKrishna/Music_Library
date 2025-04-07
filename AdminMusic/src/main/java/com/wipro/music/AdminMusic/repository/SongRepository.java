package com.wipro.music.AdminMusic.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.wipro.music.AdminMusic.dto.SongDTO;
import com.wipro.music.AdminMusic.entity.Song;

public interface SongRepository extends JpaRepository<Song, Long> {
    List<Song> findByVisibleTrue();//this is used for getting only visibility enabled songs 
}