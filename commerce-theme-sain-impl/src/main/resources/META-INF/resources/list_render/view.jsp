<%--
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
--%>

<%@ include file="/init.jsp" %>

<%
    CPDataSourceResult cpDataSourceResult = (CPDataSourceResult) request.getAttribute(CPWebKeys.CP_DATA_SOURCE_RESULT);

    List<CPCatalogEntry> cpCatalogEntries = cpDataSourceResult.getCPCatalogEntries();
%>

<c:choose>
    <c:when test="<%= !cpCatalogEntries.isEmpty() %>">
        <%--<div class="categories-features-wrapper">--%>
            <%--<div class="ht-slick-slider-wrap">--%>
                <%--<div class="shop-product-wrap grid-view row pt-40">--%>
                <div class="minium-product-tiles">

                    <%
                        for (CPCatalogEntry cpCatalogEntry : cpCatalogEntries) {
                    %>
                          <%--<div class="commerce-item col-md-4 col-sm-6">--%>
                          <div class="minium-product-tiles__item">

                        <liferay-commerce-product:product-list-entry-renderer
                                CPCatalogEntry="<%= cpCatalogEntry %>"
                        />

                          </div>
                    <%
                        }
                    %>

                </div>
            <%--</div>--%>
        <%--</div>--%>
    </c:when>
    <c:otherwise>
        <div class="alert alert-info">
            <liferay-ui:message key="no-products-were-found"/>
        </div>
    </c:otherwise>
</c:choose>