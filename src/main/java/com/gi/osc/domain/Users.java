package com.gi.osc.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data			// Getter Setter
@Builder		// DTO -> Entity화
@AllArgsConstructor	// 모든 컬럼 생성자 생성
@NoArgsConstructor	// 기본 생성자
@Table(name = "users")
public class Users{

	    @Id	//  PK
	    @GeneratedValue(strategy = GenerationType.IDENTITY)	// 자동 id 생성
	    private String realId;
	    
	    @Column
	    private String userName;

	    @Column(nullable = false)
	    private String userPw;
	    
	    @Column
	    private String nickname;

	    @Column
	    private Date regDate;
	}