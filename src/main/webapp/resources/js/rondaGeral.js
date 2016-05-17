/**
 *
 */

/* global google */
var RondaGeral = {
    
    mapa: undefined,
    locais: new Array(),
    veiculos: new Array(),
    postos: new Array(),
    ocorrencias: new Array(),
    infoViatura: new google.maps.InfoWindow(),
    clusterVeiculos: undefined,
    clusterOcorrencias: undefined,
    managerPostosServico: undefined,
    
    initializarMapa: function () {
        var centroMapa = new google.maps.LatLng(-23.626036115293587, -46.5083509683609);
        var configuracaoMapa = {
            center: centroMapa,
            zoom: 13,
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            mapTypeControl: true,
            mapTypeControlOptions: {
                position: google.maps.ControlPosition.LEFT_BOTTOM
            },
            zoomControl: true,
            zoomControlOptions: {
                position: google.maps.ControlPosition.RIGHT_BOTTOM
            },
            scaleControl: true,
            streetViewControl: true,
            streetViewControlOptions: {
                position: google.maps.ControlPosition.RIGHT_BOTTOM
            }
        };

        RondaGeral.mapa = new google.maps.Map(document.getElementById('map-canvas'), configuracaoMapa);

      //Adiciona div como legenda no mapa
        RondaGeral.mapa.controls[google.maps.ControlPosition.TOP_RIGHT].push(document.getElementById('legenda'));

        RondaGeral.mapa.controls[google.maps.ControlPosition.TOP_LEFT].push(document.getElementById('btnFiltro'));

        RondaGeral.obterCercasVirtuais();
        
        RondaGeral.mapa.addListener('zoom_changed', function() {
            if (this.getZoom() > 18) {
                var count = RondaGeral.postos.length;
                for (var i = 0; i < count; i++) {
                    RondaGeral.postos[i].setVisible(true);
                }
            } else {
                var count = RondaGeral.postos.length;
                for (var i = 0; i < count; i++) {
                    RondaGeral.postos[i].setVisible(false);
                }
            }
        });

        var clusterStyles = [[{
                    url: '/nicBrain/resources/images/maps/clusterPolicia.png',
                    height: 55,
                    width: 55,
                    anchor: [0, 0]
                }], [{
                    url: '/nicBrain/resources/images/maps/clusterOcorrencia.png',
                    height: 55,
                    width: 55,
                    anchor: [0, 0]
                }]];

       
        RondaGeral.clusterOcorrencias = new MarkerClusterer(RondaGeral.mapa, RondaGeral.ocorrencias, {
            maxZoom: 15,
            styles: clusterStyles[1]
        });
        RondaGeral.clusterVeiculos = new MarkerClusterer(RondaGeral.mapa, RondaGeral.veiculos, {
            maxZoom: 15,
            styles: clusterStyles[0]
        });
       

        RondaGeral.ativarRotinaDeAtualizacao();
    },
    
    ativarRotinaDeAtualizacao: function () {
    	RondaGeral.obterCoordenadasViaturas();
        RondaGeral.obterOcorrencias();
        RondaGeral.obterPostosServico();

        setInterval(function () {
        	RondaGeral.obterCoordenadasViaturas();
            RondaGeral.obterOcorrencias();
        }, 5000);

        setInterval(function () {
        	RondaGeral.obterPostosServico();
        }, 20000);
    },
    
    obterCercasVirtuais: function () {
    	$.ajax({
			type : 'GET',
			url : Properties_JS.url_servico + "cercaVirtual/buscarCercasVirtuais",
			contentType : "application/json; charset=utf-8",
			dataType : 'json',
			success : function(data, textStatus, jqXHR) {
				RondaGeral.montarCercas(data.cercasVirtuais);
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
    			map: RondaGeral.mapa,
    			idInspetoria: cerca.idLocal
    		}
    		var cerca = new google.maps.Polygon(options);
    		
    		RondaGeral.locais.push(cerca);
    		
    		$.each(paths, function(i, value) {
				coords.push(value);
			});
    	});
    	
//		Centraliza e da zoom de acordo com coordenadas passadas
		RondaGeral.centralizar(coords);
    },
    
    obterCoordenadasViaturas: function () {
    	$.ajax({
			type : 'GET',
			url : Properties_JS.url_servico + "rondaGeral/obterCoordenadasViaturas",
			contentType : "application/json; charset=utf-8",
			dataType : 'json',
			success : function(data, textStatus, jqXHR) {
				RondaGeral.mostrarViaturas(data);
			}
		});
    },
    
    mostrarViaturas: function(rondas) {
    	$.each(rondas.listRonda, function (i, ronda) {
            var ponto = new google.maps.LatLng(ronda.locationDTO.latitude, ronda.locationDTO.longitude);

            if (RondaGeral.veiculos.containsVeiculo(ronda)) {
                var veiculo = RondaGeral.veiculos.getVeiculo(ronda);
                veiculo.setPosition(ponto);
            } else {
                var stringGuarnicoes = '';

                $.each(rondas.guarnicoes, function (i, guarnicao) {
                    if (guarnicao.idVeiculo === ronda.idVeiculo) {
                        if (stringGuarnicoes !== '') {
                            stringGuarnicoes += ', ';
                        }
                        stringGuarnicoes += guarnicao.nome;
                    }
                });

                RondaGeral.criarVeiculo(ronda, stringGuarnicoes);
            }
        });
    },
    
    obterOcorrencias: function() {
        $.ajax({
			type : 'GET',
			url : Properties_JS.url_servico + "rondaGeral/obterOcorrencias",
			contentType : "application/json; charset=utf-8",
			dataType : 'json',
			success : function(data, textStatus, jqXHR) {
				RondaGeral.mostrarOcorrencias(data.ocorrencias);
			}
		});
    },
    
    mostrarOcorrencias: function(ocorrencias) {
    	RondaGeral.ocorrencias.limparOcorrencias();
        RondaGeral.clusterOcorrencias.clearMarkers();

        $.each(ocorrencias, function (i, ocorrencia) {
            var ponto = new google.maps.LatLng(ocorrencia.latitude, ocorrencia.longitude);

            var o = new google.maps.Marker({
                position: ponto,
                map: RondaGeral.mapa,
                title: ocorrencia.descricaoOcorrencia,
                icon: '/nicBrain/resources/images/maps/explosao.png',
                idOcorrencia: ocorrencia.idOcorrencia,
                dataInicio: ocorrencia.dataInicio,
                status: ocorrencia.status
            });

            google.maps.event.addListener(o, 'click', function () {
                var conteudo = '<div>' +
                        '<div>' +
                        '<b>Descrição:</b> ' + this.title +
                        '</div>' +
                        '<hr />' +
                        '<div>' +
                        '<b>Data:</b> ' + this.dataInicio + '<br />' +
                        '<b>Status:</b> ' + this.status +
                        '</div>' +
                        '</div>';

                RondaGeral.infoViatura.setContent(conteudo);
                RondaGeral.infoViatura.open(RondaGeral.mapa, this);
            });

            RondaGeral.ocorrencias.push(o);

            RondaGeral.clusterOcorrencias.addMarker(o);
        });
    },
    
    obterPostosServico: function() {
    	$.ajax({
			type : 'GET',
			url : Properties_JS.url_servico + "rondaGeral/obterPostosServico",
			contentType : "application/json; charset=utf-8",
			dataType : 'json',
			success : function(data, textStatus, jqXHR) {
				RondaGeral.mostrarPostosServico(data.postosServicos);
			}
		});
    },
    
    mostrarPostosServico: function (postos) {
        RondaGeral.postos.limparPostos();

        $.each(postos, function (i, posto) {
            var ponto = new google.maps.LatLng(posto.latitude, posto.longitude);

            var o = new google.maps.Marker({
                position: ponto,
                map: RondaGeral.mapa,
                title: posto.nome,
                icon: '/nicBrain/resources/images/maps/postoServico.png',
                idPosto: posto.idPosto
            });

            google.maps.event.addListener(o, 'click', function () {
                var conteudo = '<div>' +
                        '<div>' +
                        '<b>Descrição:</b> ' + this.title +
                        '</div>' +
                        '<hr />' +
                        '<div>' +
                        '</div>' +
                        '</div>';

                RondaGeral.infoViatura.setContent(conteudo);
                RondaGeral.infoViatura.open(RondaGeral.mapa, this);
            });

            RondaGeral.postos.push(o);
        });
    },
    
    criarVeiculo: function (ronda, guarnicoes) {
        var veiculo = new google.maps.Marker({
            position: new google.maps.LatLng(ronda.locationDTO.latitude, ronda.locationDTO.longitude),
            map: RondaGeral.mapa,
            title: ronda.descricaoVeiculo,
            icon: '/nicBrain/resources/images/maps/policia_azul.png',
            idVeiculo: ronda.idVeiculo,
            idInspetoria: ronda.idLocal,
            guarnicoes: []
        });

        google.maps.event.addListener(veiculo, 'position_changed', RondaGeral.verificarCercaVirtual);

        google.maps.event.addListener(veiculo, 'click', function () {
            var conteudo = '<div>' +
                    '<div>' +
                    '<b>Viatura:</b> ' + this.title +
                    '</div>' +
                    '<hr />' +
                    '<div>' +
                    '<img src="/nicBrain/resources/images/maps/guarnicao.png" /> ' + guarnicoes +
                    '</div>' +
                    '</div>';

            RondaGeral.infoViatura.setContent(conteudo);
            RondaGeral.infoViatura.open(RondaGeral.mapa, this);
        });

        RondaGeral.veiculos.push(veiculo);

        RondaGeral.clusterVeiculos.addMarker(veiculo);
    },
    
    verificarCercaVirtual: function () {
        var veiculo = this;
        var local = RondaGeral.locais.getLocalPorVeiculo(veiculo);
        var foraDoLocal = true;
        
        if (local == null) {
			console.log("Inspetoria com ID " + veiculo.idInspetoria + " não definida")
		} else {
			$.each(local, function(i, value) {
				if (google.maps.geometry.poly.containsLocation(veiculo.position, value)) {
					
					foraDoLocal = false;
				}
			});
	        
			if (foraDoLocal == false) {
				veiculo.setIcon('/nicBrain/resources/images/maps/policia_azul.png'); 
			} else {
				veiculo.setIcon('/nicBrain/resources/images/maps/policia_vermelha.png');
			}
		} 
    },
    
    centralizar: function(coords) {
		var latlngbounds = new google.maps.LatLngBounds();		
		$.each(coords, function(i, value) {
			latlngbounds.extend(value);
		})
		
		RondaGeral.mapa.fitBounds(latlngbounds);
	},
	
	aplicarFiltro: function() {
		var coord = JSON.parse($('#coord_input').val());
		
		if (coord != "") {			
			RondaGeral.mapa.setCenter(new google.maps.LatLng(coord.latitude, coord.longitude));
			RondaGeral.mapa.setZoom(14);
		}
	}
};

Array.prototype.containsVeiculo = function (vehicle) {
    var count = this.length;

    while (count--) {
        if (this[count].idVeiculo === vehicle.idVeiculo) {
            return true;
        }
    }

    return false;
};

Array.prototype.getVeiculo = function (vehicle) {
    var count = this.length;

    for (var i = 0; i < count; i++) {
        if (this[i].idVeiculo === vehicle.idVeiculo) {
            return this[i];
        }
    }

    return null;
};

Array.prototype.getLocalPorVeiculo = function (veiculo) {
    var count = this.length;
   var locais = new Array();
    
    for (var i = 0; i < count; i++) {
        if (this[i].idInspetoria === veiculo.idInspetoria) {
            locais.push(this[i]);
        }
    }

    return locais;
};

Array.prototype.limparOcorrencias = function () {
    var count = this.length;

    for (var i = 0; i < count; i++) {
        this[i].setMap(null);
    }

    RondaGeral.ocorrencias.length = 0;
};

Array.prototype.limparPostos = function () {
    var count = this.length;

    for (var i = 0; i < count; i++) {
        this[i].setMap(null);
    }

    RondaGeral.postos.length = 0;
};