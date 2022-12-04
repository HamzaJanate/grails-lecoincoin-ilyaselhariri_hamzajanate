<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
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
        a{
            color: #FFFFFF;
        }
        .newuser{
            background-color: #FFFFFF;
            width: 200px;
            margin: auto;
            padding: 20px;
            text-align: center;
            border-radius: 10px;
            margin-top: 35px;
            margin-bottom: 35px;
        }
        .newannoncelink{
            color: #1b6d85;
            text-decoration: none;
        }
        li{
            list-style: none;
        }
        </style>
    </head>
    <body>
    <a href="/user/create" class="newannoncelink"><li class="newuser">Nouveau user</li> </a>
        <div id="list-user" class="content scaffold-list" role="main">
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table>
                <thead>
                <tr>
                    <th>Username
                    <th>Mot de pass expiré
                    <th>compte bloqué
                    <th>compte expriré
                    <th>compte actif
                    <th>Annonces
                </thead>
                <tbody>
                <g:each in="${userList}" var="currentUser">
                    <tr>
                    <td><a href="/user/show/${currentUser.id}">${currentUser.username}</a>
                    <td>${currentUser.passwordExpired}
                    <td>${currentUser.accountLocked}
                    <td>${currentUser.accountExpired}
                    <td>${currentUser.enabled}
                    <td>
                        <g:each in="${currentUser.annonces}" var="annonce">
                            <a href="/annonce/show/${annonce.id}">${annonce.title}</a>
                        </g:each>
                    </td>
                </g:each>

                </tbody>
            </table>

            <div class="pagination">
                <g:paginate total="${userCount ?: 0}" />
            </div>
        </div>
    </body>
</html>