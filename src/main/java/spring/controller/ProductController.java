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
		
		if(productOption1!=null) {
			for(Option p : productOption1) {
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
				productOption));

		model.addAttribute("productOption",productOption);
		
		return "PRODUCT/productUpdate";
	}
	
	@RequestMapping(value="/update/{num}",method=RequestMethod.POST)
	public String updateP(@PathVariable("num") int num,ProductCommand pic, 
		     Model model) throws IllegalStateException, IOException {
		
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
		String[] classification = {"M","H","D","I"};
		int number = 0;
		for (MultipartFile multipartFile : file) {
			if(!multipartFile.isEmpty()) {
				String uploadFileName = multipartFile.getOriginalFilename();
				
				String filenameExtension = uploadFileName.substring(uploadFileName.lastIndexOf("."));
				System.out.println(filenameExtension);
				uploadFileName = pic.getProduct_Name()+classification[number]+filenameExtension;
				
				String productImagePath = getFolder()+"\\"+uploadFileName;
				
				if(number==0) {
					product.setProduct_m_image(productImagePath);
					System.out.println("check1");
				}else if(number==1) {
					product.setProduct_m_h_image(productImagePath);
					System.out.println("check2");
				}else if(number==2) {
					product.setProduct_d_image(productImagePath);
					System.out.println("check3");
				}else if(number==3) {
					product.setProduct_i_image(productImagePath);
					System.out.println("check4");
				}
				
				File saveFile = new File(uploadPath, uploadFileName);
				
				try {
					System.out.println("업로드check1");
					multipartFile.transferTo(saveFile);
					System.out.println("업로드check2");
					
				}catch(Exception e) {
					e.printStackTrace();
				}
			}else {
				if(number==0) {
					product.setProduct_m_image(productIMG.getProduct_m_image());
					System.out.println("check1");
				}else if(number==1) {
					product.setProduct_m_h_image(productIMG.getProduct_m_h_image());
					System.out.println("check2");
				}else if(number==2) {
					product.setProduct_d_image(productIMG.getProduct_d_image());
					System.out.println("check3");
				}else if(number==3) {
					product.setProduct_i_image(productIMG.getProduct_i_image());
					System.out.println("check4");
				}
			}
			number++;
		}
		
		dao.updateProduct(product);
		
		int join_number = dao.selectJoinNumber(product.getProduct_name());
		int roop = 0;

		for (Option option : pic.getProduct_Option()) {
			if(option.getDelete_check()==1) { // 값을 변경 후 삭제하면 변경된 값은 update가 되지않음
				System.out.println(roop+"삭제");
				option.setOption_Join_Number(join_number);				
				dao.optionDelete(option);	
			}else if(roop>50) { 
				if(option.getOption_Name()!=null) {
					System.out.println(roop+"추가");
					option.setOption_Join_Number(join_number);
					dao.insertOption(option);
				}
			}else if(option.getOption_Name()!=null){
				System.out.println(roop+"업뎃");
				dao.updateOption(option);
			}
				
			roop++;
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
		
		if(pic.getProduct_Option()!=null) {
			for (Option option : pic.getProduct_Option()) {
				option.setOption_Join_Number(join_number);
				if(option.getOption_Name()!=null) {
					dao.insertOption(option);
				}
			}
		}
		
		
		model.addAttribute("msg", "Please select a valid mediaFile..");
		return "redirect:/";
	}
}
