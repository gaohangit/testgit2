package bugmanage.bugservice;

import bugmanage.bugbase.bug;

import java.util.List;



public interface bugService {
	List<bug> getAll();
	List<bug> fenye(int curr, int page);
	List<bug> chakan(int type);
	int add(int project, int severity, String title, String username);

}
