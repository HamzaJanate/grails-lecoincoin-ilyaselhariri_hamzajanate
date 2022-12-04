<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <style>
        body {
            background: #105469;
            font-family: 'Open Sans', sans-serif;
        }
        .labelclass{
            color: #FFFFFF;
        }
        .buttons{
            width: 150px;
            margin: auto;
        }
        form{
            margin: auto;
            width: 470px;
        }

        </style>
    </head>
    <body>
        <a href="#create-annonce" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="create-annonce" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.annonce}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.annonce}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <form action="/annonce/save" method="post">
                <fieldset class="form">
                    <div class="fieldcontain required">
                        <label for="title"><span class="labelclass">Titre</span></label>
                        <input type="text" name="title" value="" required="" maxlength="100" id="title">
                    </div>
                    <div class="fieldcontain required">
                        <label for="description"><span class="labelclass">Description</span></label>
                        <input type="text" name="description" value="" required="" id="description">
                    </div>
                    <div class="fieldcontain required">
                        <label for="price"><span class="labelclass">prix</span></label>
                        <input type="number decimal" name="price" value="" required="" step="0.01" min="0.0" id="price">
                    </div>
                    <div class="fieldcontain">
                        <label for="illustrations"><span class="labelclass">illustrations  </span></label><a href="/illustration/create?annonce.id=">  Add Illustration</a>
                    </div><div class="fieldcontain required">
                    <label for="author"><span class="labelclass">Auteur</span></label>
                    <select name="author.id" required="" id="author">
                        <sec:ifAnyGranted roles='ROLE_ADMIN'>
                            <g:each in="${listusers}" var="users">
                                <option value="${users.id}">${users.username}</option>
                            </g:each>

                        </sec:ifAnyGranted>
                        <sec:ifNotGranted roles="ROLE_ADMIN">
                            <option value="${user.id}">${user.username}</option>
                        </sec:ifNotGranted>

                    </select>
                </div>
                </fieldset>
                <fieldset class="buttons">
                    <input type="submit" name="create" class="save" value="Create" id="create">
                </fieldset>
            </form>
        </div>
    </body>
</html>
