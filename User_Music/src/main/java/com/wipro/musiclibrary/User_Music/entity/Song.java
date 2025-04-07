package com.wipro.musiclibrary.User_Music.entity;

import jakarta.persistence.*;
import lombok.*;

@Data
@Entity
public class Song {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	private String name;
	private String singer;
    private String musicDirector;
    private String releaseDate;
    private String album;
	@ManyToOne
	@JoinColumn(name = "playlist_id")
	private Playlist playlist;
}
