/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */

package com.sain.commerce.themes.sain.internal.product.renderer;

import com.liferay.commerce.frontend.template.soy.renderer.ComponentDescriptor;
import com.liferay.commerce.frontend.template.soy.renderer.SoyComponentRenderer;
import com.liferay.commerce.product.catalog.CPCatalogEntry;
import com.liferay.commerce.product.constants.CPPortletKeys;
import com.liferay.commerce.product.content.constants.CPContentWebKeys;
import com.liferay.commerce.product.content.render.list.CPContentListRenderer;
import com.liferay.commerce.product.content.util.CPCompareContentHelper;
import com.liferay.commerce.product.util.CPCompareUtil;
import com.liferay.commerce.product.util.CPDefinitionHelper;
import com.sain.commerce.themes.sain.internal.product.model.ProductCompareModel;
import com.liferay.frontend.js.loader.modules.extender.npm.NPMResolver;
import com.liferay.frontend.taglib.servlet.taglib.util.JSPRenderer;
import com.liferay.petra.string.StringPool;
import com.liferay.portal.kernel.language.LanguageUtil;
import com.liferay.portal.kernel.portlet.PortletURLFactory;
import com.liferay.portal.kernel.portlet.PortletURLFactoryUtil;
import com.liferay.portal.kernel.theme.ThemeDisplay;
import com.liferay.portal.kernel.util.Portal;
import com.liferay.portal.kernel.util.ResourceBundleUtil;
import com.liferay.portal.kernel.util.Validator;
import com.liferay.portal.kernel.util.WebKeys;
import org.osgi.service.component.annotations.Component;
import org.osgi.service.component.annotations.Reference;

import javax.portlet.ActionRequest;
import javax.portlet.PortletRequest;
import javax.portlet.PortletURL;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

/**
 * @author Alessio Antonio Rendina
 */
@Component(
	immediate = true,
	property = {
		"commerce.product.content.list.renderer.key=" + SainCPCompareListRenderer.KEY,
		"commerce.product.content.list.renderer.order=1000",
		"commerce.product.content.list.renderer.portlet.name=" + CPPortletKeys.CP_COMPARE_CONTENT_MINI_WEB
	},
	service = CPContentListRenderer.class
)
public class SainCPCompareListRenderer implements CPContentListRenderer {

	public static final String KEY = "compare-list-sain";

	@Override
	public String getKey() {
		return KEY;
	}

	@Override
	public String getLabel(Locale locale) {
		ResourceBundle resourceBundle = ResourceBundleUtil.getBundle(
			"content.Language", locale, getClass());

		return LanguageUtil.get(resourceBundle, "sain");
	}

	@Override
	public void render(
			HttpServletRequest httpServletRequest,
			HttpServletResponse httpServletResponse)
		throws Exception {

		ThemeDisplay themeDisplay =
			(ThemeDisplay)httpServletRequest.getAttribute(
				WebKeys.THEME_DISPLAY);

		CPCompareContentHelper cpCompareContentHelper =
			(CPCompareContentHelper)httpServletRequest.getAttribute(
				CPContentWebKeys.CP_COMPARE_CONTENT_HELPER);

		int limit = cpCompareContentHelper.getProductsLimit(
			themeDisplay.getPortletDisplay());

		List<Long> cpDefinitionIds = CPCompareUtil.getCPDefinitionIds(
			httpServletRequest);

		List<ProductCompareModel> products = new ArrayList<>();

		for (Long cpDefinitionId : cpDefinitionIds) {
			CPCatalogEntry cpCatalogEntry =
				_cpDefinitionHelper.getCPCatalogEntry(
					cpDefinitionId, themeDisplay.getLocale());

			String thumbnail = cpCatalogEntry.getDefaultImageFileUrl();

			if (Validator.isNull(thumbnail)) {
				thumbnail = StringPool.BLANK;
			}

			ProductCompareModel productCompareModel = new ProductCompareModel(
				cpCatalogEntry.getCPDefinitionId(), thumbnail, "visible");

			products.add(productCompareModel);
		}

		if (products.size() > limit) {
			products = products.subList(0, limit);
		}

		PortletURL editCompareProductActionURL = PortletURLFactoryUtil.create(
			httpServletRequest, CPPortletKeys.CP_COMPARE_CONTENT_WEB,
			PortletRequest.ACTION_PHASE);

		editCompareProductActionURL.setParameter(
			ActionRequest.ACTION_NAME, "editCompareProduct");

		String moduleName = _npmResolver.resolveModuleName(
			"commerce-theme-sain-impl/products_compare/SainProductsCompare.es");

		ComponentDescriptor testDescriptor = new ComponentDescriptor(
			"ProductsCompare.render", moduleName, null, null);

		Map<String, Object> context = new HashMap<>();

		context.put("limit", limit);

		context.put(
			"editCompareProductActionURL",
			editCompareProductActionURL.toString());

		context.put(
			"compareProductsURL",
			cpCompareContentHelper.getCompareProductsURL(themeDisplay));

		context.put(
			"portletNamespace",
			_portal.getPortletNamespace(CPPortletKeys.CP_COMPARE_CONTENT_WEB));

		context.put(
			"spritemap",
			themeDisplay.getPathThemeImages() + "/commerce-icons.svg");

		context.put("products", products);

		_soyComponentRenderer.renderSoyComponent(
			httpServletRequest, httpServletResponse, testDescriptor, context);
	}

	@Reference
	private CPDefinitionHelper _cpDefinitionHelper;

	@Reference
	private JSPRenderer _jspRenderer;

	@Reference
	private NPMResolver _npmResolver;

	@Reference
	private Portal _portal;

	@Reference
	private PortletURLFactory _portletURLFactory;

	@Reference(
		target = "(osgi.web.symbolicname=com.sain.commerce.theme.sain.impl)"
	)
	private ServletContext _servletContext;

	@Reference
	private SoyComponentRenderer _soyComponentRenderer;

}