package com.wipro.musiclibrary.User_Music.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.wipro.musiclibrary.User_Music.entity.Playlist;

public interface PlaylistRepository extends JpaRepository<Playlist, Long> {

//	void saveAll(PlaylistDTO existingPlaylist);

}
