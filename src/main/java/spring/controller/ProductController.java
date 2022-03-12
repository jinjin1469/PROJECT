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

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import spring.dao.MemberDao;
import spring.dao.ProductDao;
import spring.vo.Notice;
import spring.vo.Option;
import spring.vo.Product;
import spring.vo.ProductCommand;

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
	
	
	
	@RequestMapping("/totalList")
	public String totalG(Model model) {
		List<Product> product = dao.productAll();
		model.addAttribute("Product", product);
		
		return "PRODUCT/totalProductList";
	}
	
	@RequestMapping("/detail/{num}")
	public String detailG(@PathVariable("num") int num,Model model) {
		
		Product product = dao.productSelect(num);
		List<Option> productOption = dao.productOptionSelect(num);
		
		model.addAttribute("Product", product);
		model.addAttribute("ProductOption", productOption);
		
		return "PRODUCT/productDetail";
	}
	
	@RequestMapping(value="/update/{num}",method=RequestMethod.GET)
	public String updateG(@PathVariable("num") int num,Model model) {
		
		Product product = dao.productSelect(num);
		
		List<Option> productOption1 = dao.productOptionSelect(num);
		ArrayList<Option> productOption = new ArrayList<Option>();
		for(Option p : productOption1) {
			productOption.add(p);
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
				productOption));
		return "PRODUCT/productUpdate";
	}
	
	@RequestMapping(value="/update/{num}",method=RequestMethod.POST)
	public String updateP(@PathVariable("num") int num,ProductCommand pic, 
		     Model model) throws IllegalStateException, IOException {
		ArrayList<MultipartFile> file = pic.getUploadFile();
		System.out.println(file.get(0).getOriginalFilename()+"1");
		System.out.println(file.get(1).getOriginalFilename()+"2");
		System.out.println(file.get(2).getOriginalFilename()+"3");
		System.out.println(file.get(3).getOriginalFilename()+"4");
		
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
		String[] classification = {"M","H","D","I"};
		int number = 0;
		for (MultipartFile multipartFile : file) {
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			String filenameExtension = uploadFileName.substring(uploadFileName.lastIndexOf("."));
			
			uploadFileName = pic.getProduct_Name()+classification[number]+filenameExtension;
			
			String productImagePath = getFolder()+"\\"+uploadFileName;
			
			if(number==0) {
				product.setProduct_m_image(productImagePath);
			}else if(number==1) {
				product.setProduct_m_h_image(productImagePath);
			}else if(number==2) {
				product.setProduct_d_image(productImagePath);
			}else if(number==3) {
				product.setProduct_i_image(productImagePath);
			}
			
			File saveFile = new File(uploadPath, uploadFileName);
			
			try {
				multipartFile.transferTo(saveFile);
				number++;
			}catch(Exception e) {
				e.printStackTrace();
			}

		}
		
		
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/insert",method=RequestMethod.GET)
	public String uploadG(Model model) {
		
		model.addAttribute("ProductCommand", new ProductCommand());
		
		return "PRODUCT/productInsert";
	}
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	public String uploadP(ProductCommand pic, 
			     Model model) throws IllegalStateException, IOException {
		
		ArrayList<MultipartFile> file = pic.getUploadFile();
		
		Product product = new Product(pic.getProduct_Name(),pic.getProduct_Price(),pic.getProduct_Count(),pic.getProduct_CookingTime(),pic.getProduct_weight(),pic.getProduct_Storage());
		
		if(pic.getCategory_1()!=null) {
			product.setCategory_1(pic.getCategory_1());
		}
		if(pic.getCategory_2()!=null) {
			product.setCategory_2(pic.getCategory_2());
		}
		System.out.println(pic.getCategory_1());
		
		String uploadFolder = "C:\\upload\\temp";
		
		File uploadPath = new File(uploadFolder, getFolder());
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		String[] classification = {"M","H","D","I"};
		int num = 0;
		for (MultipartFile multipartFile : file) {
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			String filenameExtension = uploadFileName.substring(uploadFileName.lastIndexOf("."));
			
			uploadFileName = pic.getProduct_Name()+classification[num]+filenameExtension;
			
			String productImagePath = getFolder()+"\\"+uploadFileName;
			
			if(num==0) {
				product.setProduct_m_image(productImagePath);
			}else if(num==1) {
				product.setProduct_m_h_image(productImagePath);
			}else if(num==2) {
				product.setProduct_d_image(productImagePath);
			}else if(num==3) {
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
		
		dao.insertProduct(product);
		int join_number = dao.selectJoinNumber(product.getProduct_name());
		
		for (Option option : pic.getProduct_Option()) {
			option.setOption_Join_Number(join_number);
			dao.insertOption(option);
		}
		
		model.addAttribute("msg", "Please select a valid mediaFile..");
		return "redirect:/";
	}
}
