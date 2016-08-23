package com.jshop.util;

import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.jbarcode.JBarcode;
import org.jbarcode.encode.EAN8Encoder;
import org.jbarcode.paint.EAN8TextPainter;
import org.jbarcode.paint.WidthCodedPainter;
import org.jbarcode.util.ImageUtil;

public class OneBarcodeUtil {

	public static void main(String[] paramArrayOfString) {
		try {
			JBarcode localJBarcode = new JBarcode(EAN8Encoder.getInstance(),
					WidthCodedPainter.getInstance(),
					EAN8TextPainter.getInstance());
			String str = "2219644";
			BufferedImage localBufferedImage = localJBarcode.createBarcode(str);

			saveToJPEG(localBufferedImage, "EAN8.jpg");
		} catch (Exception localException) {
			localException.printStackTrace();
		}
	}

	static void saveToJPEG(BufferedImage paramBufferedImage, String paramString) {
		saveToFile(paramBufferedImage, paramString, "jpeg");
	}

	static void saveToFile(BufferedImage paramBufferedImage,
			String paramString1, String paramString2) {
		try {
			FileOutputStream localFileOutputStream = new FileOutputStream(
					"C:\\Users\\Administrator\\Desktop/" + paramString1);
			ImageUtil.encodeAndWrite(paramBufferedImage, paramString2,
					localFileOutputStream, 96, 96);
			localFileOutputStream.close();
		} catch (Exception localException) {
			localException.printStackTrace();
		}
	}

	/**
	 * 等比例放大图象
	 * 
	 * @param imgUrl
	 *            图像路径
	 * @param resultImgUrl
	 *            放大后的存放路径
	 * @param scale
	 *            放大倍数
	 * @throws IOException
	 */
	static void scale(String imgUrl, String resultImgUrl, int scale)
			throws IOException {
		BufferedImage src = ImageIO.read(new File(imgUrl));
		int width = src.getWidth();
		int height = src.getHeight();

		width = width * scale;
		height = height * scale;

		Image image = src.getScaledInstance(width, height, Image.SCALE_DEFAULT);
		BufferedImage tag = new BufferedImage(width, height,
				BufferedImage.TYPE_INT_RGB);
		Graphics g = tag.getGraphics();
		g.drawImage(image, 0, 0, null);
		g.dispose();
		ImageIO.write(tag, "JPEG", new File(resultImgUrl));
	}
}