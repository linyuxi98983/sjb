package com.jshop.action.app.function;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;

import com.jshop.common.ApplicationConfig;
import com.jshop.common.SmsClient;
import com.jshop.util.ImageUtil;

import java.util.Date;
import java.math.BigInteger;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;

public class HandleAppFunction {
	public String App_ResultCode = "resultcode";
	public String App_Message = "message";

	private String GetDateString(Date date) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return df.format(date);
	}

	private String GetNow() {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return df.format(new Date());
	}

	private static HandleAppFunction instance = null;

	public static synchronized HandleAppFunction getInstance() {
		if (instance == null)
			instance = new HandleAppFunction();
		return instance;
	}

	private String GetPicPath(Session session, int PicType) {
		String result = "";
		String sql = "select PicPath, 1 from spictype where ID = "
				+ Integer.toString(PicType);
		List<Object[]> list = session.createSQLQuery(sql).list();
		if (!list.isEmpty()) {
			for (Object[] object : list)
				result = (String) object[0];
		}
		return result;
	}

	private void SendSMS(String PhoneNo, String Text) {
		SmsClient.getClient().sendSMS(new String[] { PhoneNo }, Text, "", 5);
	}

	public String HandleData(Session session, JSONObject data) {
		String result = ReturnMessage(999999, "未知调用", "");

		if (data.getString("name").equals("sendvalidatecode"))
			result = SendValidateCode(session, data.getJSONObject("data"));
		else if (data.getString("name").equals("registermember"))
			result = RegisterMember(session, data.getJSONObject("data"));
		else if (data.getString("name").equals("changepassword"))
			result = ChangePassword(session, data.getJSONObject("data"));
		else if (data.getString("name").equals("resetpassword"))
			result = ResetPassword(session, data.getJSONObject("data"));
		else if (data.getString("name").equals("memberlogin"))
			result = MemberLogin(session, data.getJSONObject("data"));
		else if (data.getString("name").equals("getadvert"))
			result = GetAdvert(session, data.getJSONObject("data"));
		else if (data.getString("name").equals("getprovince"))
			result = GetProvince(session, data.getJSONObject("data"));
		else if (data.getString("name").equals("getcity"))
			result = GetCity(session, data.getJSONObject("data"));
		else if (data.getString("name").equals("getdistrict"))
			result = GetDistrict(session, data.getJSONObject("data"));
		else if (data.getString("name").equals("tryregistervendor"))
			result = TryRegisterVendor(session, data.getJSONObject("data"));
		else if (data.getString("name").equals("registervendor"))
			result = RegisterVendor(session, data.getJSONObject("data"));
		else if (data.getString("name").equals("getmember"))
			result = GetMember(session, data.getJSONObject("data"));
		else if (data.getString("name").equals("editmember"))
			result = EditMember(session, data.getJSONObject("data"));
		else if (data.getString("name").equals("editmemberarea"))
			result = EditMemberArea(session, data.getJSONObject("data"));
		else if (data.getString("name").equals("getnames"))
			result = GetNames(session, data.getJSONObject("data"));
		else if (data.getString("name").equals("getpicpath"))
			result = GetPicPath(session, data.getJSONObject("data"));
		else if (data.getString("name").equals("editmemberportrait"))
			result = EditMemberPortrait(session, data.getJSONObject("data"));
		else if (data.getString("name").equals("getvendorlist"))
			result = GetVendorList(session, data.getJSONObject("data"));
		else if (data.getString("name").equals("getvendor"))
			result = GetVendor(session, data.getJSONObject("data"));
		else if (data.getString("name").equals("getbeautician"))
			result = GetBeautician(session, data.getJSONObject("data"));
		else if (data.getString("name").equals("getservicelist"))
			result = GetServiceList(session, data.getJSONObject("data"));
		else if (data.getString("name").equals("getgoods"))
			result = GetGoods(session, data.getJSONObject("data"));
		else if (data.getString("name").equals("getgoodslist"))
			result = GetGoodsList(session, data.getJSONObject("data"));
		else if (data.getString("name").equals("getdescriptionhtml"))
			result = GetDescriptionHtml(session, data.getJSONObject("data"));
		else if (data.getString("name").equals("getaddress"))
			result = GetAddress(session, data.getJSONObject("data"));
		else if (data.getString("name").equals("editaddress"))
			result = EditAddress(session, data.getJSONObject("data"));
		else if (data.getString("name").equals("getdefaultaddress"))
			result = GetDefaultAddress(session, data.getJSONObject("data"));

		else if (data.getString("name").equals("createsorder"))
			result = CreateSOrder(session, data.getJSONObject("data"));
		else if (data.getString("name").equals("getgoodsticket"))
			result = GetGoodsTicket(session, data.getJSONObject("data"));
		else if (data.getString("name").equals("getsorderlist"))
			result = GetSOrderList(session, data.getJSONObject("data"));
		else if (data.getString("name").equals("sorderclose"))
			result = SOrderClose(session, data.getJSONObject("data"));
		else if (data.getString("name").equals("sorderreceive"))
			result = SOrderReceive(session, data.getJSONObject("data"));
		else if (data.getString("name").equals("getarticlelist"))
			result = GetArticleList(session, data.getJSONObject("data"));
		else if (data.getString("name").equals("gettypelist"))
			result = GetTypeList(session, data.getJSONObject("data"));
		else if (data.getString("name").equals("getticketlist"))
			result = GetTicketList(session, data.getJSONObject("data"));
		else if (data.getString("name").equals("getmemberticketlist"))
			result = GetMemberTicketList(session, data.getJSONObject("data"));
		else if (data.getString("name").equals("creatememberticket"))
			result = CreateMemberTicket(session, data.getJSONObject("data"));

		else if (data.getString("name").equals("memberbindvendor"))
			result = MemberBindVendor(session, data.getJSONObject("data"));
		else if (data.getString("name").equals("favorite"))
			result = Favorite(session, data.getJSONObject("data"));
		else if (data.getString("name").equals("unfavorite"))
			result = UnFavorite(session, data.getJSONObject("data"));
		else if (data.getString("name").equals("getfavorite"))
			result = GetFavorite(session, data.getJSONObject("data"));
		else if (data.getString("name").equals("evaluationgoods"))
			result = EvaluationGoods(session, data.getJSONObject("data"));
		else if (data.getString("name").equals("getgoodsevaluation"))
			result = GetGoodsEvaluation(session, data.getJSONObject("data"));
		else if (data.getString("name").equals("evaluationarticle"))
			result = EvaluationArticle(session, data.getJSONObject("data"));
		else if (data.getString("name").equals("answerevaluationarticle"))
			result = AnswerEvaluationArticle(session,
					data.getJSONObject("data"));
		else if (data.getString("name").equals("getarticleevaluation"))
			result = GetArticleEvaluation(session, data.getJSONObject("data"));
		else if (data.getString("name").equals("getaccount"))
			result = GetAccount(session, data.getJSONObject("data"));
		else if (data.getString("name").equals("editaccount"))
			result = EditAccount(session, data.getJSONObject("data"));
		else if (data.getString("name").equals("requestcash"))
			result = RequestCash(session, data.getJSONObject("data"));
		else if (data.getString("name").equals("getcash"))
			result = GetCash(session, data.getJSONObject("data"));
		else if (data.getString("name").equals("sorderpay"))
			result = SOrderPay(session, data.getJSONObject("data"));

		JSONObject testjson = JSONObject.fromObject(result);
		System.out.println("json转换测试:" + testjson.toString());
		return result;
	}

	private String ReturnMessage(int ErrorIndex, String Message, String More) {
		String result = "{" + App_ResultCode + ":"
				+ Integer.toString(ErrorIndex) + "," + App_Message + ":'"
				+ Message + "'";
		if (!More.equals(""))
			result = result + "," + More;
		result = result + "}";
		return result;
	}

	private String ReturnMessage(String Message) {
		return ReturnMessage(0, Message, "");
	}

	private String ReturnMessage(String Message, String More) {
		return ReturnMessage(0, Message, More);
	}

	private String RaiseErrorMessage(int ErrorIndex, String Message) {
		return ReturnMessage(ErrorIndex, Message, "");
	}

	private String RaiseErrorMessage(String Message) {
		return ReturnMessage(1, Message, "");
	}

	private String SendValidateCode(Session session, JSONObject data) {
		String sql = "delete from esmsvalidate where PhoneNo = '"
				+ data.getString("phoneno") + "'";
		Query query = session.createSQLQuery(sql);
		query.executeUpdate();

		String code = Integer.toString((int) (Math.random() * 1000000));
		while (code.length() < 6)
			code = "0" + code;
		if (data.getInt("validatetype") == 0)
			SendSMS(data.getString("phoneno"), "【优品美妆】欢迎您注册优品美妆，您的验证码是：" + code
					+ "。请不要把验证码泄露给其他人。如非本人操作，可不用理会！");
		else if (data.getInt("validatetype") == 1)
			SendSMS(data.getString("phoneno"), "【优品美妆】您正在通过手机找回登录密码，您的验证码是："
					+ code + "（优品美妆短信验证码，请勿泄露），需要您谨慎省份校验。如非本人操作，可不用理会！");
		sql = "insert into esmsvalidate(PhoneNo, ValidateNo, SendTime) values (?, ?, ?)";
		query = session.createSQLQuery(sql);
		query.setString(0, data.getString("phoneno"));
		query.setString(1, code);
		query.setString(2, GetNow());
		query.executeUpdate();

		return ReturnMessage("提交成功");
	}

	private String RegisterMember(Session session, JSONObject data) {
		String sql = "select ID, Name from lmember where PhoneNo = '"
				+ data.getString("phoneno") + "'";
		List<Object[]> list = session.createSQLQuery(sql).list();
		if (!list.isEmpty())
			return RaiseErrorMessage("手机号已被注册");
		else {
			String invidecode = data.getString("invidecode");
			int vendorid = 0;
			if (!invidecode.equals("")) {
				try {
					vendorid = Integer.parseInt(invidecode);
				} catch (Exception e) {
					return RaiseErrorMessage("非法邀请码");
				}
				sql = "select ID, 1 from lvendor where ID ="
						+ Integer.toString(vendorid);
				list = session.createSQLQuery(sql).list();
				if (list.isEmpty())
					vendorid = 0;
			}

			String checkcode = CheckValidateNo(session,
					data.getString("phoneno"), data.getString("validatecode"));
			if (!checkcode.equals(""))
				RaiseErrorMessage(checkcode);

			sql = "insert into lmember(phoneno, password, lvendorid, regtime, state) values(?,?,?,?,0)";
			Query query = session.createSQLQuery(sql);
			query.setString(0, data.getString("phoneno"));
			query.setString(1, data.getString("password"));
			if (vendorid != 0)
				query.setInteger(2, vendorid);
			else
				query.setParameter(2, null);
			query.setString(3, GetNow());
			query.executeUpdate();

			return ReturnMessage("提交成功");
		}
	}

	private String ChangePassword(Session session, JSONObject data) {
		String sql = "select password, 1 from lmember where ID = "
				+ Integer.toString(data.getInt("memberid"));
		List<Object[]> list = session.createSQLQuery(sql).list();
		if (list.isEmpty())
			return RaiseErrorMessage("会员不存在");
		for (Object[] object : list) {
			if (!object[0].equals(data.getString("oldpassword")))
				return RaiseErrorMessage("旧密码不正确");
		}
		sql = "update lmember set password = '" + data.getString("newpassword")
				+ "' where ID = " + Integer.toString(data.getInt("memberid"));
		Query query = session.createSQLQuery(sql);
		query.executeUpdate();
		return ReturnMessage("提交成功");
	}

	private String CheckValidateNo(Session session, String PhoneNo, String Code) {
		String sql = "select ValidateNo, SendTime from esmsvalidate where PhoneNo = '"
				+ PhoneNo + "'";
		List<Object[]> list = session.createSQLQuery(sql).list();
		if (list.isEmpty())
			return "请发送短信验证码";
		else {
			for (Object[] object : list) {
				Calendar c = Calendar.getInstance();
				c.add(Calendar.MINUTE, -1);// 1分钟前
				Date dt1 = c.getTime();
				Date dt2 = null;
				dt2 = (Date) object[1];
				if (dt1.getTime() > dt2.getTime())
					return "短信验证码已过期";
				else if (!object[0].equals(Code))
					return "短信验证码不正确";
			}
			sql = "delete from esmsvalidate where PhoneNo = '" + PhoneNo + "'";
			Query query = session.createSQLQuery(sql);
			query.executeUpdate();
		}
		return "";
	}

	private String ResetPassword(Session session, JSONObject data) {
		String sql = "select password, 1 from lmember where PhoneNo = '"
				+ data.getString("phoneno") + "'";
		List<Object[]> list = session.createSQLQuery(sql).list();
		if (list.isEmpty())
			return RaiseErrorMessage("会员不存在");

		String checkcode = CheckValidateNo(session, data.getString("phoneno"),
				data.getString("validatecode"));
		if (!checkcode.equals(""))
			return RaiseErrorMessage(checkcode);

		sql = "update lmember set password = '" + data.getString("newpassword")
				+ "' where PhoneNo = '" + data.getString("phoneno") + "'";
		Query query = session.createSQLQuery(sql);
		query.executeUpdate();
		return ReturnMessage("提交成功");
	}

	private String MemberLogin(Session session, JSONObject data) {
		String sql = "select m.ID, m.LVendorID, "
				+ "(select ID from LVendor where LMemberID = m.ID) ShopVendorID, "
				+ "m.ZFBAccount, m.WXAccount, "
				+ "(select State from LVendor where LMemberID = m.ID) ShopVendorState, "
				+ "(select AuditState from LVendor where LMemberID = m.ID) ShopVendorAuditState, "
				+ "(select AuditRemark from LVendor where LMemberID = m.ID) AuditRemark "
				+ "from lmember m " + "where PhoneNo = '"
				+ data.getString("phoneno") + "' and password = '"
				+ data.getString("password") + "'";
		List<Object[]> list = session.createSQLQuery(sql).list();
		if (!list.isEmpty()) {
			int memberid = 0;
			String result = "";
			for (Object[] object : list) {
				memberid = (Integer) object[0];
				result = "data:{memberid:" + Integer.toString(memberid) + ",";
				if (object[1] != null)
					result = result + "vendorid:"
							+ Integer.toString((Integer) object[1]) + ",";
				else
					result = result + "vendorid:null,";
				if ((object[2] != null) && ((Short) object[5] == 0)
						&& ((Short) object[6] == 0))
					result = result + "shopvendorid:"
							+ Integer.toString((Integer) object[2]) + ",";
				else
					result = result + "shopvendorid:null,";
				result = result + "zfbaccount:'" + object[3] + "',wxaccount:'"
						+ object[4] + "', remark:'";
				if (object[5] != null) {
					if (((Short) object[5] == 1))
						result = result + "美容院已被冻结'}";
					else
						result = result + object[7] + "'}";
				} else
					result = result + "'}";

				result = ReturnMessage("登陆成功", result);
				break;
			}

			sql = "update lmember set logintime = ? where ID = ?";
			Query query = session.createSQLQuery(sql);
			query.setString(0, GetNow());
			query.setInteger(1, memberid);
			query.executeUpdate();

			return result;
		} else
			return RaiseErrorMessage("会员或密码输入错误");

	}

	private String MemberBindVendor(Session session, JSONObject data) {
		String sql = "update lmember set LVendorID = ? where ID = ?";
		Query query = session.createSQLQuery(sql);
		query.setInteger(0, data.getInt("vendorid"));
		query.setInteger(1, data.getInt("memberid"));
		query.executeUpdate();
		return ReturnMessage("提交成功");
	}

	private String GetMember(Session session, JSONObject data) {
		String sql = "select m.ID, m.Name, m.Sex, m.Birthday, m.Height, m.Weight, m.Skin, "
				+ "(select Name from SProvince where ID = m.SProvinceID) Province, "
				+ "(select Name from SCity where ID = m.SCityID) City, "
				+ "(select Name from SDistrict where ID = m.SDistrictID) District, "
				+ "m.Label, "
				+ "case when ISNULL(p.PicFileName) then '' else p.PicFileName end PicFileName "
				+ "from lmember m left join lpicture p on p.ID = m.PortraitPicID "
				+ "where m.ID = " + data.getString("memberid");
		String resultjson = "data:{";
		List<Object[]> list = session.createSQLQuery(sql).list();
		for (Object[] object : list) {
			resultjson = resultjson + "id:"
					+ Integer.toString((Integer) object[0]) + ',' + "name:'"
					+ object[1] + "'," + "sex:"
					+ Short.toString((Short) object[2]) + "," + "birthday:'"
					+ object[3] + "',";
			if (object[4] == null)
				resultjson = resultjson + "height:null,";
			else
				resultjson = resultjson + "height:"
						+ Double.toString((Double) object[4]) + ",";
			if (object[5] == null)
				resultjson = resultjson + "weight:null,";
			else
				resultjson = resultjson + "weight:"
						+ Double.toString((Double) object[5]) + ",";
			resultjson = resultjson + "skin:'" + object[6] + "',"
					+ "province:'" + object[7] + "'," + "city:'" + object[8]
					+ "'," + "district:'" + object[9] + "'," + "label:'"
					+ object[10] + "',";
			if (!((String) object[11]).equals(""))
				resultjson = resultjson + "picfile:'"
						+ ApplicationConfig.getFilePath(1, (String) object[11])
						+ "'}";
			else
				resultjson = resultjson + "picfile:''}";
		}
		return ReturnMessage("获取数据成功", resultjson);
	}

	private String EditMember(Session session, JSONObject data) {
		String sql = "update lmember set " + data.getString("field")
				+ " =? where id = ?";
		Query query = session.createSQLQuery(sql);
		String field = data.getString("field");
		if (field.equals("sex") || field.equals("height")
				|| field.equals("weight"))
			query.setInteger(0, data.getInt("value"));
		else
			query.setString(0, data.getString("value"));
		query.setInteger(1, data.getInt("memberid"));
		query.executeUpdate();
		return ReturnMessage("修改成功");
	}

	private String EditMemberArea(Session session, JSONObject data) {
		int provinceid = 0, cityid = 0, districtid = 0;
		String sql = "select ID, 1 from sprovince where Name = '"
				+ data.getString("province") + "'";
		List<Object[]> list = session.createSQLQuery(sql).list();
		for (Object[] object : list) {
			provinceid = (Integer) object[0];
		}
		sql = "select ID, 1 from scity where Name = '" + data.getString("city")
				+ "' and sprovinceid = " + Integer.toString(provinceid);
		list = session.createSQLQuery(sql).list();
		for (Object[] object : list) {
			cityid = (Integer) object[0];
		}
		sql = "select ID, 1 from sdistrict where Name = '"
				+ data.getString("district") + "' and scityid = "
				+ Integer.toString(cityid);
		list = session.createSQLQuery(sql).list();
		for (Object[] object : list) {
			districtid = (Integer) object[0];
		}

		sql = "update lmember set SProvinceID = ?, SCityID = ?, SDistrictID = ? where id = ?";
		Query query = session.createSQLQuery(sql);
		query.setInteger(0, provinceid);
		query.setInteger(1, cityid);
		query.setInteger(2, districtid);
		query.setInteger(3, data.getInt("memberid"));
		query.executeUpdate();
		return ReturnMessage("修改成功");
	}

	private String GetPicPath(Session session, JSONObject data) {
		String resultjson = "data:{" + "ftpurl:'"
				+ ApplicationConfig.getInstance().getFtpurl() + "',"
				+ "ftpport:" + ApplicationConfig.getInstance().getFtpport()
				+ "," + "ftpuser:'"
				+ ApplicationConfig.getInstance().getFtpuser()
				+ "', ftppassword:'"
				+ ApplicationConfig.getInstance().getFtppassword() + "',"
				+ "ftppath:'" + GetPicPath(session, data.getInt("pictype"))
				+ "'}";
		return ReturnMessage("获取数据成功", resultjson);
	}

	private String EditMemberPortrait(Session session, JSONObject data) {
		String sql = "insert into lpicture(SPicTypeID, PicFileName)values(?,?)";
		Query query = session.createSQLQuery(sql);
		query.setInteger(0, 1);
		query.setString(1, data.getString("filename"));
		query.executeUpdate();
		int picid = 0;
		sql = "select ID, 1 from lpicture where PicFileName = '"
				+ data.getString("filename") + "'";
		List<Object[]> list = session.createSQLQuery(sql).list();
		for (Object[] object : list) {
			picid = (Integer) object[0];
		}
		sql = "update lmember set PortraitPicID = ? where id = ?";
		query = session.createSQLQuery(sql);
		query.setInteger(0, picid);
		query.setInteger(1, data.getInt("memberid"));
		query.executeUpdate();

		return ReturnMessage("修改成功");
	}

	private String GetNames(Session session, JSONObject data) {
		String sql = "select Name, 1 from " + data.getString("table")
				+ " order by orderno";
		Query query = session.createSQLQuery(sql);
		List<Object[]> list = query.list();
		String resultjson = "data:{values:'";
		for (Object[] object : list) {
			resultjson = resultjson + object[0] + ',';
		}
		if (!list.isEmpty())
			resultjson = resultjson.substring(0, resultjson.length() - 1);
		resultjson = resultjson + "'}";
		return ReturnMessage("获取数据成功", resultjson);
	}

	private String GetAdvert(Session session, JSONObject data) {
		String sql = "select ID, Name, StartTime, EndTime, ShowTime, LGoodsID, Disc, Price, LimitQty"
				+ " from ladvert where IsPublish = 1 and AdvertType = 1 and ShowTime <= ? and StartTime >= ? ";
		if (data.getInt("isvendor") == 0)
			sql = sql + " and (Position = 0 or Position = 1) ";
		sql = sql + " order by OrderNo";
		Query query = session.createSQLQuery(sql);
		query.setString(0, GetNow());
		query.setString(1, GetNow());
		List<Object[]> list = query.list();
		String resultjson = "data:{willsale:[";
		int iIndex = 0;
		for (Object[] object : list) {
			resultjson = resultjson + "{advertid:" + object[0] + "," + "name:'"
					+ object[1] + "'," + "starttime:'" + object[2] + "',"
					+ "endtime:'" + object[3] + "'," + "showtime:'" + object[4]
					+ "'," + "lgoodsid:" + object[5] + "," + "disc:"
					+ object[6] + "," + "price:" + object[7] + ","
					+ "limitqty:" + object[8] + "," + "picture:[";
			sql = "select t.PicPath, "
					+ "case when ISNULL(p.PicFileName) then '' else p.PicFileName end PicFileName "
					+ "from ladvertpicture ap left join lpicture p on p.ID = ap.LPictureID "
					+ " left join spictype t on t.ID = p.SPicTypeID "
					+ "where ap.LAdvertID = ? order by ap.OrderNo";
			Query query2 = session.createSQLQuery(sql);
			query2.setInteger(0, (Integer) object[0]);
			List<Object[]> list2 = query2.list();
			int iIndex2 = 0;
			for (Object[] object2 : list2) {
				resultjson = resultjson + "{url:'"
						+ ApplicationConfig.getFilePath("") + object2[0]
						+ object2[1] + "'";
				resultjson = resultjson + "},";
				iIndex2++;
			}
			if (iIndex2 > 0)
				resultjson = resultjson.substring(0, resultjson.length() - 1);
			resultjson = resultjson + "]},";
			iIndex++;
		}
		if (iIndex > 0)
			resultjson = resultjson.substring(0, resultjson.length() - 1);
		resultjson = resultjson + "],";

		sql = "select ID, Name, StartTime, EndTime, ShowTime, LGoodsID, Disc, Price, LimitQty"
				+ " from ladvert where IsPublish = 1 and AdvertType = 1 and StartTime <= ? and EndTime >= ? ";
		if (data.getInt("isvendor") == 0)
			sql = sql + " and (Position = 0 or Position = 1) ";
		sql = sql + " order by OrderNo";
		query = session.createSQLQuery(sql);
		query.setString(0, GetNow());
		query.setString(1, GetNow());
		list = query.list();
		resultjson = resultjson + "forsale:[";
		iIndex = 0;
		for (Object[] object : list) {
			resultjson = resultjson + "{advertid:" + object[0] + "," + "name:'"
					+ object[1] + "'," + "starttime:'" + object[2] + "',"
					+ "endtime:'" + object[3] + "'," + "showtime:'" + object[4]
					+ "'," + "lgoodsid:" + object[5] + "," + "disc:"
					+ object[6] + "," + "price:" + object[7] + ","
					+ "limitqty:" + object[8] + "," + "picture:[";
			sql = "select t.PicPath, "
					+ "case when ISNULL(p.PicFileName) then '' else p.PicFileName end PicFileName "
					+ "from ladvertpicture ap left join lpicture p on p.ID = ap.LPictureID "
					+ " left join spictype t on t.ID = p.SPicTypeID "
					+ "where ap.LAdvertID = ? order by ap.OrderNo";
			Query query2 = session.createSQLQuery(sql);
			query2.setInteger(0, (Integer) object[0]);
			List<Object[]> list2 = query2.list();
			int iIndex2 = 0;
			for (Object[] object2 : list2) {
				resultjson = resultjson + "{url:'"
						+ ApplicationConfig.getFilePath("") + object2[0]
						+ object2[1] + "'";
				resultjson = resultjson + "},";
				iIndex2++;
			}
			if (iIndex2 > 0)
				resultjson = resultjson.substring(0, resultjson.length() - 1);
			resultjson = resultjson + "]},";
			iIndex++;
		}
		if (iIndex > 0)
			resultjson = resultjson.substring(0, resultjson.length() - 1);
		resultjson = resultjson + "],";

		sql = "select ID, Name, StartTime, EndTime, ShowTime, LGoodsID, Disc, Price, LimitQty"
				+ " from ladvert where IsPublish = 1 and AdvertType = 0 and StartTime <= ? and EndTime >= ? ";
		if (data.getInt("isvendor") == 0)
			sql = sql + " and (Position = 0 or Position = 1) ";
		sql = sql + " order by OrderNo";
		query = session.createSQLQuery(sql);
		query.setString(0, GetNow());
		query.setString(1, GetNow());
		list = query.list();
		resultjson = resultjson + "advert:[";
		iIndex = 0;
		for (Object[] object : list) {
			resultjson = resultjson + "{advertid:" + object[0] + "," + "name:'"
					+ object[1] + "'," + "lgoodsid:" + object[5] + ","
					+ "picture:[";
			sql = "select t.PicPath, "
					+ "case when ISNULL(p.PicFileName) then '' else p.PicFileName end PicFileName "
					+ "from ladvertpicture ap left join lpicture p on p.ID = ap.LPictureID "
					+ " left join spictype t on t.ID = p.SPicTypeID "
					+ "where ap.LAdvertID = ? order by ap.OrderNo";
			Query query2 = session.createSQLQuery(sql);
			query2.setInteger(0, (Integer) object[0]);
			List<Object[]> list2 = query2.list();
			int iIndex2 = 0;
			for (Object[] object2 : list2) {
				resultjson = resultjson + "{url:'"
						+ ApplicationConfig.getFilePath("") + object2[0]
						+ object2[1] + "'";
				resultjson = resultjson + "},";
				iIndex2++;
			}
			if (iIndex2 > 0)
				resultjson = resultjson.substring(0, resultjson.length() - 1);
			resultjson = resultjson + "]},";
			iIndex++;
		}
		if (iIndex > 0)
			resultjson = resultjson.substring(0, resultjson.length() - 1);
		resultjson = resultjson + "]";

		resultjson = resultjson + "}";
		return ReturnMessage("获取数据成功", resultjson);
	}

	private String GetProvince(Session session, JSONObject data) {
		String value = "";
		String sql = "select Name, 1 from SProvince";
		List<Object[]> list = session.createSQLQuery(sql).list();
		for (Object[] object : list) {
			value = value + object[0] + ",";
		}
		value = value.substring(0, value.length() - 1);
		return ReturnMessage("获取数据成功", "Data:{Value:'" + value + "'}");
	}

	private String GetCity(Session session, JSONObject data) {
		String value = "";
		String sql = "select m.Name, 1 from SCity m left join SProvince p on m.SProvinceID = p.ID where p.Name = '"
				+ data.getString("province") + "'";
		List<Object[]> list = session.createSQLQuery(sql).list();
		for (Object[] object : list) {
			value = value + object[0] + ",";
		}
		value = value.substring(0, value.length() - 1);
		return ReturnMessage("获取数据成功", "Data:{Value:'" + value + "'}");
	}

	private String GetDistrict(Session session, JSONObject data) {
		String value = "";
		String sql = "select m.Name, 1 from SDistrict m left join SCity p on m.SCityID = p.ID left join SProvince p2 on p.SProvinceID = p2.ID "
				+ "where p.Name = '"
				+ data.getString("city")
				+ "' and p2.Name ='" + data.getString("province") + "'";
		List<Object[]> list = session.createSQLQuery(sql).list();
		for (Object[] object : list) {
			value = value + object[0] + ",";
		}
		value = value.substring(0, value.length() - 1);
		return ReturnMessage("获取数据成功", "Data:{Value:'" + value + "'}");
	}

	private String TryRegisterVendor(Session session, JSONObject data) {
		String sql = "select ID, 1 from lvendor where AuditState != 2 and name = '"
				+ data.getString("name") + "'";
		List<Object[]> list = session.createSQLQuery(sql).list();
		if (!list.isEmpty())
			return RaiseErrorMessage("美容院已被登记");

		int memberid = 0;
		sql = "select ID, 1 from lmember where phoneno = '"
				+ data.getString("phoneno") + "'";
		list = session.createSQLQuery(sql).list();
		if (list.isEmpty())
			return RaiseErrorMessage("手机号还没有注册会员");
		else {
			for (Object[] object : list) {
				memberid = (Integer) object[0];
			}
		}

		sql = "select m.ID, 1 from lvendor v inner join lmember m on m.ID = v.LMemberID where v.AuditState != 2 and m.phoneno = '"
				+ data.getString("phoneno") + "'";
		list = session.createSQLQuery(sql).list();
		if (!list.isEmpty())
			return RaiseErrorMessage("手机号已被其他美容院或品牌商捆绑");

		return ReturnMessage(
				"尝试注册成功",
				"memberid:"
						+ Integer.toString(memberid)
						+ ", ftpurl:'"
						+ ApplicationConfig.getInstance().getFtpurl()
						+ "',"
						+ "ftpport:"
						+ Integer.toString(ApplicationConfig.getInstance()
								.getFtpport()) + "," + "ftpuser:'"
						+ ApplicationConfig.getInstance().getFtpuser()
						+ "', ftppassword:'"
						+ ApplicationConfig.getInstance().getFtppassword()
						+ "'," + "lisencepath:'" + GetPicPath(session, 101)
						+ "', idcard1path:'" + GetPicPath(session, 102)
						+ "', idcard2URL:'" + GetPicPath(session, 103) + "'");
	}

	private String RegisterVendor(Session session, JSONObject data) {
		int provinceid = 0, cityid = 0, districtid = 0;
		String sql = "select ID, 1 from sprovince where Name = '"
				+ data.getString("province") + "'";
		List<Object[]> list = session.createSQLQuery(sql).list();
		for (Object[] object : list) {
			provinceid = (Integer) object[0];
		}
		sql = "select ID, 1 from scity where Name = '" + data.getString("city")
				+ "' and sprovinceid = " + Integer.toString(provinceid);
		list = session.createSQLQuery(sql).list();
		for (Object[] object : list) {
			cityid = (Integer) object[0];
		}
		sql = "select ID, 1 from sdistrict where Name = '"
				+ data.getString("district") + "' and scityid = "
				+ Integer.toString(cityid);
		list = session.createSQLQuery(sql).list();
		for (Object[] object : list) {
			districtid = (Integer) object[0];
		}

		int memberid = 0;
		sql = "select ID, 1 from lmember where PhoneNo = '"
				+ data.getString("phoneno") + "'";
		list = session.createSQLQuery(sql).list();
		for (Object[] object : list) {
			memberid = (Integer) object[0];
		}

		sql = "insert into lpicture(SPicTypeID, PicFileName)values(?,?)";
		Query query = session.createSQLQuery(sql);
		query.setInteger(0, 101);
		query.setString(1, data.getString("lisencepicname"));
		query.executeUpdate();
		int lisencepicid = 0;
		sql = "select ID, 1 from lpicture where PicFileName = '"
				+ data.getString("lisencepicname") + "'";
		list = session.createSQLQuery(sql).list();
		for (Object[] object : list) {
			lisencepicid = (Integer) object[0];
		}

		sql = "insert into lpicture(SPicTypeID, PicFileName)values(?,?)";
		query = session.createSQLQuery(sql);
		query.setInteger(0, 102);
		query.setString(1, data.getString("idcardpic1name"));
		query.executeUpdate();
		int idcardpic1id = 0;
		sql = "select ID, 1 from lpicture where PicFileName = '"
				+ data.getString("idcardpic1name") + "'";
		list = session.createSQLQuery(sql).list();
		for (Object[] object : list) {
			idcardpic1id = (Integer) object[0];
		}

		sql = "insert into lpicture(SPicTypeID, PicFileName)values(?,?)";
		query = session.createSQLQuery(sql);
		query.setInteger(0, 103);
		query.setString(1, data.getString("idcardpic2name"));
		query.executeUpdate();
		int idcardpic2id = 0;
		sql = "select ID, 1 from lpicture where PicFileName = '"
				+ data.getString("idcardpic2name") + "'";
		list = session.createSQLQuery(sql).list();
		for (Object[] object : list) {
			idcardpic2id = (Integer) object[0];
		}

		// 删除未审核通过的vendor
		sql = "delete from lvendor where lmemberid = "
				+ Integer.toString(memberid);
		query = session.createSQLQuery(sql);
		query.executeUpdate();

		sql = "insert into lvendor(LMemberID, VendorType, VendorSubType, BindTime, Name, FullName, Legalman, Linkman, "
				+ "WorkTime, Aptitude, IDCard, SProvinceID, SCityID, SDistrictID, Lng, Lat, Address, LocalPhoneNo, Area, Description, AuditState, State, RegTime, "
				+ "LicencePicID, IDCardPicID, IDCardPic2ID)"
				+ "values(?,?,?,?,?,?,?,?,"
				+ "?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,"
				+ "?,?,?)";
		query = session.createSQLQuery(sql);
		query.setInteger(0, memberid);
		query.setInteger(1, 1);
		query.setInteger(2, 0);
		query.setString(3, GetNow());
		query.setString(4, data.getString("name"));
		query.setString(5, data.getString("fullname"));
		query.setString(6, data.getString("legalman"));
		query.setString(7, data.getString("linkman"));

		query.setString(8, data.getString("worktime"));
		query.setString(9, data.getString("aptitude"));
		query.setString(10, data.getString("idcard"));
		query.setInteger(11, provinceid);
		query.setInteger(12, cityid);
		query.setInteger(13, districtid);
		query.setDouble(14, data.getDouble("lng"));
		query.setDouble(15, data.getDouble("lat"));
		query.setString(16, data.getString("address"));
		query.setString(17, data.getString("localphoneno"));
		query.setDouble(18, data.getDouble("area"));
		query.setString(19, data.getString("descrip"));
		query.setInteger(20, 0);
		query.setInteger(21, 0);
		query.setString(22, GetNow());

		query.setInteger(23, lisencepicid);
		query.setInteger(24, idcardpic1id);
		query.setInteger(25, idcardpic2id);

		query.executeUpdate();

		return ReturnMessage("申请成功");
	}

	private String GetVendorList(Session session, JSONObject data) {
		String sql = "select m.ID, m.name, m.Aptitude, m.Address, m.lat, m.lng,"
				+ "(6378.138*2*asin(sqrt(pow(sin(( "
				+ Double.toString(data.getDouble("lat"))
				+ "*pi()/180-m.lat*pi()/180)/2),2)+cos("
				+ Double.toString(data.getDouble("lat"))
				+ "*pi()/180)*cos(m.lat*pi()/180)* pow(sin(("
				+ Double.toString(data.getDouble("lng"))
				+ "*pi()/180-m.lng*pi()/180)/2),2)))) distance,"
				+ "(select AVG((sde.Score1 + sde.Score2 + sde.Score3 + sde.Score4) / 4) from sordergoods sd "
				+ "inner join levaluation sde on sde.SOrderGoodsID = sd.ID inner join sorder sm on sd.ID = sm.ID where sm.LVendorID = m.ID) Score,"
				+ "case when ISNULL(p.PicFileName) then '' else p.PicFileName end PicFileName,"
				+ "(select count(sd.ID) from sordergoods sd inner join sorder sm on sd.ID = sm.ID where sm.LVendorID = m.ID) SaleCount, "
				+ "m.FavoriteCount "
				+ "from lvendor m "
				+ "left join lvendorpicture vp on vp.lvendorid = m.ID and vp.orderno = 1 "
				+ "left join lpicture p on p.ID = vp.LPictureID ";
		if (!data.getString("filter").equals(""))
			sql = sql
					+ "where m.State = 0 and m.AuditState = 1 and m.Name like '%"
					+ data.getString("filter") + "%' or m.FullName like '%"
					+ data.getString("filter") + "%' ";
		sql = sql + "order by " + data.getString("orderby") + " " + "limit "
				+ Integer.toString(data.getInt("pagestart")) + ","
				+ Integer.toString(data.getInt("pagecount"));
		Query query = session.createSQLQuery(sql);
		List<Object[]> list = session.createSQLQuery(sql).list();
		String resultjson = "data:[";
		int iIndex = 0;
		for (Object[] object : list) {
			resultjson = resultjson + "{" + "vendorid:" + object[0] + ","
					+ "name:'" + object[1] + "'," + "aptitude:" + object[2]
					+ "," + "address:'" + object[3] + "'," + "lat:" + object[4]
					+ "," + "lng:" + object[5] + "," + "distance:" + object[6]
					+ ",";
			if (object[7] == null)
				resultjson = resultjson + "score:5,";
			else
				resultjson = resultjson + "score:" + object[7] + ",";
			if (!((String) object[8]).equals(""))
				resultjson = resultjson
						+ "picfile:'"
						+ ApplicationConfig.getFilePath(104,
								ImageUtil.PIC_TEMPORARY + (String) object[8])
						+ "',";
			else
				resultjson = resultjson + "picfile:'',";
			resultjson = resultjson + "favoritecount:" + object[9] + "},";
			iIndex++;
		}
		if (iIndex > 0)
			resultjson = resultjson.substring(0, resultjson.length() - 1);
		resultjson = resultjson + "]";
		return ReturnMessage("获取数据成功", resultjson);
	}

	private String GetServiceList(Session session, JSONObject data) {
		String sql = "select m.ID, m.name, m.salepoint, m.price ,m.DiscPrice, m.ServiceMinute, v.lat, v.lng,"
				+ "(6378.138*2*asin(sqrt(pow(sin(( "
				+ Double.toString(data.getDouble("lat"))
				+ "*pi()/180-v.lat*pi()/180)/2),2)+cos("
				+ Double.toString(data.getDouble("lat"))
				+ "*pi()/180)*cos(v.lat*pi()/180)* pow(sin(("
				+ Double.toString(data.getDouble("lng"))
				+ "*pi()/180-v.lng*pi()/180)/2),2)))) distance,"
				+ "(select v2.name from lvendor v2 where v2.id = m.LVendorID) VendorName, v.Address Address,"
				+ "(select AVG((sde.Score1 + sde.Score2 + sde.Score3 + sde.Score4) / 4) from sordergoods sd "
				+ "inner join levaluation sde on sde.SOrderGoodsID = sd.ID inner join sorder sm on sd.ID = sm.ID where sd.LGoodsID = m.ID) Score,"
				+ "case when ISNULL(p.PicFileName) then '' else p.PicFileName end PicFileName "
				+ "from lgoods m "
				+ "left join lvendor v on m.LVendorID = v.ID "
				+ "left join lgoodspicture vp on vp.lgoodsid = m.ID and vp.orderno = 1 "
				+ "left join lpicture p on p.ID = vp.LPictureID "
				+ "where m.GoodsKind = 1 and m.ForVendor = 0 "
				+ "order by "
				+ data.getString("orderby")
				+ " "
				+ "limit "
				+ Integer.toString(data.getInt("pagestart"))
				+ ","
				+ Integer.toString(data.getInt("pagecount"));
		Query query = session.createSQLQuery(sql);
		List<Object[]> list = session.createSQLQuery(sql).list();
		String resultjson = "data:[";
		int iIndex = 0;
		for (Object[] object : list) {
			resultjson = resultjson + "{" + "serviceid:" + object[0] + ","
					+ "name:'" + object[1] + "'," + "salepoint:'" + object[2]
					+ "'," + "price:" + object[3] + "," + "discprice:"
					+ object[4] + "," + "serviceminute:" + object[5] + ","
					+ "lat:" + object[6] + "," + "lng:" + object[7] + ","
					+ "distance:" + object[8] + "," + "vendorname:'"
					+ object[9] + "'," + "address:'" + object[10] + "',";
			if (object[11] == null)
				resultjson = resultjson + "score:5,";
			else
				resultjson = resultjson + "score:" + object[11] + ",";
			if (!((String) object[12]).equals(""))
				resultjson = resultjson
						+ "picfile:'"
						+ ApplicationConfig.getFilePath(301,
								ImageUtil.PIC_TEMPORARY + (String) object[12])
						+ "'},";
			else
				resultjson = resultjson + "picfile:''},";
			iIndex++;
		}
		if (iIndex > 0)
			resultjson = resultjson.substring(0, resultjson.length() - 1);
		resultjson = resultjson + "]";
		return ReturnMessage("获取数据成功", resultjson);
	}

	private String GetVendor(Session session, JSONObject data) {
		String sql = "select m.ID, m.name, m.Aptitude, m.Address, m.lat, m.lng,"
				+ "(6378.138*2*asin(sqrt(pow(sin(( "
				+ Double.toString(data.getDouble("lat"))
				+ "*pi()/180-m.lat*pi()/180)/2),2)+cos("
				+ Double.toString(data.getDouble("lat"))
				+ "*pi()/180)*cos(m.lat*pi()/180)* pow(sin(("
				+ Double.toString(data.getDouble("lng"))
				+ "*pi()/180-m.lng*pi()/180)/2),2)))) distance,"
				+ "(select AVG((sde.Score1 + sde.Score2 + sde.Score3 + sde.Score4) / 4) from sordergoods sd "
				+ "inner join levaluation sde on sde.SOrderGoodsID = sd.ID inner join sorder sm on sd.ID = sm.ID where sm.LVendorID = m.ID) Score,"
				+ "case when ISNULL(p.PicFileName) then '' else p.PicFileName end PicFileName,"
				+ "(select count(sd.ID) from sordergoods sd inner join sorder sm on sd.ID = sm.ID where sm.LVendorID = m.ID) SaleCount,"
				+ "m.FullName, m.WorkTime, m.LocalPhoneNo, m.Description "
				+ "from lvendor m "
				+ "left join lvendorpicture vp on vp.lvendorid = m.ID and vp.orderno = 1 "
				+ "left join lpicture p on p.ID = vp.LPictureID "
				+ "where m.ID = " + Integer.toString(data.getInt("vendorid"));
		Query query = session.createSQLQuery(sql);
		List<Object[]> list = session.createSQLQuery(sql).list();
		String resultjson = "data:{";
		for (Object[] object : list) {
			resultjson = resultjson + "vendorid:" + object[0] + "," + "name:'"
					+ object[1] + "'," + "aptitude:" + object[2] + ","
					+ "address:'" + object[3] + "'," + "lat:" + object[4] + ","
					+ "lng:" + object[5] + "," + "distance:" + object[6] + ",";
			if (object[7] == null)
				resultjson = resultjson + "score:5,";
			else
				resultjson = resultjson + "score:" + object[7] + ",";
			if (!((String) object[8]).equals(""))
				resultjson = resultjson
						+ "picfile:'"
						+ ApplicationConfig
								.getFilePath(104, (String) object[8]) + "',";
			else
				resultjson = resultjson + "picfile:'',";
			resultjson = resultjson + "salecount:" + object[9] + ","
					+ "fullname:'" + object[10] + "'," + "worktime:'"
					+ object[11] + "'," + "localphoneno:'" + object[12] + "',"
					+ "descrip:'" + object[13] + "',";

			// 护理
			resultjson = resultjson + "service:[";
			sql = "select m.ID, m.Name, m.SalePoint, m.Price, m.DiscPrice, m.ServiceMinute,"
					+ "case when ISNULL(p.PicFileName) then '' else p.PicFileName end PicFileName "
					+ "from lgoods m "
					+ "left join lgoodspicture vp on vp.lgoodsid = m.ID and vp.orderno = 1 "
					+ "left join lpicture p on p.ID = vp.LPictureID "
					+ "where m.GoodsKind = 1 and m.LVendorID = "
					+ Integer.toString((Integer) object[0])
					+ " order by m.OrderNo";
			List<Object[]> list2 = session.createSQLQuery(sql).list();
			int iIndex = 0;
			for (Object[] object2 : list2) {
				resultjson = resultjson + "{" + "goodsid:" + object2[0] + ","
						+ "name:'" + object2[1] + "'," + "salepoint:'"
						+ object2[2] + "'," + "price:" + object2[3] + ","
						+ "discprice:" + object2[4] + "," + "serviceminute:"
						+ object2[5] + ",";
				if (!((String) object2[6]).equals(""))
					resultjson = resultjson
							+ "picfile:'"
							+ ApplicationConfig.getFilePath(301,
									ImageUtil.PIC_TEMPORARY
											+ (String) object2[6]) + "'},";
				else
					resultjson = resultjson + "picfile:''},";
				iIndex++;
			}
			if (iIndex > 0)
				resultjson = resultjson.substring(0, resultjson.length() - 1);
			resultjson = resultjson + "],";

			// 商品
			resultjson = resultjson + "goods:[";
			sql = "select m.ID, m.Name, m.SalePoint, m.Price, m.DiscPrice,m.CarriagePrice,"
					+ "(select sum(sd.Qty) from sordergoods sd inner join sorder sm on sd.ID = sm.ID where sd.LGoodsID = m.ID) SaleQty, "
					+ "case when m.Qty > m.OccupyQty then m.Qty - m.OccupyQty else 0 end Qty,"
					+ "case when ISNULL(p.PicFileName) then '' else p.PicFileName end PicFileName "
					+ "from lgoods m "
					+ "left join lgoodspicture vp on vp.lgoodsid = m.ID and vp.orderno = 1 "
					+ "left join lpicture p on p.ID = vp.LPictureID "
					+ "where m.GoodsKind = 0 and m.LVendorID = "
					+ Integer.toString((Integer) object[0])
					+ " order by m.OrderNo";
			list2 = session.createSQLQuery(sql).list();
			iIndex = 0;
			for (Object[] object2 : list2) {
				resultjson = resultjson + "{" + "goodsid:" + object2[0] + ","
						+ "name:'" + object2[1] + "'," + "salepoint:'"
						+ object2[2] + "'," + "price:" + object2[3] + ","
						+ "carriageprice:" + object2[4] + "," + "discprice:"
						+ object2[5] + "," + "saleqty:" + object2[6] + ","
						+ "qty:" + object2[7] + ",";
				if (!((String) object2[8]).equals(""))
					resultjson = resultjson
							+ "picfile:'"
							+ ApplicationConfig.getFilePath(301,
									ImageUtil.PIC_TEMPORARY
											+ (String) object2[8]) + "'},";
				else
					resultjson = resultjson + "picfile:''},";
				iIndex++;
			}
			if (iIndex > 0)
				resultjson = resultjson.substring(0, resultjson.length() - 1);
			resultjson = resultjson + "],";

			// 美容师
			resultjson = resultjson + "beautician:[";
			sql = "select m.ID, m.Name, m.Description, m.WorkTime, "
					+ "(select AVG(sde.Score3) from sordergoods sd "
					+ "inner join levaluation sde on sde.SOrderGoodsID = sd.ID inner join sorder sm on sd.ID = sm.ID where sd.LBeauticianID = m.ID) Score,"
					+ "case when ISNULL(p.PicFileName) then '' else p.PicFileName end PicFileName "
					+ "from lbeautician m "
					+ "left join lpicture p on p.ID = m.PportraitPicID "
					+ "where m.LVendorID = "
					+ Integer.toString((Integer) object[0])
					+ " order by m.OrderNo";
			list2 = session.createSQLQuery(sql).list();
			iIndex = 0;
			for (Object[] object2 : list2) {
				resultjson = resultjson + "{" + "beauticianid:" + object2[0]
						+ "," + "name:'" + object2[1] + "'," + "descrip:'"
						+ object2[2] + "'," + "worktime:'" + object2[3] + "',";
				if (object2[4] == null)
					resultjson = resultjson + "score:5,";
				else
					resultjson = resultjson + "score:" + object2[4] + ",";
				if (!((String) object2[5]).equals(""))
					resultjson = resultjson
							+ "picfile:'"
							+ ApplicationConfig.getFilePath(201,
									(String) object2[5]) + "'},";
				else
					resultjson = resultjson + "picfile:''},";
				iIndex++;
			}
			if (iIndex > 0)
				resultjson = resultjson.substring(0, resultjson.length() - 1);
			resultjson = resultjson + "],";

			// 图片
			resultjson = resultjson + "picture:[";
			sql = "select case when ISNULL(m.PicFileName) then '' else m.PicFileName end PicFileName, 1 "
					+ "from lvendorpicture vp "
					+ "left join lpicture m on vp.lpictureid = m.ID "
					+ "where vp.LVendorID = "
					+ Integer.toString((Integer) object[0])
					+ " order by vp.OrderNo";
			list2 = session.createSQLQuery(sql).list();
			iIndex = 0;
			for (Object[] object2 : list2) {
				if (!((String) object2[0]).equals("")) {
					resultjson = resultjson + "{";
					resultjson = resultjson
							+ "filename:'"
							+ ApplicationConfig.getFilePath(104,
									(String) object2[0]) + "'},";
					iIndex++;
				}
			}
			if (iIndex > 0)
				resultjson = resultjson.substring(0, resultjson.length() - 1);
			resultjson = resultjson + "]";

		}
		resultjson = resultjson + "}";
		return ReturnMessage("获取数据成功", resultjson);
	}

	private String GetBeautician(Session session, JSONObject data) {
		String sql = "select m.ID, m.Name, m.Description, m.WorkTime, "
				+ "(select AVG(sde.Score3) from sordergoods sd "
				+ "inner join levaluation sde on sde.SOrderGoodsID = sd.ID inner join sorder sm on sd.ID = sm.ID where sd.LBeauticianID = m.ID) Score,"
				+ "case when ISNULL(p.PicFileName) then '' else p.PicFileName end PicFileName, "
				+ "m.WorkYears, "
				+ "(select count(sd.ID) from sordergoods sd "
				+ "inner join sorder sm on sd.ID = sm.ID where sd.LBeauticianID = m.ID) OrderCount "
				+ "from lbeautician m "
				+ "left join lpicture p on p.ID = m.PportraitPicID "
				+ "where m.ID = "
				+ Integer.toString(data.getInt("beauticianid"));

		Query query = session.createSQLQuery(sql);
		List<Object[]> list = session.createSQLQuery(sql).list();
		String resultjson = "data:{";
		for (Object[] object : list) {
			resultjson = resultjson + "beauticianid:" + object[0] + ","
					+ "name:'" + object[1] + "'," + "descrip:'" + object[2]
					+ "'," + "worktime:'" + object[3] + "',";
			if (object[4] == null)
				resultjson = resultjson + "score:5,";
			else
				resultjson = resultjson + "score:" + object[4] + ",";
			if (!((String) object[5]).equals(""))
				resultjson = resultjson
						+ "picfile:'"
						+ ApplicationConfig
								.getFilePath(201, (String) object[5]) + "',";
			else
				resultjson = resultjson + "picfile:'',";
			resultjson = resultjson + "workyesrs:" + object[6] + ","
					+ "ordercount:" + object[7] + ",";

		}

		sql = "select m.ID, m.Name, m.SalePoint, m.Price, m.DiscPrice, m.ServiceMinute,"
				+ "case when ISNULL(p.PicFileName) then '' else p.PicFileName end PicFileName "
				+ "from lbeauticiangoods bg "
				+ "left join lgoods m on m.ID = bg.LGoodsID "
				+ "left join lgoodspicture vp on vp.lgoodsid = m.ID and vp.orderno = 1 "
				+ "left join lpicture p on p.ID = vp.LPictureID "
				+ "where bg.LbeauticianID = "
				+ Integer.toString(data.getInt("beauticianid"))
				+ " order by m.OrderNo";
		list = session.createSQLQuery(sql).list();
		resultjson = resultjson + "service:[";
		for (Object[] object : list) {
			resultjson = resultjson + "{" + "goodsid:" + object[0] + ","
					+ "name:'" + object[1] + "'," + "salepoint:'" + object[2]
					+ "'," + "price:" + object[3] + "," + "discprice:"
					+ object[4] + "," + "serviceminute:" + object[5] + ",";
			if (!((String) object[6]).equals(""))
				resultjson = resultjson
						+ "picfile:'"
						+ ApplicationConfig.getFilePath(301,
								ImageUtil.PIC_TEMPORARY + (String) object[6])
						+ "'},";
			else
				resultjson = resultjson + "picfile:''},";
		}
		if (!list.isEmpty())
			resultjson = resultjson.substring(0, resultjson.length() - 1);
		resultjson = resultjson + "]}";
		return ReturnMessage("获取数据成功", resultjson);
	}

	private String GetGoods(Session session, JSONObject data) {
		// 获取限时促销价
		int goodsid = data.getInt("goodsid");
		double advertprice = 0;
		String sql = "select m.Price, m.ID from ladvert m where m.LGoodsID = ? and m.AdvertType = 1 and m.ShowTime <= ? and m.EndTime >= ? "
				+ "and m.LimitQty > (select sum(sd.qty) from sordergoods sd where sd.LAdvertID = m.ID) order by m.Price";
		Query query = session.createSQLQuery(sql);
		query.setInteger(0, goodsid);
		query.setString(1, GetNow());
		query.setString(2, GetNow());
		List<Object[]> list = query.list();
		if (!list.isEmpty()) {
			for (Object[] object : list) {
				advertprice = (Double) object[0];
				break;
			}
		}

		Calendar calendar = new GregorianCalendar();
		calendar.setTime(new Date());
		calendar.add(calendar.DATE, -30);
		sql = "select m.ID, m.LVendorID, m.GoodsNo, m.Name, m.Spec, m.Price, m.DiscPrice, "
				+ "case when m.Qty > m.OccupyQty then m.Qty - m.OccupyQty else 0 end Qty,"
				+ "m.Unit, m.ForSaleStartDate, m.ForSaleEndDate, m.CarriagePrice, m.CanUsePoint, m.UsePoint, m.CanUseTicket, m.UseTicket,"
				+ "m.SaleQty, m.SalePoint, m.ServiceMinute,"
				+ "(select sum(sd.Qty) from sordergoods sd left join sorder sm on sd.SOrderID = sm.ID where sm.OrderTime >= '"
				+ GetDateString(calendar.getTime())
				+ "' and sd.LGoodsID = m.ID) RealSaleQty,"
				+ "(select avg((pf.Score1 + pf.Score2 + pf.Score3 + pf.Score4)/4) from sordergoods sd left join levaluation pf on sd.ID = pf.SOrderGoodsID where sd.LGoodsID = m.ID) Score,"
				+ "(select v2.name from lvendor v2 where v2.id = m.LVendorID) VendorName, v.Address Address, v.WorkTime, "
				+ "v.lat, v.lng,"
				+ "(6378.138*2*asin(sqrt(pow(sin(( "
				+ Double.toString(data.getDouble("lat"))
				+ "*pi()/180-v.lat*pi()/180)/2),2)+cos("
				+ Double.toString(data.getDouble("lat"))
				+ "*pi()/180)*cos(v.lat*pi()/180)* pow(sin(("
				+ Double.toString(data.getDouble("lng"))
				+ "*pi()/180-v.lng*pi()/180)/2),2)))) distance,"
				+ "m.MarketTime, m.ColorType, m.Effect, m.Brand, m.FitSkin, m.OrginPlace, m.ShelfLife, "
				+ "(select Name from sprovince where ID = v.sprovinceID) province, "
				+ "(select Name from scity where ID = v.scityID) city, "
				+ "(select Name from sdistrict where ID = v.sdistrictID) district, "
				+ "(select count(1) from lfavorite where LMemberID = "
				+ Integer.toString(data.getInt("memberid"))
				+ " and ObjectType = 301 and ObjectID = "
				+ Integer.toString(goodsid)
				+ ") isfavorite "
				+ "from LGoods m "
				+ "left join lvendor v on m.LVendorID = v.ID "
				+ "where m.ID = " + Integer.toString(goodsid);

		query = session.createSQLQuery(sql);
		list = session.createSQLQuery(sql).list();
		String resultjson = "data:{";
		for (Object[] object : list) {
			resultjson = resultjson + "goodsid:" + object[0] + ","
					+ "vendorid:" + object[1] + "," + "code:'" + object[2]
					+ "'," + "name:'" + object[3] + "'," + "spec:'" + object[4]
					+ "'," + "price:" + object[5] + "," + "discprice:"
					+ object[6] + ",";
			if (advertprice == 0)
				resultjson = resultjson + "advertprice:null,";
			else
				resultjson = resultjson + "advertprice:"
						+ Double.toString(advertprice);
			resultjson = resultjson + "qty:" + object[7] + "," + "unit:'"
					+ object[8] + "'," + "forsalestartdate:'" + object[9]
					+ "'," + "forsaleenddate:'" + object[10] + "',"
					+ "carriageprice:" + object[11] + "," + "canusepoint:"
					+ object[12] + "," + "usepoint:" + object[13] + ","
					+ "canuseticket:" + object[14] + "," + "useticket:"
					+ object[15] + "," + "saleqty:" + object[16] + ","
					+ "salepoint:'" + object[17] + "'," + "serviceminute:"
					+ object[18] + "," + "realsaleqty:" + object[19] + ",";
			if (object[20] == null)
				resultjson = resultjson + "score:5,";
			else
				resultjson = resultjson + "score:" + object[20] + ",";
			resultjson = resultjson + "vendorname:'" + object[21] + "',"
					+ "address:'" + object[22] + "'," + "worktime:'"
					+ object[23] + "'," + "lat:" + object[24] + "," + "lng:"
					+ object[25] + "," + "distance:" + object[26] + ","
					+ "markettime:'" + object[27] + "'," + "colortype:'"
					+ object[28] + "'," + "effect:'" + object[29] + "',"
					+ "brand:'" + object[30] + "'," + "fitskin:'" + object[31]
					+ "'," + "orginplace:'" + object[32] + "'," + "shelflife:'"
					+ object[33] + "'," + "province:'" + object[34] + "',"
					+ "city:'" + object[35] + "'," + "district:'" + object[36]
					+ "'," + "isfavorite:'" + object[37] + "'," + "Picture:[";
			sql = "select t.PicPath, p.PicFileName from lgoodspicture ap left join lpicture p on p.ID = ap.LPictureID "
					+ " left join spictype t on t.ID = p.SPicTypeID "
					+ "where ap.LGoodsID = ? order by ap.OrderNo";
			Query query2 = session.createSQLQuery(sql);
			query2.setInteger(0, (Integer) object[0]);
			List<Object[]> list2 = query2.list();
			int iIndex2 = 0;
			for (Object[] object2 : list2) {
				resultjson = resultjson + "{URL:'"
						+ ApplicationConfig.getFilePath("") + object2[0]
						+ object2[1] + "'";
				resultjson = resultjson + "},";
				iIndex2++;
			}
			if (iIndex2 > 0)
				resultjson = resultjson.substring(0, resultjson.length() - 1);
		}
		resultjson = resultjson + "]}";

		// 维护广告被点击数
		if (data.getInt("advertid") != 0) {
			sql = "update ladvert set ClickCount = ClickCount + 1 where ID = ?";
			query = session.createSQLQuery(sql);
			query.setInteger(0, data.getInt("advertid"));
			query.executeUpdate();
		}

		return ReturnMessage("获取数据成功", resultjson);
	}

	private String GetDescriptionHtml(Session session, JSONObject data) {
		String sql = "select Description, ID from "
				+ data.getString("tablename") + " where ID = "
				+ Integer.toString(data.getInt("id"));
		List<Object[]> list = session.createSQLQuery(sql)
				.addScalar("description", Hibernate.TEXT).addScalar("id")
				.list();
		String resultjson = "data:{";
		for (Object[] object : list) {
			try {
				String value = BASE64.encryptBASE64(((String) object[0])
						.getBytes());
				// System.out.println(Integer.toString(value.length()));
				value = value.replaceAll("[\\t\\n\\r]", "");
				resultjson = resultjson + "value:'" + value + "'";
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		resultjson = resultjson + "}";
		return ReturnMessage("获取数据成功", resultjson);
	}

	private String GetAddress(Session session, JSONObject data) {
		String sql = "select ID, Name, PhoneNo, Address, IsDefault from laddress where LMemberID = "
				+ Integer.toString(data.getInt("memberid"));
		String resultjson = "data:[";
		List<Object[]> list = session.createSQLQuery(sql).list();
		int iIndex = 0;
		for (Object[] object : list) {
			resultjson = resultjson + "{addressid:"
					+ Integer.toString((Integer) object[0]) + ',' + "name:'"
					+ object[1] + "'," + "phoneno:'" + object[2] + "',"
					+ "address:'" + object[3] + "'," + "isdefault:"
					+ Short.toString((Short) object[4]) + "},";
			iIndex++;
		}
		if (iIndex > 0)
			resultjson = resultjson.substring(0, resultjson.length() - 1);
		resultjson = resultjson + "]";

		return ReturnMessage("获取数据成功", resultjson);
	}

	private String EditAddress(Session session, JSONObject data) {
		String sql;
		if (data.getInt("edittype") == 0)
			sql = "insert into laddress(LMemberID, Name, PhoneNo, Address, IsDefault) values (?, ?, ?, ?, ?)";
		else if (data.getInt("edittype") == 1)
			sql = "update laddress set Name = ?, PhoneNo = ?, Address = ?, IsDefault = ? where ID = ?";
		else
			sql = "delete from laddress where ID = ?";
		Query query = session.createSQLQuery(sql);
		int addressid = 0;
		if (data.getInt("edittype") == 0) {
			query.setInteger(0, data.getInt("memberid"));
			query.setString(1, data.getString("name"));
			query.setString(2, data.getString("phoneno"));
			query.setString(3, data.getString("address"));
			query.setInteger(4, data.getInt("isdefault"));
			sql = "select max(ID), 1 from laddress";
			List<Object[]> list = session.createSQLQuery(sql).list();
			for (Object[] object : list)
				addressid = (Integer) object[0];
		} else if (data.getInt("edittype") == 1) {
			query.setString(0, data.getString("name"));
			query.setString(1, data.getString("phoneno"));
			query.setString(2, data.getString("address"));
			query.setInteger(3, data.getInt("isdefault"));
			query.setInteger(4, data.getInt("addressid"));
			addressid = data.getInt("addressid");
		} else {
			query.setInteger(0, data.getInt("addressid"));
		}
		query.executeUpdate();

		// 把其他收货地址设置为非默认地址
		if ((data.getInt("edittype") == 0) || (data.getInt("edittype") == 1)) {
			if (data.getInt("isdefault") == 1) {
				sql = "update laddress set IsDefault = 0 where LMemberID = ? and ID != ?";
				query = session.createSQLQuery(sql);
				query.setInteger(0, data.getInt("memberid"));
				query.setInteger(1, addressid);
				query.executeUpdate();
			}
		}
		return ReturnMessage("提交成功");
	}

	private String GetAccount(Session session, JSONObject data) {
		String sql = "select ID, LVendorID, AccountKind, Account, BankName, AccountUser from laccount where LVendorID = "
				+ Integer.toString(data.getInt("vendorid"));
		String resultjson = "data:[";
		List<Object[]> list = session.createSQLQuery(sql).list();
		for (Object[] object : list) {
			resultjson = resultjson + "{accountid:"
					+ Integer.toString((Integer) object[0]) + ','
					+ "accountkind:" + object[1] + "," + "account:'"
					+ object[2] + "'," + "bankname:'" + object[3] + "',"
					+ "accountuser:'" + object[4] + "'},";
		}
		if (!list.isEmpty())
			resultjson = resultjson.substring(0, resultjson.length() - 1);
		resultjson = resultjson + "]";

		return ReturnMessage("获取数据成功", resultjson);
	}

	private String EditAccount(Session session, JSONObject data) {
		String sql;
		if (data.getInt("edittype") == 0)
			sql = "insert into laccount(LVendorID, AccountKind, Account, BankName, AccountUser) values (?, ?, ?, ?, ?)";
		else if (data.getInt("edittype") == 1)
			sql = "update laccount set AccountKind = ?, Account = ?, BankName = ?, AccountUser = ? where ID = ?";
		else
			sql = "delete from laccount where ID = ?";
		Query query = session.createSQLQuery(sql);
		if (data.getInt("edittype") == 0) {
			query.setInteger(0, data.getInt("vendorid"));
			query.setInteger(1, data.getInt("accountkind"));
			query.setString(2, data.getString("account"));
			query.setString(3, data.getString("bankname"));
			query.setString(4, data.getString("accountuser"));
		} else if (data.getInt("edittype") == 1) {
			query.setInteger(0, data.getInt("accountkind"));
			query.setString(1, data.getString("account"));
			query.setString(2, data.getString("bankname"));
			query.setString(3, data.getString("accountuser"));
			query.setInteger(4, data.getInt("accountid"));
		} else {
			query.setInteger(0, data.getInt("accountid"));
		}
		query.executeUpdate();

		return ReturnMessage("提交成功");
	}

	private String GetCash(Session session, JSONObject data) {
		String sql = "select RequestTime, AccountKind, Account, BankName, AccountUser, Amt, FlowState, CashNo from scash where LVendorID = "
				+ Integer.toString(data.getInt("vendorid"))
				+ " order by RequestTime desc";
		String resultjson = "data:[";
		List<Object[]> list = session.createSQLQuery(sql).list();
		for (Object[] object : list) {
			resultjson = resultjson + "{requesttime:'" + object[0] + "',"
					+ "accountkind:" + object[1] + "," + "account:'"
					+ object[2] + "'," + "bankname:'" + object[3] + "',"
					+ "accountuser:'" + object[4] + "'," + "amt:" + object[5]
					+ "," + "flowstate:" + object[6] + "," + "cashno:'"
					+ object[7] + "'},";
		}
		if (!list.isEmpty())
			resultjson = resultjson.substring(0, resultjson.length() - 1);
		resultjson = resultjson + "]";

		return ReturnMessage("获取数据成功", resultjson);
	}

	private String RequestCash(Session session, JSONObject data) {
		String sql = "select LVendorID, AccountKind, Account, case when IsNull(BankName) then '' else BankName end BankName, "
				+ "case when IsNull(AccountUser) then '' else AccountUser end AccountUser "
				+ "from laccount where ID = "
				+ Integer.toString(data.getInt("accountid"));
		int vendorid = 0;
		short accountkind = 0;
		String account = "";
		String bankname = "";
		String accountuser = "";
		List<Object[]> list = session.createSQLQuery(sql).list();
		if (list.isEmpty())
			return RaiseErrorMessage("提现账户不存在");

		for (Object[] object : list) {
			vendorid = (Integer) object[0];
			accountkind = (Short) object[1];
			account = (String) object[2];
			bankname = (String) object[3];
			accountuser = (String) object[4];
		}

		sql = "select sum(sd.payamt), 1 from sordergoods sd inner join sorder s on s.ID = sd.SOrderID and s.IsReceive = 1 "
				+ "inner join lgoods g on sd.LGoodsID = g.ID and g.LVendorID = "
				+ Integer.toString(vendorid);
		double sumpayamt = 0;
		list = session.createSQLQuery(sql).list();
		for (Object[] object : list) {
			if (object[0] != null)
				sumpayamt = (Double) object[0];
		}
		sql = "select sum(sd.amt), 1 from scash sd where sd.FlowState != -1 and sd.LVendorID = "
				+ Integer.toString(vendorid);
		double sumcashamt = 0;
		list = session.createSQLQuery(sql).list();
		for (Object[] object : list) {
			if (object[0] != null)
				sumcashamt = (Double) object[0];
		}

		if (data.getDouble("amt") > sumpayamt - sumcashamt) {
			return RaiseErrorMessage("本次申请大于可提现总金额");
		}

		sql = "insert into scash(RequestTime, LVendorID, AccountKind, Account, BankName, AccountUser, Amt, FlowState, CashNo) values "
				+ "(?, ?, ?, ?, ?, ?, ?, 0, ?)";
		Query query = session.createSQLQuery(sql);
		query.setString(0, GetNow());
		query.setInteger(1, vendorid);
		query.setInteger(2, accountkind);
		query.setString(3, account);
		query.setString(4, bankname);
		query.setString(5, accountuser);
		query.setDouble(6, data.getDouble("amt"));
		String cashno = "T" + Integer.toString(vendorid)
				+ Long.toString(System.currentTimeMillis());
		query.setString(7, cashno);

		query.executeUpdate();

		return ReturnMessage("提交成功");
	}

	private String GetDefaultAddress(Session session, JSONObject data) {
		String sql = "select ID, Name, PhoneNo, Address, IsDefault from laddress where isdefault = 1 and LMemberID = "
				+ Integer.toString(data.getInt("memberid"));
		String resultjson = "data:{";
		List<Object[]> list = session.createSQLQuery(sql).list();
		for (Object[] object : list) {
			resultjson = resultjson + "id:"
					+ Integer.toString((Integer) object[0]) + ',' + "name:'"
					+ object[1] + "'," + "phoneno:'" + object[2] + "',"
					+ "address:'" + object[3] + "'," + "isdefault:"
					+ Short.toString((Short) object[4]);
			break;
		}
		resultjson = resultjson + "}";

		return ReturnMessage("获取数据成功", resultjson);
	}

	private String GetGoodsTicket(Session session, JSONObject data) {
		String sql = "select UsePoint, 1 from lgoods where CanUsePoint = 1 and ID = ?";
		Query query = session.createSQLQuery(sql);
		query.setInteger(0, data.getInt("goodsid"));
		List<Object[]> list = query.list();
		int goodscanusepoint = 0;
		for (Object[] object : list)
			goodscanusepoint = (Integer) object[0];

		sql = "select UseTicket, 1 from lgoods where CanUseTicket = 1 and ID = ?";
		query = session.createSQLQuery(sql);
		query.setInteger(0, data.getInt("goodsid"));
		list = query.list();
		double goodscanuseticket = 0;
		for (Object[] object : list)
			goodscanuseticket = (Double) object[0];

		sql = "select Point, 1 from lmember where ID = ?";
		query = session.createSQLQuery(sql);
		query.setInteger(0, data.getInt("memberid"));
		list = query.list();
		int membercanusepoint = 0;
		if (!list.isEmpty())
			for (Object[] object : list)
				membercanusepoint = (Integer) object[0];
		String resultjson = "data:{";
		resultjson = resultjson + "goodscanusepoint:"
				+ Double.toString(goodscanusepoint) + ","
				+ "membercanusepoint:" + Integer.toString(goodscanusepoint)
				+ "," + "goodscanuseticket:"
				+ Double.toString(goodscanuseticket) + "," + "ticket:[";

		if (goodscanuseticket > 0) {
			Boolean bticket = false;

			// 通用券
			sql = "select d.ID, m.Amt, m.TicketKind "
					+ "from lmemberticket d "
					+ "inner join lticketprovider m on m.ID = d.LTicketPrivoderID and m.TicketKind = 0 "
					+ "where d.LMemberID = ? and d.SOrderGoodsID is null and m.TicketStartTime <= ? and m.TicketEndTime >= ?";
			query = session.createSQLQuery(sql);
			query.setInteger(0, data.getInt("memberid"));
			query.setString(1, GetNow());
			query.setString(2, GetNow());
			list = query.list();
			for (Object[] object : list) {
				resultjson = resultjson + "{ticketid:" + object[0] + ","
						+ "amt:" + Double.toString((Double) object[1]) + ","
						+ "ticketkind:" + Short.toString((Short) object[2])
						+ "},";
				bticket = true;
			}
			// 类别券
			sql = "select d.ID, m.Amt, m.TicketKind "
					+ "from lmemberticket d "
					+ "inner join lticketprovider m on m.ID = d.LTicketPrivoderID and m.TicketKind = 1 "
					+ "inner join ltype t on t.ID = m.GoodsTypeID "
					+ "inner join lgoods g on g.LTypeID = t.ID and g.ID = ? "
					+ "where d.LMemberID = ? and d.SOrderGoodsID is null and m.TicketStartTime <= ? and m.TicketEndTime >= ?";
			query = session.createSQLQuery(sql);
			query.setInteger(0, data.getInt("goodsid"));
			query.setInteger(1, data.getInt("memberid"));
			query.setString(2, GetNow());
			query.setString(3, GetNow());
			list = query.list();
			for (Object[] object : list) {
				resultjson = resultjson + "{ticketid:" + object[0] + ","
						+ "amt:" + Double.toString((Double) object[1]) + ","
						+ "ticketkind:" + Short.toString((Short) object[2])
						+ "},";
				bticket = true;
			}
			// 单品券
			sql = "select d.ID, m.Amt, m.TicketKind "
					+ "from lmemberticket d "
					+ "inner join lticketprovider m on m.ID = d.LTicketPrivoderID and m.TicketKind = 2 "
					+ "inner join lgoods g on g.ID = m.LGoodsID and g.ID = ? "
					+ "where d.LMemberID = ? and d.SOrderGoodsID is null and m.TicketStartTime <= ? and m.TicketEndTime >= ?";
			query = session.createSQLQuery(sql);
			query.setInteger(0, data.getInt("goodsid"));
			query.setInteger(1, data.getInt("memberid"));
			query.setString(2, GetNow());
			query.setString(3, GetNow());
			list = query.list();
			for (Object[] object : list) {
				resultjson = resultjson + "{ticketid:" + object[0] + ","
						+ "amt:" + Double.toString((Double) object[1]) + ","
						+ "ticketkind:" + Short.toString((Short) object[2])
						+ "},";
				bticket = true;
			}

			if (bticket)
				resultjson = resultjson.substring(0, resultjson.length() - 1);
		}

		resultjson = resultjson + "]}";

		return ReturnMessage("获取数据成功", resultjson);
	}

	private String CreateSOrder(Session session, JSONObject data) {
		String sql = "insert into SOrder (OrderNo, OrderTime, ServiceTime, OrderType, LMemberID, LVendorID, PayKind, "
				+ "ClientName, ClientPhoneNo, ClientAddress, Message, "
				+ "IsSend, IsPay, ReturnState, Closed, IsReceive,"
				+ "Amt, PayAmt, UsePoint, GetPoint, UseTicket) values ("
				+ "?, ?, ?, ?, ?, ?, ?, "
				+ "?, ?, ?, ?, "
				+ "0, 0, 0, 0, 0, "
				+ "0, 0, 0, 0, 0)";
		Query query = session.createSQLQuery(sql);
		String orderno = Integer.toString(data.getInt("memberid"))
				+ Long.toString(System.currentTimeMillis());
		double sumamt = 0;
		double sumpayamt = 0;
		int sumusepoint = 0;
		int sumgetpoint = 0;
		double sumuseticket = 0;

		query.setString(0, orderno);
		query.setString(1, GetNow());
		if (data.getString("servicetime").equals(""))
			query.setParameter(2, null);
		else
			query.setString(2, data.getString("servicetime"));
		query.setInteger(3, data.getInt("ordertype"));
		query.setInteger(4, data.getInt("memberid"));
		query.setInteger(5, data.getInt("vendorid"));
		query.setInteger(6, data.getInt("paykind"));

		query.setString(7, data.getString("clientname"));
		query.setString(8, data.getString("clientphoneno"));
		query.setString(9, data.getString("clientaddress"));
		query.setString(10, data.getString("message"));
		query.executeUpdate();

		sql = "select max(ID), 1 from sorder";
		List<Object[]> list = session.createSQLQuery(sql).list();
		int orderid = 0;
		for (Object[] object : list)
			orderid = (Integer) object[0];

		JSONArray goods = JSONArray.fromObject(data.getString("goods"));
		for (int i = 0; i < goods.size(); i++) {
			int sordergoodsid = 0;
			int goodsid = goods.getJSONObject(i).getInt("goodsid");
			double qty = goods.getJSONObject(i).getDouble("qty");
			int usepoint = goods.getJSONObject(i).getInt("usepoint");
			int ticketid = 0;
			if (!goods.getJSONObject(i).get("ticketid").equals(null))
				ticketid = goods.getJSONObject(i).getInt("ticketid");
			double useticket = 0;

			// 获取最低价格
			double price = 0;
			int advertid = 0;
			sql = "select m.Price, m.ID from ladvert m where m.LGoodsID = ? and m.AdvertType = 1 and m.ShowTime <= ? and m.EndTime >= ? "
					+ "and m.LimitQty > (select sum(sd.qty) from sordergoods sd where sd.LAdvertID = m.ID) + ? order by m.Price";
			query = session.createSQLQuery(sql);
			query.setInteger(0, goodsid);
			query.setString(1, GetNow());
			query.setString(2, GetNow());
			query.setDouble(3, qty);
			list = query.list();
			if (!list.isEmpty()) {
				for (Object[] object : list) {
					price = (Double) object[0];
					advertid = (Integer) object[1];
					break;
				}
			} else {
				sql = "select DiscPrice, ID from lgoods where ID = ?";
				query = session.createSQLQuery(sql);
				query.setInteger(0, goodsid);
				list = query.list();
				if (list.isEmpty()) {
					return RaiseErrorMessage("商品不存在");
				}
				for (Object[] object : list)
					price = (Double) object[0];
			}

			sql = "insert into sordergoods(SOrderID, LGoodsID, Price, Qty, Amt, PayAmt, "
					+ "UsePoint, GetPoint, LMemberTicketID, UseTicket, LAdvertID) values "
					+ "(?, ?, ?, ?, ?, ?, " + "?, ? ,?, ?, ?)";
			query = session.createSQLQuery(sql);
			query.setInteger(0, orderid);
			query.setInteger(1, goods.getJSONObject(i).getInt("goodsid"));
			query.setDouble(2, price);
			query.setDouble(3, qty);
			query.setDouble(4, qty * price);
			sumamt = sumamt + qty * price;

			query.setInteger(6, usepoint);
			sumusepoint = sumusepoint + usepoint;
			query.setInteger(7, (int) Math.floor(qty * price));
			sumgetpoint = sumgetpoint + (int) Math.floor(qty * price);
			if (ticketid == 0) {
				query.setParameter(8, null);
				query.setDouble(9, 0);// UseTicket
			} else {
				// 券面值 如果为0时已经过期或不足最低消费
				useticket = 0;
				sql = "select m.amt from lmemberticket d "
						+ "left join lticketprovider m on m.ID = d.LTicketPrivoderID where d.ID = "
						+ Integer.toString(ticketid)
						+ " and m.TicketStartTime <= ? and m.TicketEndTime >= ? and m.GoodsMinAmt >= ?";
				Query query2 = session.createSQLQuery(sql);
				query2.setString(0, GetNow());
				query2.setString(1, GetNow());
				query2.setDouble(2, qty * price);
				List<Object[]> list2 = query2.list();
				if (!list2.isEmpty())
					for (Object[] object2 : list2) {
						useticket = (Double) object2[0];
					}
				else
					return RaiseErrorMessage("现金券已过期或不足最低消费");

				// 商品使用券上限
				if (useticket > 0) {
					sql = "select useticket, 1 from lgoods where ID = "
							+ Integer.toString(goodsid);
					list2 = session.createSQLQuery(sql).list();
					for (Object[] object2 : list2) {
						if (((Double) object2[0] != 0)
								&& ((Double) object2[0] < useticket))
							useticket = (Double) object2[0];
					}
				}

				query.setDouble(9, useticket);// UseTicket
				sumuseticket = sumuseticket + useticket;

				if (useticket == 0) {
					ticketid = 0;
					query.setParameter(8, null);
				} else {
					query.setInteger(8, ticketid);
				}
			}
			double payamt = qty * price
					- Double.parseDouble(Integer.toString(usepoint)) / 100
					- useticket;
			DecimalFormat df = new DecimalFormat("#.00");
			query.setDouble(5, Double.valueOf(df.format(payamt)));// 现金支付金额
			sumpayamt = sumpayamt + Double.valueOf(df.format(payamt));

			if (advertid == 0)
				query.setParameter(10, null);// LAdvertID
			else
				query.setInteger(10, advertid);
			query.executeUpdate();

			// 维护占用库存
			sql = "update lgoods set OccupyQty = OccupyQty + ? where ID = ?";
			query = session.createSQLQuery(sql);
			query.setDouble(0, qty);
			query.setInteger(1, goodsid);
			query.executeUpdate();

			// 维护现金券订单明细ID
			if (ticketid != 0) {
				sql = "select max(ID), 1 from sordergoods";
				list = session.createSQLQuery(sql).list();
				for (Object[] object : list)
					sordergoodsid = (Integer) object[0];

				sql = "update lmemberticket set sordergoodsid = ? where ID = ?";
				query = session.createSQLQuery(sql);
				query.setInteger(0, sordergoodsid);
				query.setInteger(1, ticketid);
				query.executeUpdate();
			}
		}
		// 维护订单主表
		sql = "update sorder set amt = ?, payamt = ?, usepoint = ?, getpoint = ?, useticket = ? where ID = ?";
		query = session.createSQLQuery(sql);
		query.setDouble(0, sumamt);
		query.setDouble(1, sumpayamt);
		query.setInteger(2, sumusepoint);
		query.setInteger(3, sumgetpoint);
		query.setDouble(4, sumuseticket);
		query.setInteger(5, orderid);
		query.executeUpdate();

		// 维护广告被下单数
		if (data.getInt("advertid") != 0) {
			sql = "update ladvert set ordercount = ordercount + 1 where ID = ?";
			query = session.createSQLQuery(sql);
			query.setInteger(0, data.getInt("advertid"));
			query.executeUpdate();
		}

		return ReturnMessage("提交成功",
				"data:{orderid:" + Integer.toString(orderid) + ", payamt:"
						+ Double.toString(sumpayamt) + "}");
	}

	private String GetSOrderList(Session session, JSONObject data) {
		String sql = "select m.ID, m.OrderNo, m.OrderTime, m.LVendorID, m.ServiceTime, m.Amt, m.PayAmt, m.PayKind, "
				+ "m.IsSend, m.SendTime, m.IsPay, m.PayTime, m.ReturnState, m.ReturnTime, "
				+ "m.Closed, m.CloseTime, m.ClientName, m.ClientPhoneNo, m.Message, "
				+ "(select v2.name from lvendor v2 where v2.id = m.LVendorID) VendorName, "
				+ "m.IsReceive, m.ReceiveTime, m.IsEvaluation, m.PayNo "
				+ "from SOrder m "
				+ "where m.LMemberID = "
				+ Integer.toString(data.getInt("memberid"));
		if (!data.getString("filter").equals(""))
			sql = sql + " and m." + data.getString("filter");
		sql = sql + " order by m.OrderTime";
		String resultjson = "data:[";
		List<Object[]> list = session.createSQLQuery(sql).list();
		for (Object[] object : list) {
			int orderid = (Integer) object[0];
			resultjson = resultjson + "{orderid:" + Integer.toString(orderid)
					+ "," + "orderno:'" + object[1] + "'," + "ordertime:'"
					+ object[2] + "'," + "vendorid:" + object[3] + ","
					+ "servicetime:'" + object[4] + "'," + "amt:" + object[5]
					+ "," + "payamt:" + object[6] + "," + "paykind:"
					+ object[7] + "," +

					"issend:" + object[8] + "," + "sendtime:'" + object[9]
					+ "'," + "ispay:" + object[10] + "," + "paytime:'"
					+ object[11] + "'," + "returnstate:" + object[12] + ","
					+ "returntime:'" + object[13] + "'," +

					"closed:" + object[14] + "," + "closetime:'" + object[15]
					+ "'," + "clientname:'" + object[16] + "',"
					+ "clientphoneno:'" + object[17] + "'," + "message:'"
					+ object[18] + "'," + "vendorname:'" + object[19] + "',"
					+ "isreceive:" + object[20] + "," + "receivetime:'"
					+ object[21] + "'," + "isevaluation:" + object[22] + ","
					+ "payno:'" + object[23] + "',";

			resultjson = resultjson + "goods:[";
			sql = "select m.LGoodsID, g.Name, g.Spec, m.Qty, "
					+ "m.price, m.amt, m.payamt, m.usepoint, m.getpoint, "
					+ "(select tp.Name from lmemberticket mt inner join lticketprovider tp on tp.ID = mt.LTicketPrivoderID where mt.ID = m.LMemberTicketID) ticketname, "
					+ "m.useticket, (select Name from lbeautician where ID = m.LBeauticianID) BeauticianName, "
					+ "case when ISNULL(p.PicFileName) then '' else p.PicFileName end PicFileName "
					+ "from sordergoods m "
					+ "left join lgoods g on g.ID = m.LGoodsID "
					+ "left join lgoodspicture vp on vp.lgoodsid = m.LGoodsID and vp.orderno = 1 "
					+ "left join lpicture p on p.ID = vp.LPictureID "
					+ "where SOrderID = " + Integer.toString(orderid);
			List<Object[]> list2 = session.createSQLQuery(sql).list();
			for (Object[] object2 : list2) {
				resultjson = resultjson + "{goodsid:" + object2[0] + ","
						+ "name:'" + object2[1] + "'," + "spec:'" + object2[2]
						+ "'," + "qty:" + object2[3] + "," + "price:"
						+ object2[4] + "," + "amt:" + object2[5] + ","
						+ "payamt:" + object2[6] + "," + "usepoint:"
						+ object2[7] + "," + "getpoint:" + object2[8] + ","
						+ "ticketname:'" + object[9] + "'," + "useticket:"
						+ object[10] + "," + "beauticianname:'" + object[11]
						+ "',";
				if (!((String) object2[12]).equals(""))
					resultjson = resultjson
							+ "picfile:'"
							+ ApplicationConfig.getFilePath(301,
									ImageUtil.PIC_TEMPORARY
											+ (String) object2[12]) + "'},";
				else
					resultjson = resultjson + "picfile:''},";

			}
			if (!list2.isEmpty())
				resultjson = resultjson.substring(0, resultjson.length() - 1);

			resultjson = resultjson + "]},";
		}
		if (!list.isEmpty())
			resultjson = resultjson.substring(0, resultjson.length() - 1);
		resultjson = resultjson + "]";

		return ReturnMessage("获取数据成功", resultjson);
	}

	private String SOrderPay(Session session, JSONObject data) {
		String sql = "update sorder set ispay = 1, paytime = ? , PayNo = ? , PayAccountType = ? where ispay = 0 and OrderNo = ?";
		Query query = session.createSQLQuery(sql);
		query.setString(0, GetNow());
		query.setString(1, data.getString("payno"));
		query.setInteger(2, data.getInt("paytype"));
		query.setString(3, data.getString("orderno"));
		query.executeUpdate();

		// 回写会员最后一次支付的账号名先注释，由于微信支付无法获取账号名
		/*
		 * int memberid = 0; sql =
		 * "select LMemberID, 1 from sorder where OrderNo = '" +
		 * data.getString("orderno") + "'"; List<Object[]> list =
		 * session.createSQLQuery(sql).list(); for (Object[] object : list) {
		 * memberid = (Integer) object[0]; }
		 * 
		 * sql = "update lmember set "; if (data.getInt("paytype") == 0) sql =
		 * sql + "ZFBAccount"; else if (data.getInt("paytype") == 1) sql = sql +
		 * "WXAccount"; sql = sql + " = '" + data.getString("account") +
		 * "' where ID = " + Integer.toString(memberid); query =
		 * session.createSQLQuery(sql); query.executeUpdate();
		 */

		return ReturnMessage("提交成功");
	}

	/*
	 * private String SOrderPay(Session session, JSONObject data){ String sql =
	 * "update sorder set ispay = 1, paytime = ? , PayNo = ? where ID = ?";
	 * Query query = session.createSQLQuery(sql); query.setString(0, GetNow());
	 * query.setInteger(1, data.getInt("orderid")); query.setString(2,
	 * data.getString("payno")); query.executeUpdate();
	 * 
	 * sql = "update lmember set "; if (data.getInt("paytype") == 0) sql = sql +
	 * "ZFBAccount"; else if (data.getInt("paytype") == 1) sql = sql +
	 * "WXAccount"; sql = sql + " = '" + data.getString("account") +
	 * "' where ID = " + data.getInt("memberid"); query =
	 * session.createSQLQuery(sql); query.executeUpdate();
	 * 
	 * return ReturnMessage("提交成功"); }
	 */

	private String SOrderClose(Session session, JSONObject data) {
		String sql = "update sorder set closed = 1, closetime = ? where ID = ?";
		Query query = session.createSQLQuery(sql);
		query.setString(0, GetNow());
		query.setInteger(1, data.getInt("orderid"));
		query.executeUpdate();

		// 维护占用库存
		sql = "update lgoods set OccupyQty = OccupyQty + (select sum(Qty) from SOrderGoods where SOrderID = ?) "
				+ "where ID = (select LGoodsID from SOrderGoods where SOrderID = ? limit 1, 1)";
		query = session.createSQLQuery(sql);
		query.setInteger(0, data.getInt("orderid"));
		query.setInteger(1, data.getInt("orderid"));
		query.executeUpdate();

		return ReturnMessage("提交成功");
	}

	private String SOrderReceive(Session session, JSONObject data) {
		String sql = "update sorder set IsReceive = 1, ReceiveTime = ? where ID = ?";
		Query query = session.createSQLQuery(sql);
		query.setString(0, GetNow());
		query.setInteger(1, data.getInt("orderid"));
		query.executeUpdate();

		// 维护积分
		sql = "select GetPoint, UsePoint, LMemberID from sorder where ID = ?";
		query = session.createSQLQuery(sql);
		query.setInteger(0, data.getInt("orderid"));
		List<Object[]> list = query.list();
		int getpoint = 0;
		int usepoint = 0;
		int memberid = 0;
		if (!list.isEmpty())
			for (Object[] object : list) {
				getpoint = (Integer) object[0];
				usepoint = (Integer) object[0];
				memberid = (Integer) object[2];
			}

		sql = "update lmember set Point = Point + "
				+ Integer.toString(getpoint) + " - "
				+ Integer.toString(getpoint) + " where ID = ?";
		query = session.createSQLQuery(sql);
		query.setInteger(0, memberid);
		query.executeUpdate();

		return ReturnMessage("提交成功");
	}

	private String GetGoodsList(Session session, JSONObject data) {
		String resultjson = "data:{";

		// 商品
		resultjson = resultjson + "goodsgroup:[";
		String sql = "select m.ID, m.Name, m.SalePoint, m.Price, m.DiscPrice,m.CarriagePrice,"
				+ "(select sum(sd.Qty) from sordergoods sd inner join sorder sm on sd.ID = sm.ID where sd.LGoodsID = m.ID) SaleQty, "
				+ "case when m.Qty > m.OccupyQty then m.Qty - m.OccupyQty else 0 end Qty,"
				+ "case when ISNULL(p.PicFileName) then '' else p.PicFileName end PicFileName, "
				+ "m.FavoriteCount "
				+ "from lgoods m "
				+ "left join ltype t on t.ID = m.LTypeID "
				+ "left join lgoodspicture vp on vp.lgoodsid = m.ID and vp.orderno = 1 "
				+ "left join lpicture p on p.ID = vp.LPictureID "
				+ "left join lvendor v on v.ID = m.LVendorID "
				+ "where m.GoodsKind = 0 and m.ForVendor = "
				+ Integer.toString(data.getInt("forvendor"))
				+ " and (m.LVendorID is null or v.VendorType = 1) ";
		if (data.getInt("typeid") != 0)
			sql = sql + " and (t.ID = "
					+ Integer.toString(data.getInt("typeid"))
					+ " or t.ParentID = "
					+ Integer.toString(data.getInt("typeid")) + ") ";
		sql = sql + "order by m.OrderNo";
		List<Object[]> list2 = session.createSQLQuery(sql).list();
		int iIndex = 0;
		for (Object[] object2 : list2) {
			resultjson = resultjson + "{" + "goodsid:" + object2[0] + ","
					+ "name:'" + object2[1] + "'," + "salepoint:'" + object2[2]
					+ "'," + "price:" + object2[3] + "," + "discprice:"
					+ object2[4] + "," + "carriageprice:" + object2[5] + ","
					+ "saleqty:" + object2[6] + "," + "qty:" + object2[7] + ",";
			if (!((String) object2[8]).equals(""))
				resultjson = resultjson
						+ "picfile:'"
						+ ApplicationConfig.getFilePath(301,
								ImageUtil.PIC_TEMPORARY + (String) object2[8])
						+ "',";
			else
				resultjson = resultjson + "picfile:'',";

			resultjson = resultjson + "favoritecount:" + object2[9] + "},";
			iIndex++;
		}
		if (iIndex > 0)
			resultjson = resultjson.substring(0, resultjson.length() - 1);
		resultjson = resultjson + "],";

		// 护理
		resultjson = resultjson + "servicegroup:[";
		sql = "select m.ID, m.Name, m.SalePoint, m.Price, m.DiscPrice, m.ServiceMinute,"
				+ "case when ISNULL(p.PicFileName) then '' else p.PicFileName end PicFileName "
				+ "from lgoods m "
				+ "left join ltype t on t.ID = m.LTypeID "
				+ "left join lgoodspicture vp on vp.lgoodsid = m.ID and vp.orderno = 1 "
				+ "left join lpicture p on p.ID = vp.LPictureID "
				+ "where m.GoodsKind = 1 and m.ForVendor = "
				+ Integer.toString(data.getInt("forvendor"))
				+ " and m.LVendorID is null ";
		if (data.getInt("typeid") != 0)
			sql = sql + " and (t.ID = "
					+ Integer.toString(data.getInt("typeid"))
					+ " or t.ParentID = "
					+ Integer.toString(data.getInt("typeid")) + ") ";
		sql = sql + "order by m.OrderNo";
		list2 = session.createSQLQuery(sql).list();
		iIndex = 0;
		for (Object[] object2 : list2) {
			resultjson = resultjson + "{" + "goodsid:" + object2[0] + ","
					+ "name:'" + object2[1] + "'," + "salepoint:'" + object2[2]
					+ "'," + "price:" + object2[3] + "," + "discprice:"
					+ object2[4] + "," + "serviceminute:" + object2[5] + ",";
			if (!((String) object2[6]).equals(""))
				resultjson = resultjson
						+ "picfile:'"
						+ ApplicationConfig.getFilePath(301,
								ImageUtil.PIC_TEMPORARY + (String) object2[6])
						+ "'},";
			else
				resultjson = resultjson + "picfile:''},";
			iIndex++;
		}
		if (iIndex > 0)
			resultjson = resultjson.substring(0, resultjson.length() - 1);

		resultjson = resultjson + "]}";

		return ReturnMessage("获取数据成功", resultjson);
	}

	private String GetArticleList(Session session, JSONObject data) {
		String sql = "select m.ID, m.Name, m.PraiseCount, m.ReadCount, m.ShareCount,"
				+ "case when ISNULL(p.PicFileName) then '' else p.PicFileName end PicFileName, "
				+ "m.FavoriteCount "
				+ "from larticle m left join lpicture p on p.ID = m.LPictureID "
				+ "left join ltype t on t.ID = m.LTypeID "
				+ "where (m.LVendorID is null or m.AuditState = 1) ";
		if (data.getInt("typeid") != 0)
			sql = sql + " and (t.ID = "
					+ Integer.toString(data.getInt("typeid"))
					+ " or t.ParentID = "
					+ Integer.toString(data.getInt("typeid")) + ") ";
		sql = sql + "order by m.IsTop desc, m.OrderNo";
		Query query = session.createSQLQuery(sql);
		List<Object[]> list = query.list();
		String resultjson = "data:[";
		int iIndex = 0;
		for (Object[] object : list) {
			resultjson = resultjson + "{articleid:" + object[0] + ","
					+ "name:'" + object[1] + "'," + "praisecount:" + object[2]
					+ "," + "readcount:" + object[3] + "," + "sharecount:"
					+ object[4] + ",";
			if (!((String) object[5]).equals(""))
				resultjson = resultjson
						+ "picfile:'"
						+ ApplicationConfig
								.getFilePath(501, (String) object[5]) + "',";
			else
				resultjson = resultjson + "picfile:'',";
			resultjson = resultjson + "favoritecount:" + object[6] + "},";
		}
		if (!list.isEmpty())
			resultjson = resultjson.substring(0, resultjson.length() - 1);
		resultjson = resultjson + "]";
		return ReturnMessage("获取数据成功", resultjson);
	}

	private String GetTypeList(Session session, JSONObject data) {
		String sql = "select m.ID, m.Name, (select Name from ltype where ID = m.ParentID) ParentName,"
				+ "CONCAT(LPAD(case when ISNULL(m.ParentID) then OrderNo else (select OrderNo from ltype where ID = m.ParentID) end, 4, '0'),"
				+ "case when ISNULL(m.ParentID) then '' else LPAD(m.OrderNo, 4, '0') end) LCode "
				+ "from ltype m " + "where m.TypeKind = ? " + "order by LCode";
		Query query = session.createSQLQuery(sql);
		query.setInteger(0, data.getInt("typekind"));
		List<Object[]> list = query.list();
		String resultjson = "data:[";
		for (Object[] object : list) {
			resultjson = resultjson + "{typeid:" + object[0] + "," + "name:'"
					+ object[1] + "'," + "parentname:'" + object[2] + "'},";
		}
		if (!list.isEmpty())
			resultjson = resultjson.substring(0, resultjson.length() - 1);
		resultjson = resultjson + "]";
		return ReturnMessage("获取数据成功", resultjson);
	}

	private String GetTicketList(Session session, JSONObject data) {
		String sql = "select m.ID, m.Name, m.Amt, m.TicketKind, m.GoodsTypeID, m.LGoodsID, (select Name from ltype where ID = m.GoodsTypeID) TypeName, (select Name from lgoods where ID = m.LGoodsID) GoodsName,"
				+ "m.StartTime, m.EndTime, m.PrivodeCount, m.GetCount, "
				+ "case when ISNULL(p.PicFileName) then '' else p.PicFileName end PicFileName "
				+ "from lticketprovider m left join lpicture p on p.ID = m.LPictureID "
				+ "where m.SendKind = 0 and m.PrivodeCount > m.GetCount and m.IsPublish = 1 and m.StartTime <= ? and m.EndTime >= ? "
				+ "and m.Amt <= 10 " + "order by m.StartTime desc";
		Query query = session.createSQLQuery(sql);
		query.setString(0, GetNow());
		query.setString(1, GetNow());
		List<Object[]> list = query.list();
		String resultjson = "data:{smallpicgroup:[";
		for (Object[] object : list) {
			resultjson = resultjson + "{ticketid:" + object[0] + "," + "name:'"
					+ object[1] + "'," + "amt:" + object[2] + ","
					+ "ticketkind:" + object[3] + "," + "goodstypeid:"
					+ object[4] + "," + "goodsid:" + object[5] + ","
					+ "goodstypename:'" + object[6] + "'," + "goodsname:'"
					+ object[7] + "'," + "starttime:'" + object[8] + "',"
					+ "endtime:'" + object[9] + "'," + "providecount:"
					+ object[10] + "," + "getcount:" + object[11] + ",";

			if (!((String) object[12]).equals(""))
				resultjson = resultjson
						+ "picfile:'"
						+ ApplicationConfig.getFilePath(701,
								(String) object[12]) + "'}";
			else
				resultjson = resultjson + "picfile:''}";
			resultjson = resultjson + ",";
		}
		if (!list.isEmpty())
			resultjson = resultjson.substring(0, resultjson.length() - 1);

		resultjson = resultjson + "], bigpicgroup:[";

		sql = "select m.ID, m.Name, m.Amt, m.TicketKind, m.GoodsTypeID, m.LGoodsID, (select Name from ltype where ID = m.GoodsTypeID) TypeName, (select Name from lgoods where ID = m.LGoodsID) GoodsName,"
				+ "m.StartTime, m.EndTime, m.PrivodeCount, m.GetCount, "
				+ "case when ISNULL(p.PicFileName) then '' else p.PicFileName end PicFileName "
				+ "from lticketprovider m left join lpicture p on p.ID = m.LPictureID "
				+ "where m.SendKind = 0 and m.PrivodeCount > m.GetCount and m.IsPublish = 1 and m.StartTime <= ? and m.EndTime >= ? "
				+ "and m.Amt > 10 " + "order by m.StartTime desc";
		query = session.createSQLQuery(sql);
		query.setString(0, GetNow());
		query.setString(1, GetNow());
		list = query.list();
		for (Object[] object : list) {
			resultjson = resultjson + "{ticketid:" + object[0] + "," + "name:'"
					+ object[1] + "'," + "amt:" + object[2] + ","
					+ "ticketkind:" + object[3] + "," + "goodstypeid:"
					+ object[4] + "," + "goodsid:" + object[5] + ","
					+ "goodstypename:'" + object[6] + "'," + "goodsname:'"
					+ object[7] + "'," + "starttime:'" + object[8] + "',"
					+ "endtime:'" + object[9] + "'," + "providecount:"
					+ object[10] + "," + "getcount:" + object[11] + ",";

			if (!((String) object[12]).equals(""))
				resultjson = resultjson
						+ "picfile:'"
						+ ApplicationConfig.getFilePath(701,
								(String) object[12]) + "'}";
			else
				resultjson = resultjson + "picfile:''}";
			resultjson = resultjson + ",";
		}
		if (!list.isEmpty())
			resultjson = resultjson.substring(0, resultjson.length() - 1);

		resultjson = resultjson + "]}";
		return ReturnMessage("获取数据成功", resultjson);
	}

	private String CreateMemberTicket(Session session, JSONObject data) {
		String sql = "select m.LimitCount, cast((select count(ID) from lmemberticket where LTicketPrivoderID = m.ID and LMemberID = ?) as char(32)) GetCount, m.Amt, m.TicketStartTime, m.TicketEndTime "
				+ "from lticketprovider m "
				+ "where m.SendKind = 0 and m.PrivodeCount > m.GetCount and m.IsPublish = 1 and m.StartTime <= ? and m.EndTime >= ? and m.ID = ?";
		Date starttime = null;
		Date endtime = null;
		double amt = 0;
		Query query = session.createSQLQuery(sql);
		query.setInteger(0, data.getInt("memberid"));
		query.setString(1, GetNow());
		query.setString(2, GetNow());
		query.setInteger(3, data.getInt("ticketid"));
		List<Object[]> list = query.list();
		for (Object[] object : list) {
			amt = (Double) object[2];
			starttime = (Date) object[3];
			endtime = (Date) object[4];
			BigInteger limitcount = new BigInteger(
					Integer.toString((Integer) object[0]));
			BigInteger getcount = new BigInteger((String) object[1]);
			if (getcount.intValue() >= limitcount.intValue())
				return RaiseErrorMessage("每人限领"
						+ Integer.toString((Integer) object[0]) + "张");
		}

		if (!list.isEmpty()) {
			sql = "insert into lmemberticket(LTicketPrivoderID, GetTime, GrantTime, LMemberID) values (?, ?, ?, ?)";
			query = session.createSQLQuery(sql);
			query.setInteger(0, data.getInt("ticketid"));
			query.setString(1, GetNow());
			query.setString(2, GetNow());
			query.setInteger(3, data.getInt("memberid"));
			query.executeUpdate();

			sql = "update lticketprovider set GetCount = GetCount + 1 where ID = ?";
			query = session.createSQLQuery(sql);
			query.setInteger(0, data.getInt("ticketid"));
			query.executeUpdate();

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			return ReturnMessage("提交成功", "data:{amt:" + Double.toString(amt)
					+ ", starttime:'" + sdf.format(starttime) + "', endtime:'"
					+ sdf.format(endtime) + "'}");
		} else
			return RaiseErrorMessage("不符合领取条件");
	}

	private String GetMemberTicketList(Session session, JSONObject data) {
		String sql = "select d.ID, m.Name, m.Amt, m.TicketKind, m.GoodsTypeID, m.LGoodsID, (select Name from ltype where ID = m.GoodsTypeID) TypeName, (select Name from lgoods where ID = m.LGoodsID) GoodsName,"
				+ "m.StartTime, m.EndTime, m.PrivodeCount, m.LimitCount, "
				+ "case when ISNULL(p.PicFileName) then '' else p.PicFileName end PicFileName, "
				+ "d.GetTime, m.TicketStartTime, m.TicketEndTime, so.OrderTime, m.LimitCount "
				+ "from lmemberticket d "
				+ "left join lticketprovider m on m.ID = d.LTicketPrivoderID "
				+ "left join lpicture p on p.ID = m.LPictureID "
				+ "left join sorder so on so.ID = d.SOrderGoodsID "
				+ "where m.TicketEndTime > ? and d.LMemberID = "
				+ Integer.toString(data.getInt("memberid"));
		if (data.getInt("used") == 0)
			sql = sql + " and d.SOrderGoodsID is null ";
		else
			sql = sql + " and d.SOrderGoodsID is not null ";
		sql = sql + "order by d.GetTime";

		Query query = session.createSQLQuery(sql);
		query.setString(0, GetNow());
		List<Object[]> list = query.list();
		String resultjson = "data:{inrangegroup:[";
		for (Object[] object : list) {
			resultjson = resultjson + "{name:'" + object[1] + "'," + "amt:"
					+ object[2] + "," + "ticketkind:" + object[3] + ","
					+ "goodstypeid:" + object[4] + "," + "goodsid:" + object[5]
					+ "," + "goodstypename:'" + object[6] + "',"
					+ "goodsname:'" + object[7] + "',";
			if (!((String) object[12]).equals(""))
				resultjson = resultjson
						+ "picfile:'"
						+ ApplicationConfig.getFilePath(701,
								(String) object[12]) + "',";
			else
				resultjson = resultjson + "picfile:'',";

			resultjson = resultjson + "gettime:'" + object[13] + "',"
					+ "ticketstarttime:'" + object[14] + "',"
					+ "ticketendtime:'" + object[15] + "'," + "usetime:'"
					+ object[16] + "'," + "limitcount:" + object[17] + "},";
		}
		if (!list.isEmpty())
			resultjson = resultjson.substring(0, resultjson.length() - 1);
		resultjson = resultjson + "],";

		sql = sql.replace(">", "<");
		query = session.createSQLQuery(sql);
		query.setString(0, GetNow());
		list = query.list();
		resultjson = resultjson + "outrangegroup:[";
		for (Object[] object : list) {
			resultjson = resultjson + "{name:'" + object[1] + "'," + "amt:"
					+ object[2] + "," + "ticketkind:" + object[3] + ","
					+ "goodstypeid:" + object[4] + "," + "goodsid:" + object[5]
					+ "," + "goodstypename:'" + object[6] + "',"
					+ "goodsname:'" + object[7] + "',";
			if (!((String) object[12]).equals(""))
				resultjson = resultjson
						+ "picfile:'"
						+ ApplicationConfig.getFilePath(701,
								(String) object[12]) + "',";
			else
				resultjson = resultjson + "picfile:'',";

			resultjson = resultjson + "gettime:'" + object[13] + "',"
					+ "ticketstarttime:'" + object[14] + "',"
					+ "ticketendtime:'" + object[15] + "'," + "usetime:'"
					+ object[16] + "'," + "limitcount:" + object[17] + "},";
		}
		if (!list.isEmpty())
			resultjson = resultjson.substring(0, resultjson.length() - 1);
		resultjson = resultjson + "]}";

		return ReturnMessage("获取数据成功", resultjson);
	}

	private String Favorite(Session session, JSONObject data) {
		String sql = "select ID, 1 from lfavorite where LMemberID = ? and ObjectID = ? and ObjectType = ?";
		Query query = session.createSQLQuery(sql);
		query.setInteger(0, data.getInt("memberid"));
		query.setInteger(1, data.getInt("objectid"));
		query.setInteger(2, data.getInt("objecttype"));
		List<Object[]> list = query.list();
		if (list.isEmpty()) {
			sql = "insert into lfavorite(LMemberID, ObjectType, ObjectID, InsertTime) values (?, ?, ?, ?)";
			query = session.createSQLQuery(sql);
			query.setInteger(0, data.getInt("memberid"));
			query.setInteger(1, data.getInt("objecttype"));
			query.setInteger(2, data.getInt("objectid"));
			query.setString(3, GetNow());
			query.executeUpdate();

			sql = "update ";
			if (data.getInt("objecttype") == 301)
				sql = sql + "lgoods";
			else if (data.getInt("objecttype") == 101)
				sql = sql + "lvendor";
			else if (data.getInt("objecttype") == 501)
				sql = sql + "larticle";
			sql = sql + " set FavoriteCount = FavoriteCount + 1 where ID = "
					+ Integer.toString(data.getInt("objectid"));
			query = session.createSQLQuery(sql);
			query.executeUpdate();
		}

		return ReturnMessage("提交成功");
	}

	private String UnFavorite(Session session, JSONObject data) {
		String sql = "delete from lfavorite where LMemberID = ? and ObjectID = ? and ObjectType = ?";
		Query query = session.createSQLQuery(sql);
		query.setInteger(0, data.getInt("memberid"));
		query.setInteger(1, data.getInt("objectid"));
		query.setInteger(2, data.getInt("objecttype"));
		query.executeUpdate();

		return ReturnMessage("提交成功");
	}

	private String GetFavorite(Session session, JSONObject data) {
		String sql = "select ObjectID, InsertTime from lfavorite where LMemberID = ? and ObjectType = ? order by InsertTime desc";
		Query query = session.createSQLQuery(sql);
		query.setInteger(0, data.getInt("memberid"));
		query.setInteger(1, data.getInt("objecttype"));
		List<Object[]> list = query.list();
		String resultjson = "data:[";
		for (Object[] object : list) {
			resultjson = resultjson + "{goodsid:" + object[0] + ","
					+ "inserttime:'" + object[1] + "'},";
		}
		if (!list.isEmpty())
			resultjson = resultjson.substring(0, resultjson.length() - 1);
		resultjson = resultjson + "]";
		return ReturnMessage("获取数据成功", resultjson);
	}

	private String EvaluationGoods(Session session, JSONObject data) {
		String sql = "insert into levaluation(SOrderGoodsID, Content, Score1, Score2, Score3, Score4, EvaluationTime) values "
				+ "(?, ?, ?, ?, ?, ?, ?)";
		Query query = session.createSQLQuery(sql);
		query.setInteger(0, data.getInt("sordergoodsid"));
		query.setString(1, data.getString("content"));
		query.setInteger(2, data.getInt("score1"));
		query.setInteger(3, data.getInt("score2"));
		query.setInteger(4, data.getInt("score3"));
		query.setInteger(5, data.getInt("score4"));
		query.setString(6, GetNow());
		query.executeUpdate();

		sql = "select max(ID), 1 from levaluation";
		List<Object[]> list = session.createSQLQuery(sql).list();
		int evaluationid = 0;
		for (Object[] object : list)
			evaluationid = (Integer) object[0];

		JSONArray pictures = JSONArray.fromObject(data.getString("pictures"));
		for (int i = 0; i < pictures.size(); i++) {
			String filename = pictures.getJSONObject(i).getString("filename");
			sql = "insert into lpicture(SPicTypeID, PicFileName) values(601, '"
					+ filename + "')";
			query = session.createSQLQuery(sql);
			query.executeUpdate();

			sql = "select max(ID), 1 from lpicture";
			list = session.createSQLQuery(sql).list();
			int pictureid = 0;
			for (Object[] object : list)
				pictureid = (Integer) object[0];

			sql = "insert into levaluationpicture(LEvaluationID, LPictureID, OrderNo) values (?, ?, ?)";
			query = session.createSQLQuery(sql);
			query.setInteger(0, evaluationid);
			query.setInteger(1, pictureid);
			query.setInteger(2, i + 1);
			query.executeUpdate();
		}
		return ReturnMessage("提交成功");
	}

	private String EvaluationArticle(Session session, JSONObject data) {
		String sql = "insert into larticleevaluation(LArticleID, LMemberID, Content, EvaluationTime) values "
				+ "(?, ?, ?, ?)";
		Query query = session.createSQLQuery(sql);
		query.setInteger(0, data.getInt("articleid"));
		query.setInteger(1, data.getInt("memberid"));
		query.setString(2, data.getString("content"));
		query.setString(3, GetNow());
		query.executeUpdate();

		return ReturnMessage("提交成功");
	}

	private String AnswerEvaluationArticle(Session session, JSONObject data) {
		String sql = "insert into larticleevaluation(LArticleID, LMemberID, Content, EvaluationTime, ParentID, ParentMemberID) values "
				+ "(?, ?, ?, ?, ?, ?)";
		Query query = session.createSQLQuery(sql);
		query.setInteger(0, data.getInt("articleid"));
		query.setInteger(1, data.getInt("memberid"));
		query.setString(2, data.getString("content"));
		query.setString(3, GetNow());
		query.setInteger(4, data.getInt("parentid"));
		query.setInteger(5, data.getInt("parentmemberid"));
		query.executeUpdate();

		return ReturnMessage("提交成功");
	}

	private String GetArticleEvaluation(Session session, JSONObject data) {
		String sql = "select case when d.ParentID is null then d.ID else d.ParentID end EvaluationID, "
				+ "(select name from lmember where ID = d.LMemberID) MemberName,"
				+ "(select name from lmember where ID = d.ParentMemberID) ParentMemberName,"
				+ "d.Content, d.EvaluationTime, "
				+ "case when ISNULL(p.PicFileName) then '' else p.PicFileName end PicFileName "
				+ "from larticleevaluation d "
				+ "left join lmember mb on mb.ID = d.LMemberID "
				+ "left join lpicture p on p.ID = mb.PortraitPicID "
				+ "where d.LArticleID = "
				+ Integer.toString(data.getInt("articleid"))
				+ " "
				+ "order by d.EvaluationTime";
		Query query = session.createSQLQuery(sql);
		List<Object[]> list = query.list();
		String resultjson = "data:[";
		for (Object[] object : list) {
			resultjson = resultjson + "{evaluationid:" + object[0] + ","
					+ "membername:'" + object[1] + "'," + "parentmembername:'"
					+ object[2] + "'," + "content:'" + object[3] + "',"
					+ "evaluationtime:'" + object[4] + "'," + "picfilename:'"
					+ object[5] + "'},";
		}
		if (!list.isEmpty())
			resultjson = resultjson.substring(0, resultjson.length() - 1);
		resultjson = resultjson + "]";

		return ReturnMessage("获取数据成功", resultjson);
	}

	private String GetGoodsEvaluation(Session session, JSONObject data) {
		String sql = "select d.ID, (select name from lmember where ID = s.LMemberID) MemberName, d.Content, "
				+ "d.Score1, d.Score2, d.Score3, d.Score4, d.EvaluationTime, "
				+ "case when ISNULL(p.PicFileName) then '' else p.PicFileName end PicFileName "
				+ "from levaluation d "
				+ "left join SOrderGoods sd on sd.ID = d.SOrderGoodsID "
				+ "left join SOrder s on s.ID = sd.SOrderID "
				+ "left join lmember mb on mb.ID = s.LMemberID "
				+ "left join lpicture p on p.ID = mb.PortraitPicID "
				+ "where sd.LGoodsID = "
				+ Integer.toString(data.getInt("goodsid"))
				+ " "
				+ "order by d.EvaluationTime desc "
				+ "limit "
				+ Integer.toString(data.getInt("pagestart"))
				+ ","
				+ Integer.toString(data.getInt("pagecount"));
		Query query = session.createSQLQuery(sql);
		List<Object[]> list = query.list();
		String resultjson = "data:[";
		for (Object[] object : list) {
			double avgscore = ((Short) object[3] + (Short) object[4]
					+ (Short) object[5] + (Short) object[6]) / 4;
			resultjson = resultjson + "{membername:'" + object[1] + "',"
					+ "content:'" + object[2] + "'," + "score1:" + object[3]
					+ "," + "score2:" + object[4] + "," + "score3:" + object[5]
					+ "," + "score4:" + object[6] + "," + "avgscore:"
					+ Double.toString(avgscore) + "," + "evaluationtime:'"
					+ object[7] + "'," + "picfilename:'" + object[8] + "',"
					+ "pictures:[";
			sql = "select d.ID, "
					+ "case when ISNULL(p.PicFileName) then '' else p.PicFileName end PicFileName "
					+ "from levaluationpicture d "
					+ "left join lpicture p on p.ID = d.LPictureID "
					+ "where d.LEvaluationID = "
					+ Integer.toString((Integer) object[0]);
			Query query2 = session.createSQLQuery(sql);
			List<Object[]> list2 = query2.list();
			for (Object[] object2 : list2) {
				resultjson = resultjson + "{filename:'" + object2[1] + "'},";
			}
			if (!list2.isEmpty())
				resultjson = resultjson.substring(0, resultjson.length() - 1);
			resultjson = resultjson + "]},";
		}
		if (!list.isEmpty())
			resultjson = resultjson.substring(0, resultjson.length() - 1);

		resultjson = resultjson + "]";

		return ReturnMessage("获取数据成功", resultjson);
	}
}
