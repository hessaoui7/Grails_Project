<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-annonce" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                <li><a href="/logoff">Log Out</a></li>
            </ul>
        </div>
        <div id="list-annonce" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
%{--            <f:table collection="${annonceList}" />--}%

            <table>
                <thead>
                <tr>
                    <th class="sortable"><a href="/annonce/index?sort=title&amp;max=10&amp;order=asc">Title</a></th>
                    <th class="sortable"><a href="/annonce/index?sort=description&amp;max=10&amp;order=asc">Description</a></th>
                    <th class="sortable"><a href="/annonce/index?sort=price&amp;max=10&amp;order=asc">Price</a></th>
                    <th class="sortable"><a href="/annonce/index?sort=active&amp;max=10&amp;order=asc">Active</a></th>
                    <th class="sortable"><a href="/annonce/index?sort=illustrations&amp;max=10&amp;order=asc">Illustrations</a></th>
                    <th class="sortable"><a href="/annonce/index?sort=author&amp;max=10&amp;order=asc">Author</a></th>
                </tr>
                </thead>
                <tbody>
                    <g:each status="i" in="${annonceList}" var="${annonce}">
                        <tr class="${ (i % 2) == 0 ? 'even' : 'odd'}">
                            <td><a href="/annonce/show/${annonce.id}">${annonce.title}</a></td>
                            <td>${annonce.description}</td>
                            <td>${annonce.price}</td>
                            <td>${annonce.active}</td>
                            <td>
                                <ul>
                                    <li>
                                        <g:each in="${annonce.illustrations}" var="illus" >
                                            <asset:image src="${illus.filename}" class="mySlides"></asset:image>
                                        </g:each>
                                    </li>
                                </ul>
                            </td>
                            <td>${annonce.author.username}</td>
                        </tr>
                    </g:each>
                </tbody>
            </table>

            <div class="pagination">
                <g:paginate total="${annonceCount ?: 0}" />
            </div>
        </div>
    </body>
</html>