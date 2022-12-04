<g:set var="myuserid" value="${sec.loggedInUserInfo(field:'id')}" />
<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
    LeCoinCoin
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <asset:link rel="icon" href="lecoincoinLogo.png" type="image/x-ico" />

    <asset:stylesheet src="application.css"/>

    <g:layoutHead/>
</head>
<body>

<div class="navbar navbar-default navbar-static-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <a class="" href="/#">
                <asset:image src="lecoinlogo.png" alt="Logo"/>
            </a>
        </div>
        <div class="navbar-collapse collapse" aria-expanded="false" style="height: 0.8px;">
            <ul class="nav navbar-nav navbar-right">
                <g:pageProperty name="page.nav" />
                <sec:ifAnyGranted roles='ROLE_ADMIN'>
                    <li class="">
                        <a href="/user/" >Users</a>
                    </li>
                </sec:ifAnyGranted>
                <sec:ifLoggedIn>
                    <sec:ifNotGranted roles="ROLE_ADMIN">
                        <li class="">
                            <a href="/user/edit/${myuserid}" >Mon Compte</a>
                        </li>
                    </sec:ifNotGranted>
                </sec:ifLoggedIn>




                <li class="">
                    <a href="/annonce">ANNONCES</a>
                </li>


                <sec:ifLoggedIn>
                    <li class="">
                        <a href="/logout"  role="button" aria-haspopup="true" aria-expanded="false">LOGOUT <span></span></a>
                    </li>
                </sec:ifLoggedIn>
                <sec:ifNotLoggedIn>
                    <li class="">
                        <a href="/login"  role="button" aria-haspopup="true" aria-expanded="false">LOGIN <span></span></a>
                    </li>
                </sec:ifNotLoggedIn>

            </ul>
        </div>
    </div>
</div>

<g:layoutBody/>



<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>

<asset:javascript src="application.js"/>

</body>
</html>