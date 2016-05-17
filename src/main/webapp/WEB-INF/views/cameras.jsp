<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
    <!--<![endif]-->
    <!-- BEGIN HEAD -->
    <head>
        <meta charset="utf-8"/>
        <title>NicBrain - Ronda Online</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
        <meta http-equiv="Content-type" content="text/html; charset=utf-8">
        <meta content="" name="description"/>
        <meta content="" name="author"/>
        <!-- BEGIN PAGE FIRST SCRIPTS -->
        <script src="<c:url value="/resources/assets/global/plugins/pace/pace.min.js" />" type="text/javascript"></script>
        <!-- END PAGE FIRST SCRIPTS -->
        <!-- BEGIN PAGE TOP STYLES -->
        <link href="<c:url value="/resources/assets/global/plugins/pace/themes/pace-theme-big-counter.css" />" rel="stylesheet" type="text/css" />
        <!-- END PAGE TOP STYLES -->
        <!-- BEGIN GLOBAL MANDATORY STYLES -->
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css"/>
        <link href="<c:url value="/resources/assets/global/plugins/font-awesome/css/font-awesome.min.css" />" rel="stylesheet" type="text/css"/>
        <link href="<c:url value="/resources/assets/global/plugins/simple-line-icons/simple-line-icons.min.css" />" rel="stylesheet" type="text/css"/>
        <link href="<c:url value="/resources/assets/global/plugins/bootstrap/css/bootstrap.min.css" />" rel="stylesheet" type="text/css"/>
        <link href="<c:url value="/resources/assets/global/plugins/uniform/css/uniform.default.css" />" rel="stylesheet" type="text/css"/>
        <link href="<c:url value="/resources/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" />" rel="stylesheet" type="text/css"/>
        <!-- END GLOBAL MANDATORY STYLES -->
        <!-- Início Bootstrap Select -->
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/global/plugins/bootstrap-select/css/bootstrap-select.min.css" />" />
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/global/plugins/select2/css/select2.css" />"/>
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/global/plugins/jquery-multi-select/css/multi-select.css" />"/>
        <!-- Fim Bootstrap Select -->
        <!-- BEGIN THEME GLOBAL STYLES -->
        <link href="<c:url value="/resources/assets/global/css/components-md.min.css" />" rel="stylesheet" id="style_components" type="text/css" />
        <link href="<c:url value="/resources/assets/global/css/plugins-md.min.css" />" rel="stylesheet" type="text/css" />
        <!-- END THEME GLOBAL STYLES -->
        <!-- BEGIN THEME LAYOUT STYLES -->
        <link href="<c:url value="/resources/assets/layouts/layout/css/layout.min.css" />" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/assets/layouts/layout/css/themes/darkblue.min.css" />" rel="stylesheet" type="text/css" id="style_color" />
        <link href="<c:url value="/resources/assets/layouts/layout/css/custom.min.css" />" rel="stylesheet" type="text/css" />
        <!-- END THEME LAYOUT STYLES -->
        <!-- END THEME STYLES -->
        <!--         Início declaração - JS do mapa -->
        <link href="<c:url value="/resources/css/custom-nicbrain.css" />" rel="stylesheet" type="text/css" />
        <!--         Fim declaração - JS do mapa -->

        <link rel="icon" href="<c:url value="/favicon-16.png" />" sizes="16x16"/>
        <link rel="icon" href="<c:url value="/favicon-32.png" />" sizes="32x32"/>
    </head>
    <!-- END HEAD -->
    <!-- BEGIN BODY -->
    <!-- DOC: Apply "page-header-fixed-mobile" and "page-footer-fixed-mobile" class to body element to force fixed header or footer in mobile devices -->
    <!-- DOC: Apply "page-sidebar-closed" class to the body and "page-sidebar-menu-closed" class to the sidebar menu element to hide the sidebar by default -->
    <!-- DOC: Apply "page-sidebar-hide" class to the body to make the sidebar completely hidden on toggle -->
    <!-- DOC: Apply "page-sidebar-closed-hide-logo" class to the body element to make the logo hidden on sidebar toggle -->
    <!-- DOC: Apply "page-sidebar-hide" class to body element to completely hide the sidebar on sidebar toggle -->
    <!-- DOC: Apply "page-sidebar-fixed" class to have fixed sidebar -->
    <!-- DOC: Apply "page-footer-fixed" class to the body element to have fixed footer -->
    <!-- DOC: Apply "page-sidebar-reversed" class to put the sidebar on the right side -->
    <!-- DOC: Apply "page-full-width" class to the body element to have full width page without the sidebar menu -->
    <body class="page-md page-header-fixed page-quick-sidebar-over-content page-full-width page-container-bg-solid">
        <!-- BEGIN HEADER -->
        <div class="page-header md-shadow-z-1-i navbar navbar-fixed-top">
            <!-- BEGIN HEADER INNER -->
            <div class="page-header-inner">
                <!-- BEGIN LOGO -->
                <div class="page-logo">
                    <a href="<c:url value="/" />">
                        <img src="<c:url value="/resources/images/logo_nicbrain.png" />" alt="logo" class="logo-default"/>
                    </a>
                    <div class="menu-toggler sidebar-toggler hide">
                        <!-- DOC: Remove the above "hide" to enable the sidebar toggler button on header -->
                    </div>
                </div>
                <!-- END LOGO -->
                <!-- BEGIN RESPONSIVE MENU TOGGLER -->
                <a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse">
                </a>
                <!-- END RESPONSIVE MENU TOGGLER -->
                <!-- BEGIN HORIZANTAL MENU -->
                <!-- DOC: Apply "hor-menu-light" class after the "hor-menu" class below to have a horizontal menu with white background -->
                <!-- DOC: This is desktop version of the horizontal menu. The mobile version is defined(duplicated) sidebar menu below. So the horizontal menu has 2 seperate versions -->
                <div class="hor-menu hor-menu-light hidden-sm hidden-xs">
                    <ul class="nav navbar-nav">
                        <!-- DOC: Remove data-hover="dropdown" and data-close-others="true" attributes below to disable the horizontal opening on mouse hover -->
                        <li class="classic-menu-dropdown">
                            <a data-toggle="dropdown" href="javascript:;">
                                <i class="fa fa-cogs"></i> Configurações <i class="fa fa-angle-down"></i>
                            </a>
                            <ul class="dropdown-menu pull-left">
                                <li>
                                    <a onclick="cameras.toggleColumns(2)">
                                        <i class="fa fa-th-large"></i> 2 Colunas </a>
                                </li>
                                <li>
                                    <a onclick="cameras.toggleColumns(3)">
                                        <i class="fa fa-th"></i> 3 Colunas </a>
                                </li>
                            </ul>
                        </li>
                        <li class="classic-menu-dropdown">
                            <a data-toggle="dropdown" href="javascript:;">
                                <i class="fa fa-wrench"></i> Ferramentas <i class="fa fa-angle-down"></i>
                            </a>
                            <ul class="dropdown-menu pull-left">
                                <li>
                                    <a href="<c:url value="/rest/ronda/online" />">
                                        <i class="fa fa-eye"></i> Ronda Online </a>
                                </li>
                                <li>
                                    <a href="<c:url value="/rest/ronda/detalhe" />">
                                        <i class="fa fa-code-fork"></i> Detalhes da Ronda </a>
                                </li>
                                <li>
                                    <a href="<c:url value="/restrict/ListaCercaVirtual.nicbrain" />">
                                        <i class="fa fa-dot-circle-o"></i> Cerca Virtual </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <!-- END HORIZANTAL MENU -->
                <!-- BEGIN HEADER SEARCH BOX -->

                <!-- END HEADER SEARCH BOX -->
                <!-- BEGIN RESPONSIVE MENU TOGGLER -->
                <a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse">
                </a>
                <!-- END RESPONSIVE MENU TOGGLER -->
                <!-- BEGIN TOP NAVIGATION MENU -->
                <div class="top-menu">
                    <ul class="nav navbar-nav pull-right">
                        <!-- BEGIN NOTIFICAÇÃO VIATURA FORA DROPDOWN -->
                        <!-- END NOTIFICAÇÃO VIATURA FORA DROPDOWN -->
                        <!-- BEGIN NOTIFICAÇÃO OCORRENCIA DROPDOWN -->

                        <!-- END NOTIFICAÇÃO OCORRENCIA DROPDOWN -->
                        <!-- BEGIN USER LOGIN DROPDOWN -->
                        <li class="dropdown dropdown-user">
                            <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                <%--<img alt="" class="img-circle" src="../assets/layouts/layout/img/avatar3_small.jpg" />--%>
                                <span class="username username-hide-on-mobile"> <b>Usuário:</b> ${userName} </span>
                                <i class="fa fa-angle-down"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-default">
                                <li>
                                    <a href="javascript:;" onclick="window.close();">
                                        <i class="icon-close"></i> Fechar </a>
                                </li>
                            </ul>
                        </li>
                        <!-- END USER LOGIN DROPDOWN -->
                        <!-- BEGIN QUICK SIDEBAR TOGGLER -->
                        <!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
                        <li class="dropdown dropdown-quick-sidebar-toggler hide">
                            <a href="javascript:;" class="dropdown-toggle" id="btnQuick">
                                <i class="icon-logout"></i>
                            </a>
                        </li>
                        <!-- END QUICK SIDEBAR TOGGLER -->
                    </ul>
                </div>
                <!-- END TOP NAVIGATION MENU -->
            </div>
            <!-- END HEADER INNER -->
        </div>
        <!-- END HEADER -->
        <div class="clearfix">
        </div>
        <!-- BEGIN CONTAINER -->
        <div class="page-container">
            <!-- BEGIN SIDEBAR -->

            <!-- END SIDEBAR -->
            <!-- BEGIN CONTENT -->
            <div class="page-content-wrapper">
              <div class="page-content">

                    <!-- BEGIN PAGE CONTENT-->
                      <div class="row">
                				<div class="col-md-12">
                					<div class="full-height-content full-height-content-scrollable">
                						<div class="full-height-content-body">

                            <c:forEach items="${cameras}" var="camera">
                              <div class="camera col-md-4" style="padding-left: 0.5px; padding-right: 0.5px;">
                      					<!-- BEGIN Portlet PORTLET-->
                      					<div class="portlet light" style="margin: 5px;">
                                  <div class="portlet-title">
                      							<div class="caption font-red-sunglo">
                      								<i class="icon-camcorder font-red-sunglo"></i>
                      								<span class="caption-subject bold uppercase"> Câmera</span>
                      								<span class="caption-helper">${camera.nome}</span>
                      							</div>
                      							<div class="actions">
                      								<a class="btn btn-circle btn-icon-only btn-default fullscreen" href="javascript:;">
                      								</a>
                      							</div>
                      						</div>
                      						<div class="portlet-body">
                                    <object classid="clsid:9BE31822-FDAD-461B-AD51-BE1D1C159921" codebase="http://download.videolan.org/pub/videolan/vlc/last/win32/axvlc.cab" id="vlc2">
                                      <param name="autostart" value="true" />
                                      <embed type="application/x-vlc-plugin" pluginspage="http://www.videolan.org" name="vlc" width="100%" height="260" controls="false" mute="true" id="vlc3" target="${camera.endereco}" />
                                    </object>
                      						</div>
                      					</div>
                      					<!-- END Portlet PORTLET-->
                      				</div>
                          </c:forEach>

                        </div>
          					    </div>
                      </div>
                    </div>
                    <!-- END PAGE CONTENT-->
            </div>
            </div>
            <!-- END CONTENT -->
            <!-- BEGIN QUICK SIDEBAR -->

            <!-- END QUICK SIDEBAR -->
        </div>
        <!-- END CONTAINER -->
        <!-- BEGIN FOOTER -->
        <div class="page-footer">
            <div class="page-footer-inner">
                2015 &copy; NicBrain desenvolvido por <a class="font-red-sunglo" href="http://kobel.com.br/" title="Kobel - Soluções de Inteligência em Segurança" target="_blank">Kobel</a>.
            </div>
            <div class="scroll-to-top">
                <i class="icon-arrow-up"></i>
            </div>
        </div>
        <!-- END FOOTER -->
        <!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
        <!-- BEGIN CORE PLUGINS -->
        <!--[if lt IE 9]>
        <script src="<c:url value="/resources/assets/global/plugins/respond.min.js" />"></script>
        <script src="<c:url value="/resources/assets/global/plugins/excanvas.min.js" />"></script>
        <![endif]-->
        <script src="<c:url value="/resources/js/jquery-2.1.4.min.js" />" type="text/javascript"></script>
        <!-- Início declaração - JS do mapa -->
        <script src="<c:url value="/resources/js/properties_js.js" />" type="text/javascript"></script>
        <script src="<c:url value="/resources/js/cameras.js" />" type="text/javascript"></script>
        <!-- Fim declaração - JS do mapa -->
        <!-- IMPORTANT! Load jquery-ui.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
        <script src="<c:url value="/resources/assets/global/plugins/jquery-ui/jquery-ui.min.js" />" type="text/javascript"></script>
        <script src="<c:url value="/resources/assets/global/plugins/bootstrap/js/bootstrap.min.js" />" type="text/javascript"></script>
        <script src="<c:url value="/resources/assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" />" type="text/javascript"></script>
        <script src="<c:url value="/resources/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" />" type="text/javascript"></script>
        <script src="<c:url value="/resources/assets/global/plugins/jquery.blockui.min.js" />" type="text/javascript"></script>
        <script src="<c:url value="/resources/assets/global/plugins/jquery.cokie.min.js" />" type="text/javascript"></script>
        <script src="<c:url value="/resources/assets/global/plugins/uniform/jquery.uniform.min.js" />" type="text/javascript"></script>
        <script src="<c:url value="/resources/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" />" type="text/javascript"></script>
        <!-- END CORE PLUGINS -->
        <script src="<c:url value="/resources/assets/global/plugins/jquery-ui/jquery-ui.min.js" />" type="text/javascript"></script>
        <!-- BEGIN THEME GLOBAL SCRIPTS -->
        <script src="<c:url value="/resources/assets/global/scripts/app.min.js" />" type="text/javascript"></script>
        <!-- END THEME GLOBAL SCRIPTS -->
        <!-- Início Bootstrap Select -->
        <script type="text/javascript" src="<c:url value="/resources/assets/global/plugins/bootstrap-select/js/bootstrap-select.min.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/assets/global/plugins/select2/js/select2.min.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/assets/global/plugins/jquery-multi-select/js/jquery.multi-select.js" />"></script>
        <!-- Fim Bootstrap Select -->
        <!-- BEGIN THEME LAYOUT SCRIPTS -->
        <script src="<c:url value="/resources/assets/layouts/layout/scripts/layout.min.js" />" type="text/javascript"></script>
        <script src="<c:url value="/resources/assets/layouts/layout/scripts/demo.min.js" />" type="text/javascript"></script>
        <script src="<c:url value="/resources/assets/layouts/global/scripts/quick-sidebar.min.js" />" type="text/javascript"></script>
        <!-- END THEME LAYOUT SCRIPTS -->
        <script>
                                                            jQuery(document).ready(function () {

                                                            });
        </script>
        <!-- END JAVASCRIPTS -->
    </body>
    <!-- END BODY -->
</html>
