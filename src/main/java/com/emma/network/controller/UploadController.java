package com.emma.network.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


import com.emma.network.dao.FriendsDao;
import com.emma.network.dao.NotificationDao;
import com.emma.network.dao.PostsDao;
import com.emma.network.dao.UploadsDao;
import com.emma.network.dao.UserDao;
import com.emma.network.model.Bucket;
import com.emma.network.model.Notification;
import com.emma.network.model.Posts;
import com.emma.network.model.Uploads;
import com.emma.network.model.UserAccount;
import com.emma.network.util.FileValidator;

@Controller
public class UploadController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private UploadsDao uploadDao;

	@Autowired
	private FriendsDao friendDao;

	@Autowired
	private NotificationDao notificationDao;

	@Autowired
	FileValidator fileValidator;

	@InitBinder("bucket")
	protected void initBinder(WebDataBinder binder) {
		binder.setValidator(fileValidator);
	}

	@RequestMapping(value= "/upload", method = RequestMethod.GET)
	public String getUpload(Model model, @RequestParam("uploadId") String uploadId, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		UserAccount user = (UserAccount) session.getAttribute("user");
		
		Bucket fileModel = new Bucket();
		model.addAttribute("bucket", fileModel);
		
		Uploads upload = uploadDao.getUpload(user, Integer.parseInt(uploadId));
		
		ArrayList<Notification> notificationList = notificationDao.getUnseenNotifications(user);
		session.setAttribute("notificationCount", String.valueOf(notificationList.size()));
		session.setAttribute("notificationList", notificationList);
		
		model.addAttribute("upload", upload);
		
		return "upload";
	}
	
	@RequestMapping(value="/addUploads", method = RequestMethod.POST)
	/*public String uploadDocument(@Valid Bucket bucket, BindingResult result, ModelMap model, @PathVariable int personId) throws IOException{

		if (result.hasErrors()) {
			System.out.println("validation errors");
			UserAccount user = UserDao.getPersonByIds(personId);
			model.addAttribute("person", person);

			List<Document> documents = documentService.findAllByUserId(userId);
			model.addAttribute("documents", documents);

			return "managedocuments";
		} else {

			System.out.println("Fetching file");

			User user = userService.findById(userId);
			model.addAttribute("person", person);

			saveDocument(bucket, person);

			return "redirect:/add-document-"+userId;
		}*/
		
	public String shareUploads(@Valid Bucket bucket, Model model, Uploads upload, HttpServletRequest request) throws IOException {

		if(upload!= null || upload.getCaption()!=null || upload.getCaption().isEmpty()) 
		{
			HttpSession session = request.getSession();
			UserAccount user = (UserAccount) session.getAttribute("user");
			upload.setPerson(user.getPerson());
			
			saveDocument(bucket, user);
			
			ArrayList<Integer> friendList = friendDao.getAllFriends(user);
			ArrayList<Uploads> uploadList = uploadDao.getFriendPosts(user, friendList);
			model.addAttribute("uploads", uploadList);
			
		}
		return "redirect:/index";
	}

	private void saveDocument(Bucket bucket, UserAccount user) throws IOException {
		Uploads upload = new Uploads();
		
		MultipartFile mf = bucket.getFile();
		
		upload.setName(mf.getOriginalFilename());
		upload.setCaption(bucket.getCaption());
		upload.setType(mf.getContentType());
		upload.setContent(mf.getBytes());
		upload.setPerson(user.getPerson());
		uploadDao.saveDocument(upload);
		
	}

}
