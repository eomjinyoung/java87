package bitcamp.java87.project01.controller;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import bitcamp.java87.project01.domain.Page;
import bitcamp.java87.project01.domain.Product;
import bitcamp.java87.project01.domain.Search;
import bitcamp.java87.project01.service.ProductService;


@Controller
@RequestMapping("/product/*") // 
public class ProductController {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
		
	public ProductController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize; 
	
	
	@SuppressWarnings("deprecation")
	@RequestMapping( value="addProduct", method=RequestMethod.POST )
	public String addProduct(@ModelAttribute("product") Product product, @ModelAttribute("search") Search search
			,Model model , HttpServletRequest request) 
				 throws Exception{
	
		System.out.println("/product/addProduct : POST");

		if (FileUpload.isMultipartContent(request)) {
			String temDir = "C:\\workspace\\07.Model2MVCShop(URI,pattern)\\webContent\\images\\uploadFiles\\";
			
			DiskFileUpload fileUpload = new DiskFileUpload();
			fileUpload.setRepositoryPath(temDir);
			
			fileUpload.setSizeMax(1024 * 1024 * 10);
			fileUpload.setSizeThreshold(1024 * 100);
			
			if (request.getContentLength() < fileUpload.getSizeMax()) {
//				product = new Product();
				
				StringTokenizer token = null;
				
				@SuppressWarnings("rawtypes")
				List fileitemList = fileUpload.parseRequest(request);
				int size = fileitemList.size();
				
				for (int i = 0; i < size; i++) {
//				for (Object i: fileitemList) {
//					FileItem fileItem = (FileItem)fileitemList.get((int) i);
					FileItem fileItem = (FileItem)fileitemList.get(i);
					
					if (fileItem.isFormField()) {
						if (fileItem.getFieldName().equals("manuDate")) {
							token = new StringTokenizer(fileItem.getString("euc-kr"), "-");
							
							String manuDate = token.nextToken() + token.nextToken() + token.nextToken();
							product.setManuDate(manuDate);
						}
						else if (fileItem.getFieldName().equals("prodName")) {
							product.setProdName(fileItem.getString("euc-kr"));
						}else if (fileItem.getFieldName().equals("prodDetail")) {
							product.setProdDetail(fileItem.getString("euc-kr"));
							System.out.println(product.getProdDetail());
						}else if (fileItem.getFieldName().equals("price")) {
							product.setPrice(Integer.parseInt(fileItem.getString("euc-kr")));
							System.out.println(product.getPrice());
						}
						
					}else{
						if (fileItem.getSize() > 0) {
							int idx = fileItem.getName().lastIndexOf("\\");
							
							if (idx == -1) {
								idx = fileItem.getName().lastIndexOf("/");
							}
							
							String fileName = fileItem.getName().substring(idx + 1);
							product.setFileName(fileName);
							
							try{
								System.out.println("try");
								System.out.println(temDir);
								System.out.println(fileName);
								
								File uploadedFile = new File(temDir, fileName);
								fileItem.write(uploadedFile);
								
							}catch (Exception e) {
								// TODO: handle exception
								System.out.println(e);
							}
							
						}else{
							product.setFileName("../../images/empty.GIF");
						}
					}
				}
				System.out.println("========== "+product);
				productService.addProduct(product);
				
			}
		}
		
		listProduct(search, model,request);

		/*Map<String , Object> map=productService.getProductList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);*/
		
		return "forward:/product/listProduct.jsp";
	}
	
	//@RequestMapping("/listUser.do")
		@RequestMapping("listProduct")
		public String listProduct( @ModelAttribute("search") Search search , Model model 
				, HttpServletRequest request) throws Exception{
			
			System.out.println("/product/listProduct : GET / POST");
			System.out.println(search);
			System.out.println(model);
			System.out.println(request);
			
			if(search.getCurrentPage() ==0 ){
				search.setCurrentPage(1);
			}
			search.setPageSize(pageSize);
			
			Map<String , Object> map=productService.getProductList(search);
			
			Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
			System.out.println(resultPage);
			
			model.addAttribute("list", map.get("list"));
			model.addAttribute("resultPage", resultPage);
			model.addAttribute("search", search);
			
			return "forward:/product/listProduct.jsp";
		}
	
	//@RequestMapping("/getUser.do")
	@RequestMapping( value="getProduct", method=RequestMethod.GET )
	public String getProduct( @RequestParam() int prodNo , Model model, @RequestParam() String menu ) throws Exception {
		
		System.out.println("/product/getProduct : GET");
		//Business Logic
		Product product = productService.getProduct(prodNo);
		model.addAttribute("product", product);
		model.addAttribute("menu", menu); // ��� request�� �����Ѵ�
		
		return "forward:/product/getProduct.jsp";
	}
	
	//@RequestMapping("/updateUserView.do")
	//public String updateProduct( @RequestParam() String prodNo , Model model ) throws Exception{
	@RequestMapping( value="updateProduct", method=RequestMethod.POST )
	public String updateUser( @ModelAttribute() Product product , Model model ) throws Exception{

		System.out.println("/product/updateProduct : POST");
		System.out.println(product);
		System.out.println(model);
		
		productService.updateProduct(product);
		
		//Business Logic
		product = productService.getProduct(product.getProdNo());
		model.addAttribute("product", product);
		
		return "forward:/product/getProduct.jsp?menu=manage";
	}
	
	//@RequestMapping("/updateUser.do")
//	@RequestMapping( value="updateUser", method=RequestMethod.POST )
//	public String updateUser( @ModelAttribute("user") User user , Model model , HttpSession session) throws Exception{
//
//		System.out.println("/user/updateUser : POST");
//		//Business Logic
//		userService.updateUser(user);
//		
//		String sessionId=((User)session.getAttribute("user")).getUserId();
//		if(sessionId.equals(user.getUserId())){
//			session.setAttribute("user", user);
//		}
//		
//		//return "redirect:/getUser.do?userId="+user.getUserId();
//		return "redirect:/user/getUser?userId="+user.getUserId();
//	}
	
	//@RequestMapping("/loginView.do")
	//public String loginView() throws Exception{
//	@RequestMapping( value="login", method=RequestMethod.GET )
//	public String login() throws Exception{
//		
//		System.out.println("/user/logon : GET");
//
//		return "redirect:/user/loginView.jsp";
//	}
	
	//@RequestMapping("/login.do")
//	@RequestMapping( value="login", method=RequestMethod.POST )
//	public String login(@ModelAttribute("user") User user , HttpSession session ) throws Exception{
//		
//		System.out.println("/user/login : POST");
//		//Business Logic
//		User dbUser=userService.getUser(user.getUserId());
//		
//		if( user.getPassword().equals(dbUser.getPassword())){
//			session.setAttribute("user", dbUser);
//		}
//		
//		return "redirect:/index.jsp";
//	}
	
	//@RequestMapping("/logout.do")
//	@RequestMapping( value="logout", method=RequestMethod.GET )
//	public String logout(HttpSession session ) throws Exception{
//		
//		System.out.println("/user/logout : POST");
//		
//		session.invalidate();
//		
//		return "redirect:/index.jsp";
//	}
	
	
	//@RequestMapping("/checkDuplication.do")
//	@RequestMapping( value="checkDuplication", method=RequestMethod.POST )
//	public String checkDuplication( @RequestParam("userId") String userId , Model model ) throws Exception{
//		
//		System.out.println("/user/checkDuplication : POST");
//		//Business Logic
//		boolean result=userService.checkDuplication(userId);
//		model.addAttribute("result", new Boolean(result));
//		model.addAttribute("userId", userId);
//
//		return "forward:/user/checkDuplication.jsp";
//	}
	
}