<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->

<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <g:javascript library="jquery" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>
        <g:layoutTitle default="Grails" />
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
    <link href='https://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'>
    <!-- Latest compiled and minified CSS -->

    <!-- Optional theme -->

    <!-- Latest compiled and minified JavaScript -->
    <asset:stylesheet src="application.css" />
    <asset:javascript src="application.js" />
    <g:layoutHead/>
</head>

<body>
    
    <div class="col-sm-12" id="grailsLogo" role="banner">
        <div class=" col-sm-8">
            <a href="/testBlog/">
                <asset:image src="blog.jpeg" alt="Blog" />
                <h3>Random wisdom from the interwebs!</h3></a>
        </div>
        <div class="col-sm-4">
            <g:loginControl/>
            <div class="loginOffset">
                <g:form controller="Entry">
                    <g:actionSubmit class="btn btn-secondary" action="index" value="Search" />
                    <input id="blogSearch" type='text' name="value" value="${params.value}" />
                </g:form>
            </div>
        </div>
    </div>

    <div class="col-sm-12">
        <g:if test="${flash.message}">
            <div class="message" role="status">
                ${flash.message}
            </div>
        </g:if>
        <g:layoutBody/>
    </div>
    <div class="footer" role="contentinfo"></div>
    <div id="spinner" class="spinner" style="display:none;">
        <g:message code="spinner.alt" default="Loading&hellip;" />
    </div>
</body>

</html>