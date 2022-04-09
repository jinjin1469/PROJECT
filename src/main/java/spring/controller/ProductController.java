package spring.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import spring.dao.MemberDao;
import spring.dao.ProductDao;
import spring.vo.AuthInfo;
import spring.vo.Cart;
import spring.vo.Notice;
import spring.vo.Option;
import spring.vo.Product;
import spring.vo.ProductCommand;
import spring.vo.Qna;
import spring.vo.RegisterRequest;
import spring.vo.Review;

@Controller
@RequestMapping("/product")
public class ProductController {

	private ProductDao dao;
	public void setDao(ProductDao dao) {
		this.dao = dao;
	}
	
	private String getFolder() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		return str.replace("-", File.separator);
	}
	
	
	
//	@RequestMapping("/totalList")
//	public String total(Model model) {
//		List<Product> product = dao.productAll();
//		model.addAttribute("Product", product);
//		
//		return "PRODUCT/totalProductList";
//	}
	
	@RequestMapping("/List/{menu}")
	public String total(@PathVariable("menu") String menu,Model model) {
		List<Product> product = null;
		if(menu.equals("totalList")) {
			product = dao.productAll();
		}else if(menu.equals("bestList")) {
			product = dao.productBest();
		}else if(menu.equals("newList")) {
			product = dao.productNew();
		}
		
		model.addAttribute("Product", product);
		
		return "PRODUCT/totalProductList";
	}
	
	@RequestMapping("/categoryList/{category}")
	public String category(@PathVariable("category") String category,Model model) {
		List<Product> product = dao.category(category);
		model.addAttribute("Product", product);
		
		return "PRODUCT/categoryProductList";
	}
	
	@RequestMapping("/detail/{num}")
	public String detailG(@PathVariable("num") int num,Model model,HttpServletRequest request) {
		
		Product product = dao.productSelect(num);
		List<Option> productOption = dao.productOptionSelect(num);
		

		long product_number = dao.productNum(num);

		
		String _section = request.getParameter("section");
		String _pageNum = request.getParameter("pageNum");
		
		int section = Integer.parseInt((_section==null)?"1":_section);
		int pageNum = Integer.parseInt((_pageNum==null)?"1":_pageNum);
		
		int totalCnt = dao.selectAllNumBoard(product_number);
		List<Qna> qnaList = dao.selectTargetBoard(section, pageNum, product_number);
		
		request.setAttribute("totalCnt", totalCnt);
		request.setAttribute("section", section);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("qna", qnaList);

		List<Review> reviewList = dao.reviewList(product_number);
		
		model.addAttribute("review", reviewList);
		model.addAttribute("num", num);
		model.addAttribute("Qna",qnaList);
		model.addAttribute("Product", product);
		model.addAttribute("ProductOption", productOption);
		model.addAttribute("formData", new Cart()); 
		model.addAttribute("cartData", new Cart());
		System.out.println("ckck");
		
		return "PRODUCT/productDetail";
	}
	

	@RequestMapping("/detail/{num}#qna")
	public String detailGQ(@PathVariable("num") int num,Model model) {
		
		Product product = dao.productSelect(num);
		List<Option> productOption = dao.productOptionSelect(num);
		long product_number = dao.productNum(num);
		List<Qna> qnaList = dao.qnaList(product_number);
		
		model.addAttribute("num", num);
		model.addAttribute("Qna",qnaList);
		model.addAttribute("Product", product);
		model.addAttribute("ProductOption", productOption);
		model.addAttribute("formData", new Cart()); 
		model.addAttribute("cartData", new Cart());
		
		return "PRODUCT/productDetail/{num}#qna";
	}
	
	
	
	
	
	
	
	@RequestMapping(value="/update/{num}",method=RequestMethod.GET)
	public String updateG(@PathVariable("num") int num,Model model) {
		
		Product product = dao.productSelect(num);
		System.out.println(product.getProduct_count());
		
		List<Option> productOption1 = dao.productOptionSelect(num);

		ArrayList<Option> productOption = new ArrayList<Option>();
		int option_loop = 0;
		if(productOption1!=null) {
			for(Option p : productOption1) {
				option_loop++;
				productOption.add(p);
			}
		}

		model.addAttribute("ProductCommand", new ProductCommand(
				product.getCategory_1(),
				product.getCategory_2(),
				product.getProduct_name(),
				product.getOption_join_number(),
				product.getProduct_price(),
				product.getProduct_count(),
				product.getProduct_cookingTime(),
				product.getProduct_weight(),
				product.getProduct_storage(),
				productOption,
				option_loop));

		model.addAttribute("category_1",product.getCategory_1());
		model.addAttribute("category_2",product.getCategory_2());
		model.addAttribute("productOption",productOption);
		model.addAttribute("option_loop",option_loop);
		
		return "PRODUCT/productUpdate";
	}
	
	@RequestMapping(value="/update/{num}",method=RequestMethod.POST)
	public String updateP(@PathVariable("num") int num,ProductCommand pic, 
		     Model model) throws IllegalStateException, IOException {
		int productNum = dao.updateProductNumber(num);
		Product productIMG = dao.productSelect(num);
		ArrayList<MultipartFile> file = pic.getUploadFile();
		
		Product product = new Product(num,pic.getProduct_Name(),pic.getProduct_Price(),pic.getProduct_Count(),pic.getProduct_CookingTime(),pic.getProduct_weight(),pic.getProduct_Storage());
		
		if(pic.getCategory_1()!=null) {
			product.setCategory_1(pic.getCategory_1());
		}
		if(pic.getCategory_2()!=null) {
			product.setCategory_2(pic.getCategory_2());
		}
		
		String uploadFolder = "C:\\upload\\temp";
		
		File uploadPath = new File(uploadFolder, getFolder());
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		String[] classification = {"M","D","I"};
		int number = 0;
		for (MultipartFile multipartFile : file) {
			if(!multipartFile.isEmpty()) {
				String uploadFileName = multipartFile.getOriginalFilename();
				
				String filenameExtension = uploadFileName.substring(uploadFileName.lastIndexOf("."));
				System.out.println(filenameExtension);
				uploadFileName = productNum+classification[number]+filenameExtension;
				
				String productImagePath = getFolder()+"\\"+uploadFileName;
				
				if(number==0) {
					product.setProduct_m_image(productImagePath);
					System.out.println("check1");
				}else if(number==1) {
					product.setProduct_d_image(productImagePath);
					System.out.println("check2");
				}else if(number==2) {
					product.setProduct_i_image(productImagePath);
					System.out.println("check3");
				}
				
				File saveFile = new File(uploadPath, uploadFileName);
				
				try {
					multipartFile.transferTo(saveFile);
					
				}catch(Exception e) {
					e.printStackTrace();
				}
			}else {
				if(number==0) {
					product.setProduct_m_image(productIMG.getProduct_m_image());
				}else if(number==1) {
					product.setProduct_d_image(productIMG.getProduct_d_image());
				}else if(number==2) {
					product.setProduct_i_image(productIMG.getProduct_i_image());
				}
			}
			number++;
		}
		
		dao.updateProduct(product);
		
		int join_number = dao.selectJoinNumber(product.getProduct_name());
		int roop = 0;
		
		if(pic.getProduct_Option()!=null) {
			for (Option option : pic.getProduct_Option()) {
				if(option.getDelete_check()==1) { 
					option.setOption_Join_Number(join_number);				
					dao.optionDelete(option);	
				}else if(roop>=pic.getOption_loop()) { 
					if(option.getOption_Name()!=null) {
						option.setOption_Join_Number(join_number);
						dao.insertOption(option);
					}
				}else if(option.getOption_Name()!=null){
					dao.updateOption(option);
				}
					
				roop++;
			}	
		}
		return "redirect:/product/detail/"+join_number;
	}
	
	@RequestMapping(value="/insert",method=RequestMethod.GET)
	public String uploadG(Model model) {
		
		
		return "PRODUCT/productInsert";
	}
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	public String uploadP(ProductCommand pic, 
			     Model model) throws IllegalStateException, IOException {
		
		int productNum = dao.seqNumber();
		System.out.println(productNum);
		
		ArrayList<MultipartFile> file = pic.getUploadFile();
		
		Product product = new Product(pic.getProduct_Name(),pic.getProduct_Price(),pic.getProduct_Count(),pic.getProduct_CookingTime(),pic.getProduct_weight(),pic.getProduct_Storage());
		
		if(pic.getCategory_1()!=null) {
			product.setCategory_1(pic.getCategory_1());
		}
		if(pic.getCategory_2()!=null) {
			product.setCategory_2(pic.getCategory_2());
		}
		
		String uploadFolder = "C:\\upload\\temp";
		
		File uploadPath = new File(uploadFolder, getFolder());
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		String[] classification = {"M","D","I"};
		int num = 0;
		for (MultipartFile multipartFile : file) {
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			String filenameExtension = uploadFileName.substring(uploadFileName.lastIndexOf("."));
			
			uploadFileName = productNum+classification[num]+filenameExtension;
			
			String productImagePath = getFolder()+"\\"+uploadFileName;
			
			if(num==0) {
				product.setProduct_m_image(productImagePath);
			}else if(num==1) {
				product.setProduct_d_image(productImagePath);
			}else if(num==2) {
				product.setProduct_i_image(productImagePath);
			}
			
			File saveFile = new File(uploadPath, uploadFileName);
			
			try {
				multipartFile.transferTo(saveFile);
				num++;
			}catch(Exception e) {
				e.printStackTrace();
			}

		}
		product.setProduct_number(productNum);
		dao.insertProduct(product);
		int join_number = dao.selectJoinNumber(product.getProduct_name());
		
		if(pic.getProduct_Option()!=null) {
			for (Option option : pic.getProduct_Option()) {
				option.setOption_Join_Number(join_number);
				if(option.getOption_Name()!=null) {
					dao.insertOption(option);
				}
			}
		}
		
		return "redirect:/product/detail/"+join_number;
	}
}
