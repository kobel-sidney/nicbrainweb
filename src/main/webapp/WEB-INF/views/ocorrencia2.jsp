<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<security:authentication property="principal" var="usuario" />
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html ng-app="nicbrainApp">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8" />
<title>NicBrain - Ronda Online</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<meta content="" name="description" />
<meta content="" name="author" />
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/assets/global/plugins/font-awesome/css/font-awesome.min.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/assets/global/plugins/simple-line-icons/simple-line-icons.min.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/assets/global/plugins/bootstrap/css/bootstrap.min.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/assets/global/plugins/uniform/css/uniform.default.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" />" rel="stylesheet" type="text/css" />
<!-- END GLOBAL MANDATORY STYLES -->
<!-- Início - Bootstrap Input -->
<link href="<c:url value="/resources/assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css" />" rel="stylesheet" type="text/css" />
<!-- Fim - Bootstrap Input -->
<!-- Início - Profile -->
<link href="<c:url value="/resources/assets/admin/pages/css/profile.css" />" rel="stylesheet" type="text/css" />
<!-- Fim - Profile -->
<!-- Início Bootstrap Select -->
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/global/plugins/bootstrap-select/bootstrap-select.min.css" />" />
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/global/plugins/select2/select2.css" />" />
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/global/plugins/jquery-multi-select/css/multi-select.css" />" />
<!-- Fim Bootstrap Select -->
<!-- Início - Toastr -->
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/assets/global/plugins/bootstrap-toastr/toastr.min.css" />" />
<!-- Fim - Toastr -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link href="<c:url value="/resources/assets/global/plugins/bootstrap-modal/css/bootstrap-modal-bs3patch.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/assets/global/plugins/bootstrap-modal/css/bootstrap-modal.css" />" rel="stylesheet" type="text/css" />
<!-- END PAGE LEVEL STYLES -->
<!-- Início - UI Grid -->
<%--         <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/angular-material.min.css" />"/> --%>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/ui-grid.min.css" />" />
<!-- Fim - UI Grid -->
<!-- BEGIN PAGE STYLES -->
<link href="<c:url value="/resources/assets/admin/pages/css/tasks.css" />" rel="stylesheet" type="text/css" />
<!-- END PAGE STYLES -->
<!-- BEGIN THEME STYLES -->
<link href="<c:url value="/resources/assets/global/css/components-md.css" />" id="style_components" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/assets/global/css/plugins-md.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/assets/admin/layout/css/layout.css" />" rel="stylesheet" type="text/css" />
<link id="style_color" href="<c:url value="/resources/assets/admin/layout/css/themes/darkblue.css" />" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/assets/admin/layout/css/custom.css" />" rel="stylesheet" type="text/css" />
<!-- END THEME STYLES -->
<link href="<c:url value="/resources/css/custom-nicbrain.css" />" rel="stylesheet" type="text/css" />
<script src="<c:url value="/resources/js/jquery-2.1.4.min.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/js/angular/angular.min.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/js/angular/angular-animate.min.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/js/angular/angular-touch.min.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/js/ui-grid.min.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/js/angular/nicbrainApp.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/js/angular/services/genericService.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/js/angular/controllers/ocorrenciaController.js" />" type="text/javascript"></script>
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
<body class="page-md page-header-fixed page-quick-sidebar-over-content page-full-width">
	<!-- BEGIN HEADER -->
	<div class="page-header md-shadow-z-1-i navbar navbar-fixed-top">
		<!-- BEGIN HEADER INNER -->
		<div class="page-header-inner">
			<!-- BEGIN LOGO -->
			<div class="page-logo">
				<a href="<c:url value="/" />"> <img src="<c:url value="/resources/assets/admin/layout/img/logo.png" />" alt="logo" class="logo-default" />
				</a>
				<div class="menu-toggler sidebar-toggler hide">
					<!-- DOC: Remove the above "hide" to enable the sidebar toggler button on header -->
				</div>
			</div>
			<!-- END LOGO -->
			<!-- BEGIN RESPONSIVE MENU TOGGLER -->
			<a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse"> </a>
			<!-- END RESPONSIVE MENU TOGGLER -->
			<!-- BEGIN HORIZANTAL MENU -->
			<!-- DOC: Apply "hor-menu-light" class after the "hor-menu" class below to have a horizontal menu with white background -->
			<!-- DOC: This is desktop version of the horizontal menu. The mobile version is defined(duplicated) sidebar menu below. So the horizontal menu has 2 seperate versions -->
			<div class="hor-menu hor-menu-light hidden-sm hidden-xs">
				<ul class="nav navbar-nav">
					<!-- DOC: Remove data-hover="dropdown" and data-close-others="true" attributes below to disable the horizontal opening on mouse hover -->
					<li class="classic-menu-dropdown"><a href="javascript:;" onclick="$('#dropdown-config').click();"> <i class="fa fa-cogs"></i> Configurações do Mapa
					</a></li>
					<li class="classic-menu-dropdown"><a data-toggle="dropdown" href="javascript:;"> <i class="fa fa-wrench"></i> Ferramentas <i class="fa fa-angle-down"></i>
					</a>
						<ul class="dropdown-menu pull-left">
							<li><a href="<c:url value="/rest/ronda/detalhe" />"> <i class="fa fa-eye"></i> Detalhes da Ronda
							</a></li>
							<li><a href="<c:url value="/restrict/ListaCercaVirtual.nicbrain" />"> <i class="fa fa-code-fork"></i> Cerca Virtual
							</a></li>
						</ul></li>
				</ul>
			</div>
			<!-- END HORIZANTAL MENU -->
			<!-- BEGIN HEADER SEARCH BOX -->
			<!-- DOC: Apply "search-form-expanded" right after the "search-form" class to have half expanded search box -->
			<form class="search-form">
				<div class="input-group">
					<input id="pesquisa_endereco" type="text" class="form-control" placeholder="Pesquisar endereço..."> <span class="input-group-btn"> <a href="javascript:;"
						class="btn submit"><i class="icon-magnifier"></i></a>
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
					<!-- BEGIN NOTIFICATION DROPDOWN -->
					<!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
					<li class="dropdown dropdown-extended dropdown-notification" id="header_notification_bar"><a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"
						data-hover="dropdown" data-close-others="true"> <i class="fa fa-cab"></i> <span class="badge badge-default quant_viaturasfora">0</span>
					</a>
						<ul class="dropdown-menu">
							<li class="external">
								<h3>
									<span class="bold"><span class="quant_viaturasfora">0</span> viaturas</span> fora da área
								</h3>
							</li>
							<li>
								<ul id="notificacoes_viaturasfora" class="dropdown-menu-list scroller" style="height: 250px;" data-handle-color="#637283">
								</ul>
							</li>
						</ul></li>
					<!-- END NOTIFICATION DROPDOWN -->
					<!-- BEGIN INBOX DROPDOWN -->
					<!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
					<li class="dropdown dropdown-extended dropdown-notification" id="header_inbox_bar"><a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"
						data-hover="dropdown" data-close-others="true"> <i class="icon-fire"></i> <span class="badge badge-default quant_ocorrencias"> 0 </span>
					</a>
						<ul class="dropdown-menu">
							<li class="external">
								<h3>
									<span class="bold"><span class="quant_ocorrencias">0</span> notificações</span> de ocorrência
								</h3>
							</li>
							<li>
								<ul id="notificacoes_ocorrencias" class="dropdown-menu-list scroller" style="height: 250px;" data-handle-color="#637283">
								</ul>
							</li>
						</ul></li>
					<!-- END INBOX DROPDOW
                        <!-- BEGIN USER LOGIN DROPDOWN -->
					<!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
					<!-- END USER LOGIN DROPDOWN -->
					<!-- BEGIN QUICK SIDEBAR TOGGLER -->
					<!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
					<li class="dropdown dropdown-quick-sidebar-toggler"><a href="javascript:;" class="dropdown-toggle" id="dropdown-config"> <i class="icon-logout"></i>
					</a></li>
					<!-- END QUICK SIDEBAR TOGGLER -->
				</ul>
			</div>
			<!-- END TOP NAVIGATION MENU -->
		</div>
		<!-- END HEADER INNER -->
	</div>
	<!-- END HEADER -->
	<div class="clearfix"></div>
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
						<div class="portlet light tasks-widget">
							<div class="portlet-title">
								<div class="caption">
									<i class="icon-share font-green-haze hide"></i> <span class="caption-subject font-green-haze bold uppercase">Tasks</span> <span class="caption-helper">tasks
										summary...</span>
								</div>
								<div class="actions">
									<div class="btn-group">
										<a class="btn green-haze btn-circle btn-sm" href="javascript:;" data-toggle="dropdown" data-hover="dropdown" data-close-others="true"> More <i
											class="fa fa-angle-down"></i>
										</a>
										<ul class="dropdown-menu pull-right">
											<li><a href="javascript:;"> <i class="i"></i> All Project
											</a></li>
											<li class="divider"></li>
											<li><a href="javascript:;"> AirAsia </a></li>
											<li><a href="javascript:;"> Cruise </a></li>
											<li><a href="javascript:;"> HSBC </a></li>
											<li class="divider"></li>
											<li><a href="javascript:;"> Pending <span class="badge badge-danger"> 4 </span>
											</a></li>
											<li><a href="javascript:;"> Completed <span class="badge badge-success"> 12 </span>
											</a></li>
											<li><a href="javascript:;"> Overdue <span class="badge badge-warning"> 9 </span>
											</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="portlet-body">
								<div class="task-content">
									<div class="scroller" style="height: 305px;" data-always-visible="1" data-rail-visible1="1">
										<!-- START TASK LIST -->
										<ul class="task-list" ng-controller="OcorrenciaController as ocorrenciaCtrl">
											<li ng-repeat="evento in ocorrenciaCtrl.eventos">
												<div class="task-title">
													<span class="task-title-sp"> {{evento.nomeEvento}} </span> <span class="label label-sm label-warning">Company</span>
												</div>
												<div class="task-config">
													<div class="task-config-btn btn-group">
														<a class="btn btn-xs default" href="javascript:;"> <i class="fa fa-cog"></i>
														Gerar Ocorrência
														</a>
													</div>
												</div>
											</li>
										</ul>
										<!-- END START TASK LIST -->
									</div>
								</div>
								<div class="task-footer">
									<div class="btn-arrow-link pull-right">
										<a href="javascript:;">See All Records</a> <i class="icon-arrow-right"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- END PAGE CONTENT-->
			</div>
		</div>
		<!-- END CONTENT -->
		<!-- BEGIN QUICK SIDEBAR -->
		<a href="javascript:;" class="page-quick-sidebar-toggler"><i class="icon-close"></i></a>
		<div class="page-quick-sidebar-wrapper">
			<div class="page-quick-sidebar">
				<div class="nav-justified">
					<ul class="nav nav-tabs nav-justified">
						<li class="active"><a href="#mapa_tab" data-toggle="tab"> Mapa </a></li>
						<li><a href="#alerta_tab" data-toggle="tab"> Alertas </a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active page-quick-sidebar-alerts" id="mapa_tab">
							<div class="page-quick-sidebar-alerts" data-rail-color="#ddd" data-wrapper-class="page-quick-sidebar-list">
								<h3 class="list-heading">Configurações</h3>
								<ul class="feeds list-items">
									<li>
										<div class="md-checkbox">
											<input type="checkbox" id="check_ps" class="md-check"> <label for="check_ps"> <span></span> <span class="check"></span> <span class="box"></span> Mostrar
												Postos de Serviços
											</label>
										</div>
									</li>
									<li>
										<div class="md-checkbox">
											<input type="checkbox" id="check_o" class="md-check" checked=""> <label for="check_o"> <span></span> <span class="check"></span> <span class="box"></span>
												Mostrar Ocorrências
											</label>
										</div>
									</li>
									<li>
										<div class="md-checkbox">
											<input type="checkbox" id="check_cameras" class="md-check"> <label for="check_cameras"> <span></span> <span class="check"></span> <span class="box"></span>
												Mostrar Câmeras
											</label>
										</div>
									</li>
									<li>
										<div class="md-checkbox">
											<input type="checkbox" id="check_l" class="md-check"> <label for="check_l"> <span></span> <span class="check"></span> <span class="box"></span> Mostrar
												Legenda do mapa
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
													<c:forEach items="${selectGroup}" var="select">
														<optgroup label="${select.groupName}">
															<c:forEach items="${select.options}" var="option">
																<option value="${option.value}">${option.label}</option>
															</c:forEach>
														</optgroup>
													</c:forEach>
												</select> <span class="input-group-btn">
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
											<input type="checkbox" id="alerta_email" class="md-check" checked=""> <label for="alerta_email"> <span></span> <span class="check"></span> <span
												class="box"></span> Receber email de alerta quando uma viatura sair da cerca
											</label>
										</div>
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
	<script src="<c:url value="/resources/assets/global/plugins/jquery-migrate.min.js" />" type="text/javascript"></script>
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
	<!-- Início - Bootstrap Input -->
	<script src="<c:url value="/resources/assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js" />" type="text/javascript"></script>
	<!-- Fim - Bootstrap Input -->
	<!-- Início - Profile -->
	<script src="<c:url value="/resources/assets/global/plugins/jquery.sparkline.min.js" />" type="text/javascript"></script>
	<!-- Fim - Profile -->
	<!-- Início Bootstrap Select -->
	<script type="text/javascript" src="<c:url value="/resources/assets/global/plugins/bootstrap-select/bootstrap-select.min.js" />"></script>
	<script type="text/javascript" src="<c:url value="/resources/assets/global/plugins/select2/select2.min.js" />"></script>
	<script type="text/javascript" src="<c:url value="/resources/assets/global/plugins/jquery-multi-select/js/jquery.multi-select.js" />"></script>
	<!-- Fim Bootstrap Select -->
	<!-- Início - Toastr -->
	<script src="<c:url value="/resources/assets/global/plugins/bootstrap-toastr/toastr.min.js" />"></script>
	<!-- Fim - Toastr -->
	<!-- BEGIN PAGE LEVEL PLUGINS -->
	<script src="<c:url value="/resources/assets/global/plugins/bootstrap-modal/js/bootstrap-modalmanager.js" />" type="text/javascript"></script>
	<script src="<c:url value="/resources/assets/global/plugins/bootstrap-modal/js/bootstrap-modal.js" />" type="text/javascript"></script>
	<!-- END PAGE LEVEL PLUGINS -->
	<script src="<c:url value="/resources/assets/global/plugins/flot/jquery.flot.min.js" />" type="text/javascript"></script>
	<script src="<c:url value="/resources/assets/global/plugins/flot/jquery.flot.resize.min.js" />" type="text/javascript"></script>
	<script src="<c:url value="/resources/assets/global/plugins/flot/jquery.flot.categories.min.js" />" type="text/javascript"></script>
	<script src="<c:url value="/resources/assets/global/plugins/jquery.pulsate.min.js" />" type="text/javascript"></script>
	<script src="<c:url value="/resources/assets/global/plugins/bootstrap-daterangepicker/moment.min.js" />" type="text/javascript"></script>
	<script src="<c:url value="/resources/assets/global/plugins/bootstrap-daterangepicker/daterangepicker.js" />" type="text/javascript"></script>
	<!-- IMPORTANT! fullcalendar depends on jquery-ui.min.js for drag & drop support -->
	<script src="<c:url value="/resources/assets/global/plugins/fullcalendar/fullcalendar.min.js" />" type="text/javascript"></script>
	<script src="<c:url value="/resources/assets/global/plugins/jquery-easypiechart/jquery.easypiechart.min.js" />" type="text/javascript"></script>
	<script src="<c:url value="/resources/assets/global/plugins/jquery.sparkline.min.js" />" type="text/javascript"></script>
	
	<script src="<c:url value="/resources/assets/global/scripts/metronic.js" />" type="text/javascript"></script>
	<script src="<c:url value="/resources/assets/admin/layout/scripts/layout.js" />" type="text/javascript"></script>
	<script src="<c:url value="/resources/assets/admin/layout/scripts/quick-sidebar.js" />" type="text/javascript"></script>
	<script src="<c:url value="/resources/assets/admin/layout/scripts/demo.js" />" type="text/javascript"></script>
	<script src="<c:url value="/resources/assets/admin/pages/scripts/profile.js" />" type="text/javascript"></script>
	<script src="<c:url value="/resources/assets/admin/pages/scripts/table-managed.js" />"></script>
	<script src="<c:url value="/resources/assets/admin/pages/scripts/components-dropdowns.js" />"></script>
	<script src="<c:url value="/resources/assets/admin/pages/scripts/tasks.js" />" type="text/javascript"></script>
	<script>
		jQuery(document).ready(function() {
			Metronic.init(); // init metronic core components
			Layout.init(); // init current layout
			QuickSidebar.init(); // init quick sidebar
			Demo.init(); // init demo features
			Profile.init(); // init page demo
			TableManaged.init();
			ComponentsDropdowns.init();
			Tasks.initDashboardWidget();
		});
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>