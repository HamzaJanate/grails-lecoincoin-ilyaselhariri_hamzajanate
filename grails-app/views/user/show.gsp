<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
        <style>
        body {
            background: #105469;
            font-family: 'Open Sans', sans-serif;
        }
        .content{
            color: #FFFFFF;
        }
        .whitetext{
            color: #FFFFFF;
        }
        .buttons{
            width: 100px;
            border-radius: 10px;
            margin: auto;
            margin-top: 200px;
        }
        form{
            width: 700px;
            margin: auto;
        }
        fieldset{
            display: inline;
            border-radius: 10px;
        }
        a{

        }
        a:hover{

        }
        .annoncesTitle{
            margin-left: 37px;
        }
        .content .edit a{
            color: #FFFFFF;
        }
        .content .edit a:hover{
            background-color: #FFFFFF;
            border-radius: 10px;
        }
        </style>
    </head>
    <body>
    <div id="show-user" class="content scaffold-show" role="main">
        <h1>Show User</h1>

        <ol class="property-list user">
            <li class="fieldcontain">
                <span id="username-label" class="property-label"><span class="whitetext">Username</span></span>
                <div class="property-value" aria-labelledby="username-label">${this.user.username}</div>
            </li>

            <li class="fieldcontain">
                <span id="passwordExpired-label" class="property-label"><span class="whitetext">Mot de pass expiré</span></span>
                <div class="property-value" aria-labelledby="passwordExpired-label">${this.user.passwordExpired}</div>
            </li>

            <li class="fieldcontain">
                <span id="accountLocked-label" class="property-label"><span class="whitetext">Compte bloqué</span></span>
                <div class="property-value" aria-labelledby="accountLocked-label">${this.user.accountLocked}</div>
            </li>

            <li class="fieldcontain">
                <span id="accountExpired-label" class="property-label"><span class="whitetext">Compte expiré</span></span>
                <div class="property-value" aria-labelledby="accountExpired-label">${this.user.accountExpired}</div>
            </li>

            <li class="fieldcontain">
                <span id="enabled-label" class="property-label"><span class="whitetext">Compte activé</span></span>
                <div class="property-value" aria-labelledby="enabled-label">${this.user.enabled}</div>
            </li>

            <li class="fieldcontain">
                <span id="annonces-label" class="property-label"><span class="whitetext">Annonces</span></span>
                <span class="annoncesTitle">
                <g:each in="${this.user.annonces}" var="annonce">
                    <a href="/annonce/show/${annonce.id} ">${annonce.title}</a>
                </g:each>
                </span>
            </li>
        </ol>
        <form action="/user/delete/${this.user.id}" method="post"><input type="hidden" name="_method" value="DELETE" id="_method">
            <fieldset class="buttons">
                <a href="/user/edit/${this.user.id}" class="edit">Modifier</a>
            </fieldset>
            <fieldset class="buttons">
                <input class="delete" type="submit" value="Delete" onclick="return confirm('Are you sure?');">
            </fieldset>
        </form>
    </div>
        </div>
    </body>
</html>
