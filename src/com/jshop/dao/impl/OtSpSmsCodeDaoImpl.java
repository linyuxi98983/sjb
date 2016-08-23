package com.jshop.dao.impl;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.jshop.common.GEnum.SMSType;
import com.jshop.dao.OtSpSmsCodeDao;
import com.jshop.dao.SysParamsDao;
import com.jshop.entity.OtSpSmsCode;
import com.jshop.entity.Pager;
import com.jshop.util.FreemarkerUtil;
import com.jshop.util.SpringUtil;

@Repository
public class OtSpSmsCodeDaoImpl extends BaseDaoImpl<OtSpSmsCode, Integer>
		implements OtSpSmsCodeDao {
	@Resource
	private SysParamsDao paramsDao;

	@Override
	public List getWebList(Pager pager, Map<String, String> searchProperties) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public OtSpSmsCode getWebEntity(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteWebIds(String ids) {
		if (StringUtils.isNotEmpty(ids)) {
			String[] idArr = ids.split(",");

			getSession()
					.createSQLQuery(
							"delete from Ot_SpSmsCode where id in(:ids)")
					.setParameterList("ids", idArr).executeUpdate();
		}
	}

	public void deleteByPhoneNo(String phoneNo) {
		String sql = "delete from Ot_SpSmsCode where PhoneNo = ?";
		getSession().createSQLQuery(sql).setParameter(0, phoneNo)
				.executeUpdate();
	}

	/**
	 * 发送信验证码
	 * 
	 * @param entity
	 * @return 0:表示正常 <0表示短信发送失败
	 */
	@Override
	public Integer saveOrUpdateWebEntity(OtSpSmsCode entity) throws Exception {
		deleteByPhoneNo(entity.getPhoneNo());

		String code = Integer.toString((int) (Math.random() * 1000000));
		while (code.length() < 6)
			code = "0" + code;
		Integer result = 0;
		String templateContent;
		String shopname = paramsDao.getWebValueByName("ShopSystemName");
		if (StringUtils.isEmpty(shopname)) {
			shopname = SpringUtil.getMessage("global.project.shopname");
		}
		Map<String, String> root = new HashMap<String, String>(0);
		root.put("shopname", shopname);
		root.put("code", code);
		if (SMSType.REGISTER.equals(entity.getSmsType())) {
			templateContent = FreemarkerUtil.processTemplateContent(
					SpringUtil.getMessage("global.sms.register"), root);
			result = SendSMS(entity.getPhoneNo(), templateContent);
		} else if (SMSType.PWDBACK.equals(entity.getSmsType())) {
			templateContent = FreemarkerUtil.processTemplateContent(
					SpringUtil.getMessage("global.sms.passwordback"), root);
			result = SendSMS(entity.getPhoneNo(), templateContent);
		}
		entity.setCode(code);
		if (result == 0) {
			save(entity);
			;
		}
		return result;
	}

	/**
	 * 验证短信验证码
	 * 
	 * @param entity
	 * @return 空字符串表示验证通过，非空表示具体的错误信息
	 */
	@Override
	public String updateCheckValidateNo(String phoneNo, String code) {
		List<OtSpSmsCode> list = getList("phoneNo", phoneNo);
		if (list.isEmpty())
			return "请发送短信验证码";
		else {
			for (OtSpSmsCode otSmsCode : list) {
				Calendar c = Calendar.getInstance();
				c.add(Calendar.MINUTE, -30);// 30分钟前
				Date dt1 = c.getTime();
				Date dt2 = otSmsCode.getSendTime();
				if (dt1.getTime() > dt2.getTime())
					return "短信验证码已过期,请重新获取";
				else if (!otSmsCode.getCode().equals(code))
					return "短信验证码不正确";
			}
			deleteByPhoneNo(phoneNo);
		}
		return "";
	}
}
