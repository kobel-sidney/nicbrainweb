/**
 * 
 */

/* global google */

var RondaDetalhada = {
	mapa : undefined,
	locais : new Array(),
	pontosViatura : new Array(),
	rota : undefined,
	pontoInicio : undefined,
	pontoFinal : undefined,
	initializarMapa : function() {
		var centroMapa = new google.maps.LatLng(-23.626036115293587,
				-46.5083509683609);
		var configuracaoMapa = {
			center : centroMapa,
			zoom : 13,
			mapTypeId : google.maps.MapTypeId.ROADMAP,
			mapTypeControl: true,
            mapTypeControlOptions: {
                style: google.maps.MapTypeControlStyle.HORIZONTAL_BAR,
                position: google.maps.ControlPosition.RIGHT_TOP
            },
            zoomControl: true,
            zoomControlOptions: {
                position: google.maps.ControlPosition.LEFT_BOTTOM
            },
            scaleControl: true,
            streetViewControl: true,
            streetViewControlOptions: {
                position: google.maps.ControlPosition.LEFT_BOTTOM
            }
		};
		RondaDetalhada.mapa = new google.maps.Map(document
				.getElementById('map-detalhe'), configuracaoMapa);
		// Adiciona div como legenda no mapa
		RondaDetalhada.mapa.controls[google.maps.ControlPosition.RIGHT_BOTTOM]
				.push(document.getElementById('informacoesRota'));
		RondaDetalhada.mapa.controls[google.maps.ControlPosition.TOP_LEFT]
				.push(document.getElementById('botoesVoltarEFiltrar'));
		
		RondaDetalhada.obterCercasVirtuais();

		RondaDetalhada.rota = new google.maps.Polyline({
			strokeColor : '#00008B',
			strokeOpacity : 3.0,
			strokeWeight : 4,
			geodesic : true,
			map : RondaDetalhada.mapa
		});

		RondaDetalhada.pontoInicio = new google.maps.Marker({
			map : RondaDetalhada.mapa,
			icon : '/nicBrain/resources/images/maps/letter_a.png'
		});

		RondaDetalhada.pontoFinal = new google.maps.Marker({
			map : RondaDetalhada.mapa,
			icon : '/nicBrain/resources/images/maps/letter_b.png'
		});
		
		$('#fim_label').hide();
		$('#fim').hide();
		
		$('#setor_label').hide();
		$('#setor').hide();
	},
	
	obterCercasVirtuais: function () {
		$.ajax({
			type : 'GET',
			url : Properties_JS.url_servico + "cercaVirtual/buscarCercasVirtuais",
			contentType : "application/json; charset=utf-8",
			dataType : 'json',
			success : function(data, textStatus, jqXHR) {
				RondaDetalhada.montarCercas(data.cercasVirtuais);
			}
		});
    },
    
    montarCercas: function(cercasVirtuais) {
    	var quant = cercasVirtuais.length;
    	var coords = new Array();
    	
    	$.each(cercasVirtuais, function(i, cerca) {
    		var paths = new Array();
    		
    		$.each(cerca.coordenadas, function(i, value) {
    			paths.push(new google.maps.LatLng(value.latitude, value.longitude));
    		});
    		
    		var options = {
    			paths: paths,
    			fillColor : cerca.cor,
    			fillOpacity : 0.35,
    			strokeColor : cerca.cor,
    			strokeOpacity : 0.8,
    			strokeWeight : 2,
    			map: RondaDetalhada.mapa,
    			idInspetoria: cerca.idLocal
    		}
    		var cerca = new google.maps.Polygon(options);
    		
    		RondaDetalhada.locais.push(cerca);
    		
    		$.each(paths, function(i, value) {
				coords.push(value);
			});
    	});
    	
//		Centraliza e da zoom de acordo com coordenadas passadas
		RondaDetalhada.centralizar(coords);
    },
    
    mudarConfiguracoes: function() {
		$('#fim_label').toggle();
		$('#fim').toggle();
		
		$('#setor_label').toggle();
		$('#setor').toggle();
	},

	aplicarFiltro : function() {

		var ronda = undefined;
		RondaDetalhada.rota.setPath(new Array());
		RondaDetalhada.pontoInicio.setPosition(null);
		RondaDetalhada.pontoFinal.setPosition(null);

		var idLocal = $('#inspetoria_input').val();
		var idSetor = $('#setor_input').val();
		var idVeiculo = $('#viatura_input').val();
		var idUsuario = $('#usuario_input').val();
		var inicio = $('#inicio_input').val();
		var fim = $('#fim_input').val();
		
		if (inicio != "") {
			PF('dlgFiltro').hide();
			PF('dlgStatus').show();
			
			var query = {
				idLocal : idLocal,
				idSetor : idSetor,
				idVeiculo : idVeiculo,
				idUsuario: idUsuario,
				inicio : inicio,
				fim : fim
			};

			$
					.ajax({
						type : 'POST',
						url : Properties_JS.url_servico + "rondaDetalhada/obterPontos",
						data : JSON.stringify(query),
						contentType : "application/json; charset=utf-8",
						dataType : 'json',
						success : function(data, textStatus, jqXHR) {
							RondaDetalhada.montarRota(data);
						}
					});
		}
		
		$('#setor_input').val('');
		$('#fim_input').val('');
	},

	montarRota : function(ronda) {
		if (ronda != undefined) {
			var pontosRota = RondaDetalhada.rota.getPath();
			var kmPercorrido = 0;
			var pontoTemp = undefined;
			var latlngbounds = new google.maps.LatLngBounds();

			$.each(ronda.listRonda, function(i, valor) {
				var ponto = new google.maps.LatLng(valor.locationDTO.latitude,
						valor.locationDTO.longitude);
				pontosRota.push(ponto);

				if (pontoTemp !== undefined) {
					kmPercorrido += google.maps.geometry.spherical
							.computeDistanceBetween(pontoTemp, ponto);
				}

				pontoTemp = ponto;
				
				latlngbounds.extend(ponto);
				RondaDetalhada.mapa.fitBounds(latlngbounds);
			});

			if (ronda.listRonda.length > 0) {
				RondaDetalhada.pontoInicio.setPosition(new google.maps.LatLng(
						ronda.listRonda[0].locationDTO.latitude,
						ronda.listRonda[0].locationDTO.longitude));

				RondaDetalhada.pontoFinal
						.setPosition(new google.maps.LatLng(
								ronda.listRonda[ronda.listRonda.length - 1].locationDTO.latitude,
								ronda.listRonda[ronda.listRonda.length - 1].locationDTO.longitude));

				var rota = {
					descricaoViarura : ronda.listRonda[0].descricaoVeiculo,
					distanciaPercorrida : (kmPercorrido / 1000).toFixed(2)
							+ ' km',
					duracao : DateUtil
							.segundosParaHoraCompleta(ronda.listRonda.length * 10),
					inicio : new Date(ronda.listRonda[0].date).toUTCString()
							.substring(17, 25),
					fim : new Date(
							ronda.listRonda[ronda.listRonda.length - 1].date)
							.toUTCString().substring(17, 25)
				};
				RondaDetalhada.apresentarInformacoesRota(rota);
			} else {
				notificarRotaVazia();
				RondaDetalhada.limparInformacoesRota();
			}

			PF('dlgStatus').hide();
		}
	},

	apresentarInformacoesRota : function(rota) {
		$('#descricaoViatura').text(rota.descricaoViarura);
		$('#distancia').text(rota.distanciaPercorrida);
		$('#duracao').text(rota.duracao);
		$('#inicio_info').text(rota.inicio);
		$('#fim_info').text(rota.fim);
	},
	limparInformacoesRota : function() {
		$('#descricaoViatura').text('');
		$('#distancia').text('');
		$('#duracao').text('');
		$('#inicio_info').text('');
		$('#fim_info').text('');
	},
    
    centralizar: function(coords) {
		var latlngbounds = new google.maps.LatLngBounds();		
		$.each(coords, function(i, value) {
			latlngbounds.extend(value);
		})
		
		RondaDetalhada.mapa.fitBounds(latlngbounds);
	}
};

var DateUtil = {
	segundosParaHoraCompleta : function(tempo) {
		var hours = Math.floor(tempo / 3600);
		var minutes = Math.floor((tempo % 3600) / 60);
		var seconds = tempo % 60;

		minutes = minutes < 10 ? '0' + minutes : minutes;

		seconds = seconds < 10 ? '0' + seconds : seconds;

		var result = hours + ":" + minutes + ":" + seconds;

		return result;
	}
}