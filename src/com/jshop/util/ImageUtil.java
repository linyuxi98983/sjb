package com.jshop.util;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import com.jshop.common.ApplicationConfig;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

public class ImageUtil {

	public final static String PIC_TEMPORARY = "small_";
	private Image srcImage = null;
	private File srcFile = null;
	private File destFile = null;
	private String fileSuffix = null;

	private int imageWidth = 0;
	private int imageHeight = 0;

	public ImageUtil(String fileName) throws IOException {
		this(new File(fileName));
	}

	public ImageUtil(File fileName) throws IOException {
		File _file = fileName;
		_file.setReadOnly();
		this.srcFile = _file;
		this.fileSuffix = _file.getName().substring(
				(_file.getName().indexOf(".") + 1), (_file.getName().length()));
		this.destFile = new File(this.srcFile.getPath().substring(0,
				(this.srcFile.getPath().lastIndexOf(".")))
				+ PIC_TEMPORARY + "." + this.fileSuffix);
		srcImage = javax.imageio.ImageIO.read(_file);
		// 得到图片的原始大小， 以便按比例压缩。
		imageWidth = srcImage.getWidth(null);
		imageHeight = srcImage.getHeight(null);
		System.out.println("width: " + imageWidth);
		System.out.println("height: " + imageHeight);
	}

	/**
	 * 强制压缩/放大图片到固定的大小
	 * 
	 * @param w
	 *            int 新宽度
	 * @param h
	 *            int 新高度
	 * @throws IOException
	 */
	public File resize(int w, int h) throws IOException {
		// 得到合适的压缩大小，按比例。
		if (imageWidth >= imageHeight) {
			h = (int) Math.round((imageHeight * w * 1.0 / imageWidth));
		} else {
			w = (int) Math.round((imageWidth * h * 1.0 / imageHeight));
		}

		if (w >= imageWidth) {
			FileUtil.copyFile(this.srcFile.getPath(), this.destFile.getPath());
			return this.destFile;
		}

		// 构建图片对象
		BufferedImage _image = new BufferedImage(w, h,
				BufferedImage.TYPE_INT_RGB);
		// 绘制缩小后的图
		_image.getGraphics().drawImage(srcImage, 0, 0, w, h, null);
		// 输出到文件流
		FileOutputStream out = new FileOutputStream(destFile);
		JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
		encoder.encode(_image);
		out.flush();
		out.close();
		return destFile;
	}

	/**
	 * @param rat
	 *            图片缩放比例
	 * @return
	 * @throws IOException
	 */
	public File resize(double rat) throws IOException {
		return resize(new Double(imageWidth * rat).intValue(), new Double(
				imageHeight * rat).intValue());
	}

	public File resize() throws IOException {
		Double ratio = ApplicationConfig.getInstance().getImageratio();
		if (ratio != null) {
			return resize(new Double(imageWidth * ratio).intValue(),
					new Double(imageHeight * ratio).intValue());
		}
		Integer width = ApplicationConfig.getInstance().getImagewidth();
		Integer height = new Long(Math.round(width.doubleValue() / imageWidth
				* imageHeight)).intValue(); // ApplicationConfig.getInstance().getImageheight();
		return resize(height, width);
	}

	public String getSmallPicName(String bigPicName) {
		return PIC_TEMPORARY
				+ bigPicName.substring(0, bigPicName.lastIndexOf("."))
				+ bigPicName.substring(bigPicName.lastIndexOf("."),
						bigPicName.length());
	}

	public static void main(String[] args) {
		try {
			// File imageFile = new ImageUtil(new
			// File("C:/Users/Administrator/Desktop/men-3.jpeg")).resize(60,
			// 75);
			// new FtpUtil().uploadFtpFile(imageFile, "1/", null, true);

			String smallPicName = new ImageUtil(new File(
					"C:/Users/Administrator/Desktop/men-3.jpeg"))
					.getSmallPicName("123.jpg");
			System.out.println(smallPicName);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
