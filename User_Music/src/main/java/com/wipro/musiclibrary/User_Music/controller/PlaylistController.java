package com.wipro.musiclibrary.User_Music.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wipro.musiclibrary.User_Music.dto.PlaylistDTO;
import com.wipro.musiclibrary.User_Music.dto.SongDTO;
import com.wipro.musiclibrary.User_Music.entity.Playlist;
import com.wipro.musiclibrary.User_Music.entity.Song;
import com.wipro.musiclibrary.User_Music.repository.PlaylistRepository;
import com.wipro.musiclibrary.User_Music.repository.SongRepository;
import com.wipro.musiclibrary.User_Music.service.PlaylistService;
import com.wipro.musiclibrary.User_Music.service.SongService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/user/playlist")
public class PlaylistController {

	@Autowired
	private PlaylistService playlistService;
	@Autowired
	private SongRepository songRepository;
	@Autowired
	private PlaylistRepository playlistRepository;
	@Autowired
	private SongService songService;
	@Autowired
	private RestTemplate restTemplate;

	private final String ADMIN_SONGS_URL = "http://localhost:8081/admin/songs/visibleSongs";
	// Admin Microservice API to get the songes which are visible for users

	@GetMapping("/add")
	public String showAddPlaylistForm() {
		return "add_playlist";
		// returning the add_playlist.jsp page to create a playlist
	}

	@GetMapping
	public String showPlaylists(HttpServletRequest request) {
		request.setAttribute("playlists", playlistService.getAllPlaylists());
		return "playlists";
		// returns the playlists.jsp page which displays all the available playlists
	}

	@PostMapping("/save")
	public String savePlaylist(@RequestParam String name) {
		PlaylistDTO playlist = new PlaylistDTO();
		playlist.setPlaylistName(name);
		playlistService.savePlaylist(playlist);
		return "redirect:/user/playlist";
	}

	@GetMapping("/{id}")
	public String showPlaylistDetails(@PathVariable Long id, Model model) {
		// this method responsible for showing the playlist details whether in which
		// playlists what is there
		// it fetches the songs from the admin microservice using the rest template and
		// stores in a list and used in the user microservice to display those songs
		Optional<PlaylistDTO> playlistOptional = playlistService.getPlaylistById(id);

		if (playlistOptional.isPresent()) {
			PlaylistDTO playlist = playlistOptional.get();
			List<SongDTO> playlistSongs = songService.getSongsByPlaylistId(id);

			// Fetching all songs
			ResponseEntity<SongDTO[]> response = restTemplate.getForEntity(ADMIN_SONGS_URL, SongDTO[].class);
			List<SongDTO> allSongs = Arrays.asList(Optional.ofNullable(response.getBody()).orElse(new SongDTO[0]));

			// Fetching only songs in the current playlist
			List<SongDTO> availableSongs = new ArrayList<>(allSongs);
			availableSongs.removeIf(song -> playlistSongs.stream().anyMatch(p -> p.getId().equals(song.getId())));
			System.out.println("Available Songs:");
			playlistSongs.forEach(song -> System.out.println(song.getId() + " - " + song.getName()));
			model.addAttribute("playlist", playlist);
			model.addAttribute("playlistSongs", playlistSongs);
			model.addAttribute("availableSongs", availableSongs);
			return "playlist_details";
		}
		return "redirect:/user/playlist";
	}

	@PostMapping("/{playlistId}/add-song")
	public String addSongToPlaylist(@PathVariable Long playlistId, @RequestParam Long songId,
			RedirectAttributes redirectAttributes) {
		// adding a song to the playlist 
		playlistService.addSongToPlaylist(playlistId, songId);
		redirectAttributes.addFlashAttribute("message", "Song added successfully!");
		return "redirect:/user/playlist/" + playlistId;
	}

	@GetMapping("/{playlistId}/remove-song/{songId}")
	public String removeSongFromPlaylist(@PathVariable Long playlistId, @PathVariable Long songId,
			RedirectAttributes redirectAttributes) {
		// Call a service method to remove the song
		playlistService.removeSongFromPlaylist(playlistId, songId);
		redirectAttributes.addFlashAttribute("message", "Song removed successfully!");
		return "redirect:/user/playlist/" + playlistId;
	}

	// Update playlist name
	@PostMapping("/update")
	public String updatePlaylist(@RequestParam Long id, @RequestParam String name) {
		//it updates the playlist name 
		Optional<PlaylistDTO> playlist = playlistService.getPlaylistById(id);
		if (playlist.isPresent()) {
			PlaylistDTO existingPlaylist = playlist.get();
			existingPlaylist.setPlaylistName(name);
			playlistService.savePlaylist(existingPlaylist);
		}
		return "redirect:/user/playlist";
	}

	@GetMapping("/edit/{id}")
	public String showEditPlaylistForm(@PathVariable Long id, HttpServletRequest request) {
		//it is for editing the playlist 
		Optional<PlaylistDTO> playlist = playlistService.getPlaylistById(id);
		if (playlist.isPresent()) {
			request.setAttribute("playlist", playlist.get());
			return "edit_playlist";
		}
		return "redirect:/user/playlist";
	}

	@GetMapping("/delete/{id}")
	public String deletePlaylist(@PathVariable Long id) {
		//for deleting the playlist
		playlistService.deletePlaylist(id);
		return "redirect:/user/playlist";
	}
}