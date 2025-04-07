package com.wipro.musiclibrary.User_Music.entity;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import com.wipro.musiclibrary.User_Music.dto.SongDTO;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinTable;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

import lombok.Data;

@Entity
@Data
public class Playlist {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String playlistName;
//    @ManyToMany
//    @JoinTable(
//        name = "playlist_songs",
//        joinColumns = @JoinColumn(name = "playlist_id"),
//        inverseJoinColumns = @JoinColumn(name = "song_id")
//    )
    @OneToMany(mappedBy = "playlist", cascade = CascadeType.ALL)
    private List<Song> songs = new ArrayList<>();
}
