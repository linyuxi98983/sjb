package com.jshop.common;

import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jbarcode.JBarcode;
import org.jbarcode.encode.EAN13Encoder;
import org.jbarcode.encode.InvalidAtributeException;
import org.jbarcode.paint.EAN13TextPainter;
import org.jbarcode.paint.WidthCodedPainter;
import org.springframework.stereotype.Component;

import com.octo.captcha.service.CaptchaServiceException;

@Component("jBarcodeFilter")
public class JBarcodeFilter implements Filter {

	@Override
	public void init(FilterConfig fConfig) throws ServletException {
	}

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest servletRequest,
			ServletResponse servletResponse, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		response.setHeader("Cache-Control", "no-store");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("image/jpeg");
		ServletOutputStream out = response.getOutputStream();
		String barcode = request.getParameter("barcode");
		System.out.println("barcode=" + barcode.length());
		try {
			JBarcode localJBarcode = new JBarcode(EAN13Encoder.getInstance(),
					WidthCodedPainter.getInstance(),
					EAN13TextPainter.getInstance());
			BufferedImage challenge = localJBarcode.createBarcode(barcode);
			ImageIO.write(challenge, "jpg", out);
			out.flush();
		} catch (CaptchaServiceException e) {
			e.printStackTrace();
		} catch (InvalidAtributeException e) {
			e.printStackTrace();
		} finally {
			out.close();
		}
	}

}
