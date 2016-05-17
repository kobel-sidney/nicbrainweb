$(function() {
    $('#dlg_rota').click();
});

var RondaDetalhe = {
    mapa: undefined,
    locais: new Array(),
    pontosViatura: new Array(),
    rota: undefined,
    pontoInicio: undefined,
    pontoFinal: undefined,
    iniciarMapa: function () {
        var centroMapa = new google.maps.LatLng(-23.626036115293587,
                -46.5083509683609);
        var configuracaoMapa = {
            center: centroMapa,
            zoom: 13,
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            mapTypeControl: true,
            mapTypeControlOptions: {
                style: google.maps.MapTypeControlStyle.HORIZONTAL_BAR,
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
        RondaDetalhe.mapa = new google.maps.Map(document.getElementById('map-detalhe'), configuracaoMapa);
        
        RondaDetalhe.mapa.controls[google.maps.ControlPosition.RIGHT_BOTTOM]
                .push(document.getElementById('form-information'));

        /* Início - Adiciona formulário de informações da rota */
        RondaDetalhe.mapa.controls[google.maps.ControlPosition.RIGHT_BOTTOM].push(document.getElementById('informacoesRota'));
        /* Fim - Adiciona formulário de informações da rota */

        RondaDetalhe.obterCercasVirtuais();

        RondaDetalhe.rota = new google.maps.Polyline({
            strokeColor: '#00008B',
            strokeOpacity: 3.0,
            strokeWeight: 4,
            geodesic: true,
            map: RondaDetalhe.mapa
        });

        RondaDetalhe.pontoInicio = new google.maps.Marker({
            map: RondaDetalhe.mapa,
            icon: '/resources/images/maps/letter_a.png'
        });

        RondaDetalhe.pontoFinal = new google.maps.Marker({
            map: RondaDetalhe.mapa,
            icon: '/resources/images/maps/letter_b.png'
        });

        /*
         * Inicio - Campo de pesquisa autocomplete
         */
        var input = document.getElementById('pesquisa_endereco');
        var searchBox = new google.maps.places.SearchBox(input);

        searchBox.addListener('places_changed', function () {
            var places = searchBox.getPlaces();

            if (places.length == 0) {
                return;
            }

            // For each place, get the icon, name and location.
            var bounds = new google.maps.LatLngBounds();
            places.forEach(function (place) {
                var icon = {
                    url: place.icon,
                    size: new google.maps.Size(71, 71),
                    origin: new google.maps.Point(0, 0),
                    anchor: new google.maps.Point(17, 34),
                    scaledSize: new google.maps.Size(25, 25)
                };

                // Create a marker for each place.
                var marker = new google.maps.Marker({
                    map: RondaDetalhe.mapa,
                    icon: icon,
                    title: place.name,
                    position: place.geometry.location,
                    animation: google.maps.Animation.BOUNCE
                });

                setTimeout(function () {
                    marker.setMap(null);
                }, 3000);

                if (place.geometry.viewport) {
                    // Only geocodes have viewport.
                    bounds.union(place.geometry.viewport);
                } else {
                    bounds.extend(place.geometry.location);
                }
            });
            RondaDetalhe.mapa.fitBounds(bounds);
            $('#pesquisa_endereco').val("");
        });
        /*
         * Fim - Campo de pesquisa autocomplete
         */
    },
    mostrarLegenda: function () {
        var zoomControlOptions = {
            zoomControlOptions: {
                position: google.maps.ControlPosition.LEFT_TOP
            },
            streetViewControlOptions: {
                position: google.maps.ControlPosition.LEFT_TOP
            }
        };

        RondaDetalhe.mapa.setOptions(zoomControlOptions);
        $("#form-information").removeClass("hide");
    },
    esconderLegenda: function () {
        var zoomControlOptions = {
            zoomControlOptions: {
                position: google.maps.ControlPosition.RIGHT_BOTTOM
            },
            streetViewControlOptions: {
                position: google.maps.ControlPosition.RIGHT_BOTTOM
            }
        };

        RondaDetalhe.mapa.setOptions(zoomControlOptions);
        $("#form-information").addClass("hide");
    },
    obterCercasVirtuais: function () {
        $.ajax({
            type: 'GET',
            url: Properties_JS.url_servico + "cercasVirtuais",
            contentType: "application/json; charset=utf-8",
            dataType: 'json',
            success: function (data, textStatus, jqXHR) {
                RondaDetalhe.montarCercas(data.cercasVirtuais);
            }
        });
    },
    montarCercas: function (cercasVirtuais) {
        var quant = cercasVirtuais.length;
        var coords = new Array();

        $.each(cercasVirtuais, function (i, cerca) {
            var paths = new Array();

            $.each(cerca.coordenadas, function (i, value) {
                paths.push(new google.maps.LatLng(value.latitude, value.longitude));
            });

            var options = {
                paths: paths,
                fillColor: cerca.cor,
                fillOpacity: 0.1,
                strokeColor: cerca.cor,
                strokeOpacity: 0.8,
                strokeWeight: 1,
                map: RondaDetalhe.mapa,
                idInspetoria: cerca.idLocal
            }
            var cerca = new google.maps.Polygon(options);

            RondaDetalhe.locais.push(cerca);

            $.each(paths, function (i, value) {
                coords.push(value);
            });
        });

//		Centraliza e da zoom de acordo com coordenadas passadas
        RondaDetalhe.centralizar(coords);
    },
    aplicarFiltro: function () {        
        $('#close_dialog').click();
        
        RondaDetalhe.rota.setPath(new Array());
        RondaDetalhe.pontoInicio.setPosition(null);
        RondaDetalhe.pontoFinal.setPosition(null);

        var idRonda = $('#id_ronda').val();
        var data_inicio = $('#data_inicio').val();
        var data_fim = $('#data_fim').val();
        var hora_inicio = $('#hora_inicio').val();
        var hora_fim = $('#hora_fim').val();

        var inicio = data_inicio + " " + hora_inicio;
        var fim = data_fim + " " + hora_fim;

        if (inicio != "") {

            var query = {
                idRonda : idRonda,
                inicio: inicio,
                fim: fim
            };

                $.ajax({
                    type: 'POST',
                    url: Properties_JS.url_servico + "ronda/detalhe/coordenadas",
                    data: JSON.stringify(query),
                    contentType: "application/json; charset=utf-8",
                    dataType: 'json',
                    success: function (data, textStatus, jqXHR) {
                        RondaDetalhe.montarRota(data);
                    }, error: function(r){
                    	showMessages('error', 'Erro', 'Houve algum erro ao traçar a rota');
                    }
                });
        }
    },
    montarRota: function (ronda) {
        if (ronda != undefined) {
            var pontosRota = RondaDetalhe.rota.getPath();
            var kmPercorrido = 0;
            var pontoTemp = undefined;
            var latlngbounds = new google.maps.LatLngBounds();

            $.each(ronda.listRonda, function (i, valor) {
                var ponto = new google.maps.LatLng(valor.locationDTO.latitude,
                        valor.locationDTO.longitude);
                pontosRota.push(ponto);

                if (pontoTemp !== undefined) {
                    kmPercorrido += google.maps.geometry.spherical
                            .computeDistanceBetween(pontoTemp, ponto);
                }

                pontoTemp = ponto;

                latlngbounds.extend(ponto);
                RondaDetalhe.mapa.fitBounds(latlngbounds);
            });

            if (ronda.listRonda.length > 0) {
                RondaDetalhe.pontoInicio.setPosition(new google.maps.LatLng(
                        ronda.listRonda[0].locationDTO.latitude,
                        ronda.listRonda[0].locationDTO.longitude));

                RondaDetalhe.pontoFinal
                        .setPosition(new google.maps.LatLng(
                                ronda.listRonda[ronda.listRonda.length - 1].locationDTO.latitude,
                                ronda.listRonda[ronda.listRonda.length - 1].locationDTO.longitude));

                var rota = {
                    descricaoViarura: ronda.listRonda[0].descricaoVeiculo,
                    distanciaPercorrida: (kmPercorrido / 1000).toFixed(2)
                            + ' km',
                    duracao: DateUtil
                            .segundosParaHoraCompleta(ronda.listRonda.length * 10),
                    inicio: new Date(ronda.listRonda[0].date).toUTCString()
                            .substring(17, 25),
                    fim: new Date(
                            ronda.listRonda[ronda.listRonda.length - 1].date)
                            .toUTCString().substring(17, 25)
                };
                RondaDetalhe.apresentarInformacoesRota(rota);
            } else {
                showMessages('info', 'Ops!', 'Não foi encontrado nenhum ponto para traçar a rota')
                RondaDetalhe.limparInformacoesRota();
            }      
            
            
        }
    },
    apresentarInformacoesRota: function (rota) {
        $('#descricaoViatura').text(rota.descricaoViarura);
        $('#distancia').text(rota.distanciaPercorrida);
        $('#duracao').text(rota.duracao);
        $('#inicio_info').text(rota.inicio);
        $('#fim_info').text(rota.fim);
        RondaDetalhe.mostrarLegenda();
    },
    limparInformacoesRota: function () {
        $('#descricaoViatura').text('');
        $('#distancia').text('');
        $('#duracao').text('');
        $('#inicio_info').text('');
        $('#fim_info').text('');
        RondaDetalhe.esconderLegenda();
    },
    centralizar: function (coords) {
        var latlngbounds = new google.maps.LatLngBounds();
        $.each(coords, function (i, value) {
            latlngbounds.extend(value);
        });

        RondaDetalhe.mapa.fitBounds(latlngbounds);
    }
};

function showMessages(type, title, message) {
    toastr.options = {
        closeButton: true,
        debug: false,
        positionClass: "toast-top-right"
    };

    toastr[type](message, title);
}

var DateUtil = {
    segundosParaHoraCompleta: function (tempo) {
        var hours = Math.floor(tempo / 3600);
        var minutes = Math.floor((tempo % 3600) / 60);
        var seconds = tempo % 60;

        minutes = minutes < 10 ? '0' + minutes : minutes;

        seconds = seconds < 10 ? '0' + seconds : seconds;

        var result = hours + ":" + minutes + ":" + seconds;

        return result;
    }
}

