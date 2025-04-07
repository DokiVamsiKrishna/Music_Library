package com.wipro.music.AdminMusic.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wipro.music.AdminMusic.dto.SongDTO;
import com.wipro.music.AdminMusic.entity.Song;
import com.wipro.music.AdminMusic.repository.SongRepository;
import com.wipro.music.AdminMusic.service.SongService;


@Controller
@RequestMapping("/admin/songs")
public class SongController {
	@Autowired
	private SongService songService;
	@Autowired
	private SongRepository songRepository;
	@GetMapping
	public String listSongs(Model model) {
		List<SongDTO> songs = songService.getAllSongs();
		model.addAttribute("songs", songs);
		return "manage-songs";
	}

	@GetMapping("/add")
	public String showAddSongForm(Model model) {
		model.addAttribute("song", new SongDTO());
		return "manage-songs";
	}

	@PostMapping("/add")
	public String addSong(@ModelAttribute SongDTO songDTO) {
		songService.addSong(songDTO);//adding new song to the model
		return "redirect:/admin/songs";
	}

	@GetMapping("/edit/{id}")
	public String showEditForm(@PathVariable Long id, Model model) {
		SongDTO songDTO = songService.getSongById(id);//editing the song
		model.addAttribute("song", songDTO);
		return "edit-song";
	}

	@PostMapping("/savesong/{id}")
	public String updateSong(@PathVariable Long id, @ModelAttribute SongDTO songDTO) {
		songService.updateSong(id, songDTO);//updating the song which is edited
		return "redirect:/admin/songs";
	}

	@GetMapping("/delete/{id}")
	public String deleteSong(@PathVariable Long id) {
		songService.deleteSong(id);//delete the song 
		return "redirect:/admin/songs";
	}


	@GetMapping("/visibleSongs")
	@ResponseBody
	public List<SongDTO> getVisibleSongs() {
		return songService.getVisibleSongs();
		//this is the songs which is like a json response where we can use it in user microservice
	}

	@GetMapping("/visibleSongs/{id}")
    @ResponseBody  // ⬅️ Tells Spring to send JSON, not HTML
    public ResponseEntity<SongDTO> getSongById(@PathVariable Long id) {
        Optional<Song> songOpt = songRepository.findById(id);

        if (songOpt.isPresent()) {
            Song song = songOpt.get();
            SongDTO dto = new SongDTO(song.getId(), song.getName(), song.getSinger());
            return ResponseEntity.ok(dto);  // ✅ Will be sent as JSON
        }

        return ResponseEntity.notFound().build();
    }
}