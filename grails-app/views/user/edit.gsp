<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
        <style>
        @import url(https://fonts.googleapis.com/css?family=Open+Sans:400,600);

        body {
            background: #105469;
            font-family: 'Open Sans', sans-serif;
        }
        .labelclass{
            color: #FFFFFF;
        }
        .updatebtn{
            padding: 17px;
            width: 170px;
            margin: auto;
            margin-top: 25px;
        }
        form{
            width: 250px;
            margin: auto;
        }

        </style>
    </head>
    <body>
        <a href="#edit-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

        <div id="edit-user" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.user}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.user}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <form action="/user/update/3" method="post"><input type="hidden" name="_method" value="PUT" id="_method">
                <input type="hidden" name="version" value="4" id="version">
                <fieldset class="form">
                    <div class="fieldcontain required">
                        <label for="password"><span class="labelclass">Password</span></label>
                        <input type="password" name="password" required="" value="" id="password">
                    </div>
                    <div class="fieldcontain required">
                    <label for="username"><span class="labelclass">Username</span></label>
                        <input type="text" name="username" value="Bob" required="" id="username">
                    </div>

                    <fieldset class="buttons updatebtn">
                        <input class="save" type="submit" value="Update">
                    </fieldset>
            </form>

        </div>
    </body>
</html>
