package com.wipro.music.AdminMusic.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wipro.music.AdminMusic.dto.SongDTO;
import com.wipro.music.AdminMusic.entity.Song;
import com.wipro.music.AdminMusic.repository.SongRepository;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class SongService {
	@Autowired
	private SongRepository songRepository;

	public void addSong(SongDTO songDTO) {
		// for adding song using dto object
		Song song = new Song();
		song.setName(songDTO.getName());
		song.setSinger(songDTO.getSinger());
		song.setMusicDirector(songDTO.getMusicDirector());
		song.setReleaseDate(songDTO.getReleaseDate());
		song.setAlbum(songDTO.getAlbum());
		song.setVisible(songDTO.isVisible());
		System.out.println(songDTO.isVisible());
		songRepository.save(song);
	}

	public List<SongDTO> getAllSongs() {
		// getting all songs in database
		return songRepository
				.findAll().stream().map(song -> new SongDTO(song.getId(), song.getName(), song.getSinger(),
						song.getMusicDirector(), song.getReleaseDate(), song.getAlbum(), song.isVisible()))
				.collect(Collectors.toList());
	}

	public SongDTO getSongById(Long id) {
		// getting song by id
		return songRepository
				.findById(id).map(song -> new SongDTO(song.getId(), song.getName(), song.getSinger(),
						song.getMusicDirector(), song.getReleaseDate(), song.getAlbum(), song.isVisible()))
				.orElse(null);
	}

	public void updateSong(Long id, SongDTO songDTO) {
		// for updating songs
		if (songRepository.existsById(id)) {
			System.out.println(songDTO.isVisible());
			Song song = songRepository.findById(id).get();

			song.setName(songDTO.getName());
			song.setSinger(songDTO.getSinger());
			song.setMusicDirector(songDTO.getMusicDirector());
			song.setReleaseDate(songDTO.getReleaseDate());
			song.setAlbum(songDTO.getAlbum());
			song.setVisible(songDTO.isVisible());
			System.out.println(songDTO.isVisible());
			songRepository.save(song);
		}
	}

	public void deleteSong(Long id) {
		// deleting songs
		songRepository.deleteById(id);
	}

	public List<SongDTO> getVisibleSongs() {
		// this is for visibility purpose only visible enabled songs will be called
		return songRepository
				.findByVisibleTrue().stream().map(song -> new SongDTO(song.getId(), song.getName(), song.getSinger(),
						song.getAlbum(), song.getMusicDirector(), song.getReleaseDate(), song.isVisible()))
				.collect(Collectors.toList());
	}
}