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
<%@ page import="teammates.common.util.FieldValidator"%>
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
        <script type="text/javascript" src="/js/adminInstructorsAjax.js"></script>

        <jsp:include page="../enableJS.jsp"></jsp:include>
        <script type="text/javascript"  src="/bootstrap/js/bootstrap.min.js"></script>
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>

<body>
    <body>
    <div id="frameTop">
    <jsp:include page="<%=Const.ViewURIs.ADMIN_HEADER%>" />
    </div>
    <div id="frameBody">
        <div id="frameBodyWrapper" class="container">
            <div id="topOfPage"></div>
            <div id="headerOperation" class="page-header">
            <h1>Editar Instructor</h1>
            </div>
            <br />            
            <div class="panel panel-primary">
            <div class="panel-body fill-plain">
                <form method="get" action="<%=Const.ActionURIs.ADMIN_EDIT_INSTRUCTOR_PAGE_ACTION%>" name="form_editmyAccount" class="form form-horizontal">
                    <input type="hidden"  name="user_id_instructor" value="<%=data.currentGoogleId %>">
                    <!--  problemas al implementar edicion del nombre corto por no considerarse short_name en las entidades 
                    internas que iteractuan con el datastore y repercución de implementar modificaciones alli 
                     en otras funcionalidades-->
                    <!-- <div class="form-group">
                        <label class="col-sm-3 control-label">Nombre Corto:</label>
                        <div class="col-sm-3"><input class="form-control" type="text"
                            name="<%=Const.ParamsNames.INSTRUCTOR_SHORT_NAME%>" id="<%=Const.ParamsNames.INSTRUCTOR_SHORT_NAME%>"
                            value="<%=data.account.name%>"
                            data-toggle="tooltip" data-placement="top" title="Editar si lo desea su nombre corto"
                            maxlength=<%=FieldValidator.PERSON_NAME_MAX_LENGTH%> tabindex="1"
                            placeholder="Editar si lo desea su nombre corto" required />
                        </div>
                    </div>
                     -->
                    <div class="form-group">
                        <label class="col-sm-3 control-label">Nombre Completo:</label>
                        <div class="col-sm-3"><input class="form-control" type="text"
                            name="<%=Const.ParamsNames.INSTRUCTOR_NAME%>" id="<%=Const.ParamsNames.INSTRUCTOR_NAME%>"
                            value="<%=data.currentName%>"
                            data-toggle="tooltip" data-placement="top" title="Editar si lo desea su nombre completo"
                            maxlength=<%=FieldValidator.PERSON_NAME_MAX_LENGTH%> tabindex="1"
                            placeholder="Editar si lo desea su nombre completo" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">Curso:</label>
                        <div class="col-sm-3"><input class="form-control" type="text"
                            name="<%=Const.ParamsNames.COURSE_ID%>" id="<%=Const.ParamsNames.COURSE_ID%>"
                            value="<%=data.currentCourseId%>"
                            data-toggle="tooltip" data-placement="top" title="No puede cambiar este campo"
                            maxlength=<%=FieldValidator.PERSON_NAME_MAX_LENGTH%> tabindex="1"
                            placeholder="No puede cambiar este campo" readonly />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">Rol:</label>
                        <div class="col-sm-3"><input class="form-control" type="text"
                            name="<%=Const.ParamsNames.INSTRUCTOR_ROLE_NAME%>" id="<%=Const.ParamsNames.INSTRUCTOR_ROLE_NAME%>"
                            value="<%=data.currentRol %>"
                            data-toggle="tooltip" data-placement="top" title="No puede editar este campo"
                            maxlength=<%=FieldValidator.PERSON_NAME_MAX_LENGTH%> tabindex="1"
                            placeholder="No puede editar este campo" readonly />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">Email:</label>
                        <div class="col-sm-9"><input class="form-control" type="text"
                            name="<%=Const.ParamsNames.INSTRUCTOR_EMAIL%>" id="<%=Const.ParamsNames.INSTRUCTOR_EMAIL%>"
                            value="<%=data.currentEmail %>"
                            data-toggle="tooltip" data-placement="top" title="No se le permite editar su correo"
                            maxlength=<%=FieldValidator.EMAIL_MAX_LENGTH%> tabindex=2
                            placeholder="No se le permite editar su correo" readonly/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-9"><input id="btnAddCourse" type="submit" class="btn btn-primary"
                                onclick="" value="Guardar cambios" tabindex="3">
                        </div>
                    </div>
                </form>
            </div>
        </div>
        </div>
    </div>

    <div id="frameBottom">
        <jsp:include page="<%=Const.ViewURIs.FOOTER%>" />
    </div>
    </body>

</html>