package com.blog.domain.board;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder

public class Board {

	private int id;
	private int userId;
	private String title;
	private String content;
	private int readCount; //default 0
	private Timestamp createDate;
		
}
