package org.nhnnext.web;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
@Entity
public class Board {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@OneToMany(mappedBy = "board", fetch = FetchType.EAGER, cascade=CascadeType.REMOVE)
	private List<AttachComment> attachComment;

	@Column(length = 50, nullable = false)
	private String title;
	@Column(length = 500, nullable = false)
	private String comment;
	@Column(length = 50, nullable = true)
	private String fileName;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	
	@Override
	public String toString() {
		return "Board [id=" + id + ", title=" + title + ", comment=" + comment;
	}
	public List<AttachComment> getAttachComment() {
		return attachComment;
	}
	public void setAttachComment(List<AttachComment> attachComment) {
		this.attachComment = attachComment;
	}

	
}
