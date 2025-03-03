package poly.locth.dao;

import java.util.List;

import javax.management.Query;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import poly.locth.entity.Video;
import poly.locth.until.XJPA;

public class VideoDAO implements DAOImpl<Video, String>{
	public EntityManager em = XJPA.getEntityManager();

	@Override
	protected void finalize() throws Throwable {
		em.close();// dong EntiryManager khi DAO bi giai phong
		super.finalize();
	}

	@Override
	public List<Video> findAll() {
		TypedQuery<Video> query = em.createQuery("SELECT o FROM Video o ", Video.class);
		return query.getResultList();
	}
	
	public List<Video> findAllByPage(int start, int end) {
		TypedQuery<Video> query = em.createQuery("SELECT o FROM Video o ", Video.class);
		query.setFirstResult(start);
		query.setMaxResults(end);
		return query.getResultList();
	}
	

	public List<Video> findByTitle(String title) {
		TypedQuery<Video> query = em.createQuery("SELECT o FROM Video o WHERE o.title LIKE :title", Video.class);
		query.setParameter("title", '%' + title + '%');
		return query.getResultList();
	}

	public List<String> findTop10HighView() {
		TypedQuery<String> query = em.createQuery(
				"SELECT o.video.id FROM Favorite o " + "GROUP BY o.video.id ORDER BY COUNT(o.video.id) DESC",
				String.class);
		query.setMaxResults(10);
		return query.getResultList();
	}

	public List<Video> findNotLike() {
		TypedQuery<Video> query = em.createQuery(
				"SELECT o FROM Video o WHERE o.id NOT IN (SELECT f.video.id FROM Favorite f)", Video.class);

		return query.getResultList();
	}

	

	@Override
	public Video findById(String id) {
		Video v = em.find(Video.class, id);
		return v;
	}

	@Override
	public void create(Video entity) {
		em.getTransaction().begin();
		try {
			em.persist(entity);
			em.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
			em.getTransaction().rollback();
		}
		

	}

	public Video findVideoWithFavorites(String videoId) {
		String jpql = "SELECT v FROM Video v LEFT JOIN FETCH v.favorites WHERE v.id = :videoId";
		return em.createQuery(jpql, Video.class).setParameter("videoId", videoId).getSingleResult();
	}
	
	

	@Override
	public void update(Video entity) {
		em.getTransaction().begin();
		try {
			em.merge(entity);
			em.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
			em.getTransaction().rollback();
		}
		

	}

	@Override
	public void delete(String id) {
		em.getTransaction().begin();
		try {
			em.remove(em.find(Video.class, id));
			em.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
			em.getTransaction().rollback();
		}
	}

}
