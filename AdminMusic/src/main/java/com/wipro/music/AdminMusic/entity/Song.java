package com.wipro.music.AdminMusic.entity;


import jakarta.persistence.*;
import lombok.Data;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Setter
@AllArgsConstructor
@Table(name = "songs")
public class Song {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String singer;
    private String musicDirector;
    private String releaseDate;
    private String album;
    private boolean visible=true;
    public Song() {}

    public Song(String name, String singer, String musicDirector, String releaseDate, String album, boolean visible) {
        this.name = name;
        this.singer = singer;
        this.musicDirector = musicDirector;
        this.releaseDate = releaseDate;
        this.album = album;
        this.visible = visible;
    }

}
