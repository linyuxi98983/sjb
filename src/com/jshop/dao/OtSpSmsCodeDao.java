package com.jshop.dao;

import com.jshop.entity.OtSpSmsCode;

/**
 * 用于获取组件数据
 * 
 * @author syx
 * 
 */
public interface OtSpSmsCodeDao extends BaseWebCRUDDao<OtSpSmsCode, Integer> {

	/**
	 * 验证短信验证码
	 * 
	 * @param entity
	 * @return 空字符串表示验证通过，非空表示具体的错误信息
	 */
	public String updateCheckValidateNo(String phoneNo, String code);
}
