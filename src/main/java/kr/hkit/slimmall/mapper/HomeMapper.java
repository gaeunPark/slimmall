package kr.hkit.slimmall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.hkit.slimmall.admin.mapper.AdminVO;
import kr.hkit.slimmall.member.mapper.ProductOrderViewVO;

@Mapper
public interface HomeMapper {
	public int selectMemberIdx(
			@Param("username") String username, 
			@Param("password") String password);
	public ProductOrderViewVO selectProductOrderViewVO(int idx);
	public List<AdminVO> selectCategoryProducts(int categoryIdx);
	
	
	public List<ProductVO> selectProductVO(
			@Param("categoryIdx") int categoryIdx,
			@Param("keyword") String keyword
			);
	
	public List<ProductVO> selectProductVOs(@Param("categoryIdx") int categoryIdx);
}
