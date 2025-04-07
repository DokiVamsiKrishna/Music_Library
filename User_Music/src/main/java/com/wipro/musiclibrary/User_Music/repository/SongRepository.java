package com.wipro.musiclibrary.User_Music.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.wipro.musiclibrary.User_Music.entity.Song;

import java.util.List;

@Repository
public interface SongRepository extends JpaRepository<Song, Long> {
	List<Song> findByPlaylistId(Long playlistId);

	List<Song> findByPlaylistIsNull();
}
