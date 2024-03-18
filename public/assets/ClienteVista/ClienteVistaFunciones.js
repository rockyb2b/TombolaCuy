function getUrlParameter(name) {
    name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
    var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
    var results = regex.exec(location.search);
    return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
}
function CargarClienteVistaTabla() { //results  Venta.CajaTabla view with variables values
    $.ajax({
        type: 'POST',
        url: basePath + 'ClienteVistaCajaTablaFk',
        data: {
            sessionToken : OPCIONES_VENTA_VISTA.sessionToken ,
            playerID :     OPCIONES_VENTA_VISTA.playerID,
            gameID :       OPCIONES_VENTA_VISTA.gameID
        },
        beforeSend:function(){
            detenerHistorialJackpot();
            $.LoadingOverlay("show");
        },
        success: function (response) {
            $('.modal').modal('hide');
            $("#contenedor_venta").html(response.html);
            if(response.error != "")
            {
                toastr.error(response.error);
            }
            INICIAR(response.eventoactual);
            $.LoadingOverlay("hide");
        },
       error: function (jqXHR, textStatus, errorThrown) {
            toastr.error("Error de Conexión a Servidor");
            $.LoadingOverlay("hide");
            setTimeout(
                function(){
                    CargarClienteVistaTabla();
                },5000
            )
        }
    })
}
function EventoActual() { //results consulta  datos evento actual e inicia contador para animacion cuy
    $.ajax({
        type: 'POST',
        url: basePath + 'EventoActual',
        data: {
            sessionToken :  OPCIONES_VENTA_VISTA.sessionToken,
            playerID :      OPCIONES_VENTA_VISTA.playerID,
            gameID :        OPCIONES_VENTA_VISTA.gameID
        },
        beforeSend:function(){
            detenerHistorialJackpot();
            $.LoadingOverlay("show");
        },
        success: function (response) {
            $('.modal').modal('hide');
            if(response.error != "")
            {
                toastr.error(response.error);
            }
            INICIAR(response.eventoactual);
            actualizar_evento_titulo(response.eventoactual.idEvento)
            $.LoadingOverlay("hide");
        },
       error: function (jqXHR, textStatus, errorThrown) {
            toastr.error("Error de Conexión a Servidor");
            $.LoadingOverlay("hide");
            setTimeout(
                function(){
                    EventoActual();
                },5000
            )
        }
    })
}
function INICIAR(evento = null)
{
    $(".TOMBOLACUY").show();
    eventos_botones(evento); ////botones 1-22, rangos, colores ,  botones apuestas(1,2,4,5,10,20,50,100)  , botones check, x, buscar,imprimir
    responsivetombola();
    $(window).resize(function () {
        responsivetombola();
        var heighttbody = $(".rowtablaeventos").height()-$("#tabla_eventos thead").height();
        $("#tabla_eventos tbody").height(heighttbody);
    }).trigger('resize');

    EventoDatosJsonNuevo(evento);/// pide hora        
}
function EventoDatosJsonNuevo(evento) {    
    LimpiarApuestas();
    procesar_hora(evento);//CLOCK
    datos_configuracion_vista(evento);
    OPCIONES_VENTA_VISTA.DETENER_HISTORIALJACKPOT = false;
    OPCIONES_VENTA_VISTA.ajax_historial = HistorialJackpotDatosJson(evento.idEvento);    
    setTimeout(function(){
        $(".TOMBOLACUY").css("cursor","").show();
    },500);    
}///FIN EventoDatosJson
function procesar_hora(eventoactual){ //generar HORA VistaCliente
    var time_now = get_hora();
    var time_event_seconds = addSecondsToCurrentDate(OPCIONES_VENTA_VISTA.TIEMPO_VISTA_VENTA);

    var proxima_fecha = moment(time_event_seconds, "YYYY-MM-DD HH:mm:ss a");
    var ahora = moment( time_now );
    var segundos = proxima_fecha.diff(ahora,'seconds');
    reloj_generar( time_now );

    if(segundos < 1){
        console.warn("Evento " + eventoactual.idEvento + " con fecha fin= " + proxima_fecha.format("YYYY-MM-DD HH:mm:ss")+" menor a hora actual=" + ahora.format("YYYY-MM-DD HH:mm:ss")+", RECARGANDO....");
        toastr.error("Evento #" + eventoactual.idEvento + " ya finalizó, Recargar")
        detenerContador();
        $("#proximo_en2").text("--");
        $("#barra_loading").css("width","100%");
        $.LoadingOverlay("hide");
        $("#contador_overlay").remove();
        $("#recargar_tabla").text("Recargar").show();
    } else {
        $("#recargar_tabla").hide().text("");
        ContadorProximoEvento( eventoactual.idEvento , time_now ,time_event_seconds, OPCIONES_VENTA_VISTA.SEG_BLOQUEO_ANTES_EVENTO );
    }
}

function ContadorProximoEvento(evento_id , horaserv,fechaFinEvento,segundosantesbloqueo){
    var proxima_fecha = moment(fechaFinEvento, "YYYY-MM-DD HH:mm:ss a");
    var ahora = moment(horaserv);
    var segundos = proxima_fecha.diff(ahora,'seconds');
    $("#proximo_en2").text("--");
    if(segundos > 0){
        iniciarContador(evento_id , segundos, $("#proximo_en2"),segundosantesbloqueo) ;
    }
    else{
        if(typeof OPCIONES_VENTA_VISTA.intervalo_contador != "undefined"){
            clearInterval(OPCIONES_VENTA_VISTA.intervalo_contador) 
        }
    }
    console.log(horaserv);
}
function iniciarContador(evento_id , duration, display ,segundosantesbloqueo) { ///ACTUALIZAR  "PRÓXIMO EN" ,  barra loading evento 
    var timer = duration;
    detenerContador();
    OPCIONES_VENTA_VISTA.intervalo_contador = setInterval(function () {
        var minutos = parseInt(timer / 60, 10);
        var segundos = parseInt(timer % 60, 10);    
        minutos = minutos < 10 ? "0" + minutos : minutos;
        segundos = segundos < 10 ? "0" + segundos : segundos;
        display.text(minutos + ":" + segundos);
        // ///////segundos bloqueo        
        if(OPCIONES_VENTA_VISTA.RECARGAR_TOMBOLA){
            if(minutos == 0 && segundos <= segundosantesbloqueo){
                detenerHistorialJackpot();
                if($("#contador_overlay").length == 0){
                    crear_loadingoverlay_contador();
                }
                if($("#contador_overlay").length > 0){
                    $("#contador_overlay").text(segundos)
                }

                SONIDOS_LOOPS.sonido_vista_venta_contador_final.play();                
            }
            else{
                var segundostotales = parseInt((parseInt(minutos)*60)) + parseInt(segundos);
                if(segundostotales == segundosantesbloqueo){
                    $.LoadingOverlay("show",{ image : OPCIONES_VENTA_VISTA.imagen_loadingoverlay_contador})
                }
            }
            if(minutos == 0 && segundos == 0){ ///CONTADOR TERMINA
                SONIDOS_LOOPS.sonido_vista_venta_contador_final.pause();
                detenerContador();
                setTimeout(function(){
                    ocultar_loadingoverlay_contador();                    
                    clientevistaindex_mostrar_cuy();
                    get_evento_ganador(evento_id);  //en animacion.js
                },2000);
            }
        }
        //fin segundos bloqueo
        if (--timer < 0) {
            timer = 0;// duration;
        }
    }, 1000);
    setTimeout(function(){
        activarBarraLoading(duration - segundosantesbloqueo);
    },1000);
}

function GuardarTicket(eventoactual,ticketobjeto_imprimir){/////GUARDATICKET EN TICKET Y APUESTAS , ABRE MODAL
    var TicketObjeto = {};
    TicketObjeto.idEvento = eventoactual.idEvento;
    TicketObjeto.ganador = 0;
    TicketObjeto.estadoTicket = 1;

    TicketObjeto.ApuestaMinimaJuego = eventoactual.apuestaMinimaJuego;
    TicketObjeto.ApuestaMaximaJuego = eventoactual.apuestaMaximaJuego;

    TicketObjeto.ApuestaMinima = eventoactual.apuestaMinima;
    TicketObjeto.ApuestaMaxima = eventoactual.apuestaMaxima;
    TicketObjeto.PremioMaximoPagar = eventoactual.apuestaMaxima;
    TicketObjeto.PremioMaximoPotencial = eventoactual.apuestaMaxima;

    TicketObjeto.PremioMaximoPotencial_guardar = ticketobjeto_imprimir.PremioMaximoPotencial_guardar;
    TicketObjeto.PremioMaximoPagar_guardar = ticketobjeto_imprimir.PremioMaximoPagar_guardar;
    
    TicketObjeto.sessionToken = OPCIONES_VENTA_VISTA.sessionToken;
    TicketObjeto.playerID = OPCIONES_VENTA_VISTA.playerID;
    TicketObjeto.gameID = OPCIONES_VENTA_VISTA.gameID;

    var Apuestas = [];
    $(ticketobjeto_imprimir.apuestas).each(function(i,e){
        var ApuestaObjeto = {};
        ApuestaObjeto.idTicket = null;
        ApuestaObjeto.idTipoApuesta = e.idtipoapuesta;
        ApuestaObjeto.idTipoPago = e.idtipopago;
        ApuestaObjeto.idMoneda = eventoactual.idMoneda;
        ApuestaObjeto.montoApostado = e.apuesta;
        ApuestaObjeto.montoAPagar = 0;
        ApuestaObjeto.ganador = 0;
        ApuestaObjeto.multiplicadorDefecto = e.cuota;///en controlador
        Apuestas.push(ApuestaObjeto);
    })

    var totales_maximo = sacar_totales_y_maximo();
    TicketObjeto.montoTotal = totales_maximo.total;

    datosobjeto = {};
    datosobjeto.TicketObjeto = TicketObjeto;
    datosobjeto.Apuestas = Apuestas;
    $.ajax({
        type: 'POST',
        url: basePath + 'GuardarApuestaCliente', 
        data: {
                sessionToken :  OPCIONES_VENTA_VISTA.sessionToken,
                playerID :      OPCIONES_VENTA_VISTA.playerID,
                gameID :        OPCIONES_VENTA_VISTA.gameID,
                'datos' : datosobjeto
        },
        beforeSend:function(){
            $.LoadingOverlay("show");
            detenerHistorialJackpot();
            modalguardarticket = toastr.info("...Guardando Apuestas");
        },
        success: function (response) {
            $.LoadingOverlay("hide");
            if(typeof response.errorCode != "undefined" ){
                var audio = new Audio(OPCIONES_VENTA_VISTA.sonidos.cliente_vista_error);
                audio.play();
                toastr.error(response.mensaje);
                return;
            }
            LimpiarApuestas();
            if(typeof response.id_ticketinsertado == "undefined" ){
                var audio = new Audio(OPCIONES_VENTA_VISTA.sonidos.cliente_vista_error);
                audio.play();
                toastr.error(response.mensaje);
                return;
            }
            var ticketdata = response.id_ticketinsertado;
            var idticket = ticketdata.idTicket;            
            toastr.success("Apuesta Guardada");
        },
        error: function (jqXHR, textStatus, errorThrown) {
            modalguardarticket.hide();
            toastr.error("Error al Guardar Apuestas,  Recargar Página");
            $.LoadingOverlay("hide")
            $("#recargar_tabla").text("RECARGAR").show();
        }
    })
}
function LimpiarApuestas(){
    if($("#tabla_eventos tbody tr").length != "0"){//TBL  APUESTAS REALIZADAS
        $("#div_botones .cerrar").click();
    }
}
function datos_configuracion_vista (datos_evento){
    $(".nombre_tituloconfiguracionevento ").text(datos_evento.nombre);
    $(".id_tituloconfiguracionevento ").text("#" + datos_evento.idEvento);
    $("#row_datosevento #jugador").text(1);
    $("#row_datosevento #divisa").text(datos_evento.divisa);
    $("#valor_total .val").text("0.00");
    $("#valor_total .div").text(datos_evento.divisa);
    $("#valor_maximo .val").text("0.00");
    $("#valor_maximo .div").text(datos_evento.divisa);
    $(".apuesta span").text("APUESTA " + datos_evento.divisa);
}
function responsivetombola(){
    var barralateral_visible = $(".sidebar .nav-sidebar").is(":visible");
    if(!barralateral_visible){
        $(".CONTENEDOR_TOMBOLACUY").css("padding-left","3px");
    }
    else{
        $(".CONTENEDOR_TOMBOLACUY").css("padding-left","53px");
    }
    var heighttbody = $(".rowtablaeventos").outerHeight() - $("#tabla_eventos thead tr").height()
    $("#tabla_eventos tbody").attr("style","height:" + heighttbody + "px")

    $(".responsive").each(function(i,e){
        var height = $(e).height();
        $(e).css({
            'font-size': (height/2) + 'px',
            'line-height': height + 'px'
        })
    })
}

function detenerRelojServidor(){ //DETIENE  actualizar HORA
     if(typeof OPCIONES_VENTA_VISTA.intervalo_horaservidor != "undefined"){
        clearInterval(OPCIONES_VENTA_VISTA.intervalo_horaservidor)
        delete OPCIONES_VENTA_VISTA.intervalo_horaservidor;
    }
}
function detenerContador(){
    if(typeof OPCIONES_VENTA_VISTA.intervalo_contador != "undefined"){
        clearInterval(OPCIONES_VENTA_VISTA.intervalo_contador);
        delete OPCIONES_VENTA_VISTA.intervalo_contador;
    }
}

function HistorialJackpotDatosJson(idev){// AJAX RELOAD OF HISTORIAL DIVS , CADA  TIEMPO_INTERVALO_HISTORIALJACKPOT 
    var ajax_temp = $.ajax({
        type: 'POST',
        url: basePath + 'ClienteVistaHistorialJackpotDatosJsonFk',
        data: {
            'idEvento'      : idev,
        },
        beforeSend:function(){
        },
        success: function (response) {
            $("#row_datosevento #jugador").text(response.jugadores);
            $(".historial_numeros").empty();
            $(response.historial).each(function(i,e){
                var valor = e.valorGanador == "0"? "x" : e.valorGanador;
                $(".historial_numeros").append(
                    $("<div>")
                    .attr("data-idEvento",e.idEvento)
                    .text(valor)
                    .css("background-color",e.color)
                    .css("color",e.rgbLetra)
                )
            });
            OPCIONES_VENTA_VISTA.TIMEOUT_HistorialJackpotDatosJson = setTimeout(function(){
                if(!OPCIONES_VENTA_VISTA.DETENER_HISTORIALJACKPOT){
                    HistorialJackpotDatosJson(idev);
                }
                else{
                    console.warn("DETENER_HISTORIALJACKPOT " + OPCIONES_VENTA_VISTA.DETENER_HISTORIALJACKPOT);
                }
            },OPCIONES_VENTA_VISTA.TIEMPO_INTERVALO_HISTORIALJACKPOT);
        },
        error:function(){}
    });
    return ajax_temp;
}
function detenerHistorialJackpot(){
    OPCIONES_VENTA_VISTA.DETENER_HISTORIALJACKPOT = true;
    if(typeof OPCIONES_VENTA_VISTA.ajax_historial !== "undefined" && OPCIONES_VENTA_VISTA.ajax_historial != null )
    {
        OPCIONES_VENTA_VISTA.ajax_historial.abort();
    }
    if(typeof OPCIONES_VENTA_VISTA.TIMEOUT_HistorialJackpotDatosJson !== "undefined" && OPCIONES_VENTA_VISTA.TIMEOUT_HistorialJackpotDatosJson != null)
    {
        clearInterval(OPCIONES_VENTA_VISTA.TIMEOUT_HistorialJackpotDatosJson);
    }
}
function activarBarraLoading(tiempo_total_en_seg){  ///Barra loading en "PRÓXIMO EN"
    $("#barra_loading").animate({width:"0"},(tiempo_total_en_seg)*1000);
}
function crear_loadingoverlay_contador(){
    $.LoadingOverlay("show",{image : OPCIONES_VENTA_VISTA.imagen_loadingoverlay_contador})
    $(".loadingoverlay").append($('<div id="contador_overlay" style="position: relative; left: 6%;width:7%;height: 10%; text-align:center;font-size:8vh;color:red">--</div>'))
}
function ocultar_loadingoverlay_contador(){
    $.LoadingOverlay("hide");
    $("#contador_overlay").remove();
}

function reloj_generar(horaserv){ ///actualizar HORA cada SEG.   intervalo_horaservidor
    detenerRelojServidor();
    OPCIONES_VENTA_VISTA.intervalo_horaservidor = setInterval(
                            function(){
                                horaserv = new Date(horaserv);
                                horaserv = horaserv.setSeconds(horaserv.getSeconds() +1)
                                horaserv = new Date(horaserv);

                                var hora = horaserv.getHours();
                                var minutos = horaserv.getMinutes();
                                var segundos = horaserv.getSeconds();
                                var dn = "PM";
                                if (hora < 12){
                                    dn = "AM";
                                }
                                if (hora > 12){
                                    hora = hora - 12;
                                }
                                if (hora == 0){
                                    hora = 12;
                                }
                                if (minutos <= 9){
                                    minutos = "0" + minutos;
                                }
                                if (segundos <= 9){
                                    segundos = "0" + segundos;
                                }
                                var hora_servidor_final = hora
                                                    + ":" + minutos
                                                    + ":" + segundos
                                                    + " " + dn;
                                $('#fechaServidor').text(hora_servidor_final);
                            }
                            ,1000)
}
function evento_juegos(){    
}

function eventos_botones(eventoactual){
    $(".eventos_fila_der #recargar_boton").off().on("click",function(){
        CargarClienteVistaTabla();
    })
    /////botones numeros  SELECCIONADO CLASE
    $(".apuestasadicionalescontenedor .apuestacondicional_fila .apuestacondicional_fila_datos div")
        .off()
        .on("click",function(e){ 
            var idtipo_ap = $(this).data("idtipoapuesta");
            var apu = get_apuestas(eventoactual);
            var ESTA = cv_esta_ingresado(apu,idtipo_ap);
            if(!ESTA)
            {
                SONIDOS.apuestas_adicionales_btns.play();
                $(this).css("cursor","pointer")
                $(this).toggleClass("seleccionado") ;
            }
            else{
                $(this).css("cursor","not-allowed")
            }
            //$(this).toggleClass("seleccionado") ;
        })
    /////finbotones numeros
    ///nuevo
    $("#numeros_tabla2 .numeros_rect2 div")
        .off()
        .on("click",function(e){ 
            var idtipo_ap = $(this).data("idtipoapuesta");
            var apu = get_apuestas(eventoactual);
            var ESTA = cv_esta_ingresado(apu,idtipo_ap);
            if(!ESTA){
                SONIDOS.numeros_btns.play();
                $(this).css("cursor","pointer")
                $(this).toggleClass("seleccionado") ;
            }
            else{
                $(this).css("cursor","not-allowed")
            }
               // $(this).toggleClass("seleccionado") ;
    })
    ///fin nueo
    //////botones apuesta  1 2 5  10 50 100
    $("#div_apuestas [data-tipo='apuesta']").off().on("click",function(e){
        if(typeof eventoactual != "undefined"){
            SONIDOS.apuestas_btns.play();
            $(this).toggleClass("seleccionadoapuesta") ;
            var SUMAAPUESTAS = 0;
            $("#div_apuestas .seleccionadoapuesta").each(function(ii,ee){
                SUMAAPUESTAS = SUMAAPUESTAS + $(ee).data("valor");
            })
            var divisa = eventoactual.divisa.toString() == "[object HTMLSpanElement]"? " " : eventoactual.divisa;
            $(".rowtableeventos_footer_apuesta").text("APUESTA "+ eventoactual.divisa + " " + SUMAAPUESTAS);
        }
        else{
            toastr.error("No hay evento,  Recargar")
        }
    })
    /////BOTONESSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS  DINERODEFAULT
    ///boton check
    $("#div_botones .check").off().on("click",function(){
        SONIDOS.check_btn.play();
        var ID_EVENTO = $(".id_tituloconfiguracionevento").text();
        if(ID_EVENTO == ""){
            toastr.error("No hay Evento");return;
        }
        var cantidadapuesta = $("#div_apuestas .seleccionadoapuesta").length;
        var SUMAAPUESTAS = 0;
        $("#div_apuestas .seleccionadoapuesta").each(function(i,e){
            SUMAAPUESTAS = SUMAAPUESTAS + $(e).data("valor");
        })
        if(cantidadapuesta == 0){
            toastr.error("Seleccione Apuesta")
            return false;
        }
        var cantidadnumeros = $(".apuestacondicional_fila_datos .seleccionado,#numeros_tabla2 .seleccionado,#numeros_tabla .seleccionado, .rectangulo_izquierda.seleccionado").length;
        if(cantidadnumeros == 0)
        {
            toastr.error("Seleccione Número")
            return false;
        }
        var apuesta_fila = parseFloat(SUMAAPUESTAS).toFixed(2);
        if(apuesta_fila < 1){
            toastr.error("La apuesta no puede ser mínima al menor");
            apuesta_fila = 1;
        }
        var array_apuestas_json = generar_json_apuestas();
        var FILA_PARA_TABLA = {};
        //$("#numeros_tabla .seleccionado , .rectangulo_izquierda.seleccionado")
        $(".apuestacondicional_fila_datos .seleccionado,#numeros_tabla2 .seleccionado,#numeros_tabla .seleccionado, .rectangulo_izquierda.seleccionado")
        .each(function(i,e){
            array_apuestas_json = generar_json_apuestas();
            var tiponumero = $(e).data("tipo");
            var idTipoPago = $(e).data("idtipopago");
            var colornumero = $(e).data("color");
            var color2 = $(e).data("color2");
            var descripcion = $(e).data("descripcion");
            var valornumero = $(e).data("valor");
            var idtipoapuesta = $(e).data("idtipoapuesta");
            if(idTipoPago.toString() == "2"){
                valornumero = colornumero;
            }
            var cuota = $(e).data("cuota");
            apostado = false;
            //console.log(array_apuestas_json);
            $(array_apuestas_json).each(function(ii,ee){
                if((ee.SELECCION).toString()==valornumero.toString()){
                    apostado = true;
                }
            })
            console.log("apostado "+apostado+" "+valornumero)
            if(!apostado){   ////*SI NO FUE APOSTADO AUN SE  AGREGA TR A TABLA */
                
                //cuota=tiponumero=="numero"?10:tiponumero=="rango"?10:tiponumero=="pares"?11:tiponumero=="impares"?14:15;
                FILA_PARA_TABLA.ID_EVENTO = ID_EVENTO;
                FILA_PARA_TABLA.SELECCION = valornumero;
                FILA_PARA_TABLA.CUOTA = cuota;
                FILA_PARA_TABLA.APUESTA = apuesta_fila;

                var tr_tabla = $("#tabla_eventos tbody tr td:first-child:contains('-')").eq(0);
                if(tr_tabla.length == 0){
                    $("#tabla_eventos tbody").append(
                        $("<tr>")
                            .attr("data-tipo",tiponumero)
                            .attr("data-color",colornumero)
                            .attr("data-color2",color2)
                            .attr("data-descripcion",descripcion)
                            .attr("data-valor",valornumero)
                            .attr("data-idTipoPago",idTipoPago)
                            .attr("data-idtipoapuesta",idtipoapuesta)
                            .append(
                                    $("<td>").text(FILA_PARA_TABLA.ID_EVENTO)
                                    )
                            .append(
                                    $("<td>").text(FILA_PARA_TABLA.SELECCION)
                                    )
                            .append(
                                    $("<td>").text(FILA_PARA_TABLA.CUOTA)
                                    )
                            .append(
                                    $("<td>").text(parseFloat(FILA_PARA_TABLA.APUESTA).toFixed(2))
                                            .append($("<div>").addClass("divcerrarfila").append($('<i class="icon  fa fa-close" style="display:inline"></i>')))
                                    )
                    )
                    $(".divcerrarfila").off("click").on("click",function(){
                        SONIDOS.cancel_btn.play();
                        var idtip = $(this).closest("tr").data("idtipoapuesta");
                        $(".apuestasadicionalescontenedor .apuestacondicional_fila .apuestacondicional_fila_datos div[data-idtipoapuesta="+idtip+"],#numeros_tabla2 .numeros_rect2 div[data-idtipoapuesta="+idtip+"]")
                            .css("cursor","pointer");
                        $(this).closest("tr").remove();
                        var totales_maximo = sacar_totales_y_maximo();
                        $(".apuesta .rowtableeventos_footer_apuesta").text();
                        $("#valor_total .val").text(parseFloat(totales_maximo.total).toFixed(2));
                        $("#valor_total .div").text(eventoactual.divisa);

                        $("#valor_maximo .val").text(parseFloat(totales_maximo.maximo).toFixed(2));
                        $("#valor_maximo .div").text(eventoactual.divisa);

                    });
                }
                else{
                    tr_tabla = tr_tabla.parent();
                    tr_tabla.attr("data-tipo",tiponumero)       ;                 
                    tr_tabla.attr("data-color",colornumero)       ;   
                    tr_tabla.attr("data-valor",valornumero)       ;   

                    $("td",tr_tabla).eq(0).text(FILA_PARA_TABLA.ID_EVENTO)
                    $("td",tr_tabla).eq(1).text(FILA_PARA_TABLA.SELECCION)
                    $("td",tr_tabla).eq(2).text(FILA_PARA_TABLA.CUOTA)
                    $("td",tr_tabla).eq(3).text(parseFloat(FILA_PARA_TABLA.APUESTA).toFixed(2))
                }
                var totales_maximo = sacar_totales_y_maximo();

                $("#valor_total .val").text(parseFloat(totales_maximo.total).toFixed(2));
                $("#valor_total .div").text(eventoactual.divisa);
                $("#valor_total .div").text(eventoactual.divisa);

                $("#valor_maximo .val").text(parseFloat(totales_maximo.maximo).toFixed(2));
                $("#valor_maximo .div").text(eventoactual.divisa);
            }
            else{
                toastr.error("Ya ingresó  "+valornumero);
            }
        })///fin numerotabla seleccionados
        $(".apuestacondicional_fila_datos .seleccionado,#numeros_tabla2 .seleccionado,#numeros_tabla .seleccionado, .rectangulo_izquierda.seleccionado")
            .removeClass("seleccionado")
        $("#numeros_tabla .seleccionado").removeClass("seleccionado");
    })////FINNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN on click boton check

        ///BOTON CERRAR  -- BORRAR
    $("#div_botones .cerrar").off().on("click",function(){
        SONIDOS.cancel_btn.play();
        $(".apuestacondicional_fila_datos div").css("cursor","pointer");
        $("#numeros_tabla2 .numeros_rect2 div").css("cursor","pointer");

        if($("#tabla_eventos tbody tr").length == "0"){
            toastr.error("No hay Apuestas");
        }
        else
        {
            idtabla = "tabla_eventos";
            $("tbody","#" + idtabla).empty();
            var totales_maximo = sacar_totales_y_maximo();
            $("#valor_total .val").text(parseFloat(totales_maximo.total).toFixed(2));
            $("#valor_total .div").text(eventoactual.divisa);
            $("#valor_maximo .val").text(parseFloat(totales_maximo.maximo).toFixed(2));
            $("#valor_maximo .div").text(eventoactual.divisa);

        }
    // $("#numeros_tabla .apostado").removeClass("apostado");
    })

    ///BOTON BET
    $("#div_botones .bet").off().on("click",function(){
        // var audio = new Audio(OPCIONES_VENTA_VISTA.sonidos.bet);
        SONIDOS.audio_bet_btn.play();
        if(typeof eventoactual == "undefined"){
            toastr.error("No hay Evento");
            return;
        }
        if(typeof OPCIONES_VENTA_VISTA.intervalo_contador == "undefined"){
            toastr.error("Evento Actual " + eventoactual.IdEvento + " Ya Finalizó,   Recargar Página");
            return;
        }
        if($("#tabla_eventos tbody tr").length == "0"){
            toastr.error("No hay Apuestas");
        }
        else
        {
            var TICKET_IMPRIMIR = {};
            TICKET_IMPRIMIR.Id_Ticket = 0;
            TICKET_IMPRIMIR.Nro_Evento = eventoactual.IdEvento;
            TICKET_IMPRIMIR.Desc = eventoactual.nombre;

            var totales = sacar_totales_y_maximo();
            TICKET_IMPRIMIR.TotalTicket = totales.total;
            TICKET_IMPRIMIR.PremioMaximoAPagar = eventoactual.divisa +" " + parseFloat(totales.maximo).toFixed(2);
            TICKET_IMPRIMIR.PremioMaximoPotencial = eventoactual.divisa +" " + parseFloat(totales.total).toFixed(2);

            TICKET_IMPRIMIR.PremioMaximoPotencial_guardar = parseFloat(totales.maximo).toFixed(2);
            TICKET_IMPRIMIR.PremioMaximoPagar_guardar = eventoactual.apuestaMaximaJuego;

            TICKET_IMPRIMIR.apuestaMinimaJuego = eventoactual.apuestaMinimaJuego;
            TICKET_IMPRIMIR.apuestaMaximaJuego = eventoactual.apuestaMaximaJuego;

            TICKET_IMPRIMIR.sessionToken = eventoactual.sessionToken;
            TICKET_IMPRIMIR.playerID = eventoactual.playerID;
            TICKET_IMPRIMIR.gameID = eventoactual.gameID;

            apuestas = [];
            $("#tabla_eventos tbody tr").each(function(i,e){
                var fila_apuesta = {};
                var tr = e;
                if($("td:eq(1)",tr).text()!=""){
                    tipo = $(tr).data("tipo");
                    idtipopago = $(tr).data("idtipopago");
                    idtipoapuesta = $(tr).data("idtipoapuesta");
                    valor= $(tr).data("valor");
                    evento = $("td:eq(0)",tr).text();
                    seleccion = $("td:eq(1)",tr).text();
                    cuota = $("td:eq(2)",tr).text();
                    apuesta = $("td:eq(3)",tr).text();
                    fila_apuesta.evento = eventoactual.IdEvento;
                    fila_apuesta.descripcion = seleccion;
                    fila_apuesta.cuota = cuota;
                    fila_apuesta.idtipopago = idtipopago;
                    fila_apuesta.idtipoapuesta = idtipoapuesta;
                    fila_apuesta.apuesta = apuesta;
                    apuestas.push(fila_apuesta);
                }
            })
            TICKET_IMPRIMIR.apuestas = apuestas;
            GuardarTicket(eventoactual,TICKET_IMPRIMIR);
        }
    })
///////////////////////////FIN BOTONESSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS

//////MODALES
    $(".modal").off("hidden.bs.modal").on("hidden.bs.modal", function () {
        OPCIONES_VENTA_VISTA.RECARGAR_TOMBOLA = true;
        if(typeof eventoactual != "undefined"){
            HistorialJackpotDatosJson(OPCIONES_VENTA_VISTA.idPuntoVenta,eventoactual.IdEvento);
        }else{
            CargarClienteVistaTabla();
        }
    })
    $(".modal").off("shown.bs.modal").on("shown.bs.modal", function () {    
        $(".modal:visible input").focus();
        detenerHistorialJackpot();
        OPCIONES_VENTA_VISTA.RECARGAR_TOMBOLA = false;
    })
}
function generar_json_apuestas(){
    var idtabla = "tabla_eventos";
    var array_apuestas = [];
    $("tbody tr","#" + idtabla).each(function(i,e){
        var tr = e;
        if($("td:eq(0)",tr).text()!="-"){
        var filaapuesta = {};
            filaapuesta.ID_EVENTO = $("td:eq(0)",tr).text();
            filaapuesta.SELECCION = $("td:eq(1)",tr).text();
            filaapuesta.CUOTA = $("td:eq(2)",tr).text();
            filaapuesta.APUESTA = $("td:eq(3)",tr).text().trim();
            array_apuestas.push(filaapuesta)
        }
    })
    return array_apuestas;
}
function sacar_totales_y_maximo(){
    var idtabla = "tabla_eventos";
    var total = 0;
    var maximo = 0;
    var tipo = "";
    var tr_maximo = null;
    $("tbody tr","#"+idtabla).each(function(i,e){
         var tr =e;
        if($("td:eq(0)",tr).text()!="-"){
            max_fila = parseFloat($("td:eq(2)",tr).text())*parseFloat($("td:eq(3)",tr).text().trim());
            total = total+parseFloat($("td:eq(3)",tr).text().trim());//SUMA col APUESTA
            if(max_fila>maximo){
                tr_maximo = tr;
                maximo = max_fila;
                tipo = $("tr").attr("data-tipo");
            }
        }
    });
    if($(tr_maximo).data("tipo") == "numero"){  /////SI TR MAXIMO ES NUMERO, REVISAR SI HAY APUESTA EN RANGO,PAR,IMPAR,COLOR
        ///RANGO
            var tr_rangos = $("#tabla_eventos tbody tr[data-tipo='rango']");
            $(tr_rangos).each(function(a,b){
                var trrango = b;
                var rango = $(trrango).data("valor"); ///*1-12 ,13-24*/
                var rangos_array = rango.split("-");
                var valor_trmaximo = $(tr_maximo).data("valor");
                var rangoinicio = rangos_array[0];
                var rangofin = rangos_array[1];
                if(valor_trmaximo>=rangoinicio &&  valor_trmaximo<=rangofin){
                    maximo = maximo + (parseFloat($("td:eq(2)",trrango).text())*parseFloat($("td:eq(3)",trrango).text().trim()));
                }
            })
            //
        ///PAR IMPAR
            var tr_pares = $("#tabla_eventos tbody tr[data-valor='PAR']");
            if(tr_pares.length){
                var valor_trmaximo = $(tr_maximo).data("valor");
                var trpar = tr_pares;
                if(parseInt(valor_trmaximo)%2 == 0){///es par
                    maximo = maximo + (parseFloat($("td:eq(2)",trpar).text())*parseFloat($("td:eq(3)",trpar).text().trim()));
                }
            }
            var tr_impares = $("#tabla_eventos tbody tr[data-valor='IMPAR']");
            if(tr_impares.length){
                var valor_trmaximo = $(tr_maximo).data("valor");
                var trimpar = tr_impares;
                if(parseInt(valor_trmaximo)%2!=0){///es impar
                    maximo=maximo+(parseFloat($("td:eq(2)",trimpar).text())*parseFloat($("td:eq(3)",trimpar).text().trim()));
                }
            }
            //
        ///COLOR
          var tr_color1 = $("#tabla_eventos tbody tr[data-descripcion='COLOR 1']");
            if(tr_color1.length){
                var color_trmaximo = $(tr_maximo).data("color");
                var trcolor1 = tr_color1;
                if(color_trmaximo.toUpperCase()==(trcolor1.data("color2")).toUpperCase()){///es color1
                    maximo = maximo+(parseFloat($("td:eq(2)",trcolor1).text())*parseFloat($("td:eq(3)",trcolor1).text().trim()));
                }
            }
            tr_color2 = $("#tabla_eventos tbody tr[data-descripcion='COLOR 2']");
            if(tr_color2.length){
                var color_trmaximo = $(tr_maximo).data("color");
                var trcolor2 = tr_color2;
                if(color_trmaximo.toUpperCase()==(trcolor2.data("color2")).toUpperCase()){///es color2
                    maximo = maximo + (parseFloat($("td:eq(2)",trcolor2).text())*parseFloat($("td:eq(3)",trcolor2).text().trim()));
                }
            }

    }////fin tr maximo es numero

/// SI TRMAXIMO  ES RANGO
    if($(tr_maximo).data("tipo") == "rango"){  /////SI TR MAXIMO ES RANGO,  REVISAR SI HAY APUESTA EN ALGUN NUMERO DEL RANGO
            var rango = $(tr_maximo).data("valor");
            var rangos_array = rango.split("-");
            var rangoinicio = rangos_array[0];
            var rangofin = rangos_array[1];

            tr_numeros = $("#tabla_eventos tbody tr[data-tipo='numero']");
            $(tr_numeros).each(function(iii,eee){
                var trnum = eee;
                var valornumero = $(eee).data("valor");
                if(valornumero >= rangoinicio && valornumero <= rangofin){ ////numero fila esta en rango 
                    maximo = maximo + (parseFloat($("td:eq(2)",trnum).text())*parseFloat($("td:eq(3)",trnum).text().trim()));
                }
            })
    }
    datos = {}
    datos.total = total;
    datos.maximo = maximo;
    return datos;
}  ///FIN sacar_totales_y_maximo();

function get_apuestas(eventoactual){ ///get Apuestas que Cliente ha Hecho            tabla ID EVENTOS ELECCIÓN CUOTA APUESTA   Vista Venta
    var apuestas = [];
    $("#tabla_eventos tbody tr").each(function(i,e){
        var fila_apuesta = {};
        var tr = e;
        if($("td:eq(1)",tr).text()!=""){
            var tipo                    =        $(tr).data("tipo");
            var idtipopago              =        $(tr).data("idtipopago");
            var idtipoapuesta           =        $(tr).data("idtipoapuesta");
            var valor                   =        $(tr).data("valor");
            var evento                  =        $("td:eq(0)",tr).text();
            var seleccion               =        $("td:eq(1)",tr).text();
            var cuota                   =        $("td:eq(2)",tr).text();
            var apuesta                 =        $("td:eq(3)",tr).text();
            fila_apuesta.evento         =        eventoactual.IdEvento;//evento;
            fila_apuesta.descripcion    =        seleccion;
            fila_apuesta.cuota          =        cuota;
            fila_apuesta.idtipopago     =        idtipopago;
            fila_apuesta.idtipoapuesta  =        idtipoapuesta;
            fila_apuesta.apuesta        =        apuesta;
            apuestas.push(fila_apuesta);
        }
    });
    return apuestas;

}
function cv_esta_ingresado(ap_array,buscar){//buscar si Apuesta ya fue ingresada
    var encontro = false;
    $(ap_array).each(function(i,e){
        if(e.idtipoapuesta == buscar)
        {
            encontro = true;
            return false;
        }
    })
    return encontro;
}

function get_hora() {
    const currentDate = new Date();
    // Get the current date components
    const year = currentDate.getFullYear();
    const month = String(currentDate.getMonth() + 1).padStart(2, '0');
    const day = String(currentDate.getDate()).padStart(2, '0');
    // Get the current time components
    const hours = String(currentDate.getHours()).padStart(2, '0'); // Ensure two-digit representation
    const minutes = String(currentDate.getMinutes()).padStart(2, '0');
    const seconds = String(currentDate.getSeconds()).padStart(2, '0');
    // Format the date and time
    const formattedDateTime = `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;
    return formattedDateTime;
}

function addSecondsToCurrentDate(secondsToAdd) {
    const currentDate = new Date();
    const newDate = new Date(currentDate.getTime() + secondsToAdd * 1000);

    const year = newDate.getFullYear();
    const month = String(newDate.getMonth() + 1).padStart(2, '0');
    const day = String(newDate.getDate()).padStart(2, '0');
    const hours = String(newDate.getHours()).padStart(2, '0');
    const minutes = String(newDate.getMinutes()).padStart(2, '0');
    const seconds = String(newDate.getSeconds()).padStart(2, '0');

    const formattedDateTime = `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;
    return formattedDateTime;
}