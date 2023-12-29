package com.gi.osc.domain;

import lombok.*;

import javax.persistence.*;

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
	}