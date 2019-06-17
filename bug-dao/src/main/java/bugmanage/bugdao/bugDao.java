package bugmanage.bugdao;

import bugmanage.bugbase.bug;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface bugDao {
	List<bug> getAll();
	List<bug> fenye(@Param("curr") int curr, @Param("page") int page);
	List<bug> chakan(int type);
	int add(@Param("project") int project, @Param("severity") int severity, @Param("title") String title, @Param("username") String username);

}
