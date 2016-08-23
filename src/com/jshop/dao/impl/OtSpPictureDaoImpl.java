package com.jshop.dao.impl;

import java.io.File;
import java.io.IOException;
import java.net.SocketException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.jshop.common.ApplicationConfig;
import com.jshop.common.GEnum.PicType;
import com.jshop.dao.OtSpPictureDao;
import com.jshop.entity.OtSpPicture;
import com.jshop.util.FileUtil;
import com.jshop.util.FtpUtil;
import com.jshop.util.ImageUtil;
import com.jshop.vo.ImageListVo;

@Repository
public class OtSpPictureDaoImpl extends BaseDaoImpl<OtSpPicture, Integer>
		implements OtSpPictureDao {

	/**
	 * 获取缩略图名称
	 * 
	 * @return
	 */
	private String getSmallPictureName(String imageName) {
		return ImageUtil.PIC_TEMPORARY + imageName;
	}

	/**
	 * 上传图片并且生成缩略图
	 * 
	 * @param image
	 * @param imageName
	 * @param picType
	 * @return
	 * @throws SocketException
	 * @throws IOException
	 */
	/*
	 * public OtSpPicture saveImageAndCut(File image,String imageName,PicType
	 * picType) throws SocketException, IOException{ ImageUtil imageUtil = new
	 * ImageUtil(image); OtSpPicture picture = saveImage(image, imageName,
	 * picType);
	 * 
	 * String smallFileName = getSmallPictureName(picture.getPicFileName());
	 * File smallImage = imageUtil.resize();
	 * FtpUtil.getInstance().uploadFtpFile(
	 * picType,smallImage,smallFileName,false);// 缩略图
	 * 
	 * return picture; }
	 */

	/**
	 * 保存并上传图片
	 */
	@Override
	public OtSpPicture saveImage(File image, String imageName, PicType picType)
			throws SocketException, IOException {
		return saveImage(null, image, imageName, picType);
	}

	/**
	 * 保存并上传图片和上传缩略图
	 */
	@Override
	public OtSpPicture saveImage(OtSpPicture entity, File image,
			String imageName, PicType picType) throws SocketException,
			IOException {
		// 大图
		String filename = FtpUtil.getInstance().uploadFtpFile(picType, image,
				imageName);

		// 缩略图
		ImageUtil imageUtil = new ImageUtil(image);
		String smallFileName = getSmallPictureName(filename);
		File smallImage = imageUtil.resize();
		FtpUtil.getInstance().uploadFtpFile(picType, smallImage, smallFileName,
				false);

		// 图片实体
		if (entity == null) {
			entity = new OtSpPicture();
		}
		entity.setPicFileName(filename);
		entity.setUploadTime(new Timestamp(new Date().getTime()));
		if (entity.getId() == null) {
			save(entity);
		} else {
			update(entity);
		}
		return entity;
	}

	/**
	 * 获取图片路径，如:http://xxx/ss.jpg
	 */
	@Override
	public String getImagePath(String imageName) {
		return ApplicationConfig.getFilePath(imageName);
	}

	/**
	 * 获取图片路径，如:http://xxx/ss.jpg
	 */
	@Override
	public String getImagePath(OtSpPicture picture) {
		return getImagePath(picture.getPicFileName());
	}

	/**
	 * 获取缩略图片路径，如:http://xxx/small_ss.jpg
	 */
	@Override
	public String getSmallImagePath(String imageName) {
		return ApplicationConfig.getFilePath(getSmallPictureName(imageName));
	}

	/**
	 * 获取缩略图片路径，如:http://xxx/small_ss.jpg
	 */
	@Override
	public String getSmallImagePath(OtSpPicture picture) {
		return getImagePath(getSmallPictureName(picture.getPicFileName()));
	}

	/**
	 * 保存图片列表，用于保存如商品图片
	 * 
	 * @param imageListVo
	 * @throws IOException
	 * @throws SocketException
	 */
	@Override
	public void saveImageList(ImageListVo imageListVo) throws SocketException,
			IOException {
		Integer id = imageListVo.getId();
		String orderNos = imageListVo.getOrderNos();
		File[] imageFiles = imageListVo.getImageFiles();
		String[] imageFilesFileName = imageListVo.getImageFilesFileName();
		String idFiled = imageListVo.getIdField();
		String imgTableName = imageListVo.getImgTableName();
		String deleteImageIds = imageListVo.getDeleteImageIds();
		PicType picType = imageListVo.getPicType();
		String pk = imageListVo.getPk();

		Integer orderCount = 0;
		if (orderNos != null && StringUtils.isNotEmpty(orderNos.trim())) {
			String[] orderArr = orderNos.split(",");
			orderCount = orderArr.length;
			for (String o : orderArr) {
				if (StringUtils.isNotEmpty(o.trim())) {
					Integer picId = Integer.parseInt(o.split("_")[0]);
					Integer orderNo = Integer.parseInt(o.split("_")[1]);
					getSession()
							.createSQLQuery(
									"update " + imgTableName
											+ " set orderNo = ? where ID = ?")
							.setParameter(0, orderNo).setParameter(1, picId)
							.executeUpdate();
				}
			}
		}

		if (imageFiles != null && imageFilesFileName != null) {
			FtpUtil ftpUtil = new FtpUtil();
			for (int i = 0; i < imageFiles.length; i++) {
				orderCount++;

				OtSpPicture picture = saveImage(imageFiles[i],
						imageFilesFileName[i], picType);

				getSession()
						.createSQLQuery(
								"INSERT INTO "
										+ imgTableName
										+ "("
										+ idFiled
										+ ",Ot_SpPictureID,OrderNo) VALUES (?, ?, ?)")
						.setParameter(0, id).setParameter(1, picture.getId())
						.setParameter(2, orderCount).executeUpdate();
			}
		}

		if (deleteImageIds != null
				&& StringUtils.isNotEmpty(deleteImageIds.trim())) {
			getSession().createSQLQuery(
					"delete from Ot_SpPicture where ID in(select id from "
							+ imgTableName + " where id in(" + deleteImageIds
							+ "))");
			getSession().createSQLQuery(
					"delete from " + imgTableName + " where id in("
							+ deleteImageIds + ")").executeUpdate();
		}
	}

	/**
	 * 重新切割图片 1、文件生成到small，
	 * 
	 * @throws Exception
	 */
	@Override
	public void saveReCutImage() throws Exception {
		String path_temp = "C:\\temp\\";
		String path_download = path_temp + "download\\";
		FileUtil.createIfNotExists(path_temp);
		FileUtil.createIfNotExists(path_download);

		FtpUtil ftpUtil = new FtpUtil();
		List<OtSpPicture> list = getSession()
				.createSQLQuery(
						" select * from  (select  m.*, row_number() over(  order by id desc) as rownumber from Ot_SpPicture m) m where  rownumber between 200 and 300 ")
				.addEntity(OtSpPicture.class).list();

		for (OtSpPicture otSpPicture : list) {
			String ftpFileName = otSpPicture.getPicFileName();
			File localFile = new File(path_download + ftpFileName);
			if (ftpUtil.downFtpFile(ftpFileName, localFile)) {
				// 缩略图
				ImageUtil imageUtil = new ImageUtil(localFile);
				String smallFileName = getSmallPictureName(ftpFileName);
				File smallImage = imageUtil.resize();
				FtpUtil.getInstance().uploadFtpFile(PicType.PGOODS, smallImage,
						smallFileName, false);
			}
		}
		FileUtil.deleteFolder(new File(path_download));
	}
}
