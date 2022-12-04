<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}" />
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
        form{
            width: 200px;
            margin: auto;
            margin-top: 70px;
            border-radius: 10px;
        }
        fieldset{
            display: inline;
            border-radius: 10px;
        }
        </style>
    </head>
    <body>
    <div id="show-annonce" class="content scaffold-show" role="main">
        <h1>Annonce informations</h1>

        <ol class="property-list annonce">

            <li class="fieldcontain">
                <span class="property-label" ><span class="whitetext">Title</span></span>
                <div class="property-value" aria-labelledby="title-label">${this.annonce.title}</div>
            </li>

            <li class="fieldcontain">
                <span id="description-label" class="property-label"><span class="whitetext">Description</span></span>
                <div class="property-value" aria-labelledby="description-label">${this.annonce.description}</div>
            </li>

            <li class="fieldcontain">
                <span id="price-label" class="property-label"><span class="whitetext">Prix</span></span>
                <div class="property-value" aria-labelledby="price-label">${this.annonce.price}</div>
            </li>

            <li class="fieldcontain">
                <span id="active-label" class="property-label"><span class="whitetext">Actif</span></span>
                <div class="property-value" aria-labelledby="active-label">${this.annonce.active}</div>
            </li>

            <li class="fieldcontain">
                <span id="illustrations-label" class="property-label"><span class="whitetext">Illustrations</span></span>
                <div class="property-value" aria-labelledby="illustrations-label">
                    <g:each in="${this.annonce.illustrations}" var="image">
                        <img src="${createLinkTo(dir: 'images',file: image.filename)}" alt="illustration" onclick="illustration(${image.id})">
                    </g:each>
                </div>
            </li>

            <li class="fieldcontain">
                <span id="author-label" class="property-label"><span class="whitetext">Auteur</span></span>
                <div class="property-value" aria-labelledby="author-label">${this.annonce.author.username}</div>
            </li>

        </ol>
        <form action="/annonce/delete/${this.annonce.id}" method="post"><input type="hidden" name="_method" value="DELETE" id="_method">
            <fieldset class="buttons">
                <a href="/annonce/edit/${this.annonce.id}" class="edit">Edit</a>

            </fieldset>
            <fieldset class="buttons">

                <input class="delete" type="submit" value="Delete" onclick="return confirm('Are you sure?');">
            </fieldset>
        </form>
    </div>
    </body>
</html>
