package com.emma.network.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.emma.network.model.Bucket;
import com.emma.network.model.Posts;
import com.emma.network.model.Uploads;
import com.emma.network.model.UserAccount;

public class UploadsDao extends DAO {

	private static int counter;
	private static ArrayList<Integer> friends;

	public Uploads getUpload(UserAccount user, int uploadId) {
		Query q = getSession().createQuery("from Uploads where uploadid = :uploadId and personid = :personId");
		q.setInteger("uploadId", uploadId);
		q.setInteger("personId", user.getuId());
		Uploads upload = (Uploads) q.uniqueResult();

		return upload;
	}
	public void addUpload(Uploads upload) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		try
		{
			Date today = new Date();
			upload.setDateOfPost(today);
			Transaction transaction = session.beginTransaction();
			session.save(upload);
			transaction.commit();
		}
		catch(Exception e)
		{
			System.out.println("Hello " + e.getMessage());
		}
		finally
		{
			session.close();
		}
	}

	public ArrayList<Uploads> getFriendPosts(UserAccount user, ArrayList<Integer> friendList) {
		friendList.add(user.getuId());
		Query query = getSession().createQuery("from Uploads where personid in (:personid) order by dateofpost desc").setMaxResults(2);
		query.setParameterList("personid", friendList);
		ArrayList<Uploads> uploadList = (ArrayList<Uploads>) query.list();
		counter = 2;
		friends = friendList;
		return uploadList;
	}
	public void saveDocument(Uploads upload) {
		getSession().persist(upload);
	}
	public void save(Uploads upload){
		Session session = HibernateUtil.getSessionFactory().openSession();
		try
		{
			Date today = new Date();
			upload.setDateOfPost(today);
			Transaction transaction = session.beginTransaction();
			session.save(upload);
			transaction.commit();
		}
		catch(Exception e)
		{
			System.out.println("Hello " + e.getMessage());
		}
		finally
		{
			session.close();
		}
	}
	


}
