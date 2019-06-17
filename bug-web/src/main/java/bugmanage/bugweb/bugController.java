package bugmanage.bugweb;

import bugmanage.bugbase.bug;
import bugmanage.bugservice.bugService;
import io.swagger.annotations.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
@Api("测试")
@Controller
public class bugController {
	@ApiOperation(value = "这是测试",notes="成功")
	@ApiImplicitParams({@ApiImplicitParam(name="p1",value = "第一个参数",dataType = "String",paramType = "query")})
	@ApiResponses({
			@ApiResponse(code=400,message="参数对不上"),
			@ApiResponse(code=402,message="请求别拒绝"),
			@ApiResponse(code=404,message="页面找不到"),
	})
	@GetMapping(value = "ceshi1/{p1}")
	public bug ceshi(@PathVariable String p1){
		bug result=new bug();
		result.setPname("402");
		result.setTitle("看呆了");
		return result;
	}

	@Resource
    bugService service;
/*
	@GetMapping("index")
	public String index(){
		return "index";
	}
	*/

	@GetMapping("index")
	public String index(Integer yeshu,Model m){
		int size=service.getAll().size();
		if(size%3==0){
			size=size/3;
		}else{
			size=size/3+1;
		}
		if(yeshu==null||yeshu==0){
			yeshu=1;
		}
		int curr=(yeshu-1)*3;
	List<bug> list=service.fenye(curr,3);
	m.addAttribute("yeshu", yeshu);
	m.addAttribute("end", size);
	m.addAttribute("list", list);		
		return "aab";
	}

	@RequestMapping("chakan")
	public String chakan(int type,Model m){		
		List<bug> list=service.chakan(type);
		m.addAttribute("list", list);
		m.addAttribute("type", type);
		return "index";
		
	}



	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String b(bug bug,Model m){
		m.addAttribute("bug",bug);
		return "add";
	}
	@RequestMapping(value="/add22",method=RequestMethod.POST)
	public String a(@Validated Model m,bug bug,BindingResult br){
		
		System.out.println(br.hasErrors());
		System.out.println(br.getFieldError().getDefaultMessage());
		if(br.hasErrors()){
			return "index";
		}else{
			if(service.add(bug.getProjectId(),bug.getSeverity(),bug.getTitle(),bug.getReportUser())>0){
				m.addAttribute("info", "");
				return "forward:/index.action";
			}else{
				m.addAttribute("info", "");
				return "forward:/index.action";
			}
		}
		
		
		
	}
	
}
