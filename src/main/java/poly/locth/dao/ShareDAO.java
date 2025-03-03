package poly.locth.dao;

import java.util.List;

import javax.persistence.EntityManager;

import poly.locth.entity.Share;
import poly.locth.until.XJPA;

public class ShareDAO implements DAOImpl<Share, Long>{
	EntityManager em = XJPA.getEntityManager();
	@Override
	protected void finalize() throws Throwable {
		em.close();// dong EntiryManager khi DAO bi giai phong
		super.finalize();
	}
	@Override
	public List<Share> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Share findById(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void create(Share entity) {
		try {
			em.getTransaction().begin();
			em.persist(entity);
			em.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
			em.getTransaction().rollback();
		}	
		
	}

	@Override
	public void update(Share entity) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Long id) {
		// TODO Auto-generated method stub
		
	}

}
