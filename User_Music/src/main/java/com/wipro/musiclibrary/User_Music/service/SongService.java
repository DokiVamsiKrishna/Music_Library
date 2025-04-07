package com.wipro.musiclibrary.User_Music.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.wipro.musiclibrary.User_Music.dto.SongDTO;
import com.wipro.musiclibrary.User_Music.entity.Playlist;
import com.wipro.musiclibrary.User_Music.entity.Song;
import com.wipro.musiclibrary.User_Music.repository.PlaylistRepository;
import com.wipro.musiclibrary.User_Music.repository.SongRepository;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class SongService {
	private final String ADMIN_MICROSERVICE_URL = "http://localhost:8081/admin/songs/visibleSongs";
	@Autowired
	private SongRepository songRepository;
	@Autowired
	private PlaylistRepository playlistRepository;

	public List<SongDTO> getVisibleSongs() {
		RestTemplate restTemplate = new RestTemplate();
		SongDTO[] songs = restTemplate.getForObject(ADMIN_MICROSERVICE_URL, SongDTO[].class);
		return songs != null ? Arrays.asList(songs) : List.of();
	}

	public List<SongDTO> getAvailableSongsNotInPlaylist(Long playlistId) {
		// Assuming you want to exclude songs already in the playlist
		List<Song> songs = songRepository.findByPlaylistIsNull();

		return songs.stream().map(song -> new SongDTO(song.getId(), song.getName(), song.getSinger()))
				.collect(Collectors.toList());
	}

	public SongDTO convertToDTO(Song song) {
		SongDTO dto = new SongDTO();
		dto.setId(song.getId());
		dto.setName(song.getName());
		dto.setSinger(song.getSinger());
		// Add other fields if needed
		return dto;
	}

	public List<SongDTO> getSongsByPlaylistId(Long playlistId) {
		Optional<Playlist> playlistOpt = playlistRepository.findById(playlistId);
		if (playlistOpt.isPresent()) {
			Playlist playlist = playlistOpt.get();
			List<Song> songs = playlist.getSongs();
			return songs.stream().map(this::convertToDTO) 
					.collect(Collectors.toList());
		}
		return new ArrayList<>();
	}
}
