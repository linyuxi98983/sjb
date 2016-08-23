package com.jshop.common;

/**
 * 公共枚举类
 * 
 * @author syx
 * 
 */
public class GEnum {

	public enum FilterList {

		GOODS, // 商品过滤列表
		SPEC, // 商品规格列表
		BRAND, // 品牌列表
		SHOP, // 商铺列表
		MEMBER, // 会员列表
		PROMOTION, // 团购与促销列表
		DELIVERYMAN, // 送货员
	}

	public enum LSelect {
		GOODSTYPE_NODES, // 商品类型顶级、二级和三级节点
		GOODSTYPE_PARENTS, // 商品类型顶级和二级节点
		GOODSTYPE_TOPPARNETS, // 商品类型一级节点
		SHOPTYPE_NODES, // 商铺类型一级、二级节点
		SHOPTYPE_PARENTS, // 商铺类型一级节点
		AREA_NODES, // 地区顶级，二级，三级节点
		STREET_NODES, // 地区顶级，二级，三级节点，街道,
		PROJECT_TYPE,
		DESIGN_STYLE,
		HOUSE_TYPE,
		SPACE_TYPE,
		MEMBER
	}

	/**
	 * 图片类型
	 */
	public enum PicType {
		PGOODS, // 商品
		PGOODSSPEC, // 货品
		UEDITOR, // ueditor上传的图片
		PGOODSTYPE, // 商品类型
		PSHOPTYPE, // 商铺分类
		PSHOP, // 商铺
		PBRAND, // 品牌
		PMEMBER, // 会员头像
		MHOMEPAGE, // 手机主页板块
		PHOMEPAGE, // PC主页板块
		CASE
	}

	public enum Select {
		SPECGROUP, // 商品规格组
		SPEC, // 商品规格
		NOTICETYPE, // 电商消息通知类型d
		STORE, // 仓库
		PROJECT_TYPE,
		DESIGN_STYLE,
		HOUSE_TYPE,
		SPACE_TYPE,
		MEMBER_TYPE_DESIGN,
		MEMBER_TYPE_ORG,
		MEMBER
	}

	/**
	 * 短信类型
	 */
	public enum SMSType {
		REGISTER, // 注册验证码
		PWDBACK, // 找回验证码
	}
}
