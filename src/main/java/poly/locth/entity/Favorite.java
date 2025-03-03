package poly.locth.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;
import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table(name = "Favorites", uniqueConstraints = { @UniqueConstraint(columnNames = { "Userid", "Videoid" }) })

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class Favorite {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@ManyToOne
	@JoinColumn(name = "UserId")
    @JsonBackReference
	private User user;
	@ManyToOne
	@JoinColumn(name = "VideoId")
    @JsonBackReference
	private Video video;
	@Temporal(TemporalType.DATE)
	private Date likeDate = new Date();
}
