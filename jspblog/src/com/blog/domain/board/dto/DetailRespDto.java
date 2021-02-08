package com.blog.domain.board.dto;

import java.sql.Timestamp;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class DetailRespDto {
	private int Id;
	private int userId;
	private String title;
	private String content;
	private int readCount;
	private String username;
	private Timestamp createDate;
}
