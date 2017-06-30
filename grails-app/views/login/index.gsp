<!DOCTYPE html>
<html class="no-js">
<head>
    <meta name="layout" content="main" />
</head>
<body>
<div class="container-fluid" style="">
    <div id="loginbox" style="margin-top:100px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-success">
            <div class="panel-heading">
                <div class="panel-title">Sign In</div>
                <div style="float:right; font-size: 80%; position: relative; top:-10px"><g:link controller="login" action="forgetPassword">Forgot password?</g:link></div>
            </div>
            <div style="padding-top:30px" class="panel-body" >
                <div>
                    <g:if test="${flash.message}">
                        <div class="alert alert-success">${flash.message}</div>
                    </g:if>
                    <g:hasErrors bean="${this.login}">
                        <ul class="alert alert-danger" role="alert">
                            <g:eachError bean="${this.login}" var="error">
                                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                            </g:eachError>
                        </ul>
                    </g:hasErrors>
                </div>
                <g:form controller="login" action="verifyUser" class="form-horizontal">
                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input type="text" class="form-control" name="userName" placeholder="username or email">
                    </div>
                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                        <input type="password" class="form-control" name="password" placeholder="password">
                    </div>
                    <div style="margin-top:10px" class="form-group">
                        <div class="col-sm-12 controls">
                            <input type="submit" id="btn-login" class="btn btn-success" value="Login">
                        </div>
                    </div>
                </g:form>
            </div>
        </div>
    </div>
</div>
<br><br><br><br><br><br><br><br><br><br>
</body>
</html>