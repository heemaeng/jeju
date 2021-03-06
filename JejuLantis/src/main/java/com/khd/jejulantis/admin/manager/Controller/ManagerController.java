package com.khd.jejulantis.admin.manager.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.khd.jejulantis.admin.manager.Service.ManagerService;
import com.khd.jejulantis.admin.sms.Service.SmsService;
import com.khd.jejulantis.model.Branch;
import com.khd.jejulantis.model.Manager;
import com.khd.jejulantis.model.Member;


@Controller
public class ManagerController {
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	@Autowired
	ManagerService managerService;
	@Autowired
	private SmsService sservice;
	
	@RequestMapping(value="admin/managerlogin.do",method=RequestMethod.GET)
	public String login() {
		return "admin/adminUsers/login";
	}
	@RequestMapping(value="admin/register.do",method=RequestMethod.GET)
	public String register() {
		return "admin/adminUsers/register";
	}
	@RequestMapping(value="admin/manager.do", method=RequestMethod.POST)
	public String join(Manager manager,@RequestParam(value="hp1")String hp1,@RequestParam(value="hp2")String hp2,@RequestParam(value="hp3")String hp3,@RequestParam(value="hp4")String hp4,@RequestParam(value="hp5")String hp5,@RequestParam(value="hp6")String hp6,@RequestParam(value="birth1")String birth1,@RequestParam(value="birth2")String birth2,@RequestParam(value="birth3")String birth3) {		
		System.out.println("지나감!!");
		String manager_birth = birth1+"-"+birth2+"-"+birth3;
		String manager_tel1 = hp1+"-"+hp2+"-"+hp3;
		if( hp4 == null && hp5 == null && hp6 == null) {
			String manager_tel2 = null;	
		}else{
			String manager_tel2 = hp4+"-"+hp5+"-"+hp6;
		}
		String manager_tel2 = hp4+"-"+hp5+"-"+hp6;
		manager.setManager_tel1(manager_tel1);
		manager.setManager_tel2(manager_tel2);
		manager.setManager_birth(manager_birth);
		String manager_pwd = manager.getManager_pwd();
		
		if(StringUtils.hasText(manager_pwd)) {
			String bCryptString = passwordEncoder.encode(manager_pwd);
			manager.setManager_pwd(bCryptString);
		}
		boolean flag = managerService.joinService(manager);
		return "admin/adminUsers/login";
	}
	@RequestMapping(value="admin/managermypage.do", method=RequestMethod.GET)
	public String mypage(Model model,HttpSession session) {		
		System.out.println("지나감!!");
		Manager log = (Manager) session.getAttribute("managerlog");	
		String manager_id = log.getManager_id();
		String branch_name = log.getBranch_name();
		String manager_tel1=log.getManager_tel1();
		String manager_tel2=log.getManager_tel2();
		
		Manager nn = managerService.mypageService(manager_id);
		System.out.println("idCkkkk :" + manager_id);
		System.out.println("branch_name :" + branch_name);
		System.out.println("getManager_id :" + nn.getManager_id());
		//System.out.println("nn.manager_birth1 :" + nn.getManager_birth());
		model.addAttribute("nn", nn);
	
		return "admin/adminUsers/mypage";
	}
	@RequestMapping(value="admin/managermodify.do", method=RequestMethod.POST)
	 public String managermodify(Manager manager, HttpSession session)  {	
		System.out.println("지나감!~~~~");
		System.out.println("tel123 :" +manager.getManager_tel1());
		System.out.println("tel456 :" +manager.getManager_tel2());
		 System.out.println("birth123 :" +manager.getManager_birth());
		 String manager_pwd = manager.getManager_pwd();		
			if(StringUtils.hasText(manager_pwd)) {
				String bCryptString = passwordEncoder.encode(manager_pwd);
				manager.setManager_pwd(bCryptString);
			}
		Manager md = managerService.modifyService(manager);
			if(md!=null) {
				md = new Manager(manager.getManager_id());
				session.setAttribute("managerlog", md);	
				System.out.println("id1 :" +manager.getManager_id());
			}			
//			return "/admin";
			return "redirect:./index.do";
		}
	
	@RequestMapping(value = "admin/adminUsers/post", method = RequestMethod.GET)
	public void get(){
		
	}
	@RequestMapping(value = "admin/adminUsers/apost", method = RequestMethod.GET)
	 @ResponseBody public List<Branch> aget(@RequestParam(value = "user", required=false) String branch_name){
		List<Branch> branchList = null;
		if(branch_name != null) {
			branchList = managerService.postService(branch_name);
		}
		System.out.println("branchList.size "+branchList.size());
		return branchList;
	}
	@RequestMapping(value = "admin/adminUsers/post", method = RequestMethod.POST)
	public ModelAndView post(Locale locale,Branch branch,HttpServletRequest request, @RequestParam(value = "branch_name", required=false) String branch_name){

		ModelAndView result = new ModelAndView();
		if(branch_name != ""){
			List<Branch> branchList = managerService.postService(branch_name);
			System.out.println("branchname"+ branch_name);
			
			for (Branch post : branchList) {
				
				System.out.println("업체명 "+post.getBranch_name());
				System.out.println("업체주소"+post.getBranch_local());
				System.out.println("업체번호"+post.getBranch_member_tel());				
			}
			System.out.println("branchname11"+ branchList.size());
			result.addObject("result", branchList);
			result.setViewName("admin/adminUsers/post");
			return result;
			
		}else{
			result.addObject("nullResult", "검색해주세요.");
			result.setViewName("admin/adminUsers/post");
			return result;
		}
	}
	@RequestMapping(value = "/main")
	public String main(){
		return "main";
	}
	 @RequestMapping(value = "/idcheckmanager.do" , method = RequestMethod.POST)
	    @ResponseBody
	    public Map<Object, Object> idcheck(@RequestBody String manager_id) {
		 System.out.println("id1 =" +manager_id);
	        int count = 0;
	        Map<Object, Object> map = new HashMap<Object, Object>();
//	        System.out.println("id2 =" +member_id);
	        count = managerService.idcheck(manager_id);
	        map.put("cnt", count);
//	        System.out.println("id3 =" +member_id);
	        return map;
	    }
	 @RequestMapping(value = "/emailcheckmanager.do" , method = RequestMethod.POST)
	    @ResponseBody
	    public Map<Object, Object> emailcheck(@RequestBody String manager_email) {
		 System.out.println("manager_email =" +manager_email);
	        int count = 0;
	        Map<Object, Object> map = new HashMap<Object, Object>();
//	        System.out.println("id2 =" +id);
	        count = managerService.emailcheck(manager_email);
	        map.put("cnt", count);
//	        System.out.println("id3 =" +id);
	        return map;
	    }
	 /*@RequestMapping(value = "/Managerlogin/ManagerloginCheck",method = RequestMethod.POST)
		public void loginCheck(Manager manager,HttpSession session,HttpServletResponse request,
				HttpServletResponse response) throws IOException {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			if ((manager.getManager_id()!= null && !manager.getManager_id().equals("") && manager.getManager_pwd()!= null
					&& !manager.getManager_pwd().equals(""))) {
				 System.out.println("getManager_id =" +manager.getManager_id());
				 System.out.println("getManager_pwd =" + manager.getManager_pwd());
				Manager Info1 = null;
				 Manager nn = managerService.loginCheck(manager);
				if (nn != null) {					 
					session.setAttribute("managerlogin", 0);	
//					Info1 = new Manager(manager.getManager_id(),manager.getBranch_no());
					session.setAttribute("managerlog", nn);
					Manager managerlog = (Manager)session.getAttribute("managerlog");
					out.println("<script>location.href='/jejulantis/admin/index.do'; </script>");
					out.flush();
					out.close();
				}
				if (nn == null) {
					out.println("<script>alert('로그인정보를확인하세요'); history.go(-1); </script>");
					out.flush();
					out.close();
				}
			}
			 System.out.println("getManager_id 1111=" +manager.getManager_id());
			 System.out.println("getManager_id 1111=" +manager.getManager_id());
			 System.out.println("getManager_pwd 1111=" + manager.getManager_pwd());
		}
*/
//		@RequestMapping(value = "/managerlogin/managerlogout")
//		public ModelAndView logOut(ModelAndView mv, HttpSession session) {			
//			String page = "redirect:/admin/index.do";
//			session.removeAttribute("managerlog");
//			mv.setViewName(page);
//			return mv;
//			}
		 @RequestMapping(value="admin/managerdelete.do")
			public String delete(HttpSession session) {
			 System.out.println("id1:"+ session.getId());		
			 Manager log = (Manager) session.getAttribute("managerlog");
			 System.out.println("id2:"+ session.getId());
				String manager_id = log.getManager_id();
				System.out.println("idwqeqwqwe:"+ manager_id);
			 System.out.println("id7777:"+ manager_id);	
			 int dm = managerService.managerdeleteService(manager_id);
			 session.removeAttribute("managerlog");
			 System.out.println("idwqeqwqwe:"+ manager_id);
				return "admin/adminUsers/login";
			
			}
		 @RequestMapping(value = "admin/managerfind_id.do", method = RequestMethod.POST)
			public String find_id(HttpServletResponse response, @RequestParam("manager_email") String manager_email, Model md) throws Exception{
				 System.out.println("지나감123456");
				 response.setCharacterEncoding("UTF-8");
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
				 String manager_id = managerService.find_id(manager_email);
				 if (manager_id == null) {
					 	out.println("<script language='javascript'>");
						out.println("alert('일치하지 않습니다');");
						out.println("history.go(-1);");
						out.println("</script>");
						out.close();
						return null;
					} else {
						md.addAttribute("manager_id", managerService.find_id(manager_email));
					}
				 return "/admin/adminUsers/managerfind_id";
				
			}
					/*@RequestMapping(value = "admin/managerfind_pwd.do", method = RequestMethod.POST)
					public String find_pwd(HttpServletRequest request,HttpServletResponse response, @RequestParam("manager_id") String manager_id, Model md) throws Exception{												
						System.out.println("");
						 System.out.println("id11111:"+ manager_id);
						 response.setCharacterEncoding("UTF-8");
							response.setContentType("text/html; charset=UTF-8");
							PrintWriter out = response.getWriter();
						 String manager_pwd = managerService.find_pwd(manager_id);
						 System.out.println("pwd222221:"+ manager_pwd);
						 if (manager_pwd == null) {
								out.println("<script language='javascript'>");
								out.println("alert('일치하지 않습니다');");
								out.println("history.go(-1);");
								out.println("</script>");
								out.close();
								return null;
							} else {
								md.addAttribute("manager_pwd", managerService.find_pwd(manager_id));
							}
						 return "/admin/adminUsers/managerfind_pwd";
						
					}*/
		// 비밀번호 찾기
					@RequestMapping(value = "admin/managerfind_pwd.do", method = RequestMethod.POST)
					public void find_pw(@ModelAttribute Manager manager, HttpServletResponse response,@RequestParam("manager_id") String manager_id,@RequestParam("manager_email") String manager_email, Model md) throws Exception{	
						System.out.println("email"+ manager_email);
						managerService.find_pw(response, manager, manager_id,manager_email, md);
					}
				 
					@RequestMapping(value = "admin/managerfind_id_form.do",method=RequestMethod.GET)
					public String find_id_form() {						
						return "admin/adminUsers/managerfind_id_form";
					}
					@RequestMapping(value = "admin/managerfind_pwd_form.do",method=RequestMethod.GET)
					public String find_pwd_form() {
						return "admin/adminUsers/managerfind_pwd_form";
					}
					@RequestMapping(value = "admin/CheckPwd.do",method=RequestMethod.POST)
					public String CheckPwd(Manager manager, HttpSession session) {
						 String manager_pwd = manager.getManager_pwd();	
						 if(StringUtils.hasText(manager_pwd)) {
								String bCryptString = passwordEncoder.encode(manager_pwd);
								manager.setManager_pwd(bCryptString);
							}
						 managerService.changePwd(manager);
						return "admin/adminUsers/login";
					}
					/*@RequestMapping(value="admin/managermodify.do", method=RequestMethod.POST)
					 public String managermodify(Manager manager, HttpSession session)  {	
						System.out.println("지나감!~~~~");
						System.out.println("tel123 :" +manager.getManager_tel1());
						System.out.println("tel456 :" +manager.getManager_tel2());
						 System.out.println("birth123 :" +manager.getManager_birth());
						 String manager_pwd = manager.getManager_pwd();		
							if(StringUtils.hasText(manager_pwd)) {
								String bCryptString = passwordEncoder.encode(manager_pwd);
								manager.setManager_pwd(bCryptString);
							}
						Manager md = managerService.modifyService(manager);
							if(md!=null) {
								md = new Manager(manager.getManager_id());
								session.setAttribute("managerlog", md);	
								System.out.println("id1 :" +manager.getManager_id());
							}			
//							return "/admin";
							return "redirect:./index.do";
						}
					*/

}
