package com.emma.network.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.emma.network.dao.UploadsDao;
import com.emma.network.model.Uploads;
import com.emma.network.service.UploadsService;

@Service("uploadsService")
@Transactional
public class UploadsServiceImpl implements UploadsService {
	
	@Autowired
	private UploadsDao dao;

	public Uploads findById(int uploadId) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Uploads> findAllByUserId(int pId) {
		// TODO Auto-generated method stub
		return null;
	}

	public void saveUpload(Uploads uploads) {
		// TODO Auto-generated method stub
		
	}

	public void deleteById(int uploadId) {
		// TODO Auto-generated method stub
		
	}

}
