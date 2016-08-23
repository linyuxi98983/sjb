package com.jshop.util;

import java.io.File;
import java.io.IOException;
import java.io.StringWriter;
import java.io.Writer;
import java.util.Map;

import com.jshop.common.Global;

import freemarker.cache.StringTemplateLoader;
import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;
import freemarker.template.TemplateException;

public class FreemarkerUtil {

	public static void processTemplate(String templatePath, Map<?, ?> root,
			Writer out) {
		try {
			Configuration configuration = new Configuration();
			File file = new File(Global.getRealPath());
			configuration.setDirectoryForTemplateLoading(file);
			configuration.setObjectWrapper(new DefaultObjectWrapper());
			if (!templatePath.startsWith("/")) {
				templatePath = "/" + templatePath;
			}
			Template template = configuration.getTemplate(templatePath,
					Global.ENCODING);
			template.process(root, out);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (TemplateException e) {
			e.printStackTrace();
		}
	}

	public static String processTemplateAndGetContent(String templatePath,
			Map<?, ?> root) {

		StringWriter stringWriter = new StringWriter();
		processTemplate(templatePath, root, stringWriter);
		// System.out.println(stringWriter.toString());
		return stringWriter.toString();
	}

	public static String processTemplateContent(String templateContent,
			Map<?, ?> root) {

		Configuration cfg = new Configuration();
		StringTemplateLoader stringLoader = new StringTemplateLoader();
		stringLoader.putTemplate("myTemplate", templateContent);
		cfg.setTemplateLoader(stringLoader);
		StringWriter writer = new StringWriter();
		try {
			Template template = cfg.getTemplate("myTemplate", "utf-8");

			template.process(root, writer);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (TemplateException e) {
			e.printStackTrace();
		}
		return writer.toString();
	}
}
