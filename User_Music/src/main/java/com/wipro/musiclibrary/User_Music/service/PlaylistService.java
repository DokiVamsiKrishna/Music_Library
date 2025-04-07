package com.wipro.musiclibrary.User_Music.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.client.RestTemplate;

import com.wipro.musiclibrary.User_Music.dto.PlaylistDTO;
import com.wipro.musiclibrary.User_Music.dto.SongDTO;
import com.wipro.musiclibrary.User_Music.entity.Playlist;
import com.wipro.musiclibrary.User_Music.entity.Song;
import com.wipro.musiclibrary.User_Music.repository.PlaylistRepository;
import com.wipro.musiclibrary.User_Music.repository.SongRepository;

import jakarta.transaction.Transactional;

@Transactional
@Service
public class PlaylistService {

	@Autowired
	private PlaylistRepository playlistRepository;

	@Autowired
	private SongRepository songRepository;

	@Autowired
	private RestTemplate restTemplate;
	
	private final String ADMIN_SONGS_URL = "http://localhost:8081/admin/songs/visibleSongs/";

	public List<Playlist> getAllPlaylists() {
		return playlistRepository.findAll();
	}

	public Optional<PlaylistDTO> getPlaylistById(Long id) {
		return playlistRepository.findById(id).map(this::convertToDTO);
	}

	public List<SongDTO> getAvailableSongsNotInPlaylist(Long playlistId) {
		// Assuming you want to exclude songs already in the playlist
		List<Song> songs = songRepository.findByPlaylistIsNull();

		return songs.stream().map(song -> new SongDTO(song.getId(), song.getName(), song.getSinger()))
				.collect(Collectors.toList());
	}

	public Playlist findById(Long id) {
		return playlistRepository.findById(id).orElseThrow(() -> new RuntimeException("Playlist not found"));
	}

	public void savePlaylist(PlaylistDTO dto) {
		Playlist playlist = convertToEntity(dto);
		playlistRepository.save(playlist);
	}

	// Conversion methods
	private PlaylistDTO convertToDTO(Playlist entity) {
		PlaylistDTO dto = new PlaylistDTO();
		dto.setId(entity.getId());
		dto.setPlaylistName(entity.getPlaylistName());
		return dto;
	}

	private Playlist convertToEntity(PlaylistDTO dto) {
		Playlist entity = new Playlist();
		entity.setId(dto.getId());
		entity.setPlaylistName(dto.getPlaylistName());
		return entity;
	}

	public void deletePlaylist(Long id) {
		playlistRepository.deleteById(id);
	}

	public void addSongToPlaylist(Long playlistId, Long songId) {
		Optional<Playlist> playlistOpt = playlistRepository.findById(playlistId);

		if (playlistOpt.isPresent()) {
			Playlist playlist = playlistOpt.get();

			ResponseEntity<SongDTO> response = restTemplate.getForEntity(ADMIN_SONGS_URL + songId, SongDTO.class);
			SongDTO songDTO = response.getBody();

			if (songDTO != null) {
				boolean songExists = playlist.getSongs().stream().anyMatch(
						s -> s.getName().equals(songDTO.getName()) && s.getSinger().equals(songDTO.getSinger()));

				if (!songExists) {
					Song song = new Song();
					song.setName(songDTO.getName());
					song.setSinger(songDTO.getSinger());
					song.setPlaylist(playlist);
					

					songRepository.save(song);
					playlist.getSongs().add(song);
					playlistRepository.save(playlist);
				}
			}
		}
	}

	public void removeSongFromPlaylist(Long playlistId, Long songId) {
		Optional<Playlist> playlistOpt = playlistRepository.findById(playlistId);
		if (playlistOpt.isPresent()) {
			Playlist playlist = playlistOpt.get();
			// Find the song in the playlist
			Optional<Song> songToRemove = playlist.getSongs().stream().filter(song -> song.getId().equals(songId))
					.findFirst();

			// Remove the song if found
			if (songToRemove.isPresent()) {
				Song song = songToRemove.get();
				playlist.getSongs().remove(song);
				song.setPlaylist(null);
				songRepository.delete(song);
				playlistRepository.save(playlist);
			}
		}
	}
}