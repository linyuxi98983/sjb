package com.jshop.dao;

import java.io.File;
import java.io.IOException;
import java.net.SocketException;

import com.jshop.common.GEnum.PicType;
import com.jshop.entity.OtSpPicture;
import com.jshop.vo.ImageListVo;

public interface OtSpPictureDao extends BaseDao<OtSpPicture, Integer> {

	public OtSpPicture saveImage(File image, String imageName, PicType picType)
			throws SocketException, IOException;

	public OtSpPicture saveImage(OtSpPicture entity, File image,
			String imageName, PicType picType) throws SocketException,
			IOException;

	public String getImagePath(String imageName);

	public String getImagePath(OtSpPicture picture);

	public String getSmallImagePath(String imageName);

	public String getSmallImagePath(OtSpPicture picture);

	public void saveImageList(ImageListVo imageListVo) throws SocketException,
			IOException;

	public void saveReCutImage() throws Exception;
}
