package kr.hkit.slimmall.member.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.hkit.slimmall.admin.mapper.AdminMapper;
import kr.hkit.slimmall.admin.mapper.AdminVO;
import kr.hkit.slimmall.mapper.HomeMapper;
import kr.hkit.slimmall.member.mapper.MemberMapper;
import kr.hkit.slimmall.member.mapper.ProductOrderViewVO;

@RequestMapping("/member")
@Controller
public class MemberController {
	
	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private AdminMapper adminMapper;
	@Autowired
	private HomeMapper homeMapper;

	@RequestMapping("/header.do")
	public String header(Model model) throws Exception {		
		return "member/header";
	}
	
	@RequestMapping("/nav.do")
	public String nav(@ModelAttribute NavDTO navDTO, Model model) throws Exception {
		model.addAttribute("menu", navDTO.getMenu());
		return "member/nav";
	}
	
	@RequestMapping("/footer.do")
	public String footer(Model model) throws Exception {		
		return "member/footer";
	}
	
	@RequestMapping("/main.do")
	public String main(Model model) throws Exception {
		return "member/main";
	}

	@RequestMapping("/memberSet.do")
	public String memberSet(Model model, HttpSession session) throws Exception {
		Integer memberIdx = (Integer) session.getAttribute("memberIdx");
		
		if(memberIdx == null) {
			return "redirect:/login.do";
		}
		
		AdminVO adminVO = new AdminVO();
		adminVO.setIdx(memberIdx);
		adminVO.setTableName("member");
		adminVO = adminMapper.selectAdminVO(adminVO);
		model.addAttribute("adminVO", adminVO);
		return "member/memberSet";
	}
	
	@RequestMapping("/setMember.do")
	public String myInfo(@ModelAttribute AdminVO adminVO, Model model) throws Exception {
		adminVO.setTableName("member");
		adminMapper.updateAdminVO(adminVO);
		return "redirect:/member/main.do";
	}
	
	@RequestMapping("/cartList.do")
	public String cartList(Model model, HttpSession session) throws Exception {
		
		@SuppressWarnings("unchecked")
		List<ProductOrderViewVO> carts = (List<ProductOrderViewVO>) session.getAttribute("carts");
		
		if(carts == null) {
			carts = new ArrayList<>();
		}
		
		model.addAttribute("carts", carts);
		return "member/cartList";
	}
	
	@RequestMapping("/productOrderList.do")
	public String productOrderList(Model model, HttpSession session) throws Exception {
		Integer memberIdx = (Integer) session.getAttribute("memberIdx");
		
		if(memberIdx == null) {
			return "redirect:/login.do";
		}

		List<ProductOrderViewVO> productOrderViewVOs = memberMapper.selectProductOrderViewVO(memberIdx);
		model.addAttribute("productOrderViewVOs", productOrderViewVOs);
		return "member/productOrderList";
	}
	
	@RequestMapping("/cancelOrder.do")
	public String cancelOrder(@ModelAttribute ProductOrderViewVO productOrderViewVO, Model model) throws Exception {
		String status = productOrderViewVO.getStatus();
		
		if("ORDERED".equals(status)) {
			AdminVO adminVO = new AdminVO();
			adminVO.setIdx(productOrderViewVO.getIdx());
			adminVO.setTableName("order");
			adminMapper.deleteAdminVO(adminVO);
		} else {
			memberMapper.updateOrderStatus(productOrderViewVO.getIdx(), "REFUNDED");
			memberMapper.updateOrderPaymentType(productOrderViewVO.getIdx(), "NONE");
		}
		
		return "redirect:/member/productOrderList.do";
	}

	// 장바구니
	@RequestMapping("/moveOrder.do")
	public String main(@ModelAttribute AdminVO adminVO, Model model, HttpSession session) throws Exception {

		Integer memberIdx = (Integer) session.getAttribute("memberIdx");
		
		if(memberIdx == null) {
			return "redirect:/login.do";
		}
		
		int productIdx = adminVO.getProductIdx();
		adminVO.setMemberIdx(memberIdx);
		adminVO.setTableName("order");
		adminMapper.insertAdminVO(adminVO);
		
		@SuppressWarnings("unchecked")
		List<ProductOrderViewVO> carts = (List<ProductOrderViewVO>) session.getAttribute("carts");
		
		int i = 0;
		for(ProductOrderViewVO cart : carts) {
			if(productIdx == cart.getProductIdx()) {				
				break;
			}
			i++;			
		}
		carts.remove(i);
		
		session.setAttribute("carts", carts);
		
		return "redirect:/member/productOrderList.do";
	}
	
	@RequestMapping("/payOrder.do")
	public String payOrder(@ModelAttribute AdminVO adminVO, Model model) throws Exception {
		ProductOrderViewVO productOrderViewVO = homeMapper.selectProductOrderViewVO(adminVO.getIdx());
		model.addAttribute("productOrderViewVO", productOrderViewVO);
		return "member/payOrder";
	}

	
	@RequestMapping("/payProduct.do")
	public String payProduct(@ModelAttribute AdminVO adminVO, Model model, HttpSession session) throws Exception {
		memberMapper.updateOrderPaymentType(adminVO.getIdx(), adminVO.getPaymentType());
		memberMapper.updateOrderStatus(adminVO.getIdx(), "PAYED");
		return "redirect:/member/productOrderList.do";
	}	
	
}
