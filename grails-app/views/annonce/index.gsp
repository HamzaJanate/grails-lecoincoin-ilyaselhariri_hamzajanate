<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <style>
        @import url(https://fonts.googleapis.com/css?family=Open+Sans:400,600);

        *, *:before, *:after {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background: #105469;
            font-family: 'Open Sans', sans-serif;
        }
        table {
            background: #012B39;
            border-radius: 0.25em;
            border-collapse: collapse;
            margin: 1em;
            width: 1200px;
            margin: auto;

        }
        th {
            border-bottom: 1px solid #364043;
            color: #000000;
            font-size: 0.85em;
            font-weight: 600;
            padding: 0.5em 1em;
            text-align: left;
        }
        td {
            color: #fff;
            font-weight: 400;
            padding: 0.65em 1em;
        }
        .disabled td {
            color: #4F5F64;
        }
        tbody tr {
            transition: background 0.25s ease;
        }
        tbody tr:hover {
            background: #014055;
        }
        .newannonce{
            background-color: #FFFFFF;
            width: 200px;
            margin: auto;
            padding: 20px;
            text-align: center;
            border-radius: 10px;
            margin-top: 35px;
            margin-bottom: 35px;
        }
        li{
            list-style: none;
        }
        a{
            text-decoration: none;

        }
        .titleannonce{
            color: #FFFFFF;
            text-decoration: underline;
        }
        </style>
    </head>
    <body>
        <a href="#list-annonce" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>





    <a href="/annonce/create" class="newannoncelink"><li class="newannonce">Nouvelle Annonce</li> </a>


        <div id="list-annonce" class="content scaffold-list" role="main">

            <table>
                <thead>
                <tr>
                    <th>title
                    <th>description
                    <th>price
                    <th>Illustrations
                </thead>
                <tbody>
                <g:each in="${annonceList}" var="currentAnnonce">
                    <tr>
                      <td><a href="/annonce/show/${currentAnnonce.id}" class="titleannonce">${currentAnnonce.title}</a>
                    <td>${currentAnnonce.description}
                    <td>${currentAnnonce.price}
                    <td>
                        <g:each in="${currentAnnonce.illustrations}" var="image">
                            <img src="${createLinkTo(dir: 'images',file: image.filename)}" alt="illustration" onclick="illustration(${image.id})">
                        </g:each>
                    </td>
                </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${annonceCount ?: 0}" />
            </div>
        </div>
    </body>
</html>