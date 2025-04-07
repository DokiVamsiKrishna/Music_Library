package com.wipro.music.AdminMusic.dto;

import lombok.*;

@Getter
@Setter
@Data
@AllArgsConstructor
public class SongDTO {
    private Long id;
    private String name;
    private String singer;
    private String musicDirector;
    private String releaseDate;
    private String album;
    private boolean visible;
    public SongDTO() {
        this.visible = true;
    }
	public SongDTO(Long id, String name, String singer) {
		super();
		this.id = id;
		this.name = name;
		this.singer = singer;
	}
	
}