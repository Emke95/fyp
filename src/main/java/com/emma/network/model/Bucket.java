package com.emma.network.model;

import org.springframework.web.multipart.MultipartFile;

public class Bucket {

	MultipartFile file;

	String caption;

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public String getCaption() {
		return caption;
	}

	public void setCaption(String caption) {
		this.caption = caption;
	}
}
