var PIN_USER = '/resources/images/maps/pin_user.png';
var PIN_USER_FORA = '/resources/images/maps/pin_user_fora.png';
var PIN_OCORRENCIA = '/resources/images/maps/pin_ocorrencia.png';
var PIN_CAMERA = '/resources/images/maps/pin_camera.png';
var PIN_POSTO_SERVICO = '/resources/images/maps/pin_posto_servico.png';

var ronda = new Ronda();
var quickPanel = new QuickPanel();
var cameraCtrl = new CameraCtrl();
var cameraOccurrence = new CameraCtrl();

function Ronda() {

    this.centralizar = function (coordenadas) {
        var latlngbounds = new google.maps.LatLngBounds();

        $.each(coordenadas, function (i, value) {
            latlngbounds.extend(value);
        });

        Ocorrencia.mapa.fitBounds(latlngbounds);
    };
}

function QuickPanel() {

    this.toggle = function () {
        $('#btnQuick').click();
    };

    this.showPatrol = function (patrol) {
        $('#titulo_quick').text('Informações da Ronda');

        /*
         * Cria divs com lista de tripulantes da ronda e mostra no painél
         */
        var crewItems = '';
        $.each(patrol.crew, function (i, crewMember) {
            if (crewMember.usuario == 0)
                crewItems += '<div class="todo-tasklist-item-text" ><i class="icon-user"></i> ' + crewMember.nome + ' </div>';
        });

        $('.crewItems').html(crewItems || '<div class="todo-tasklist-item-text" ><i class="icon-user"></i> Nenhum tripulante </div>');

        /*
         * Obtem nome e foto (Avatar) do usuário e mostra no painél
         */
        $.ajax({
            type: 'GET',
            url: Properties_JS.url_servico + "ronda/online/usuario/" + patrol.idUsuario,
            contentType: "application/json; charset=utf-8",
            dataType: 'json',
            success: function (data, textStatus, jqXHR) {
                $('.userName').html(data.nome);

                if (data.foto != null)
                    $('.userPhoto').attr("src", "data:image/png;base64," + data.foto);
            }
        });

        $('.nameVehicle').html(patrol.nameVehicle || 'Sem veículo');

        /*
         * Obtem nome e foto (Avatar) do usuário e mostra no painél
         */
        $.ajax({
            type: 'GET',
            url: Properties_JS.url_servico + "ronda/online/ocorrencias/" + patrol.idUsuario,
            contentType: "application/json; charset=utf-8",
            dataType: 'json',
            success: function (data, textStatus, jqXHR) {
                $('.flagOcorrencia').html(data != 0 ? 'Em ocorrência' : 'Sem ocorrência');

                var ocorrenciaItems = '';
                $.each(data, function (i, ocorrencia) {
                    ocorrenciaItems += '<div class="todo-tasklist-controls pull-left" style="margin-bottom: 10px;">' +
                            '<div class="todo-tasklist-item-text"><i class="fa fa-fire"></i>' + ocorrencia.classificacao.descricao + '</div>' +
                            '<span class="todo-tasklist-date">' +
                            '<i class="fa fa-calendar"></i> ' + ocorrencia.dataInicio +
                            '</span>' +
                            '<span class="label label-sm label-danger">' + ocorrencia.tipoClassificacao.nome + '</span>' +
                            '</div>';
                });

                $('.ocorrenciaItems').html(ocorrenciaItems || '<div class="todo-tasklist-controls pull-left" style="margin-bottom: 10px;"><div class="todo-tasklist-item-text"><i class="fa fa-fire"></i> Nenhuma ocorrência </div></div>');
            }
        });

        $('.tab-pane').removeClass('active');
        $('#quick_usuario').addClass('active');

        if (!$('.page-md').hasClass('page-quick-sidebar-open')) {
            this.toggle();
        }
    };

    this.showGeneralConfig = function () {
        $('#titulo_quick').text('Configurações do Mapa');

        $('.tab-pane').removeClass('active');
        $('#quick_config_geral').addClass('active');

        if (!$('.page-md').hasClass('page-quick-sidebar-open')) {
            this.toggle();
        }
    };

    this.showOccurrence = function (occurrenceID) {
        $('#titulo_quick').text('Informações da Ocorrência');

        $.ajax({
            type: 'GET',
            url: Properties_JS.url_servico + "ocorrencias/" + occurrenceID,
            contentType: "application/json; charset=utf-8",
            dataType: 'json',
            success: function (data, textStatus, jqXHR) {
                var occurrence = data;

                $('.classification_photo').attr("src", "data:image/png;base64," + occurrence.classificacao.icone);
                $('.classification_occurrence').html('<b>Classificação:</b> ' + occurrence.classificacao.descricao);
                $('.type_classification_occurrence').html('<b>Tipo:</b> ' + occurrence.tipoClassificacao.nome + ' - <b>' + occurrence.tipoClassificacao.prefixo + '</b>');
                $('.data_occurrence').html('<b>Data de início:</b> ' + occurrence.dataInicio + ' ' + occurrence.horaInicio);
                $('.description_occurrence').html('<b>Descrição:</b> ' + occurrence.descricaoOcorrencia);
                if (occurrence.foto === null) {
                    $('.li_img_occurrence').addClass('hide');
                } else {
                    $('.li_img_occurrence').removeClass('hide');
                    $('.img_occurrence').attr("src", "data:image/png;base64," + occurrence.foto);
                }

                var positionOccurrence = new google.maps.LatLng(occurrence.latitude, occurrence.longitude);

                cameraCtrl.camerasNoRaioDe50Metros = [];

                $.each(Ocorrencia.cameras, function (i, camera) {
                    if (google.maps.geometry.spherical.computeDistanceBetween(camera.getPosition(), positionOccurrence) <= 50)
                        cameraCtrl.camerasNoRaioDe50Metros.push(camera);
                });

                if (cameraCtrl.camerasNoRaioDe50Metros.length == 0) {
                    $('.cameras_nearby').addClass('hide');
                } else {
                    $('.cameras_nearby').removeClass('hide');
                }
            }
        });

        $('.tab-pane').removeClass('active');
        $('#quick_occurrence').addClass('active');

        if (!$('.page-md').hasClass('page-quick-sidebar-open')) {
            this.toggle();
        }
    };
}

function occurrence() {
    this.camerasProximas;

    this.showCamerasProximas = function () {
        $.each(Ocorrencia.cameras, function (i, camera) {
            var positionOccurrence = google.maps.LatLng(camera.latitude, camera.longitude);

            if (google.maps.geometry.spherical.computeDistanceBetween(camera
                    .getPosition(), positionOccurrence) <= 50)
                cameraCtrl.camerasNoRaioDe50Metros.push(camera);
        });

        cameraCtrl.mostrarCameras();
    };
}

var Ocorrencia = {
    mapa: undefined,
    locais: new Array(),
    veiculos: new Array(),
    cameras: new Array(),
    postos: new Array(),
    eventosPanel: true,
    ocorrencia: {},
    ocorrencias: new Array(),
    infoViatura: new google.maps.InfoWindow(),
    clusterVeiculos: undefined,
    clusterOcorrencias: undefined,
    managerPostosServico: undefined,
    panelLateralIsOpen: false,
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

        Ocorrencia.mapa = new google.maps.Map(document
                .getElementById('map-ocorrencia'), configuracaoMapa);

        /* Início - Adiciona formulário de legenda */
        Ocorrencia.mapa.controls[google.maps.ControlPosition.RIGHT_BOTTOM]
                .push(document.getElementById('form-legenda'));
        /* Fim - Adiciona formulário de legenda */

        Ocorrencia.obterCercasVirtuais();

        var clusterStyles = [[{
                    url: '/resources/images/maps/clusterPolicia.png',
                    height: 55,
                    width: 55,
                    anchor: [0, 0]
                }], [{
                    url: '/resources/images/maps/clusterOcorrencia.png',
                    height: 55,
                    width: 55,
                    anchor: [0, 0]
                }]];

        Ocorrencia.clusterOcorrencias = new MarkerClusterer(Ocorrencia.mapa,
                Ocorrencia.ocorrencias, {
                    maxZoom: 15,
                    styles: clusterStyles[1]
                });
        Ocorrencia.clusterVeiculos = new MarkerClusterer(Ocorrencia.mapa,
                Ocorrencia.veiculos, {
                    maxZoom: 15,
                    styles: clusterStyles[0]
                });

        Ocorrencia.ativarRotinaDeAtualizacao();
        Ocorrencia.obterCameras();

        /*
         * Inicio - Lógica do menu de configurações do mapa
         */
        $(".make-switch").bootstrapSwitch();

        $('#check_posto_servico').on('switchChange.bootstrapSwitch', function (event, state) {
            if (state) {
                $.each(Ocorrencia.postos, function (i, posto) {
                    posto.setVisible(true);
                });
            } else {
                $.each(Ocorrencia.postos, function (i, posto) {
                    posto.setVisible(false);
                });
            }
        });

        $('#check_camera').on('switchChange.bootstrapSwitch', function (event, state) {
            if (state) {
                $.each(Ocorrencia.cameras, function (i, camera) {
                    camera.setVisible(true);
                });
            } else {
                $.each(Ocorrencia.cameras, function (i, camera) {
                    camera.setVisible(false);
                });
            }
        });

        $('#check_legenda_mapa').on('switchChange.bootstrapSwitch', function (event, state) {
            if (state) {
                Ocorrencia.mostrarLegenda();
            } else {
                Ocorrencia.esconderLegenda();
            }
        });
        /*
         * Fim - Lógica do dropmenu de opções
         */

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
                    map: Ocorrencia.mapa,
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
            Ocorrencia.mapa.fitBounds(bounds);
            $('#pesquisa_endereco').val("");
        });
        /*
         * Fim - Campo de pesquisa autocomplete
         */

        $('#classificacao').change(function () {
            if (this.value != 0)
                $.ajax({
                    type: 'GET',
                    url: Properties_JS.url_servico + "ocorrencias/tipos/" + this.value,
                    contentType: "application/json; charset=utf-8",
                    dataType: 'json',
                    success: function (data, textStatus, jqXHR) {
                        var tipos = '<option value="0">Nada selecionado...</option>';
                        $.each(data, function (i, tipo) {
                            tipos += '<option data-subtext="' + tipo.prefixo + '" value="' + tipo.id + '">' + tipo.nome + '</option>';
                        });

                        $('#tipo').html(tipos).selectpicker('refresh');
                        ;
                    }
                });
        });

        Ocorrencia.mapa.addListener('click', function (e) {
            Ocorrencia.abrirFormOcorrencia(e);
        });
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

        Ocorrencia.mapa.setOptions(zoomControlOptions);
        $("#form-legenda").removeClass("hide");
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

        Ocorrencia.mapa.setOptions(zoomControlOptions);
        $("#form-legenda").addClass("hide");
    },
    ativarRotinaDeAtualizacao: function () {
        Ocorrencia.obterOcorrencias();
        Ocorrencia.obterPostosServico();

        setInterval(function () {
            Ocorrencia.obterOcorrencias();
        }, 5000);
    },
    abrirFormOcorrencia: function (e) {
        Ocorrencia.ocorrencia.latitude = e.latLng.lat();
        Ocorrencia.ocorrencia.longitude = e.latLng.lng();

        $('.btn-save').addClass('hide');
        $('#eventosPanel').removeClass('hide');
        $('#ocorrenciaPanel').addClass('hide');

        $('#modalOcorrencia').click();
    },
    addOcorrencia: function (idEvento) {
        Ocorrencia.ocorrencia.idEvento = idEvento;

        $('.btn-save').removeClass('hide');
        $('#eventosPanel').addClass('hide');
        $('#ocorrenciaPanel').removeClass('hide');

        Ocorrencia.eventosPanel = !Ocorrencia.eventosPanel;
    },
    salvar: function () {
        Ocorrencia.ocorrencia.idClassificacaoOcorrencia = $('#classificacao')
                .val();
        Ocorrencia.ocorrencia.idTipoClassificacaoOcorrencia = $('#tipo')
                .val();
        Ocorrencia.ocorrencia.idGravidadeOcorrencia = $('#gravidade').val();
        Ocorrencia.ocorrencia.descricaoOcorrencia = $('#descricao').val();

        $.ajax({
            type: 'POST',
            url: Properties_JS.url_servico + "ocorrencias/abrir",
            data: JSON.stringify(Ocorrencia.ocorrencia),
            contentType: "application/json; charset=utf-8",
            dataType: 'json',
            success: function (data, textStatus, jqXHR) {
                Message.showSuccessMessage("Sucesso",
                        "Ocorrência aberta com sucesso.");
            },
            error: function () {
                Message.showErrorMessage("", "Erro ao abrir ocorrência")
            }
        });

        $('#fechar_dialog').click();

        $('#descricao').val("");
    },
    obterPostosServico: function () {
        $.ajax({
            type: 'GET',
            url: Properties_JS.url_servico + "ronda/online/postosServico",
            contentType: "application/json; charset=utf-8",
            dataType: 'json',
            success: function (data, textStatus, jqXHR) {
                Ocorrencia.mostrarPostosServico(data.postosServicos);
            }
        });
    },
    mostrarPostosServico: function (postos) {
        Ocorrencia.postos.limparPostos();

        $.each(postos,
                function (i, posto) {
                    var ponto = new google.maps.LatLng(posto.latitude,
                            posto.longitude);
                    var isVisible = false;

                    if ($("#check_posto_servico").is(":checked")) {
                        isVisible = true;
                    } else {
                        isVisible = false;
                    }

                    var o = new google.maps.Marker({
                        position: ponto,
                        map: Ocorrencia.mapa,
                        title: posto.nome,
                        icon: PIN_POSTO_SERVICO,
                        idPosto: posto.idPosto,
                        visible: isVisible
                    });

                    google.maps.event.addListener(o, 'click', function () {
                        var conteudo = '<div>' + '<div>' + '<b>Descrição:</b> '
                                + this.title + '</div>' + '<hr />' + '<div>'
                                + '</div>' + '</div>';

                        Ocorrencia.infoViatura.setContent(conteudo);
                        Ocorrencia.infoViatura.open(Ocorrencia.mapa, this);
                    });

                    Ocorrencia.postos.push(o);
                });
    },
    obterCercasVirtuais: function () {
        $.ajax({
            type: 'GET',
            url: Properties_JS.url_servico + "cercasVirtuais",
            contentType: "application/json; charset=utf-8",
            dataType: 'json',
            success: function (data, textStatus, jqXHR) {
                Ocorrencia.montarCercas(data.cercasVirtuais);
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
                map: Ocorrencia.mapa,
                idInspetoria: cerca.idLocal
            };
            var cerca = new google.maps.Polygon(options);

            cerca.addListener('click', function (e) {
                Ocorrencia.abrirFormOcorrencia(e);
            });

            Ocorrencia.locais.push(cerca);

            $.each(paths, function (i, value) {
                coords.push(value);
            });
        });

        // Centraliza e da zoom de acordo com coordenadas passadas
        ronda.centralizar(coords);
    },
    obterOcorrencias: function () {
        $.ajax({
            type: 'GET',
            url: Properties_JS.url_servico + "ronda/online/ocorrencias",
            contentType: "application/json; charset=utf-8",
            dataType: 'json',
            success: function (data, textStatus, jqXHR) {
                ocorrenciaCtrl.mostrarOcorrencias(data);
            }
        });
    },
    obterCameras: function () {
        $.ajax({
            type: 'GET',
            url: Properties_JS.url_servico + "ronda/online/cameras",
            contentType: "application/json; charset=utf-8",
            dataType: 'json',
            success: function (data, textStatus, jqXHR) {
                Ocorrencia.mostrarCameras(data);
            }
        });
    },
    mostrarCameras: function (cameras) {
        Ocorrencia.cameras.limparCameras();

        $
                .each(
                        cameras,
                        function (i, camera) {
                            var ponto = new google.maps.LatLng(
                                    camera.latitude, camera.longitude);

                            var c = new google.maps.Marker({
                                position: ponto,
                                map: Ocorrencia.mapa,
                                title: camera.nome,
                                icon: PIN_CAMERA,
                                idCamera: camera.id,
                                endereco: camera.endereco,
                                visible: false
                            });

                            google.maps.event
                                    .addListener(
                                            c,
                                            'click',
                                            function () {
                                                var conteudo = '<div>'
                                                        + '<object classid="clsid:9BE31822-FDAD-461B-AD51-BE1D1C159921" codebase="http://download.videolan.org/pub/videolan/vlc/last/win32/axvlc.cab" id="vlc">'
                                                        + '<param name="autostart" value="true" />'
                                                        + '<embed type="application/x-vlc-plugin" pluginspage="http://www.videolan.org" name="vlc" width="400" height="240" controls="true" mute="true" id="'
                                                        + camera.id
                                                        + '" target="'
                                                        + camera.endereco
                                                        + '" />'
                                                        + '</object>'
                                                        + '</div>';

                                                Ocorrencia.infoViatura
                                                        .setContent(conteudo);
                                                Ocorrencia.infoViatura
                                                        .open(
                                                                Ocorrencia.mapa,
                                                                this);
                                            });

                            Ocorrencia.cameras.push(c);
                        });
    },
    atualizarNotificacaoOcorrencias: function (ocorrencias) {
        //Quantidade de ocorrências
        $(".notif_ocorrencia_quant").text(ocorrencias.length);

        //Remove todos itens de ocorrência
        $(".notif_ocorrencia_item").remove();

        $.each(ocorrencias, function (i, ocorrencia) {

            var pontos = {
                ponto: new google.maps.LatLng(ocorrencia.latitude,
                        ocorrencia.longitude)
            };

            var liPrincipal = $('<li>');
            liPrincipal.addClass('notif_ocorrencia_item');

            var a = $('<a>');
            a.attr('href', 'javascript:;');
            a.click(function () {
                ronda.centralizar(pontos);
            });

            var spanTime = $('<span>');
            spanTime.addClass('time');
            spanTime.text(ocorrencia.horaInicio + ' min');
            a.append(spanTime);

            var spanDetails = $('<span>');
            spanDetails.addClass('details');

            var spanLabel = $('<span>');
            spanLabel.addClass('label label-sm label-icon label-danger');

            var icon = $('<i>');
            icon.addClass('icon-fire');

            spanLabel.append(icon);
            spanDetails.append(spanLabel);
            spanDetails.append(ocorrencia.classificacao.descricao + ' - <b>' + ocorrencia.tipoClassificacao.prefixo + '</b>');
            a.append(spanDetails);

            liPrincipal.append(a);

            $("#notif_ocorrencia_list").append(liPrincipal);
        });
    }
};

var ocorrenciaCtrl = {
    idOcorrenciaAtual: 0,
    ocorrencia: {},
    mostrarOcorrencias: function (data) {
        var ocorrencias = data.ocorrencias;
        var ocorrenciasFinalizadas = data.ocorrenciasFinalizadas;

        $.each(ocorrencias, function (i, ocorrencia) {
            if (!ocorrenciaCtrl.containsOcorrencia(ocorrencia)) {
                ocorrenciaCtrl.criarMarcador(ocorrencia);
            }
        });

        $.each(ocorrenciasFinalizadas, function (i, ocorrencia) {
            ocorrenciaCtrl.removerMarcador(ocorrencia);
        });

        Ocorrencia.atualizarNotificacaoOcorrencias(data.ocorrencias);

        if (cameraCtrl.showInfo === false) {
            cameraCtrl.showInfo = true;
        }
    },
    criarMarcador: function (ocorrencia) {
        var position = new google.maps.LatLng(ocorrencia.latitude, ocorrencia.longitude);

        var marcador = new google.maps.Marker({
            position: position,
            title: ocorrencia.descricaoOcorrencia,
            map: Ocorrencia.mapa,
            draggable: true,
            icon: ocorrencia.classificacao != undefined ? 'data:image/png;base64,' + ocorrencia.classificacao.pin : PIN_OCORRENCIA,
            crossOnDrag: false,
            idOcorrencia: ocorrencia.idOcorrencia,
            dataInicio: ocorrencia.dataInicio,
            horaInicio: ocorrencia.horaInicio,
            status: ocorrencia.status
        });

        Ocorrencia.ocorrencias.push(marcador);
        Ocorrencia.clusterOcorrencias.addMarker(marcador);

        var markerTemp = undefined;

        marcador.addListener('dragstart', function () {
            ocorrenciaCtrl.idOcorrenciaAtual = this.idOcorrencia || 0;
            this.setOpacity(0.5);

            markerTemp = new google.maps.Marker({
                position: this.getPosition(),
                map: this.getMap(),
                icon: this.icon,
                opacity: 0.7
            });
        });

        marcador.addListener('dragend', function () {
            this.setPosition(markerTemp.getPosition());
            this.setOpacity(1.0);

            markerTemp.setMap(null);
        });

        marcador.addListener('click', function () {
            quickPanel.showOccurrence(this.idOcorrencia);
        });

        if (cameraCtrl.showInfo) {
            cameraCtrl.camerasNoRaioDe50Metros = [];

            $.each(Ocorrencia.cameras, function (i, camera) {
                if (google.maps.geometry.spherical.computeDistanceBetween(camera
                        .getPosition(), marcador.getPosition()) <= 50)
                    cameraCtrl.camerasNoRaioDe50Metros.push(camera);
            });

            if (cameraCtrl.camerasNoRaioDe50Metros.length > 0)
                showInfoCameras("Clique para abrir", "Há "
                        + cameraCtrl.camerasNoRaioDe50Metros.length
                        + " câmeras à menos de 50 metros da ocorrência '"
                        + ocorrencia.descricaoOcorrencia + "'.");
        }
    },
    removerMarcador: function (ocorrencia) {
        var count = Ocorrencia.ocorrencias.length;

        while (count--) {
            if (Ocorrencia.ocorrencias[count].idOcorrencia === ocorrencia.idOcorrencia) {
                Ocorrencia.ocorrencias[count].setMap(null);
                break;
            }
        }
    },
    containsOcorrencia: function (ocorrencia) {
        var count = Ocorrencia.ocorrencias.length;

        while (count--) {
            if (Ocorrencia.ocorrencias[count].idOcorrencia === ocorrencia.idOcorrencia) {
                return true;
            }
        }

        return false;
    }
};

function CameraCtrl() {

    this.showInfo = false;
    this.camerasNoRaioDe50Metros = [];

    this.mostrarCameras = function () {
        var camerasHtml = '';
        $
                .each(
                        this.camerasNoRaioDe50Metros,
                        function (key, camera) {
                            camerasHtml += '<div class="col-md-4">'
                                    + '<div class="portlet light">'
                                    + '<div class="portlet-title">'
                                    + '<div class="caption font-red-sunglo">'
                                    + '<i class="icon-camcorder font-red-sunglo"></i>'
                                    + '<span class="caption-subject bold uppercase"> Câmera </span>'
                                    + '<span class="caption-helper">'
                                    + camera.title
                                    + '</span>'
                                    + '</div>'
                                    + '<div class="actions">'
                                    + '<a class="btn btn-circle btn-icon-only btn-default fullscreen" href="javascript:;">'
                                    + '</a>'
                                    + '</div>'
                                    + '</div>'
                                    + '<div class="portlet-body">'
                                    + '<object classid="clsid:9BE31822-FDAD-461B-AD51-BE1D1C159921" codebase="http://download.videolan.org/pub/videolan/vlc/last/win32/axvlc.cab" id="vlc2">'
                                    + '<param name="autostart" value="true" />'
                                    + '<embed type="application/x-vlc-plugin" pluginspage="http://www.videolan.org" name="vlc" width="100%" height="180" controls="false" mute="true" id="vlc3" target="'
                                    + camera.endereco + '" />' + '</object>'
                                    + '</div>' + '</div>' + '</div>';
                        });

        $('#conteudoCameras').html(camerasHtml);
        $('#modalCameras').click();

        this.camerasNoRaioDe50Metros = [];
    };
}

function showInfoCameras(title, message) {
    toastr.options = {
        closeButton: true,
        debug: false,
        positionClass: "toast-top-right",
    };
    toastr.options.onclick = function () {
        cameraCtrl.mostrarCameras()
    };

    toastr.options.showDuration = '10000';
    toastr.options.timeOut = '10000';

    toastr['info'](message, title);
}

var Message = {
    toastr: {
        options: {
            "closeButton": true,
            "debug": false,
            "positionClass": "toast-top-right",
            // "onclick" : null,
            "showDuration": "1000",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        }
    },
    showSuccessMessage: function (title, message) {
        toastr['success'](message, title);
    },
    showInfoMessage: function (title, message) {
        toastr['info'](message, title);
    },
    showWarningMessage: function (title, message) {
        toastr['warning'](message, title);
    },
    showErrorMessage: function (title, message) {
        toastr['error'](message, title);
    },
    showInfoCameras: function (title, message) {
        Message.toastr.options.onclick = function () {
            alert("kjgjgkjg");
        }
        toastr['info'](message, title);
    }
}

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

    Ocorrencia.ocorrencias.length = 0;
};

Array.prototype.limparCameras = function () {
    var count = this.length;

    for (var i = 0; i < count; i++) {
        this[i].setMap(null);
    }

    Ocorrencia.cameras.length = 0;
};

Array.prototype.limparPostos = function () {
    var count = this.length;

    for (var i = 0; i < count; i++) {
        this[i].setMap(null);
    }

    Ocorrencia.postos.length = 0;
};