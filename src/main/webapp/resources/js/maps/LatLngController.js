/*
 * Inicializa o mapa assim que a página estiver completamente carregada.
 */
$(window).load(function() {
   LatLngController.inicializarMapa();
});

var autocomplete;

var LatLngController = {
	mapa : undefined,
	marker : undefined,
	circuloRaio : undefined,
	geocoder : new google.maps.Geocoder(),
	inputs : {
		/** @type {HTMLInputElement} */
		inputEndereco : 'input[id*=endereco_maps]',
		/** @type {HTMLInputElement} */
		inputLat : 'input[id*=lat]',
		/** @type {HTMLInputElement} */
		inputLng : 'input[id*=lng]'
	},
	autocomplete : undefined,
	infoRaioLimite : undefined,

	inicializarMapa : function() {
		var lat = $('input[id*=latPadraoMapa]').val();
		var lng = $('input[id*=lngPadraoMapa]').val();
		var centroDoMapa = undefined;
                
                if (lat !== "" && lng !== "") {
                    centroDoMapa = new google.maps.LatLng(lat, lng);
                } else {
                    centroDoMapa = new google.maps.LatLng(-23.626036115293587, -46.5083509683609);
                }

		var configuracaoMapa = {
			center : centroDoMapa,
			zoom : 17,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};
		this.mapa = new google.maps.Map(document.getElementById('map-canvas'), configuracaoMapa);

		this.inicializarMarker();

		this.autocompletarEndereco();

		this.adicionarMarkerAoClicar();

		this.atualizarAoArrastarMarker();

		if ($('input[id*=temLimite]').val() == "true") {
			this.inicializarInfoRaio();
			this.inicializarRaio();
		}
		
		this.atualizarMapa();
	},

	inicializarMarker : function() {
		this.marker = new google.maps.Marker({
			map : this.mapa,
			draggable : true,
		});
	},

	atualizarMapa : function() {
		var lat = $(this.inputs.inputLat).val();
		var lng = $(this.inputs.inputLng).val();
		var latLng = new google.maps.LatLng(lat, lng);
		if (!Number.isNaN(latLng.A) && !Number.isNaN(latLng.F) && lat != "" && lng != "") {

			this.marker.setPosition(latLng);
			this.mapa.setCenter(latLng);
			this.mapa.setZoom(17);
		}
	},

	inicializarRaio : function() {
		var circleOptions = {
			strokeColor : '#FFA500',
			strokeOpacity : 0.8,
			strokeWeight : 2,
			fillColor : '#FFFF00',
			fillOpacity : 0.35,
			editable : true,
			map : this.mapa,
			radius : 0
		};

		this.circuloRaio = new google.maps.Circle(circleOptions);
		this.circuloRaio.bindTo('center', this.marker, 'position');

		google.maps.event.addListener(this.circuloRaio, 'radius_changed', function() {
			$('input[id*=limiteRaio]').val(this.getRadius());

			LatLngController.atualizarInfoRaio(this);
		});

		google.maps.event.addListener(this.circuloRaio, 'center_changed', function() {
			var raio = Number($('input[id*=limiteRaio]').val());
			if (!Number.isNaN(raio)) {
				LatLngController.circuloRaio.setRadius(raio);
			}
			
			LatLngController.atualizarInfoRaio(this);
		});

		this.infoRaioLimite.close();
	},

	atualizarInfoRaio : function(circle) {
		if (LatLngController.marker.getPosition() != null) {
			var lat_info = circle.getBounds().getSouthWest().G;
			var lng_info = circle.getCenter().K;
			var posicao_info = new google.maps.LatLng(lat_info, lng_info);

			var raioArredondado = (circle.getRadius() != 0) ? circle.getRadius().toFixed(2) : 0;
			var conteudo = "Raio de " + raioArredondado + " metros";

			this.infoRaioLimite.setPosition(posicao_info);
			this.infoRaioLimite.setContent(conteudo);

			this.infoRaioLimite.open(LatLngController.mapa);
		} else {
			this.infoRaioLimite.close();
		}
	},

	inicializarInfoRaio : function() {
		var opcoesInfo = {
			boxStyle : {
				backgroundColor : "#9ACD32",
				fontSize : "12px",
				border : "1px solid #6B8E23",
				borderRadius : "3px",
				padding : "4px",
				color : "#000000",
				width : "auto",
				textAlign : "center",
				opacity : 0.8
			},
			disableAutoPan : true,
			pixelOffset : new google.maps.Size(-65, 0),
			zIndex : null,
			infoBoxClearance : new google.maps.Size(1, 1),
			closeBoxURL : "",
			isHidden : false,
			pane : "mapPane",
			enableEventPropagation : true
		}

		this.infoRaioLimite = new InfoBox(opcoesInfo);
		this.infoRaioLimite.open(this.mapa);
	},

	autocompletarEndereco : function() {
		this.autocomplete = new google.maps.places.Autocomplete($(this.inputs.inputEndereco).get(0));

		google.maps.event.addListener(this.autocomplete, 'place_changed', function() {
			var place = LatLngController.autocomplete.getPlace();
			var latitudeLongitude = place.geometry.location;
			$(LatLngController.inputs.inputLat).val(latitudeLongitude.G);
			$(LatLngController.inputs.inputLng).val(latitudeLongitude.K);

			LatLngController.atualizarMapa();
		});
	},

	atualizarAoArrastarMarker : function() {
		google.maps.event.addListener(this.marker, 'dragend', function() {

			var latitudeLongitude = LatLngController.marker.getPosition();
			LatLngController.pesquisarPorGeocode(latitudeLongitude);
		});
	},

	adicionarMarkerAoClicar : function() {
		google.maps.event.addListener(this.mapa, 'click', function(e) {

			LatLngController.marker.setPosition(e.latLng);
			LatLngController.pesquisarPorGeocode(e.latLng);
		});
	},

	pesquisarPorGeocode : function(latitudeLongitude) {
		this.geocoder.geocode({
			'latLng' : latitudeLongitude
		}, function(results, status) {

			if (status == google.maps.GeocoderStatus.OK) {
				if (results[0]) {

					LatLngController.setarValoresNosInputs(results[0].formatted_address, results[0].geometry.location.lat(),
							results[0].geometry.location.lng());
				}
			}
		});
	},

	limparEndereco : function() {
		this.marker.setPosition(null);
		this.setarValoresNosInputs(null, null, null);

		if (this.circuloRaio != undefined) {
			this.limparRaioLimite();
		}
	},

	limparRaioLimite : function() {
		this.circuloRaio.setRadius(0);
		$('input[id*=limiteRaio]').val('0');
	},

	setarValoresNosInputs : function(valEnd, valLat, valLng) {
		$(this.inputs.inputEndereco).val(valEnd);
		$(this.inputs.inputLat).val(valLat);
		$(this.inputs.inputLng).val(valLng);
	}
};