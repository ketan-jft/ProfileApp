<!DOCTYPE html>
<html class="no-js">
    <head>
        <meta name="layout" content="main" />
    </head>
    <body>
    %{--<div class="container-fluid">--}%
        %{--<div class="row">--}%
            %{--<div class="col-lg-12">--}%
                %{--<div id="create-register" class="content col-lg-12 scaffold-create" role="main">--}%
                    %{--<div class="col-lg-12" style="margin-top: 8%">--}%
                        %{--<h1>Sign Up</h1>--}%
                    %{--</div>--}%
                    %{--<div class="col-lg-7" style="margin-top: 1%">--}%
                    %{--<g:if test="${flash.message}">--}%
                        %{--<div class="message" role="status">${flash.message}</div>--}%
                    %{--</g:if>--}%
                    %{--<g:hasErrors bean="${this.register}">--}%
                        %{--<ul class="errors" role="alert">--}%
                            %{--<g:eachError bean="${this.register}" var="error">--}%
                                %{--<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>--}%
                            %{--</g:eachError>--}%
                        %{--</ul>--}%
                    %{--</g:hasErrors>--}%
                    %{--<g:form resource="${this.register}" method="POST">--}%
                        %{--<fieldset class="form">--}%
                            %{--<div class="col-lg-2">--}%
                            %{--<f:all bean="register"/>--}%
                            %{--</div>--}%
                        %{--</fieldset>--}%
                        %{--<br>--}%
                        %{--<fieldset class="buttons col-lg-2">--}%
                            %{--<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Register')}" />--}%
                        %{--</fieldset>--}%
                        %{--<br><br>--}%
                    %{--</g:form>--}%
                    %{--</div>--}%
                    %{--<div class="col-lg-5">--}%
                        %{--<g:img dir="skin" file="about.jpg" width="100%" height="250px" />--}%
                    %{--</div>--}%
                %{--</div>--}%
            %{--</div>--}%
        %{--</div>--}%
    %{--</div>--}%
    <div class="container-fluid" style="">
        <div id="loginbox" style="margin-top:100px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
            <div class="panel panel-success">
                <div class="panel-heading">
                    <div class="panel-title">Sign Up</div>
                    <div style="float:right; font-size: 80%; position: relative; top:-10px"><g:link controller="login" action="index">Login</g:link></div>
                </div>
                <div style="padding-top:30px" class="panel-body" >
                    <div>
                        <g:if test="${flash.message}">
                        <div class="alert alert-success">${flash.message}</div>
                        </g:if>
                        <g:hasErrors bean="${this.register}">
                        <ul class="alert alert-danger" role="alert">
                        <g:eachError bean="${this.register}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                        </g:eachError>
                        </ul>
                        </g:hasErrors>
                    </div>
                    <g:form controller="register" action="save" class="form-horizontal">
                        <div style="margin-bottom: 25px" class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <g:textField required="" name="fullName" placeholder="Full Name" class="form-control"/>
                        </div>
                        <div style="margin-bottom: 25px" class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-send"></i></span>
                            <g:textField required="" name="emailId" placeholder="Email ID" class="form-control"/>
                        </div>
                        <div style="margin-bottom: 25px" class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <g:textField required="" name="userName" placeholder="Username" class="form-control"/>
                        </div>
                        <div style="margin-bottom: 25px" class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                            <g:passwordField required="" name="password" placeholder="Password" class="form-control"/>
                        </div>
                        <g:hiddenField required="" name="isActive" value="0"/>
                        <g:hiddenField name="passCode" value="0"/>
                        <div style="margin-top:10px" class="form-group">
                            <div class="col-sm-12 controls">
                                <g:submitButton name="Sign Up" value="Sign Up" />
                            </div>
                        </div>
                    </g:form>
                </div>
            </div>
        </div>
    </div>
    <br><br><br><br>
    </body>
</html>