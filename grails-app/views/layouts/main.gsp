<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>JFTChat </title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <asset:stylesheet src="bootstrap.min.css"/>
    <asset:stylesheet src="bootstrap.css"/>
    <asset:stylesheet src="font-awesome.min.css"/>
    <asset:stylesheet src="owl.carousel.css"/>
    <asset:stylesheet src="animate.css"/>
    <asset:stylesheet src="main.css"/>
    <asset:stylesheet src="responsive.css.css"/>
    <asset:stylesheet src="http://fonts.googleapis.com/css?family=Lato:400,300,700"/>
    <asset:stylesheet src="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"/>
    <!-- JS -->
    <ads:loadjui/>
    <g:javascript library="jquery"/>
    <g:javascript library="jquery-ui"/>
    <script src="jquery.countdown.min.js"></script>
    <asset:javascript src="owl.carousel.min.js"/>
    <asset:stylesheet src="bootstrap.js"/>
    <asset:javascript src="bootstrap.min.js"/>
    <asset:javascript src="jquery.form.js"/>
    <asset:javascript src="jquery.lwtCountdown-1.0.js"/>
    <asset:javascript src="jquery.nav.js"/>
    <asset:javascript src="jquery.sticky.js"/>
    <asset:javascript src="jquery.validate.min.js"/>
    <asset:javascript src="main.js"/>
    <asset:javascript src="plugins.js"/>
    <asset:javascript src="wow.min.js"/>
    <asset:javascript src="min/main.min.js"/>
    <asset:javascript src="vendor/jquery-1.10.2.min.js"/>
    <asset:javascript src="vendor/modernizr-2.6.2.min.js"/>
    <g:layoutHead/>
    <g:javascript library="prototype"/>
</head>
<body>

<div class="navbar-default navbar-fixed-top" id="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">
                JFTChat
            </a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <nav class="collapse navbar-collapse" id="navbar">
            <ul class="nav navbar-nav navbar-right" id="top-nav">
                <li><g:link uri="http://localhost:8080/">
                    <i class="fa fa-home"></i> Home</g:link></li>
                <%
                    String jftUser=(String)session.getAttribute("jftUser")
                    if(jftUser==null)
                    {
                %>
                <li><g:link controller="register" action="create">
                    <i class="fa fa-sign-out"></i> Sign Up</g:link></li>
                <li><g:link controller="login" action="index">
                    <i class="fa fa-sign-in"></i> Login</g:link></li>
                <%
                    }
                    else
                    {
                %>
                <li><g:link uri="http://localhost:8080/profile/">
                    <i class="fa fa-align-justify"></i> Profile</g:link></li>
                <li><g:link controller="login" action="logout">
                    <i class="fa fa-sign-out"></i> Logout</g:link></li>
                <%
                    }
                %>
                <li><a href="http://localhost:8080/#contact">
                <i class="fa fa-mobile-phone"></i> Contact</a></li>
            </ul>
        </nav><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</div>
<div id="body">
    <g:layoutBody/>
</div>
    <div class="footer" role="contentinfo">
    <footer>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="block">
                    <p>Copyright &copy; <a href="http://localhost:8080/">JFT Chat</a>| All right reserved.</p>
                </div>
            </div>
        </div>
    </div>
    </footer>
    </div>
    <asset:javascript src="application.js"/>
</body>
</html>
