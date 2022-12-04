<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <style>
        body {
            background: #105469;
            font-family: 'Open Sans', sans-serif;
        }
        .whitetext{
            color: #FFFFFF;
        }
        .buttons{
            width: 150px;
            border-radius: 10px;
            margin: auto;
            margin-top: 200px;
        }
        form{
            width: 700px;
            margin: auto;
        }
        </style>
    </head>
    <body>

        <div id="create-user" class="content scaffold-create" role="main">
            <h1>Edit Annonce</h1>
            <form action="/user/save" method="post">
                <fieldset class="form">
                    <div class="fieldcontain required">
                        <label for="username"><span class="whitetext">Username</span> </label>
                        <input type="text" name="username" value="" required="" id="username">
                    </div>
                    <div class="fieldcontain required">
                        <label for="password"><span class="whitetext">Mot de pass</span></label>
                        <input type="password" name="password" required="" value="" id="password">
                    </div>

                    <div class="fieldcontain">
                        <label for="passwordExpired"><span class="whitetext">Mot de pass expiré</span></label><input type="hidden" name="_passwordExpired"><input type="checkbox" name="passwordExpired" id="passwordExpired">
                    </div>
                    <div class="fieldcontain">
                        <label for="accountLocked"><span class="whitetext">Compte fermé</span></label>
                        <input type="hidden" name="_accountLocked"><input type="checkbox" name="accountLocked" id="accountLocked">
                    </div>
                    <div class="fieldcontain">
                        <label for="accountExpired"><span class="whitetext">Compte expiré</span></label>
                        <input type="checkbox" name="accountExpired" id="accountExpired">
                    </div>
                    <div class="fieldcontain">
                        <label for="enabled"><span class="whitetext">Actif</span></label>
                        <input type="hidden" name="_enabled"><input type="checkbox" name="enabled" checked="checked" id="enabled">
                    </div>
                    <div class="fieldcontain">
                        <label for="role"><span class="whitetext">Role</span></label>
                        <g:select name="role" from="${roles}" optionKey="id" optionValue="authority"/>
                    </div>

                <fieldset class="buttons">
                    <input type="submit" name="create" class="save" value="Create" id="create">
                </fieldset>
            </form>
        </div>
    </body>
</html>
