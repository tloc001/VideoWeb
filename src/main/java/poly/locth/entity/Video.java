package poly.locth.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "Videos")
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Video {
	@Id
	private	String id;
	private	String title;
	private	String poster;
	private	int views;
	private	String Description;
	private	Boolean active;
	@OneToMany(mappedBy = "video")
	private List<Favorite> favorites;
	@OneToMany(mappedBy = "video")
	private List<Share> shares;
}
