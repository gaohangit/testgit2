package bugmanage.bugservice.impl;

import bugmanage.bugbase.bug;
import bugmanage.bugdao.bugDao;
import bugmanage.bugservice.bugService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service
public class bugServiceImpl implements bugService {
@Resource
bugDao dao;

	@Override
	public List<bug> getAll() {
		// TODO Auto-generated method stub
		return dao.getAll();
	}

	@Override
	public List<bug> fenye(int curr, int page) {
		// TODO Auto-generated method stub
		return dao.fenye(curr,page);
	}

	@Override
	public List<bug> chakan(int type) {
		// TODO Auto-generated method stub
		return dao.chakan(type);
	}

	@Override
	public int add(int project, int severity, String title, String username) {
		// TODO Auto-generated method stub
		return dao.add(project,severity,title,username);
	}

}
