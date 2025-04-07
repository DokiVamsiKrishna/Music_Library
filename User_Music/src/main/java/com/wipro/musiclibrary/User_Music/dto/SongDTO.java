package com.wipro.musiclibrary.User_Music.dto;

import lombok.*;

@Data
public class SongDTO {
	private Long id;
	private String name;
	private String singer;
	private String musicDirector;
    private String releaseDate;
    private String album;


	public SongDTO(Long id, String name, String singer) {
		this.id = id;
		this.name = name;
		this.singer = singer;
	}

	public SongDTO() {
	}

	public Long getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getSinger() {
		return singer;
	}
	public String getMusicDirector() {
		return musicDirector;
	}

	public String getReleaseDate() {
		return releaseDate;
	}
	public String getAlbum() {
		return album;
	}

    

	// Getters and Setters
}