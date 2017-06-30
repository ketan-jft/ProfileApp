<%@ page import="jftchat.Profile" %>
<!DOCTYPE html>
<html class="no-js">
<head>
    <meta name="layout" content="main" />
    <title>Edit Profile</title>
</head>
<body>
<div class="container-fluid" style="">
    <div id="loginbox" style="margin-top:100px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-success">
            <div class="panel-heading">
                <div class="panel-title">Edit Your Profile</div>
            </div>
            <div style="padding-top:30px" class="panel-body" >
                <div>
                    <g:if test="${flash.message}">
                        <div class="alert alert-success">${flash.message}</div>
                    </g:if>
                    <g:hasErrors bean="${this.profile}">
                        <ul class="alert alert-danger" role="alert">
                            <g:eachError bean="${this.profile}" var="error">
                                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                            </g:eachError>
                        </ul>
                    </g:hasErrors>
                </div>
                <%
                    String bio,add,cit,sta,cty,mob
                    String ctr=  request.getParameter("ctr")
                    int userId=(Integer.parseInt((String)session.getAttribute("jftUserId")))
                    String user=(String)session.getAttribute("jftUser")
                    if(Profile.findByRegId(userId))
                    {
                        Profile p=Profile.findByRegId(userId)
                        bio=p.bio
                        add=p.address
                        cit=p.city
                        sta=p.state
                        cty=p.country
                        mob=p.mobile
                    }
                %>
                <g:form enctype="multipart/form-data" controller="profile" action="save" class="form-horizontal">
                    <input type="hidden" name="ctr" value="${ctr}">
                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon">About </span>
                        <textarea required="required" class="form-control" name="bio"><%if(ctr!=null){if(bio!=null)out.print(bio.trim())}%></textarea>
                    </div>
                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon">Address </span>
                        <textarea required="required" class="form-control" name="address"><%if(ctr!=null){if(add!=null)out.print(add.trim())else{%>Address<% }} %></textarea>
                        <input required="required" type="text" id="city" value="<%if(ctr!=null){if(cit!=null)out.print(cit.trim())}%>" class="form-control" name="city" placeholder="City">
                        <input required="required" type="text" value="<%if(ctr!=null){if(sta!=null)out.print(sta.trim())}%>" class="form-control" name="state" placeholder="State">
                        <g:select
                                value="${cty}"
                                class="form-control" name="country"
                                from="${jftchat.Countries.listOrderByName().name}"
                                noSelection="${['null':'Select Country...']}"
                                id="country"
                        ></g:select>
                    </div>
                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon">Mobile </span>
                        <input value="<%if(ctr!=null){if(mob!=null)out.print(mob.trim())}%>"
                                type="number" required="required" max="999999999999999" min="1000000000"
                               class="form-control" title="Enter Valid Number"
                               name="mobile" placeholder="Mobile Number">
                    </div>
                    <% if(ctr=="1") {} else { %>
                    <div style="margin-bottom: 25px" class="input-group ui-widget">
                        <span class="input-group-addon">Choose Profile Photo </span>
                        <input required="required" type="file" id="photo" class="form-control"
                               name="photo" title="Choose Your Display Picture (DP) / Profile Photo">
                    </div>
                    <% } %>
                    <input type="hidden" contenteditable="false" name="regId" value="<% out.print((String)session.getAttribute("jftUserId")); %>">
                    <div style="margin-top:10px" class="form-group">
                        <div class="col-sm-12 controls">
                            <input type="submit" class="btn btn-success" value="Update">
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