package poly.locth.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import poly.locth.entity.User;
import poly.locth.until.XJPA;

public class UserDAO implements DAOImpl<User, String>{
	public EntityManager em = XJPA.getEntityManager();
	@Override
	protected void finalize() throws Throwable {
		em.close();// dong EntiryManager khi DAO bi giai phong
		super.finalize();
	}
	@Override
	public List<User> findAll() {
		TypedQuery<User> query = em.createQuery("SELECT o FROM User o", User.class);
		return query.getResultList();
	}
	public List<User> findAllByPage(int start, int limit) {
		TypedQuery<User> query = em.createQuery("SELECT o FROM User o", User.class);
		query.setFirstResult(start);
		query.setMaxResults(limit);
		return query.getResultList();
	}

	@Override
	public User findById(String id) {		
		return em.find(User.class, id);
	}
	public List<User> reportUserLikeVideo(String id) {
	    String jpql = "select f.user from Favorite f where f.video.id = :id " ;
	    TypedQuery<User> query = em.createQuery(jpql, User.class);
	    query.setParameter("id", id);
	    return query.getResultList();
	}
	@Override
	public void create(User entity) {
		em.getTransaction().begin();

		try {
			em.persist(entity);
			em.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
			em.getTransaction().rollback();
		}			
	}

	@Override
	public void update(User entity) {
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
			em.remove(em.find(User.class,id));
			em.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
			em.getTransaction().rollback();
		}
	}

}
