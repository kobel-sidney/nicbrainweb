<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html>
    <head>
        <title>NicBrain | Detalhes da Ronda</title>
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
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/global/plugins/bootstrap-toastr/toastr.min.css" />"/>

        <link href="<c:url value="/resources/assets/global/plugins/bootstrap-modal/css/bootstrap-modal-bs3patch.css" />" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/assets/global/plugins/bootstrap-modal/css/bootstrap-modal.css" />" rel="stylesheet" type="text/css" />

        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/global/plugins/bootstrap-select/css/bootstrap-select.min.css" />" />

        <!-- Início Datetimepicker -->
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/global/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" />"/>
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/global/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css" />"/>
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" />"/>
        <!-- Fim Datetimepicker -->
        <!-- BEGIN THEME GLOBAL STYLES -->
        <link href="<c:url value="/resources/assets/global/css/components-md.min.css" />" rel="stylesheet" id="style_components" type="text/css" />
        <link href="<c:url value="/resources/assets/global/css/plugins-md.min.css" />" rel="stylesheet" type="text/css" />
        <!-- END THEME GLOBAL STYLES -->
        <!-- BEGIN THEME LAYOUT STYLES -->
        <link href="<c:url value="/resources/assets/layouts/layout/css/layout.min.css" />" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/assets/layouts/layout/css/themes/darkblue.min.css" />" rel="stylesheet" type="text/css" id="style_color" />
        <link href="<c:url value="/resources/assets/layouts/layout/css/custom.min.css" />" rel="stylesheet" type="text/css" />
        <!-- END THEME LAYOUT STYLES -->
        <!--         Início declaração - JS do mapa -->
        <link href="<c:url value="/resources/css/custom-nicbrain.css" />" rel="stylesheet" type="text/css" />
        <!--         Fim declaração - JS do mapa -->

        <link rel="icon" href="<c:url value="/favicon-16.png" />" sizes="16x16"/>
        <link rel="icon" href="<c:url value="/favicon-32.png" />" sizes="32x32"/>
    </head>
    <!-- END HEAD -->
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
                        <li class="classic-menu-dropdown">
                            <a data-toggle="modal" id="dlg_rota" href="#dialog_rota">
                                <i class="fa  fa-filter"></i> Filtrar Rota
                            </a>
                        </li>
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
                    <div id="map-detalhe" class="full-height-content"></div>

                    <div id="form-information" class="form-botton-right hide">
                        <div class="portlet box grey-gallery" style="margin-bottom: 0;">
                            <div class="portlet-title">
                                <div class="caption">
                                    <i class="icon-list"></i> Informações da Rota
                                </div>
                            </div>
                            <div class="portlet-body" style="display: block;">
                                <div style="font-size: 14px;">
                                    <label style="font-weight: bold;">Viatura: </label> <span id="descricaoViatura"></span>
                                    <br />
                                    <label style="font-weight: bold;">Distância: </label> <span id="distancia"></span>
                                    <br />
                                    <label style="font-weight: bold;">Duração: </label> <span id="duracao"></span>
                                    <br />
                                    <label style="font-weight: bold;">Hora início: </label> <span id="inicio_info"></span>
                                    <br />
                                    <label style="font-weight: bold;">Hora fim: </label> <span id="fim_info"></span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="modal fade" id="dialog_rota" tabindex="-1" data-backdrop="static" data-keyboard="false" aria-hidden="true">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                            <h4 class="modal-title">Filtro da Rota</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-12">

                                    <div class="form-group">
                                        <label class="control-label">Ronda</label>
                                        <select id="id_ronda" class="bs-select form-control" data-show-subtext="true" data-size="5">
                                            <option value="0">Nada selecionado...</option>
                                            <c:forEach items="${selectRondas.options}" var="option" >
                                                <option data-subtext="${option.subText}" value="${option.value}">${option.label}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label">Data de Início</label>
                                        <div class="input-group input-group-sm date date-picker" data-date-format="dd/mm/yyyy">
                                            <input id="data_inicio" type="text" class="form-control" readonly>
                                            <span class="input-group-btn">
                                                <button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
                                            </span>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label">Hora de Início</label>
                                        <div class="input-group input-group-sm">
                                            <input id="hora_inicio" type="text" class="form-control timepicker timepicker-24">
                                            <span class="input-group-btn">
                                                <button class="btn default" type="button"><i class="fa fa-clock-o"></i></button>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="control-label">Data de Fim</label>
                                        <div class="input-group input-group-sm date date-picker" data-date-format="dd/mm/yyyy">
                                            <input id="data_fim" type="text" class="form-control" readonly>
                                            <span class="input-group-btn">
                                                <button class="btn default" type="button"><i class="fa fa-calendar"></i></button>
                                            </span>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label">Hora de Fim</label>
                                        <div class="input-group input-group-sm">
                                            <input id="hora_fim" type="text" class="form-control timepicker timepicker-24">
                                            <span class="input-group-btn">
                                                <button class="btn default" type="button"><i class="fa fa-clock-o"></i></button>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" id="close_dialog" class="btn default" data-dismiss="modal">Cancelar</button>
                            <button type="button" class="btn btn-primary" onclick="RondaDetalhe.aplicarFiltro();">Aplicar Filtro</button>
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
            <div class="page-footer-inner"> 2015 &copy; NicBrain desenvolvido por
                <a class="font-red-sunglo" href="http://kobel.com.br" title="Kobel - Soluções de Inteligência em Segurança" target="_blank">Kobel</a>.
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
        <script src="<c:url value="/resources/assets/global/plugins/bootstrap-toastr/toastr.min.js" />" type="text/javascript"></script>

        <script type="text/javascript" src="<c:url value="/resources/assets/global/plugins/bootstrap-select/js/bootstrap-select.min.js" />"></script>
        <script src="<c:url value="/resources/assets/global/plugins/bootstrap-modal/js/bootstrap-modalmanager.js" />" type="text/javascript"></script>
        <script src="<c:url value="/resources/assets/global/plugins/bootstrap-modal/js/bootstrap-modal.js" />" type="text/javascript"></script>

        <script src="<c:url value="/resources/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js" />" type="text/javascript"></script>
        <script src="<c:url value="/resources/assets/global/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js" />" type="text/javascript"></script>
        <script src="<c:url value="/resources/assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js" />" type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <script src="<c:url value="/resources/assets/pages/scripts/ui-modals.min.js" />" type="text/javascript"></script>
        <script src="<c:url value="/resources/assets/pages/scripts/components-bootstrap-select.min.js" />" type="text/javascript"></script>
        <script src="<c:url value="/resources/assets/pages/scripts/components-date-time-pickers.min.js" />" type="text/javascript"></script>
        <!-- BEGIN THEME LAYOUT SCRIPTS -->
        <script src="<c:url value="/resources/assets/layouts/layout/scripts/layout.min.js" />" type="text/javascript"></script>
        <script src="<c:url value="/resources/assets/layouts/layout/scripts/demo.min.js" />" type="text/javascript"></script>
        <script src="<c:url value="/resources/assets/layouts/global/scripts/quick-sidebar.min.js" />" type="text/javascript"></script>
        <!-- END THEME LAYOUT SCRIPTS -->
        <!-- SCRIPTS DO MAPA -->
        <script src="https://maps.googleapis.com/maps/api/js?v=3.23&amp;libraries=geometry,places"></script>
        <script src="<c:url value="/resources/js/properties_js.js" />" type="text/javascript"></script>
        <script src="<c:url value="/resources/js/ronda_detalhe.js" />" type="text/javascript"></script>
        <script>
                                jQuery(document).ready(function () {
                                    RondaDetalhe.iniciarMapa();
                                });
        </script>


        <!-- Início Datetimepicker -->
<!--        <script type="text/javascript" src="<c:url value="/resources/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/assets/global/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/assets/global/plugins/clockface/js/clockface.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/assets/global/plugins/bootstrap-daterangepicker/moment.min.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/assets/global/plugins/bootstrap-daterangepicker/daterangepicker.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/assets/global/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js" />"></script>-->
        <!-- Fim Datetimepicker -->
    </body>
    <!-- END BODY -->
</html>
