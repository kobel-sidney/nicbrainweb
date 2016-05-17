<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<security:authentication property="principal" var="usuario"/>

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
        <!-- Início - Pace (Barra de progresso) -->
        <script src="<c:url value="/resources/assets/global/plugins/pace/pace.min.js" />" type="text/javascript"></script>
        <link href="<c:url value="/resources/assets/global/plugins/pace/themes/pace-theme-minimal.css" />" rel="stylesheet" type="text/css"/>
        <!-- Fim - Pace (Barra de progresso) -->
        <!-- BEGIN GLOBAL MANDATORY STYLES -->
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css"/>
        <link href="<c:url value="/resources/assets/global/plugins/font-awesome/css/font-awesome.min.css" />" rel="stylesheet" type="text/css"/>
        <link href="<c:url value="/resources/assets/global/plugins/simple-line-icons/simple-line-icons.min.css" />" rel="stylesheet" type="text/css"/>
        <link href="<c:url value="/resources/assets/global/plugins/bootstrap/css/bootstrap.min.css" />" rel="stylesheet" type="text/css"/>
        <link href="<c:url value="/resources/assets/global/plugins/uniform/css/uniform.default.css" />" rel="stylesheet" type="text/css"/>
        <link href="<c:url value="/resources/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" />" rel="stylesheet" type="text/css"/>
        <!-- END GLOBAL MANDATORY STYLES -->
        <!-- Início Bootstrap Select -->
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/global/plugins/bootstrap-select/bootstrap-select.min.css" />"/>
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/global/plugins/select2/select2.css" />"/>
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/global/plugins/jquery-multi-select/css/multi-select.css" />"/>
        <!-- Fim Bootstrap Select -->
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/global/plugins/bootstrap-toastr/toastr.min.css" />"/>
        <!-- BEGIN PAGE STYLES -->
        <link href="<c:url value="/resources/assets/admin/pages/css/profile.css" />" rel="stylesheet" type="text/css"/>
		<link href="<c:url value="/resources/assets/admin/pages/css/tasks.css" />" rel="stylesheet" type="text/css" />
		<!-- END PAGE STYLES -->
		<!-- BEGIN PAGE LEVEL STYLES -->
<link href="<c:url value="/resources/assets/global/plugins/bootstrap-modal/css/bootstrap-modal-bs3patch.css" />" rel="stylesheet" type="text/css"/>
<link href="<c:url value="/resources/assets/global/plugins/bootstrap-modal/css/bootstrap-modal.css" />" rel="stylesheet" type="text/css"/>
<!-- END PAGE LEVEL STYLES -->
        <link href="<c:url value="/resources/assets/global/css/components-md.css" />" id="style_components" rel="stylesheet" type="text/css"/>
        <link href="<c:url value="/resources/assets/global/css/plugins-md.css" />" rel="stylesheet" type="text/css"/>
        <link href="<c:url value="/resources/assets/admin/layout/css/layout.css" />" rel="stylesheet" type="text/css"/>
        <link id="style_color" href="<c:url value="/resources/assets/admin/layout/css/themes/darkblue.css" />" rel="stylesheet" type="text/css"/>
        <link href="<c:url value="/resources/assets/admin/layout/css/custom.css" />" rel="stylesheet" type="text/css"/>
        <!-- END THEME STYLES -->
        <link href="<c:url value="/resources/css/custom-nicbrain.css" />" rel="stylesheet" type="text/css"/>

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
    <body class="page-md page-header-fixed page-quick-sidebar-over-content page-quick-sidebar-over-content-transparent page-full-width">
        <!-- BEGIN HEADER -->
        <div class="page-header md-shadow-z-1-i navbar navbar-fixed-top">
            <!-- BEGIN HEADER INNER -->
            <div class="page-header-inner">
                <!-- BEGIN LOGO -->
                <div class="page-logo">
                    <a href="<c:url value="/" />">
                        <img src="<c:url value="/resources/assets/admin/layout/img/logo.png" />" alt="logo" class="logo-default"/>
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
                            <a href="javascript:;" onclick="RondaOnline.togglePanelGeral();">
                                <i class="fa fa-cogs"></i> Configurações do Mapa
                            </a>
                        </li>

                        <li class="classic-menu-dropdown">
                            <a data-toggle="dropdown" href="javascript:;">
                                <i class="fa fa-wrench"></i> Ferramentas <i class="fa fa-angle-down"></i>
                            </a>
                            <ul class="dropdown-menu pull-left">
                                <li>
                                    <a href="<c:url value="/rest/ronda/detalhe" />">
                                        <i class="fa fa-code-fork"></i> Detalhes da Ronda </a>
                                </li>
                                <li>
                                    <a href="<c:url value="/restrict/ListaCercaVirtual.nicbrain" />">
                                        <i class="fa fa-dot-circle-o"></i> Cerca Virtual </a>
                                </li>
                                <li>
                                    <a href="<c:url value="/rest/cameras/list" />">
                                        <i class="fa fa-video-camera"></i> Cameras </a>
                                </li>
                            </ul>
                        </li>
                        
                        <li class="classic-menu-dropdown hide"><a id="linkModal" data-toggle="modal" href="#dialog_rota"></a></li>
                        
                        <li class="classic-menu-dropdown hide"><a id="modalCameras" data-toggle="modal" href="#dlgCameras"></a></li>
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
                <a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse">
                </a>
                <!-- END RESPONSIVE MENU TOGGLER -->
                <!-- BEGIN TOP NAVIGATION MENU -->
                <div class="top-menu">
                    <ul class="nav navbar-nav pull-right">
                        <!-- BEGIN NOTIFICATION DROPDOWN -->
                        <!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
                        <li class="dropdown dropdown-extended dropdown-notification" id="header_notification_bar">
                            <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                <i class="fa fa-cab"></i>
                                <span class="badge badge-default quant_viaturasfora">0</span>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="external">
                                    <h3><span class="bold"><span class="quant_viaturasfora">0</span> viaturas</span> fora da área</h3>
                                </li>
                                <li>
                                    <ul id="notificacoes_viaturasfora" class="dropdown-menu-list scroller" style="height: 250px;" data-handle-color="#637283">

                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <!-- END NOTIFICATION DROPDOWN -->
                        <!-- BEGIN NOTIFICAÇÃO VIATURA FORA DROPDOWN -->
                        <!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
                        <li class="dropdown dropdown-extended dropdown-notification" id="header_inbox_bar">
                            <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                <i class="icon-fire"></i>
                                <span class="badge badge-default quant_ocorrencias">
                                    0 </span>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="external">
                                    <h3><span class="bold"><span class="quant_ocorrencias">0</span> notificações</span> de ocorrência</h3>
                                </li>
                                <li>
                                    <ul id="notificacoes_ocorrencias" class="dropdown-menu-list scroller" style="height: 250px;" data-handle-color="#637283">

                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <!-- END NOTIFICAÇÃO VIATURA FORA DROPDOW
                        <!-- BEGIN USER LOGIN DROPDOWN -->
                        <!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->

                        <!-- END USER LOGIN DROPDOWN -->
                        <!-- BEGIN QUICK SIDEBAR TOGGLER -->
                        <!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
                        <li class="dropdown dropdown-quick-sidebar-toggler hide">
                            <a href="javascript:;" class="dropdown-toggle" id="dropdown-config">
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
                <div class="page-content mapa-content">
                    <!-- BEGIN PAGE CONTENT-->
                    <div id="map-online" class="full-height-content"></div>

                    <div id="form-legenda" class="form-botton-right hide">
                        <div class="portlet box grey-gallery" style="margin-bottom: 0;">
                            <div class="portlet-title">
                                <div class="caption">
                                    <i class="icon-list"></i> Legenda
                                </div>
                            </div>
                            <div class="portlet-body" style="display: block;">
                                <div style="font-size: 14px;">
                                    <img src='<c:url value="/resources/images/maps/pin_user.png" />' width="18" height="20"  /> Viatura da Polícia<br />
                                    <img src='<c:url value="/resources/images/maps/pin_user_fora.png" />' width="18" height="20" /> Viatura da polícia fora da área<br />
                                    <img src='<c:url value="/resources/images/maps/pin_posto_servico.png" />' width="18" height="20" /> Posto de serviço<br />
                                    <img src='<c:url value="/resources/images/maps/clusterPolicia.png" />' width="18" height="20" /> Agrupamento de viaturas<br />
                                    <img src='<c:url value="/resources/images/maps/clusterOcorrencia.png" />' width="18" height="20" /> Agrupamento de ocorrências
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div id="dlgCameras" class="modal fade" tabindex="-1" data-width="1000">
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
                    
                    <div class="modal fade" id="dialog_rota" tabindex="-1"  data-backdrop="static" data-keyboard="false" aria-hidden="true">
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
																	<button class="btn btn-xs default" onclick="RondaOnline.addOcorrencia(${evento.idEvento})">
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
												<label class="control-label">Classificação</label> <select id="classificacao" class="bs-select form-control" data-size="5">
													<c:forEach items="${classificacoes.options}" var="option">
														<option value="${option.value}">${option.label}</option>
													</c:forEach>
												</select>
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label class="control-label">Tipo</label> <select id="tipo" class="bs-select form-control" data-show-subtext="true" data-size="5">
													<c:forEach items="${tipos.options}" var="option">
														<option data-subtext="${option.subText}" value="${option.value}">${option.label}</option>
													</c:forEach>
												</select>
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label class="control-label">Gravidade</label> <select id="gravidade" class="bs-select form-control" data-size="5">
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
												<textarea id="descricao" class="form-control" rows="3"></textarea>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" id="fechar_dialog" class="btn default" data-dismiss="modal">Cancelar</button>
								<button type="button" class="btn btn-primary" onclick="RondaOnline.salvar();">Salvar</button>
							</div>
						
					<!-- /.modal-dialog -->
                    <!-- END PAGE CONTENT-->
                </div>
            </div>
            <!-- END CONTENT -->
            <!-- BEGIN QUICK SIDEBAR -->
            <a href="javascript:;" class="page-quick-sidebar-toggler"><i class="icon-close"></i></a>
            <div class="page-quick-sidebar-wrapper">
                <div class="page-quick-sidebar">
                    <div class="nav-justified" id="panelGeral">
                        <ul class="nav nav-tabs nav-justified">
                            <li class="active">
                                <a href="#mapa_tab" data-toggle="tab">
                                    Mapa
                                </a>
                            </li>
                            <li>
                                <a href="#alerta_tab" data-toggle="tab">
                                    Alertas
                                </a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active page-quick-sidebar-alerts" id="mapa_tab">
                                <div class="page-quick-sidebar-alerts" data-rail-color="#ddd" data-wrapper-class="page-quick-sidebar-list">
                                    <h3 class="list-heading">Configurações</h3>
                                    <ul class="feeds list-items">
                                        <li>
                                            <div class="md-checkbox">
                                                <input type="checkbox" id="check_ps" class="md-check">
                                                <label for="check_ps">
                                                    <span></span>
                                                    <span class="check"></span>
                                                    <span class="box"></span>
                                                    Mostrar Postos de Serviços
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="md-checkbox">
                                                <input type="checkbox" id="check_o" class="md-check" checked="">
                                                <label for="check_o">
                                                    <span></span>
                                                    <span class="check"></span>
                                                    <span class="box"></span>
                                                    Mostrar Ocorrências
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="md-checkbox">
                                                <input type="checkbox" id="check_cameras" class="md-check">
                                                <label for="check_cameras">
                                                    <span></span>
                                                    <span class="check"></span>
                                                    <span class="box"></span>
                                                    Mostrar Câmeras
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="md-checkbox">
                                                <input type="checkbox" id="check_legenda_usuario" class="md-check">
                                                <label for="check_legenda_usuario">
                                                    <span></span>
                                                    <span class="check"></span>
                                                    <span class="box"></span>
                                                    Mostrar legenda do usuário
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="md-checkbox">
                                                <input type="checkbox" id="check_l" class="md-check">
                                                <label for="check_l">
                                                    <span></span>
                                                    <span class="check"></span>
                                                    <span class="box"></span>
                                                    Mostrar legenda do mapa
                                                </label>
                                            </div>
                                        </li>
                                    </ul>
                                    <h3 class="list-heading">Cerca Virtual</h3>
                                    <ul class="feeds list-items">
                                        <li>
                                            <div class="form-group">
                                                <label>Inspetoria</label>
                                                <div class="input-group input-group-sm">
                                                    <select class="bs-select form-control" data-size="5" id="cerca_virtual_filtro">
                                                        <c:forEach items="${selectGroup}" var="select" >
                                                            <optgroup label="${select.groupName}">
                                                                <c:forEach items="${select.options}" var="option" >
                                                                    <option value="${option.value}">${option.label}</option>
                                                                </c:forEach>
                                                            </optgroup>
                                                        </c:forEach>
                                                    </select>
                                                    <span class="input-group-btn">
                                                        <button class="btn blue" type="button" onclick="RondaOnline.aplicarFiltro();">Filtrar</button>
                                                    </span>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="tab-pane page-quick-sidebar-alerts" id="alerta_tab">
                                <div class="page-quick-sidebar-alerts-list">
                                    <h3 class="list-heading">Configurações</h3>
                                    <ul class="feeds list-items">
                                        <li>
                                            <div class="md-checkbox">
                                                <input type="checkbox" id="alerta_email" class="md-check" checked="">
                                                <label for="alerta_email">
                                                    <span></span>
                                                    <span class="check"></span>
                                                    <span class="box"></span>
                                                    Receber email de alerta quando uma viatura sair da cerca
                                                </label>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="nav-justified hide" id="panelUsuario">
                        <div class="tab-content">
                            
                            <div class="tab-pane active page-quick-sidebar-alerts" id="teste">
                                <div class="page-quick-sidebar-alerts-list">
                                    <ul class="feeds list-items">
                                        <li>
                                            <!-- PORTLET MAIN -->
						<div class="portlet light profile-sidebar-portlet">
							<!-- SIDEBAR USERPIC -->
							<div class="profile-userpic">
								<img src="<c:url value="/resources/assets/admin/pages/media/profile/profile_user.jpg" />" id="fotoUsuario" style="height: 140px;" class="img-responsive" alt="">
							</div>
							<!-- END SIDEBAR USERPIC -->
							<!-- SIDEBAR USER TITLE -->
							<div class="profile-usertitle">
								<div class="profile-usertitle-name" id="nomeUsuario">
									 
								</div>
								<div class="profile-usertitle-job">
									 Usuário Ativo
								</div>
							</div>
							<!-- END SIDEBAR USER TITLE -->
							<!-- SIDEBAR BUTTONS -->
							<div class="profile-userbuttons">
								<button type="button" class="btn btn-circle green-haze btn-sm">Visualizar</button>
								<button type="button" class="btn btn-circle btn-danger btn-sm">Editar</button>
							</div>
							<!-- END SIDEBAR BUTTONS -->
							<!-- SIDEBAR MENU -->
							<div class="profile-usermenu">
								<ul class="nav" id="panelGuarnicoes">
								
								</ul>
							</div>
							<!-- END MENU -->
						</div>
						<!-- END PORTLET MAIN -->
                                        </li>
                                    </ul>
                                </div>
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
            <div class="page-footer-inner">
                2015 &copy; NicBrain desenvolvido por <a class="font-red-sunglo" href="http://kobel.com.br/" target="_blank">Kobel</a>.
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
        <script src="<c:url value="/resources/assets/global/plugins/jquery-migrate.min.js" />" type="text/javascript"></script>
        <!-- Início declaração - JS do mapa -->
        <script src="https://maps.googleapis.com/maps/api/js?v=3.23&amp;libraries=places"></script>
        <script src="<c:url value="/resources/js/markerclusterer_compiled.js" />" type="text/javascript"></script>
        <script src="<c:url value="/resources/js/Label.js" />" type="text/javascript"></script>
        <script src="<c:url value="/resources/js/properties_js.js" />" type="text/javascript"></script>
        <script src="<c:url value="/resources/js/ronda_online.js" />" type="text/javascript"></script>
        <script src="<c:url value="/resources/assets/global/plugins/bootstrap-toastr/toastr.min.js" />"></script>
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
        <!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="<c:url value="/resources/assets/global/plugins/bootstrap-modal/js/bootstrap-modalmanager.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/assets/global/plugins/bootstrap-modal/js/bootstrap-modal.js" />" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
        <!-- Início Bootstrap Select -->
        <script type="text/javascript" src="<c:url value="/resources/assets/global/plugins/bootstrap-select/bootstrap-select.min.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/assets/global/plugins/select2/select2.min.js" />"></script>
        <script type="text/javascript" src="<c:url value="/resources/assets/global/plugins/jquery-multi-select/js/jquery.multi-select.js" />"></script>
        <!-- Fim Bootstrap Select -->
        <script src="<c:url value="/resources/assets/global/scripts/metronic.js" />" type="text/javascript"></script>
        <script src="<c:url value="/resources/assets/admin/layout/scripts/layout.js" />" type="text/javascript"></script>
        <script src="<c:url value="/resources/assets/admin/layout/scripts/quick-sidebar.js" />" type="text/javascript"></script>
        <script src="<c:url value="/resources/assets/admin/layout/scripts/demo.js" />" type="text/javascript"></script>
        <script src="<c:url value="/resources/assets/admin/pages/scripts/components-dropdowns.js" />"></script>
        <script>
                                                            jQuery(document).ready(function () {
                                                                Metronic.init(); // init metronic core components
                                                                Layout.init(); // init current layout
                                                                QuickSidebar.init(); // init quick sidebar
                                                                Demo.init(); // init demo features
                                                                ComponentsDropdowns.init();
                                                                RondaOnline.iniciarMapa();
                                                            });
        </script>
        <!-- END JAVASCRIPTS -->
    </body>
    <!-- END BODY -->
</html>
