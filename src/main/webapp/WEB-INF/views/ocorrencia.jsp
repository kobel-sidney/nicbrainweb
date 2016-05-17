<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<security:authentication property="principal" var="usuario" />

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html>
    <head>
        <meta charset="utf-8" />
        <title>NicBrain | Cadastro de Ocorrências</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <meta content="" name="description" />
        <meta content="" name="author" />
        <!-- BEGIN PAGE FIRST SCRIPTS -->
        <script src="<c:url value="/resources/assets/global/plugins/pace/pace.min.js" />" type="text/javascript"></script>
        <!-- END PAGE FIRST SCRIPTS -->
        <!-- BEGIN PAGE TOP STYLES -->
        <link href="<c:url value="/resources/assets/global/plugins/pace/themes/pace-theme-big-counter.css" />" rel="stylesheet" type="text/css" />
        <!-- END PAGE TOP STYLES -->
        <!-- BEGIN GLOBAL MANDATORY STYLES -->
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/assets/global/plugins/font-awesome/css/font-awesome.min.css" />" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/assets/global/plugins/simple-line-icons/simple-line-icons.min.css" />" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/assets/global/plugins/bootstrap/css/bootstrap.min.css" />" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/assets/global/plugins/uniform/css/uniform.default.css" />" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" />" rel="stylesheet" type="text/css" />
        <!-- END GLOBAL MANDATORY STYLES -->
        <!-- Início Bootstrap Select -->
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/global/plugins/bootstrap-select/css/bootstrap-select.min.css" />" />
        <!-- Fim Bootstrap Select -->
        <!-- Início Datetimepicker -->
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/global/plugins/clockface/css/clockface.css" />" />
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/global/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" />" />
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/global/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css" />" />
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/global/plugins/bootstrap-colorpicker/css/colorpicker.css" />" />
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/global/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css" />" />
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" />" />
        <!-- Fim Datetimepicker -->
        <!-- BEGIN PAGE STYLES -->

        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/global/plugins/bootstrap-toastr/toastr.min.css" />"/>

        <link href="<c:url value="/resources/assets/global/plugins/bootstrap-modal/css/bootstrap-modal-bs3patch.css" />" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/assets/global/plugins/bootstrap-modal/css/bootstrap-modal.css" />" rel="stylesheet" type="text/css" />
        <!-- END PAGE STYLES -->

        <!-- BEGIN THEME GLOBAL STYLES -->
        <link href="<c:url value="/resources/assets/global/css/components-md.min.css" />" rel="stylesheet" id="style_components" type="text/css" />
        <link href="<c:url value="/resources/assets/global/css/plugins-md.min.css" />" rel="stylesheet" type="text/css" />
        <!-- END THEME GLOBAL STYLES -->
        <!-- BEGIN THEME LAYOUT STYLES -->
        <link href="<c:url value="/resources/assets/layouts/layout/css/layout.min.css" />" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/assets/layouts/layout/css/themes/darkblue.min.css" />" rel="stylesheet" type="text/css" id="style_color" />
        <link href="<c:url value="/resources/assets/layouts/layout/css/custom.min.css" />" rel="stylesheet" type="text/css" />
        <!-- END THEME LAYOUT STYLES -->
        <!-- CSS DO MAPA -->
        <link href="<c:url value="/resources/css/custom-nicbrain.css" />" rel="stylesheet" type="text/css"/>

        <link rel="icon" href="<c:url value="/favicon-16.png" />" sizes="16x16" />
        <link rel="icon" href="<c:url value="/favicon-32.png" />" sizes="32x32" />
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
    <body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white page-full-width page-md">
        <!-- BEGIN HEADER -->
        <div class="page-header navbar navbar-fixed-top">
            <!-- BEGIN HEADER INNER -->
            <div class="page-header-inner ">
                <!-- BEGIN LOGO -->
                <div class="page-logo">
                    <a href="index.html">
                        <img src="<c:url value="/resources/images/logo_nicbrain.png" />" alt="logo" class="logo-default" /> </a>
                    <div class="menu-toggler sidebar-toggler"> </div>
                </div>
                <!-- END LOGO -->
                <div class="hor-menu hor-menu-light hidden-sm hidden-xs">
                    <ul class="nav navbar-nav">
                        <!-- DOC: Remove data-hover="dropdown" and data-close-others="true" attributes below to disable the horizontal opening on mouse hover -->
                        <li class="classic-menu-dropdown">
                            <a data-toggle="dropdown" href="javascript:;">
                                <i class="fa fa-wrench"></i> Ferramentas <i class="fa fa-angle-down"></i>
                            </a>
                            <ul class="dropdown-menu pull-left">
                                <li>
                                    <a  href="javascript:;" onclick="quickPanel.showGeneralConfig();">
                                        <i class="fa fa-cogs"></i> Configurações do Mapa </a>
                                </li>
                                <li>
                                    <a href="<c:url value="/rest/cameras/list" />">
                                        <i class="fa fa-video-camera"></i> Cameras </a>
                                </li>
                            </ul>
                        </li>

                        <li class="classic-menu-dropdown hide"><a id="modalCameras" data-toggle="modal" href="#dlgCameras"></a></li>

                        <li class="classic-menu-dropdown hide"><a id="modalOcorrencia" data-toggle="modal" href="#dlgOcorrencia"></a></li>
                    </ul>
                </div>
                <!-- END HORIZANTAL MENU -->
                <!-- BEGIN HEADER SEARCH BOX -->
                <!-- DOC: Apply "search-form-expanded" right after the "search-form" class to have half expanded search box -->
                <form class="search-form">
                    <div class="input-group">
                        <input id="pesquisa_endereco" type="text" class="form-control" placeholder="Pesquisar endereço...">
                        <span class="input-group-btn">
                            <a href="javascript:;" class="btn submit"><i class="icon-magnifier"></i></a>
                        </span>
                    </div>
                </form>
                <!-- END HEADER SEARCH BOX -->
                <!-- BEGIN RESPONSIVE MENU TOGGLER -->
                <a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse"> </a>
                <!-- END RESPONSIVE MENU TOGGLER -->
                <!-- BEGIN TOP NAVIGATION MENU -->
                <div class="top-menu">
                    <ul class="nav navbar-nav pull-right">
                        <!-- BEGIN NOTIFICAÇÃO OCORRENCIA DROPDOWN -->
                        <!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
                        <li class="dropdown dropdown-extended dropdown-notification" id="header_notification_bar">
                            <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                <i class="icon-fire"></i>
                                <span class="badge badge-danger notif_ocorrencia_quant"> 0 </span>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="external">
                                    <h3><span class="bold"><span class="notif_ocorrencia_quant"> 0 </span> notificação(ões)</span> de ocorrência</h3>
                                </li>
                                <li>
                                    <ul id="notif_ocorrencia_list" class="dropdown-menu-list scroller" style="height: 250px;" data-handle-color="#637283">

                                    </ul>
                                </li>
                            </ul>
                        </li>
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
        <!-- BEGIN HEADER & CONTENT DIVIDER -->
        <div class="clearfix"> </div>
        <!-- END HEADER & CONTENT DIVIDER -->
        <!-- BEGIN CONTAINER -->
        <div class="page-container">
            <!-- BEGIN SIDEBAR -->

            <!-- END SIDEBAR -->
            <!-- BEGIN CONTENT -->
            <div class="page-content-wrapper">
                <div class="page-content mapa-content">
                    <!-- BEGIN PAGE CONTENT-->
                    <div id="map-ocorrencia" class="full-height-content"></div>

                    <div id="form-legenda" class="form-botton-right hide">
                        <div class="portlet box grey-gallery" style="margin-bottom: 0;">
                            <div class="portlet-title">
                                <div class="caption">
                                    <i class="icon-list"></i> Legenda
                                </div>
                            </div>
                            <div class="portlet-body" style="display: block;">
                                <div style="font-size: 14px;">
                                    <img src='<c:url value="/resources/images/maps/pin_posto_servico.png" />' width="18" height="20" /> Posto de serviço<br />
                                    <img src='<c:url value="/resources/images/maps/pin_ocorrencia.png" />' width="18" height="20" /> Viatura da polícia fora da área<br />
                                    <img src='<c:url value="/resources/images/maps/clusterOcorrencia.png" />' width="18" height="20" /> Agrupamento de ocorrências
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="dlgCameras" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false" aria-hidden="true" data-width="1200">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                            <h4 class="modal-title">Câmeras mais próximas</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div id="conteudoCameras">

                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" data-dismiss="modal" class="btn btn-default">Fechar</button>
                        </div>
                    </div>

                    <div class="modal fade" id="dlgOcorrencia" tabindex="-1" data-backdrop="static" data-keyboard="false" aria-hidden="true" data-width="800">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                            <h4 class="modal-title">Cadastro de Ocorrência</h4>
                        </div>
                        <div class="modal-body">
                            <div id="eventosPanel">
                                <div class="tasks-widget">
                                    <div class="task-content">
                                        <div class="scroller" style="height: 305px;" data-always-visible="1" data-rail-visible1="1">
                                            <!-- START TASK LIST -->
                                            <ul class="task-list">
                                                <c:forEach items="${eventos}" var="evento">
                                                    <li>
                                                        <div class="task-title">
                                                            <span class="task-title-sp"> ${evento.nomeEvento} </span>
                                                            <%-- <span class="label label-sm label-warning">${evento.situacao}</span> --%>
                                                        </div>
                                                        <div class="task-config">
                                                            <div class="task-config-btn btn-group">
                                                                <button class="btn btn-xs default" onclick="Ocorrencia.addOcorrencia(${evento.idEvento})">
                                                                    <i class="icon-fire"></i> Gerar Ocorrência
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                            <!-- END START TASK LIST -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="ocorrenciaPanel">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label">Classificação</label> 
                                            <select id="classificacao" class="bs-select form-control" data-size="6">
                                                <option value="0">Nada selecionado...</option>
                                                <c:forEach items="${classificacoes.options}" var="option">
                                                    <option value="${option.value}">${option.label}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label">Tipo</label>
                                            <select id="tipo" class="bs-select form-control" data-show-subtext="true" data-size="6">
                                                <option value="0">Nenhum item...</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="control-label">Gravidade</label>
                                            <select id="gravidade" class="bs-select form-control" data-size="6">
                                                <option value="0">Nada selecionado...</option>
                                                <c:forEach items="${gravidades.options}" var="option">
                                                    <option value="${option.value}">${option.label}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Descrição Ocorrência</label>
                                            <textarea id="descricao" class="form-control" maxlength="225" rows="6"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" id="fechar_dialog" class="btn default" data-dismiss="modal">Cancelar</button>
                            <button type="button" class="btn btn-primary btn-save" onclick="Ocorrencia.salvar();">Salvar</button>
                        </div>
                    </div>
                </div>
                <!-- END PAGE CONTENT-->
            </div>
        </div>
        <!-- END CONTENT -->
        <!-- BEGIN QUICK SIDEBAR -->
        <a href="javascript:;" class="page-quick-sidebar-toggler">
            <i class="icon-login"></i>
        </a>
        <div class="page-quick-sidebar-wrapper" data-close-on-body-click="true">
            <div class="page-quick-sidebar">
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a href="javascript:;" id="titulo_quick"> Ronda Online</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane page-quick-sidebar-settings" id="quick_config_geral">
                        <div class="page-quick-sidebar-settings-list">
                            <h3 class="list-heading">Configurações Gerais</h3>
                            <ul class="list-items borderless">

                                <li> Exibir Câmeras
                                    <input type="checkbox" id="check_camera" class="make-switch" data-size="small" data-on-color="danger" data-on-text="Sim" data-off-color="default" data-off-text="Não">
                                </li>
                                <li> Exibir Postos de Serviço
                                    <input type="checkbox" id="check_posto_servico" class="make-switch" data-size="small" data-on-color="danger" data-on-text="Sim" data-off-color="default" data-off-text="Não">
                                </li>
                                <li> Enable Legenda do Mapa
                                    <input type="checkbox" id="check_legenda_mapa" class="make-switch" data-size="small" data-on-color="danger" data-on-text="Sim" data-off-color="default" data-off-text="Não">    
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane page-quick-sidebar-alerts" id="quick_usuario">
                        <div class="page-quick-sidebar-alerts-list">
                            <ul class="list-items borderless">
                                <li>
                                    <div class="todo-tasklist">
                                        <div class="todo-tasklist-item todo-tasklist-item-border-green">
                                            <img class="todo-userpic pull-left userPhoto" src="<c:url value="/resources/images/anonimo.png" />" width="48px" height="48px">
                                            <div class="todo-tasklist-item-title userName"> Weverton Silva </div>
                                            <div class="todo-tasklist-item-text"> </div>
                                            <div class="todo-tasklist-controls pull-left">
                                                <span class="todo-tasklist-badge">
                                                    <i class="fa fa-car"></i> <span class="nameVehicle"></span>
                                                </span>
                                                <span class="todo-tasklist-date">
                                                    <i class="icon-fire"></i><span class="flagOcorrencia"></span> 
                                                </span>
                                                <span class="todo-tasklist-badge badge badge-roundless">Usuário</span>
                                            </div>
                                        </div>
                                        <div class="todo-tasklist-item todo-tasklist-item-border-blue">
                                            <div class="todo-tasklist-item-title"><i class="icon-users"></i> Tripulantes </div>

                                            <div class="crewItems">
                                            </div>
                                        </div>
                                        <div class="todo-tasklist-item todo-tasklist-item-border-red">
                                            <div class="todo-tasklist-item-title"><i class="icon-fire"></i> Ocorrências Atuais </div>

                                            <div class="ocorrenciaItems">
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane active page-quick-sidebar-chat" id="quick_occurrence">
                        <div class="page-quick-sidebar-chat-users" data-rail-color="#ddd" data-wrapper-class="page-quick-sidebar-list">
                            <h3 class="list-heading">Informações Gerais</h3>
                            <ul class="media-list list-items">
                                <li class="media">
                                    <img class="media-object classification_photo">
                                    <div class="media-body">
                                        <h4 class="media-heading classification_occurrence"></h4>

                                        <h4 class="media-heading type_classification_occurrence"></h4>
                                        <h4 class="media-heading data_occurrence"></h4>


                                    </div>
                                </li>
                            </ul>
                            <ul class="list-items borderless">
                                <li>
                                    <div class="description_occurrence"></div>
                                </li>
                                <li class="li_img_occurrence">
                                    <img class="img_occurrence" width="100%" height="200px" />
                                </li>
                                <li class="cameras_nearby">
                                    <button type="button" class="btn green btn-sm" onclick="cameraCtrl.mostrarCameras();quickPanel.toggle();">Exibir câmeras próximas</button>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div> 
        <!-- END QUICK SIDEBAR -->
    </div>
    <!-- END CONTAINER -->
    <!-- BEGIN FOOTER -->
    <div class="page-footer">
        <div class="page-footer-inner"> 2015 &copy; NicBrain desenvolvido por 
            <a href="http://kobel.com.br" title="Kobel - Soluções de Inteligência em Segurança" target="_blank">Kobel</a>.
        </div>
        <div class="scroll-to-top">
            <i class="icon-arrow-up"></i>
        </div>
    </div>

    <!-- END FOOTER -->
    <!--[if lt IE 9]> -->
    <!--<script src="<c:url value="/resources/assets/global/plugins/respond.min.js" />"></script>-->
    <!--<script src="<c:url value="/resources/assets/global/plugins/excanvas.min.js" />"></script>--> 
    <!-- <![endif]-->
    <!-- BEGIN CORE PLUGINS -->
    <script src="<c:url value="/resources/js/jquery-2.1.4.min.js" />" type="text/javascript"></script>
    <script src="<c:url value="/resources/assets/global/plugins/bootstrap/js/bootstrap.min.js" />" type="text/javascript"></script>
    <script src="<c:url value="/resources/assets/global/plugins/js.cookie.min.js" />" type="text/javascript"></script>
    <script src="<c:url value="/resources/assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" />" type="text/javascript"></script>
    <script src="<c:url value="/resources/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" />" type="text/javascript"></script>
    <script src="<c:url value="/resources/assets/global/plugins/jquery.blockui.min.js" />" type="text/javascript"></script>
    <script src="<c:url value="/resources/assets/global/plugins/uniform/jquery.uniform.min.js" />" type="text/javascript"></script>
    <script src="<c:url value="/resources/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" />" type="text/javascript"></script>
    <!-- END CORE PLUGINS -->
    <script src="<c:url value="/resources/assets/global/plugins/jquery-ui/jquery-ui.min.js" />" type="text/javascript"></script>
    <!-- BEGIN THEME GLOBAL SCRIPTS -->
    <script src="<c:url value="/resources/assets/global/scripts/app.min.js" />" type="text/javascript"></script>
    <!-- END THEME GLOBAL SCRIPTS -->
    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script src="<c:url value="/resources/assets/pages/scripts/components-bootstrap-switch.min.js" />" type="text/javascript"></script>

    <script src="<c:url value="/resources/assets/global/plugins/bootstrap-toastr/toastr.min.js" />" type="text/javascript"></script>

    <!-- Início Bootstrap Select -->
    <script type="text/javascript" src="<c:url value="/resources/assets/global/plugins/bootstrap-select/js/bootstrap-select.min.js" />"></script>
    <!-- Fim Bootstrap Select -->

    <script src="<c:url value="/resources/assets/pages/scripts/components-bootstrap-select.min.js" />" type="text/javascript"></script>

    <script src="<c:url value="/resources/assets/global/plugins/bootstrap-modal/js/bootstrap-modalmanager.js" />" type="text/javascript"></script>
    <script src="<c:url value="/resources/assets/global/plugins/bootstrap-modal/js/bootstrap-modal.js" />" type="text/javascript"></script>
    <!-- END PAGE LEVEL SCRIPTS -->
    <script src="<c:url value="/resources/assets/pages/scripts/ui-modals.min.js" />" type="text/javascript"></script>

    <!-- BEGIN THEME LAYOUT SCRIPTS -->
    <script src="<c:url value="/resources/assets/layouts/layout/scripts/layout.min.js" />" type="text/javascript"></script>
    <script src="<c:url value="/resources/assets/layouts/layout/scripts/demo.min.js" />" type="text/javascript"></script>
    <script src="<c:url value="/resources/assets/layouts/global/scripts/quick-sidebar.min.js" />" type="text/javascript"></script>
    <!-- END THEME LAYOUT SCRIPTS -->

    <!-- SCRIPTS DO MAPA -->
    <script src="https://maps.googleapis.com/maps/api/js?v=3.23&amp;libraries=geometry,places"></script>
    <script src="<c:url value="/resources/js/markerclusterer_compiled.js" />" type="text/javascript"></script>
    <script src="<c:url value="/resources/js/properties_js.js" />" type="text/javascript"></script>
    <script src="<c:url value="/resources/js/mapa-ocorrencia.js" />" type="text/javascript"></script>
    <script>
                                        jQuery(document).ready(function () {
                                            Ocorrencia.iniciarMapa();
                                        });
    </script>
</body>
<!-- END BODY -->
</html>
