package poly.locth.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import poly.locth.entity.Favorite;
import poly.locth.entity.Video;
import poly.locth.until.XJPA;

public class FavoriteDAO implements DAOImpl<Favorite, Long> {
	EntityManager em = XJPA.getEntityManager();
	@Override
	protected void finalize() throws Throwable {
		em.close();// dong EntiryManager khi DAO bi giai phong
		super.finalize();
	}
	public List<Object[]> reportUFav() {
	    // Truy vấn JPQL để lấy số lượng người dùng, video id và min/max likeDate
	    String jpql = "select count(f.user.id),f.video.id, min(f.likeDate), max(f.likeDate)" +
	                  "from Favorite f " +
	                  "group by f.video.id";
	    TypedQuery<Object[]> query = em.createQuery(jpql, Object[].class);
	    return query.getResultList();
	}
	
	@Override
	public List<Favorite> findAll() {
		// TODO Auto-generated method stub
		return null;
	}
	public List<Favorite> findByTime(int time1, int time2) {
		String jpql = "SELECT o FROM Favorite o WHERE year(o.likeDate) BETWEEN ?0 AND ?1";
		TypedQuery<Favorite> query = em.createQuery(jpql, Favorite.class);
		query.setParameter(0, time1);
		query.setParameter(1, time2);

		return query.getResultList();
	}
	public List<Favorite> findByFav(String id) {
		Video v = em.find(Video.class, id);
		return v.getFavorites();
	}
	@Override
	public Favorite findById(Long id) {
		
		return em.find(Favorite.class, id);
	}

	@Override
	public void create(Favorite entity) {
		try {
			em.getTransaction().begin();
			em.persist(entity);
			em.getTransaction().commit();
			
		} catch (Exception e) {
			System.out.println("Thêm thất bại");
			em.getTransaction().rollback();
		}
		
	}

	@Override
	public void update(Favorite entity) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Long id) {
		try {
			em.getTransaction().begin();
			em.remove(em.find(Favorite.class, id));
			em.getTransaction().commit();
			
		} catch (Exception e) {
			System.out.println("Xóa thất bại");
			em.getTransaction().rollback();
		}
		
	}



}
