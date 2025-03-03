package poly.locth.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table(name= "Shares")
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class Share {
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private Long id;
@ManyToOne
@JoinColumn(name = "Userid")
private User user;
@ManyToOne
@JoinColumn(name = "Videoid")
private Video video;
private String emails;
@Temporal(TemporalType.DATE)
private Date sharedate = new Date() ;
}
