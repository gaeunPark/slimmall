package kr.hkit.slimmall.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface MemberMapper {

	public List<ProductOrderViewVO> selectProductOrderViewVO(int memberIdx);
	public int updateOrderStatus(
			@Param("idx") int idx, 
			@Param("status") String status);
	public int updateOrderPaymentType(
			@Param("idx") int idx, 
			@Param("paymentType") String paymentType);
}
