<#assign
	accountManagementUrl = commerceAccountHelper.getAccountManagementPortletURL(request)
	cartUrl = commerceOrderHttpHelper.getCommerceCartPortletURL(request)
	company_phone_number = getterUtil.getString(themeDisplay.getThemeSetting("company-phone-number"))
	copyright = getterUtil.getString(themeDisplay.getThemeSetting("copyright"))
	demo_mode = getterUtil.getBoolean(themeDisplay.getThemeSetting("demo-mode"))
	header_column_1 = getterUtil.getString(themeDisplay.getThemeSetting("header-column-1"))
	header_column_2 = getterUtil.getString(themeDisplay.getThemeSetting("header-column-2"))
	header_column_3 = getterUtil.getString(themeDisplay.getThemeSetting("header-column-3"))
	orderItemsQuantity = commerceOrderHttpHelper.getCommerceOrderItemsQuantity(request)
	orderNumber = ""
	show_header_search = getterUtil.getBoolean(themeDisplay.getThemeSetting("show-header-search"))
	wishListItemsCount = commerceWishListHttpHelper.getCurrentCommerceWishListItemsCount(request, themeDisplay.getResponse())
	wishlistUrl = commerceWishListHttpHelper.getCommerceWishListPortletURL(request)
/>
<#if orderItemsQuantity!=0>
	<#assign
		hasOrederitems = true
		miniCartClassName = ''
	/>
<#else>
	<#assign
	hasOrederitems = false
	miniCartClassName = 'hide'
	/>
</#if>

<#if commerceOrderHttpHelper.getCurrentCommerceOrder(request)??>
	<#assign
		currentOrder = commerceOrderHttpHelper.getCurrentCommerceOrder(request)
		orderNumber =  currentOrder.getCommerceOrderId()
	/>
</#if>

<#macro commerce_category_navigation_menu default_preferences = "">
	<@liferay_portlet["runtime"]
		defaultPreferences=default_preferences
		instanceId="cpAssetCategoriesNavigationPortlet_navigation_menu"
		portletName="com_liferay_commerce_product_asset_categories_navigation_web_internal_portlet_CPAssetCategoriesNavigationPortlet"
	/>
</#macro>

<#macro commerce_cart_mini default_preferences = "">
	<@liferay_portlet["runtime"]
		defaultPreferences=default_preferences
		instanceId="commerceCartContentMiniPortlet_0"
		portletName="com_liferay_commerce_cart_content_web_internal_portlet_CommerceCartContentMiniPortlet"
		queryString="type=0"
	/>
</#macro>

<#macro commerce_wish_list_mini default_preferences = "">
	<@liferay_portlet["runtime"]
		defaultPreferences=default_preferences
		instanceId="commerceCartContentMiniPortlet_1"
		portletName="com_liferay_commerce_cart_content_web_internal_portlet_CommerceCartContentMiniPortlet"
		queryString="type=1"
	/>
</#macro>

<#macro site_navigation_menu_0 default_preferences = "">
	<@liferay_portlet["runtime"]
		defaultPreferences=default_preferences
		instanceId="siteNavigationMenuPortlet_0"
		portletName="com_liferay_site_navigation_menu_web_portlet_SiteNavigationMenuPortlet"
	/>
</#macro>

<#macro site_navigation_menu_1 default_preferences = "">
	<@liferay_portlet["runtime"]
		defaultPreferences=default_preferences
		instanceId="siteNavigationMenuPortlet_1"
		portletName="com_liferay_site_navigation_menu_web_portlet_SiteNavigationMenuPortlet"
	/>
</#macro>

<#macro site_navigation_menu_2 default_preferences = "">
	<@liferay_portlet["runtime"]
		defaultPreferences=default_preferences
		instanceId="siteNavigationMenuPortlet_2"
		portletName="com_liferay_site_navigation_menu_web_portlet_SiteNavigationMenuPortlet"
	/>
</#macro>

<#macro site_navigation_menu_3 default_preferences = "">
	<@liferay_portlet["runtime"]
		defaultPreferences=default_preferences
		instanceId="siteNavigationMenuPortlet_3"
		portletName="com_liferay_site_navigation_menu_web_portlet_SiteNavigationMenuPortlet"
	/>
</#macro>