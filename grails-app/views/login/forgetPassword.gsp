<!DOCTYPE html>
<html class="no-js">
<head>
    <meta name="layout" content="main" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<div class="container-fluid" style="">
    <div id="loginbox" style="margin-top:100px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-success">
            <div class="panel-heading">
                <div class="panel-title">Forget Password</div>
                <div style="float:right; font-size: 80%; position: relative; top:-10px"><g:link controller="login" action="index">Login</g:link></div>
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
                <g:form controller="login" action="sendAuth" class="form-horizontal">
                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input type="text" class="form-control" name="userName" placeholder="Email ID or Username">
                    </div>
                    <div style="margin-top:10px" class="form-group">
                        <div class="col-sm-12 controls">
                            <input type="submit" class="btn btn-success" value="Send">
                        </div>
                    </div>
                </g:form>
            </div>
        </div>
    </div>
</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>