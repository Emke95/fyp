package com.emma.network.service;

import java.util.List;

import com.emma.network.model.Uploads;

public interface UploadsService {
	
	Uploads findById(int uploadId);
	
	List<Uploads> findAllByUserId(int pId);
	
	void saveUpload(Uploads uploads);
	
	void deleteById(int uploadId);

}
