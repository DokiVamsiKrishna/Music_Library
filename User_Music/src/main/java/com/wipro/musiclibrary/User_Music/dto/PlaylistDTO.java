package com.wipro.musiclibrary.User_Music.dto;

import java.util.List;

import lombok.Data;

@Data
public class PlaylistDTO {
	private Long id;
	private String playlistName;
	private List<SongDTO> songs;
}