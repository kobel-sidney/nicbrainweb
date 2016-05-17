angular.module('nicbrainApp').controller(
		'OcorrenciaController',
		[
				'GenericService',
				'$http',
				'$q',
				'$timeout',
				function(GenericService, $http, $q, $timeout) {

					var vm = this; 
					
					vm.eventsPanel = true;
					vm.eventoId = undefined;
					vm.eventos = [];
					vm.addOcorrencia = function(eventoId) {
						vm.eventoId = eventoId;
						
						vm.eventsPanel = !vm.eventsPanel;
					};

					function obterEventos() {
						GenericService.obter('/ocorrencia/eventos', null).then(
								function(response) {
									vm.eventos = response;
								});
					}

					obterEventos();
				} ]);