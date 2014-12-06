<%@page import="teammates.storage.entity.Account"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="teammates.common.util.TimeHelper"%>
<%@ page import="teammates.common.util.Const"%>
<%@ page import="teammates.common.util.StringHelper"%>
<%@ page import="teammates.common.datatransfer.CourseDetailsBundle"%>
<%@ page import="teammates.common.datatransfer.SectionDetailsBundle" %>
<%@ page import="teammates.common.datatransfer.TeamDetailsBundle"%>
<%@ page import="teammates.common.datatransfer.InstructorAttributes" %>
<%@ page import="teammates.common.datatransfer.CourseAttributes" %>
<%@ page import="teammates.common.datatransfer.StudentAttributes"%>
<%@ page import="teammates.common.datatransfer.EvaluationAttributes"%>
<%@ page import="teammates.common.datatransfer.FeedbackSessionAttributes"%>
<%@ page import="teammates.ui.controller.PageData"%>
<%@ page import="static teammates.ui.controller.PageData.sanitizeForJs"%>
<%@ page import="teammates.ui.controller.InstructorStudentListPageData"%>
<%@ page import="static teammates.ui.controller.PageData.sanitizeForHtml" %>
<%@ page import="teammates.ui.controller.AdminInstructorsPageData"%>
<%
    //InstructorStudentListPageData data = (InstructorStudentListPageData) request.getAttribute("data");
    AdminInstructorsPageData data = (AdminInstructorsPageData) request.getAttribute("data");
%>


<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="/favicon.png" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>TEAMMATES - Administrar Instructores</title>
        <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css" type="text/css"/>
        <link rel="stylesheet" href="/bootstrap/css/bootstrap-theme.min.css" type="text/css"/>
        <link rel="stylesheet" href="/stylesheets/teammatesCommon.css" type="text/css" media="screen"/>

        <script type="text/javascript" src="/js/googleAnalytics.js"></script>
        <script type="text/javascript" src="/js/jquery-minified.js"></script>
        <script type="text/javascript" src="/js/common.js"></script>
        
        <script type="text/javascript" src="/js/administrator.js"></script>
        <jsp:include page="../enableJS.jsp"></jsp:include>
        
        <script type="text/javascript" src="/js/adminInstructors.js"></script>

        <jsp:include page="../enableJS.jsp"></jsp:include>
        <script type="text/javascript"  src="/bootstrap/js/bootstrap.min.js"></script>
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
    <div id="frameTop">
    <jsp:include page="<%=Const.ViewURIs.ADMIN_HEADER%>" />
    </div>
    <div id="frameBody">
        <div id="frameBodyWrapper" class="container">
            <div id="topOfPage"></div>
            <div id="headerOperation" class="page-header">
            <h1>Administrar Instructores</h1>
            </div>
            <br />
            <%
                int Idx = -1;
                        
            %>
            <table class="table table-responsive table-striped table-bordered margin-0">
            <thead class="background-color-medium-gray text-color-gray font-weight-normal">
            <tr id="resultsHeader-0"><th>Nro.</th><th>googleId</th><th>Name</th><th>Email</th><th>Curso ID</th><th>Rol</th><th>Acciones</th></tr></thead><tbody>
            <% 
            for (InstructorAttributes  instructor : data.instructors ) {                
                    Idx++;
                    out.print("<tr class='instructor'><td>"+Idx+"</td><td>"+instructor.googleId+"</td><td>"+instructor.name+"</td><td>"+instructor.email+"</td><td>"+instructor.courseId+"</td><td>"+instructor.role+"</td><td><a class='btn btn-default btn-xs btn-tm-actions session-edit-for-test' href='"+ Const.ActionURIs.ADMIN_EDIT_INSTRUCTOR_PAGE +"?"+Const.ParamsNames.USER_ID+"=" + data.account.googleId+"&user_id_instructor="+instructor.googleId+"&"+Const.ParamsNames.COURSE_ID+"="+instructor.courseId+"&"+Const.ParamsNames.INSTRUCTOR_NAME+"="+instructor.name+"&"+Const.ParamsNames.INSTRUCTOR_ROLE_NAME+"="+instructor.role+"&"+Const.ParamsNames.INSTRUCTOR_EMAIL+"="+instructor.email+"'  data-toggle='tooltip' data-placement='top' data-original-title='Editar Instructor'>Edit</a></td></tr>");                
            }
            %>
            </tbody></table>
            <div id="form_edit">
            </div>
        </div>
    </div>

    <div id="frameBottom">
        <jsp:include page="<%=Const.ViewURIs.FOOTER%>" />
    </div>
    </body>
</html>
                
            

            
