<!DOCTYPE html>
<#include init />
<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>

<html class="${root_css_class} no-js" dir="<@liferay.language key="lang.dir" />" lang="${w3c_language_id}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="meta description">
    <title>${the_title} - ${company_name}</title>
    <!--=== Favicon ===-->
    <link rel="shortcut icon" href="${images_folder}/favicon.ico" type="image/x-icon"/>

    <@liferay_util["include"] page=top_head_include />

    <!-- All Vendor & plugins CSS include -->
    <link href="${css_folder}/vendor.css" rel="stylesheet" type="text/css">
    <link href="${css_folder}/slick.css" rel="stylesheet" type="text/css">
    <link href="${css_folder}/slick-theme.css" rel="stylesheet" type="text/css">
    <!-- Main Style CSS -->
    <link href="${css_folder}/style.css" rel="stylesheet" type="text/css">
    <link href="${css_folder}/fonts.css" rel="stylesheet" type="text/css">

</head>

<body class="${css_class}">
<@liferay_ui["quick-access"] contentId="#main-content" />

<@liferay_util["include"] page=body_top_include />

<@liferay.control_menu />
<!-- Start Header Area -->
<header class="header-area">
    <!-- main header start -->
    <div class="main-header d-none d-lg-block">
        <!-- header top start -->
        <div class="header-top">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-6">
                        <div class="welcome-message">
                            <p>
                                <a href="/c/portal/login"> وارد شوید </a>یا <a href="/c/portal/login">ثبت نام کنید</a>
                            </p>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="header-top-settings">
                            <ul class="nav align-items-center">
                                <li class="account-settings">
                                    حساب کاربری
                                    <i class="fa fa-angle-down"></i>
                                    <@site_navigation_menu_0 default_preferences=freeMarkerPortletPreferences.getPreferences("portletSetupPortletDecoratorId", "barebone") />
                                </li>
                                <li class="language">
                                    <#assign VOID = freeMarkerPortletPreferences.setValue("portletSetupPortletDecoratorId", "Barebone") />
                                    <#assign theme_groupID = htmlUtil.escape(theme_display.getCompanyGroupId()?string) />
                                    <@liferay_portlet["runtime"]
                                    defaultPreferences="${freeMarkerPortletPreferences}"
                                    portletProviderAction=portletProviderAction.VIEW
                                    instanceId="lang"
                                    portletName="com_liferay_site_navigation_language_web_portlet_SiteNavigationLanguagePortlet" />
                                    ${freeMarkerPortletPreferences.reset()}
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- header top end -->

        <!-- header middle area start -->
        <div class="header-middle-area">
            <div class="container">
                <div class="row align-items-center">
                    <!-- start logo area -->
                    <div class="col-lg-3">
                        <div class="logo">
                            <a href="${site_default_url}">
                                <img src="${site_logo}" alt="${logo_description}">
                            </a>
                        </div>
                    </div>
                    <!-- start logo area -->

                    <!-- start search box area -->
                    <div class="col-lg-6">
                        <div class="search-box-wrapper">
                            <div class="search-box-inner-wrap">
                                <form class="search-box-inner">
                                    <div class="search-field-wrap">
                                        <input type="text" class="search-field" placeholder="Enter your search key">
                                    </div>
                                    <div class="search-select-box">
                                        <#--<select>-->
                                            <#--<optgroup label="organic food">-->
                                                <#--<option value="volvo">All categories</option>-->
                                                <#--<option value="saab">watch</option>-->
                                                <#--<option value="saab">air cooler</option>-->
                                                <#--<option value="saab">audio</option>-->
                                                <#--<option value="saab">speakers</option>-->
                                                <#--<option value="saab">amplifires</option>-->
                                            <#--</optgroup>-->
                                            <#--<optgroup label="Fashion">-->
                                                <#--<option value="mercedes">Womens tops</option>-->
                                                <#--<option value="audi">Jeans</option>-->
                                                <#--<option value="audi">Shirt</option>-->
                                                <#--<option value="audi">Pant</option>-->
                                                <#--<option value="audi">Watch</option>-->
                                                <#--<option value="audi">Handbag</option>-->
                                            <#--</optgroup>-->
                                        <#--</select>-->
                                    </div>
                                    <div class="search-btn">
                                        <button><i class="ion-ios-search"></i></button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- start search box end -->

                    <!-- mini cart area start -->
                    <div class="col-lg-3 ml-auto">
                        <div class="header-configure-area">
                            <ul class="nav justify-content-end">
                                <#--<li>-->
                                    <#--<a href="${site_default_url}/wishlist">-->
                                        <#--<i class="ion-android-favorite-outline"></i>-->
                                    <#--</a>-->
                                <#--</li>-->
                                <li class="mini-cart-wrap">
                                    <#--<a href="${site_default_url}/cart">-->
                                        <#--<i class="ion-bag"></i>-->
                                        <#--<span class="notification ${miniCartClassName}">${orderItemsQuantity}</span>-->
                                    <#--</a>-->
                                    <#--<ul class="cart-list">-->
                                        <#--<@commerce_cart_mini default_preferences=freeMarkerPortletPreferences.getPreferences("portletSetupPortletDecoratorId", "barebone") />-->
                                        <@liferay_commerce_ui["mini-cart"] />
                                    <#--</ul>-->
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- mini cart area end -->
                </div>
            </div>
        </div>
        <!-- header middle area end -->

        <!-- main menu area start -->
        <div class="main-menu-area theme-color-2 sticky">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-3">
                        <div class="category-toggle-wrap">
                            <div class="category-toggle">
                                <i class="ion-android-menu"></i>
                                all categories
                                <span><i class="ion-android-arrow-dropdown"></i></span>
                            </div>
                            <@commerce_category_navigation_menu default_preferences=freeMarkerPortletPreferences.getPreferences("portletSetupPortletDecoratorId", "barebone") />
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <div class="main-menu home-main">
                            <!-- main menu navbar start -->
                            <#include "${full_templates_path}/navigation.ftl" />
                            <!-- main menu navbar end -->
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="contact-top">
                            <div class="contact-top-icon">
                                <img src="${images_folder}/icon/download.png" alt="">
                            </div>
                            <div class="contact-top-info">
                                <p></p>
                                <a href="#"></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- main menu area end -->
    </div>
    <!-- main header start -->

    <!-- mobile header start -->
    <div class="mobile-header d-lg-none d-md-block sticky">
        <!--mobile header top start -->
        <div class="container">
            <div class="row align-items-center">
                <div class="col-12">
                    <div class="mobile-header-top">
                        <div class="header-top-settings">
                            <ul class="nav align-items-center justify-content-center">
                                <li class="account-settings">
                                    My account
                                    <i class="fa fa-angle-down"></i>
                                    <@site_navigation_menu_0 default_preferences=freeMarkerPortletPreferences.getPreferences("portletSetupPortletDecoratorId", "barebone") />
                                </li>
                                <li class="language">
                                    Language
                                    <i class="fa fa-angle-down"></i>
                                    <ul class="dropdown-list">
                                        <#assign VOID = freeMarkerPortletPreferences.setValue("portletSetupPortletDecoratorId", "Barebone") />
                                        <#assign theme_groupID = htmlUtil.escape(theme_display.getCompanyGroupId()?string) />
                                        <@liferay_portlet["runtime"]
                                        defaultPreferences="${freeMarkerPortletPreferences}"
                                        portletProviderAction=portletProviderAction.VIEW
                                        instanceId="lang"
                                        portletName="com_liferay_site_navigation_language_web_portlet_SiteNavigationLanguagePortlet" />
                                        ${freeMarkerPortletPreferences.reset()}
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-12">
                    <div class="mobile-main-header">
                        <div class="mobile-logo">
                            <a href="${site_default_url}">
                                <img src="${site_logo}" alt="">
                            </a>
                        </div>
                        <div class="mobile-menu-toggler">
                            <div class="mini-cart-wrap">
                                <a href="${site_default_url}/cart">
                                    <i class="ion-bag"></i>
                                    <span class="notification"></span>
                                </a>
                            </div>
                            <div class="mobile-menu-btn">
                                <div class="off-canvas-btn">
                                    <i class="ion-android-menu"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12">
                    <div class="category-toggle-wrap">
                        <div class="category-toggle">
                            <i class="ion-android-menu"></i>
                            all categories
                            <span><i class="ion-android-arrow-dropdown"></i></span>
                        </div>
                        <@commerce_category_navigation_menu default_preferences=freeMarkerPortletPreferences.getPreferences("portletSetupPortletDecoratorId", "barebone") />
                    </div>
                </div>
            </div>
        </div>
        <!-- mobile header top start -->
    </div>
    <!-- mobile header end -->
</header>
<!-- end Header Area -->

<!-- off-canvas menu start -->
<aside class="off-canvas-wrapper">
    <div class="off-canvas-overlay"></div>
    <div class="off-canvas-inner-content">
        <div class="btn-close-off-canvas">
            <i class="ion-android-close"></i>
        </div>

        <div class="off-canvas-inner">
            <!-- search box start -->
            <div class="search-box-offcanvas">
                <form>
                    <input type="text" placeholder="Search Here...">
                    <button class="search-btn"><i class="ion-ios-search-strong"></i></button>
                </form>
            </div>
            <!-- search box end -->

            <!-- mobile menu start -->
            <div class="mobile-navigation">

                <!-- mobile menu navigation start -->
                <#include "${full_templates_path}/navigation.ftl" />
                <!-- mobile menu navigation end -->
            </div>
            <!-- mobile menu end -->

            <!-- offcanvas widget area start -->
            <div class="offcanvas-widget-area">
                <div class="off-canvas-contact-widget">
                    <ul>
                        <li><!--i class="fa fa-mobile"></i-->
                            <a href="#"></a>
                        </li>
                    </ul>
                </div>
                <div class="off-canvas-social-widget">
                    <a href="#"><i class="fa fa-facebook"></i></a>
                    <a href="#"><i class="fa fa-twitter"></i></a>
                    <a href="#"><i class="fa fa-pinterest-p"></i></a>
                    <a href="#"><i class="fa fa-linkedin"></i></a>
                    <a href="#"><i class="fa fa-youtube-play"></i></a>
                </div>
            </div>
            <!-- offcanvas widget area end -->
        </div>
    </div>
</aside>
<!-- off-canvas menu end -->

<!-- main wrapper start -->
<section class="container-fluid" id="sain-commerce-theme">
    <#if selectable>
        <@liferay_util["include"] page=content_include />
    <#else>
        ${portletDisplay.recycle()}

        ${portletDisplay.setTitle(the_title)}

        <@liferay_theme["wrap-portlet"] page="portlet.ftl">
            <@liferay_util["include"] page=content_include />
        </@>
    </#if>
</section>
<!-- main wrapper end -->

<!--== Start Footer Area Wrapper ==-->
<footer class="footer-wrapper">

    <!-- newsletter area start -->
    <div class="newsletter-area theme-color-2 pt-36 pb-36">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-4 col-md-6">
                    <div class="newsletter-title">
                        <h3>خبرنامه</h3>
                        <p>برای دریافت آخرین اخبار در خبرنامه عضوشوید.</p>
                    </div>
                </div>
                <div class="col-lg-5 col-md-6">
                    <div class="newsletter-inner">
                        <form id="mc-form">
                            <input type="email" class="news-field" id="mc-email" autocomplete="off"
                                   placeholder="پست الکترونیک">
                            <button class="news-btn" id="mc-submit">عضویت</button>
                        </form>
                        <!-- mailchimp-alerts Start -->
                        <div class="mailchimp-alerts">
                            <div class="mailchimp-submitting"></div><!-- mailchimp-submitting end -->
                            <div class="mailchimp-success"></div><!-- mailchimp-success end -->
                            <div class="mailchimp-error"></div><!-- mailchimp-error end -->
                        </div>
                        <!-- mailchimp-alerts end -->
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="footer-social-link">
                        <a href="#"><i class="fa fa-facebook"></i></a>
                        <a href="#"><i class="fa fa-twitter"></i></a>
                        <a href="#"><i class="fa fa-pinterest-p"></i></a>
                        <a href="#"><i class="fa fa-linkedin"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- newsletter area end -->

    <!-- footer main widget area -->
    <div class="footer-widget-area bg-gray">
        <div class="container">
            <div class="row">
                <!-- footer widget item start -->
                <div class="col-lg-6 col-md-6">
                    <#assign VOID = freeMarkerPortletPreferences.setValue("portletSetupPortletDecoratorId", "Barebone") />
                    <#assign theme_groupID = htmlUtil.escape(theme_display.getCompanyGroupId()?string) />
                    <#assign VOID = freeMarkerPortletPreferences.setValue("articleId", '') />
                    <@liferay_portlet["runtime"]
                    defaultPreferences="${freeMarkerPortletPreferences}"
                    portletProviderAction=portletProviderAction.VIEW
                    instanceId="footerArticleAbout"
                    portletName="com_liferay_journal_content_web_portlet_JournalContentPortlet" />
                    ${freeMarkerPortletPreferences.reset()}
                </div>
                <!-- footer widget item end -->

                <!-- footer widget item start -->
                <div class="col-lg-3 col-md-3">
                    <@site_navigation_menu_1 default_preferences=freeMarkerPortletPreferences.getPreferences("portletSetupPortletDecoratorId", "barebone") />
                </div>
                <!-- footer widget item end -->

                <!-- footer widget item start -->
                <div class="col-lg-3 col-md-3">
                    <@site_navigation_menu_2 default_preferences=freeMarkerPortletPreferences.getPreferences("portletSetupPortletDecoratorId", "barebone") />
                </div>
                <!-- footer widget item end -->
            </div>
        </div>
    </div>
    <!-- footer main widget end -->

    <!-- footer middle area start -->
    <div class="footer-middle-area bg-gray">
        <div class="container">
            <div class="row">
                <div class="col-xl-9 col-lg-12 m-auto">
                    <#assign VOID = freeMarkerPortletPreferences.setValue("portletSetupPortletDecoratorId", "Barebone") />
                    <#assign theme_groupID = htmlUtil.escape(theme_display.getCompanyGroupId()?string) />
                    <#assign VOID = freeMarkerPortletPreferences.setValue("articleId", '') />
                    <@liferay_portlet["runtime"]
                    defaultPreferences="${freeMarkerPortletPreferences}"
                    portletProviderAction=portletProviderAction.VIEW
                    instanceId="footerArticleShip"
                    portletName="com_liferay_journal_content_web_portlet_JournalContentPortlet" />
                    ${freeMarkerPortletPreferences.reset()}
                </div>
                <div class="col-lg-12">
                    <#assign VOID = freeMarkerPortletPreferences.setValue("portletSetupPortletDecoratorId", "Barebone") />
                    <#assign theme_groupID = htmlUtil.escape(theme_display.getCompanyGroupId()?string) />
                    <#assign VOID = freeMarkerPortletPreferences.setValue("articleId", '') />
                    <@liferay_portlet["runtime"]
                    defaultPreferences="${freeMarkerPortletPreferences}"
                    portletProviderAction=portletProviderAction.VIEW
                    instanceId="footerArticlePay"
                    portletName="com_liferay_journal_content_web_portlet_JournalContentPortlet" />
                    ${freeMarkerPortletPreferences.reset()}
                </div>
            </div>
        </div>
    </div>
    <!-- footer middle area end -->

    <!-- footer bottom area start -->
    <div class="footer-bottom-area bg-white">
        <div class="copyright-text">
            <p>Copyright <a href="http://sain.ir">SAIN</a> All Rights Reserved</p>
        </div>
    </div>
    <!-- footer bottom area end -->

</footer>
<!--== End Footer Area Wrapper ==-->

<!-- Scroll to top start -->
<div class="scroll-top not-visible">
    <i class="fa fa-angle-up"></i>
</div>
<!-- Scroll to Top End -->

<!-- All vendor & plugins & active js include here -->
<script src="${javascript_folder}/slick.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${javascript_folder}/jquery.zoom.js" type="text/javascript" charset="utf-8"></script>
<script src="${javascript_folder}/jquery.nice-select.min.js"></script>
<script src="${javascript_folder}/jquery.countdown.min.js"></script>
<#--<script src="${javascript_folder}/bootstrap.js"></script>-->
<script src="${javascript_folder}/custom.js"></script>

<@liferay_util["include"] page=body_bottom_include />

<@liferay_util["include"] page=bottom_include />

</body>

</html>