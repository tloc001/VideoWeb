package poly.locth.dao;

import java.util.List;

public interface DAOImpl <Entity, Key> {
List<Entity> findAll();
Entity findById(Key id);
 void create(Entity entity);
 void update(Entity	entity);
 void delete(Key id);
 
}
