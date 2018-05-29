package kr.hkit.slimmall.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndViewDefiningException;

import kr.hkit.slimmall.admin.mapper.AdminMapper;
import kr.hkit.slimmall.admin.mapper.AdminVO;
import kr.hkit.slimmall.admin.mapper.CategoryVO;
import kr.hkit.slimmall.mapper.HomeMapper;
import kr.hkit.slimmall.mapper.ProductVO;
import kr.hkit.slimmall.member.mapper.ProductOrderViewVO;

@Controller
public class HomeController {

	@Autowired
	private HomeMapper homeMapper;
	@Autowired
	private AdminMapper adminMapper;
	
	@RequestMapping("/header.do")
	public String header(Model model) throws Exception {		
		return "header";
	}
	
	@RequestMapping("/nav.do")
	public String nav(@ModelAttribute NavDTO navDTO, Model model) throws Exception {
		model.addAttribute("menu", navDTO.getMenu());
		AdminVO adminVO = new AdminVO();
		adminVO.setTableName("category");
		List<AdminVO> adminVOs = adminMapper.selectAdminVOs(adminVO);
		model.addAttribute("adminVOs", adminVOs);
		return "nav";
	}
	
	@RequestMapping("/footer.do")
	public String footer(Model model) throws Exception {		
		return "footer";
	}
	
	@RequestMapping("/main.do")
	public String main(@ModelAttribute MainDTO mainDTO, Model model) throws Exception {		
		List<CategoryVO> categoryVOs = adminMapper.selectCategoryVOs();
		model.addAttribute("categoryVOs", categoryVOs);
		
		String keyword = mainDTO.getKeyword();
		int categoryIdx = mainDTO.getCategoryIdx();
		List<ProductVO> productVOs = homeMapper.selectProductVO(categoryIdx, keyword);
		model.addAttribute("productVOs", productVOs);
		return "main";
	}
	
	@RequestMapping("/productList.do")
	public String productList(@ModelAttribute ProductVO productVO, MainDTO mainDTO, Model model) throws Exception {
		List<CategoryVO> categoryVOs = adminMapper.selectCategoryVOs();
		model.addAttribute("categoryVOs", categoryVOs);
		
		int categoryIdx = productVO.getCategoryIdx();
		String keyword = mainDTO.getKeyword();
		model.addAttribute("categoryIdx", categoryIdx);
		
		List<ProductVO> productVOss = homeMapper.selectProductVO(categoryIdx, keyword);
		model.addAttribute("productVO", productVO);
		
		List<ProductVO> productVOs = homeMapper.selectProductVOs(categoryIdx);
		model.addAttribute("productVOs", productVOs);
		
		return "productList";
	}
	
	@RequestMapping("/join.do")
	public String join(Model model) throws Exception {	
		return "join";
	}
	
	@RequestMapping("/login.do")
	public String login(Model model) throws Exception {	
		return "login";
	}
	
	@RequestMapping("/signUp.do")
	public String signUp(@ModelAttribute AdminVO adminVO, Model model, HttpSession session) throws Exception {
		adminVO.setTableName("member");
		int result = adminMapper.insertAdminVO(adminVO);
		if(result != 1) {
			Exception e = new Exception("가입 정보가 틀립니다.");
			throw e;
		}
		session.setAttribute("memberIdx", adminVO.getIdx());
		session.setAttribute("username", adminVO.getUsername());
		return "redirect:/main.do";
	}
	
	@RequestMapping("/signIn.do")
	public String signIn(@ModelAttribute AdminVO adminVO, Model model, HttpSession session) throws Exception {	
		int memberIdx = homeMapper.selectMemberIdx(adminVO.getUsername(), adminVO.getPassword());		
		if(memberIdx > 0) {
			session.setAttribute("memberIdx", memberIdx);
			session.setAttribute("username", adminVO.getUsername());
		} else {
			Exception e = new Exception("로그인 정보가 틀립니다.");
			throw e;
		}		
		return "redirect:/main.do";
	}
	
	@RequestMapping("/logout.do")
	public String logout(Model model, HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/main.do";
	}	
	
	@RequestMapping("/productOrder.do")
	public String productOrder(@ModelAttribute HomeVO homeVO, Model model) throws Exception {
		int idx = homeVO.getIdx();
		AdminVO adminVO = new AdminVO();
		adminVO.setIdx(idx);
		adminVO.setTableName("product");
		adminVO = adminMapper.selectAdminVO(adminVO);
		model.addAttribute("adminVO", adminVO);
		return "productOrder";
	}
	
	@RequestMapping("/orderProduct.do")
	public String orderProduct(@ModelAttribute AdminVO adminVO, Model model, HttpSession session) throws Exception {
		Integer memberIdx = (Integer) session.getAttribute("memberIdx");
		
		if(memberIdx == null) {
			return "redirect:/login.do";
		}
				
		adminVO.setMemberIdx(memberIdx);
		adminVO.setTableName("order");
		adminMapper.insertAdminVO(adminVO);
		
		return "redirect:/member/productOrderList.do";
	}

	// 장바구니
	@RequestMapping("/addCart.do")
	public String addCart(@ModelAttribute AdminVO adminVO, Model model, HttpSession session) throws Exception {
		int qty = 1;
		adminVO.setTableName("product");
		adminVO = adminMapper.selectAdminVO(adminVO);
		ProductOrderViewVO productOrderViewVO = new ProductOrderViewVO();
		productOrderViewVO.setProductIdx(adminVO.getIdx());
		productOrderViewVO.setQty(qty);
		productOrderViewVO.setProductName(adminVO.getName());
		productOrderViewVO.setProductPrice(adminVO.getPrice());
		productOrderViewVO.setProductImageName(adminVO.getImageName());
		
		@SuppressWarnings("unchecked")
		List<ProductOrderViewVO> carts = (List<ProductOrderViewVO>) session.getAttribute("carts");
		if(carts == null) {
			carts = new ArrayList<>();
		}
		carts.add(productOrderViewVO);
		session.setAttribute("carts", carts);
		return "redirect:/member/cartList.do";
	}	

	

}
