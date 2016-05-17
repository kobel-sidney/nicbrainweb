/**
 *
 */
$(document).ready(function () {
    CercaVirtual.initializarMapa();
});

var CercaVirtual = {
    mapa: undefined,
    cerca: undefined,
    locais: new Array(),

    initializarMapa: function () {
        var centroMapa = new google.maps.LatLng(-23.626036115293587,
            -46.5083509683609);
        var configuracaoMapa = {
            center: centroMapa,
            zoom: 16,
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            disableDefaultUI: true,
            panControl: false
        };

        CercaVirtual.mapa = new google.maps.Map(document
            .getElementById('map-canvas'), configuracaoMapa);

        CercaVirtual.cerca = new google.maps.Polygon({
            strokeOpacity: 0.8,
            strokeWeight: 2,
            fillOpacity: 0.35,
            editable: true,
            draggable: true,
            map: CercaVirtual.mapa
        });

        CercaVirtual.buscarCercaVirtual();

        $("#cor").change(function () {
            var options = {
                fillColor: this.value,
                strokeColor: this.value
            }
            CercaVirtual.cerca.setOptions(options);
        });

        CercaVirtual.mapa.controls[google.maps.ControlPosition.TOP_RIGHT].push(document.getElementById('btnVoltar'));
        CercaVirtual.obterCercasVirtuais();
    },

    obterCercasVirtuais: function () {
        $.ajax({
            type: 'GET',
            url: Properties_JS.url_servico + "cercasVirtuais",
            contentType: "application/json; charset=utf-8",
            dataType: 'json',
            success: function (data, textStatus, jqXHR) {
                CercaVirtual.montarCercas(data.cercasVirtuais);
            }
        });
    },
    montarCercas: function (cercasVirtuais) {
        var quant = cercasVirtuais.length;
        var coords = new Array();

        $.each(cercasVirtuais, function (i, cerca) {
            var paths = new Array();

            $.each(cerca.coordenadas, function (i, value) {
                paths.push(new google.maps.LatLng(value.latitude,
                    value.longitude));

            });

            var options = {
                paths: paths,
                fillColor: cerca.cor,
                fillOpacity: 0.1,
                strokeColor: cerca.cor,
                strokeOpacity: 0.8,
                strokeWeight: 1,
                map: CercaVirtual.mapa,
                idInspetoria: cerca.idLocal
            }
            var cerca = new google.maps.Polygon(options);

            CercaVirtual.locais.push(cerca);

            $.each(paths, function (i, value) {
                coords.push(value);
            });
        });

    },

    buscarCercaVirtual: function () {
        var cercaVirtual = {
            idCercaVirtual: $('#idCercaVirtual').val()
        }

        if (cercaVirtual.idCercaVirtual != "") {
            $
                .ajax({
                    type: 'POST',
                    url: Properties_JS.url_servico
                    + "buscarCercaVirtual",
                    data: JSON.stringify(cercaVirtual),
                    contentType: "application/json; charset=utf-8",
                    dataType: 'json',
                    success: function (data, textStatus, jqXHR) {
                        CercaVirtual.montarCerca(data);
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        Mensagem.mostrar('warning',
                            'Não há cerca virtual para esse local.', 5);
                        CercaVirtual.montarTemplate();
                    }
                });
        } else {
            var cercaVirtual = {
                idLocal: $('#idLocal').val()
            }

            $.ajax({
                type: 'POST',
                url: Properties_JS.url_servico
                + "rondaGeral/buscarCoordenadasLocal",
                data: JSON.stringify(cercaVirtual),
                contentType: "application/json; charset=utf-8",
                dataType: 'json',
                success: function (data, textStatus, jqXHR) {
                    CercaVirtual.montarTemplate(data);
                }
            });
        }
    },

    montarTemplate: function (coordenadasCentro) {
        CercaVirtual.mapa.setCenter(new google.maps.LatLng(coordenadasCentro.latitude, coordenadasCentro.longitude));
        CercaVirtual.mapa.setZoom(16);

        var templateCoords = [new google.maps.LatLng(coordenadasCentro.latitude, coordenadasCentro.longitude),
            new google.maps.LatLng(coordenadasCentro.latitude - 0.002, coordenadasCentro.longitude - 0.002),
            new google.maps.LatLng(coordenadasCentro.latitude - 0.002, coordenadasCentro.longitude - (-0.002))];

        var opcoesCerca = {
            paths: templateCoords,
            strokeColor: '#ff0000',
            fillColor: '#ff0000',
        }
        CercaVirtual.cerca.setOptions(opcoesCerca);

        $('#cor').val('#ff0000');
    },

    remover: function () {
        var cercaVirtual = {
            idCercaVirtual: $('#idCercaVirtual').val()
        }

        $
            .ajax({
                type: 'POST',
                url: Properties_JS.url_servico
                + "removerCercaVirtual",
                data: JSON.stringify(cercaVirtual),
                contentType: "application/json; charset=utf-8",
                dataType: 'json',
                // success : function(data, textStatus, jqXHR) {
                //
                // },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    if (XMLHttpRequest.status == '500') {
                        Mensagem
                            .mostrar(
                                'error',
                                'Não há Cerca virtual para ser removida neste local',
                                5);
                    } else {
                        Mensagem.mostrar('success',
                            'Cerca virtual removida com sucesso', 5);
                    }
                }
            });

        var cercaVirtual = {
            idLocal: $('#idLocal').val()
        }

        $.ajax({
            type: 'POST',
            url: Properties_JS.url_servico
            + "rondaGeral/buscarCoordenadasLocal",
            data: JSON.stringify(cercaVirtual),
            contentType: "application/json; charset=utf-8",
            dataType: 'json',
            success: function (data, textStatus, jqXHR) {
                CercaVirtual.montarTemplate(data);
            }
        });
    },

    salvar: function () {
        var arrayCoordenadas = CercaVirtual.cerca.getPath().getArray();

        var idLocal = $('#idLocal').val();
        var idCercaVirtual = $('#idCercaVirtual').val();
        var descricao = $('#descricao').val();
        var cor = $('#cor').val();

        var coords = new Array();
        $.each(arrayCoordenadas, function (i, value) {
            var ponto = {
                indice: i,
                latitude: value.lat(),
                longitude: value.lng()
            };

            coords.push(ponto);
        });

        var coordenada = {
            idCercaVirtual: idCercaVirtual,
            idLocal: idLocal,
            cor: cor,
            descricao: descricao,
            coordenadas: coords
        };

        $
            .ajax({
                type: 'POST',
                url: Properties_JS.url_servico
                + "salvarCercaVirtual",
                data: JSON.stringify(coordenada),
                contentType: "application/json; charset=utf-8",
                dataType: 'json',
                success: function (data, textStatus, jqXHR) {
                    Mensagem.mostrar('success', data, 6);
                }
            });

        Mensagem.mostrar('success', 'Cerca virtual salvo com sucesso', 6);
    },

    montarCerca: function (coordenadasCercaVirtual) {
        Mensagem.fechar();

        var paths = new Array();

        $.each(coordenadasCercaVirtual.coordenadas,
            function (i, value) {
                paths.push(new google.maps.LatLng(value.latitude,
                    value.longitude));
            });

        var options = {
            paths: paths,
            fillColor: coordenadasCercaVirtual.cor,
            strokeColor: coordenadasCercaVirtual.cor
        }
        CercaVirtual.cerca.setOptions(options);

//		Centraliza e da zoom de acordo com coordenadas passadas
        var coords = CercaVirtual.cerca.getPath().getArray();
        CercaVirtual.centralizar(coords);

        $('#cor').val(coordenadasCercaVirtual.cor);
        $('#descricao').val(coordenadasCercaVirtual.descricao);
    },

    centralizar: function (coords) {
        var latlngbounds = new google.maps.LatLngBounds();
        $.each(coords, function (i, value) {
            latlngbounds.extend(value);
        })

        CercaVirtual.mapa.fitBounds(latlngbounds);
    }
};

var Mensagem = {
    mostrar: function (type, message, time) {
        $('#alert').addClass('alert_' + type).html(message).fadeIn();

        $('#alert').click(function () {
            Mensagem.fechar();
        });

        setTimeout("Mensagem.fechar()", time * 1000);
    },

    fechar: function () {
        $('#alert').fadeOut();
    }
}