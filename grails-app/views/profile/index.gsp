<%@ page import="jftchat.Register" %>
<html>
<head>
    <title>Profile</title>
    <meta name="layout" content="main" />
    <link href="http://fontawesome.io/assets/font-awesome/css/font-awesome.css" rel="stylesheet" media="screen">
    <asset:stylesheet href="profile.css"/>
    <asset:javascript src="profile.js"/>
</head>
<body>
<%
    int userId=(Integer.parseInt((String)session.getAttribute("jftUserId")))
    String user=(String)session.getAttribute("jftUser")
    jftchat.Profile profileInstance=jftchat.Profile.findByRegId(userId)
    if(!profileInstance)
    {
        response.sendRedirect("${g.createLink(controller: 'profile', action: 'edit')}")
    }
    else
    {
        String fullName=jftchat.Register.findByUserName(user).fullName
        String emailId=jftchat.Register.findByUserName(user).emailId
        String bio=profileInstance.bio
        String address=profileInstance.address + ", " + profileInstance.city + ", " +
            profileInstance.state + ", " + profileInstance.country
        String mobile=profileInstance.mobile
%>
<div class="container-fluid" style="margin-top: 5%">
    <div class="row user-menu-container square">
        <div class="col-md-7 user-details">
            <div class="row coralbg white">
                <div class="col-md-6 no-pad">
                    <div class="user-pad">
                        <h4 style="color: whitesmoke">Welcome back, <%=fullName%></h4>
                        <h6 class="white"><i class="fa fa-mail-reply"> </i> <% if(emailId!=null) out.print(emailId) %></h6>
                        <h6 class="white"><i class="fa fa-info-circle"> </i> <% if(bio!=null) out.print(bio) %></h6>
                        <h6 class="white"><i class="fa fa-location-arrow"> </i> <% if(address!=null) out.print(address) %></h6>
                        <h6 class="white"><i class="fa fa-mobile-phone"> </i> <% if(mobile!=null) out.print(mobile) %></h6>
                        <%
                                String alphabet = (('A'..'N')+('P'..'Z')+('a'..'k')+('m'..'z')+('2'..'9')).join()
                                def n = 100
                                def giveMeKey={
                                    def key
                                    for(def i=0;i<50;i++){
                                        key = new Random().with {
                                            (1..n).collect { alphabet[ nextInt( alphabet.length() ) ] }.join()
                                        }
                                    }
                                    return key
                                }
                        %>
                        <g:link uri="/profile/edit?ctr=1&user=${userId}&session=${giveMeKey()}" class="btn btn-labeled btn-success" href="#">
                            <span class="btn-label "><i class="fa fa-pencil"></i></span>Update</g:link>
                        <g:link controller="profile" action="delProfile" class="btn btn-labeled btn-success" href="#">
                            <span class="btn-label "><i class="fa fa-eraser"></i></span>Delete</g:link>
                    </div>
                </div>
                <div class="col-md-6 no-pad">
                    <div class="user-image">
                        <button class="img-responsive thumbnail" id="OpenImgUpload">
                            <img style="height: 215px" class="img-responsive thumbnail" title="Change Photo" alt="<%=fullName%>"
                                 src="${createLink(action:'pic', id: profileInstance.id)}"/>
                        </button>
                    </div>
                    <script>
                        $('#OpenImgUpload').click(function(){ $('#imgupload').trigger('click'); });
                        $('#imgupload').change(function() {
                            $('#form').submit();
                        });
                    </script>
                    <Form method="post" id="form" controller="profile"
                          enctype="multipart/form-data" action="changePhoto">
                        <input type="file" name="photo" id="imgupload"
                               onchange='this.form.submit();' style="display:none"/>
                    </Form>
                </div>
                <div class="row overview" style="background-color: transparent">
                    <div class="col-md-6 user-pad text-center">
                        <h3>FOLLOWERS</h3>
                        <h4 style="color: #ffffff">2,784</h4>
                    </div>
                    <div class="col-md-6 user-pad text-center">
                        <h3>FOLLOWING</h3>
                        <h4 style="color: #ffffff">456</h4>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-1 user-menu-btns">
            <div class="btn-group-vertical square" id="responsive">
                <a href="#" class="btn btn-block btn-default active">
                    <i class="fa fa-bell-o fa-3x"></i>
                </a>
                <a href="#" class="btn btn-default">
                    <i class="fa fa-envelope-o fa-3x"></i>
                </a>
                <a href="#" class="btn btn-default">
                    <i class="fa fa-laptop fa-3x"></i>
                </a>
                <a href="#" class="btn btn-default">
                    <i class="fa fa-cloud-upload fa-3x"></i>
                </a>
            </div>
        </div>
        <div class="col-md-4 user-menu user-pad">
            <div class="user-menu-content active">
                <h3>
                    Recent Interactions
                </h3>
                <ul class="user-menu-list">
                    <li>
                        <h4><i class="fa fa-user coral"></i> Roselynn Smith followed you.</h4>
                    </li>
                    <li>
                        <h4><i class="fa fa-heart-o coral"></i> Jonathan Hawkins followed you.</h4>
                    </li>
                    <li>
                        <h4><i class="fa fa-paper-plane-o coral"></i> Gracie Jenkins followed you.</h4>
                    </li>
                    <li>
                        <button type="button" class="btn btn-labeled btn-success" href="#">
                            <span class="btn-label"><i class="fa fa-bell-o"></i></span>View all activity</button>
                    </li>
                </ul>
            </div>
            <div class="user-menu-content">
                <h3>
                    Your Inbox
                </h3>
                <ul class="user-menu-list">
                    <li>
                        <h4>From Roselyn Smith <small class="coral"><strong>NEW</strong> <i class="fa fa-clock-o"></i> 7:42 A.M.</small></h4>
                    </li>
                    <li>
                        <h4>From Jonathan Hawkins <small class="coral"><i class="fa fa-clock-o"></i> 10:42 A.M.</small></h4>
                    </li>
                    <li>
                        <h4>From Georgia Jennings <small class="coral"><i class="fa fa-clock-o"></i> 10:42 A.M.</small></h4>
                    </li>
                    <li>
                        <button type="button" class="btn btn-labeled btn-danger" href="#">
                            <span class="btn-label"><i class="fa fa-envelope-o"></i></span>View All Messages</button>
                    </li>
                </ul>
            </div>
            <div class="user-menu-content">
                <h3>
                    Trending
                </h3>
                <div class="row">
                    <div class="col-md-6">
                        <div class="view">
                            <div class="caption">
                                <p>47LabsDesign</p>
                                <a href="" rel="tooltip" title="Appreciate"><span class="fa fa-heart-o fa-2x"></span></a>
                                <a href="" rel="tooltip" title="View"><span class="fa fa-search fa-2x"></span></a>
                            </div>
                            <img src="http://24.media.tumblr.com/273167b30c7af4437dcf14ed894b0768/tumblr_n5waxesawa1st5lhmo1_1280.jpg" class="img-responsive">
                        </div>
                        <div class="info">
                            <p class="small" style="text-overflow: ellipsis">An Awesome Title</p>
                            <p class="small coral text-right"><i class="fa fa-clock-o"></i> Posted Today | 10:42 A.M.</small>
                        </div>
                        <div class="stats turqbg">
                            <span class="fa fa-heart-o"> <strong>47</strong></span>
                            <span class="fa fa-eye pull-right"> <strong>137</strong></span>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="view">
                            <div class="caption">
                                <p>47LabsDesign</p>
                                <a href="" rel="tooltip" title="Appreciate"><span class="fa fa-heart-o fa-2x"></span></a>
                                <a href="" rel="tooltip" title="View"><span class="fa fa-search fa-2x"></span></a>
                            </div>
                            <img src="http://24.media.tumblr.com/282fadab7d782edce9debf3872c00ef1/tumblr_n3tswomqPS1st5lhmo1_1280.jpg" class="img-responsive">
                        </div>
                        <div class="info">
                            <p class="small" style="text-overflow: ellipsis">An Awesome Title</p>
                            <p class="small coral text-right"><i class="fa fa-clock-o"></i> Posted Today | 10:42 A.M.</small>
                        </div>
                        <div class="stats turqbg">
                            <span class="fa fa-heart-o"> <strong>47</strong></span>
                            <span class="fa fa-eye pull-right"> <strong>137</strong></span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="user-menu-content">
                <h2 class="text-center">
                    START SHARING
                </h2>
                <center><i class="fa fa-cloud-upload fa-4x"></i></center>
                <div class="share-links">
                    <center><button type="button" class="btn btn-lg btn-labeled btn-success" href="#" style="margin-bottom: 15px;">
                        <span class="btn-label"><i class="fa fa-bell-o"></i></span>A FINISHED PROJECT
                    </button></center>
                    <center><button type="button" class="btn btn-lg btn-labeled btn-warning" href="#">
                        <span class="btn-label"><i class="fa fa-bell-o"></i></span>A WORK IN PROGRESS
                    </button></center>
                </div>
            </div>
            <% } %>
        </div>
    </div>
</div>
<br><br><br><br><br><br><br><br>
</body>
</html>