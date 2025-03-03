package poly.locth.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table(name = "Users")
@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
	@Id
	private	String id;
	private	String password;
	private	String email;
	private	String fullname;
	private	Boolean admin = false;
	@OneToMany(mappedBy = "user")
    @JsonManagedReference
	private List<Favorite> favorites;
	@OneToMany(mappedBy = "user")
    @JsonManagedReference
	private List<Share> shares;
}
