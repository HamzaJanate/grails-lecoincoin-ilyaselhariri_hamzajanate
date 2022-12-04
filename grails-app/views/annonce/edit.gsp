<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
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

    <div id="edit-annonce" class="content scaffold-edit" role="main">
        <h1>Edit Annonce</h1>

        <form action="/annonce/update/10" method="post"><input type="hidden" name="_method" value="PUT" id="_method">
            <input type="hidden" name="version" value="0" id="version">
            <fieldset class="form">
                <div class="fieldcontain required">
                    <label for="title">
                        <span class="whitetext">Titre</span>
                    </label>
                    <input type="text" name="title" value="Bob 5" required="" maxlength="100" id="title">
                </div>
                <div class="fieldcontain required">
                    <label for="description">
                        <span class="whitetext">Description</span>
                    </label>
                    <input type="text" name="description" value="Description de l'annonce" required="" id="description">
                </div>
                <div class="fieldcontain required">
                    <label for="price">
                        <span class="whitetext">Prix</span>
                    </label>
                    <input type="number decimal" name="price" value="50" required="" step="0.01" min="0.0" id="price">
                </div>
                <div class="fieldcontain">
                    <label for="active"> <span class="whitetext">Actif</span></label><input type="hidden" name="_active"><input type="checkbox" name="active" checked="checked" id="active">
                </div>
                <div class="fieldcontain">
                    <label for="illustrations"><span class="whitetext">Illustrations</span></label>
                    <g:each in="${this.annonce.illustrations}" var="image">
                        <img src="${createLinkTo(dir: 'images',file: image.filename)}" alt="illustration" onclick="illustration(${image.id})">
                    </g:each>
                    <br>
                    <a href="/illustration/create?annonce.id=10">Add Illustration</a>
                </div>
                <div class="fieldcontain required">
                    <label for="author">
                        <span class="whitetext">Auteur</span>
                    </label>
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
                <input class="save" type="submit" value="Update">
            </fieldset>
        </form>
    </div>
    </body>
</html>
