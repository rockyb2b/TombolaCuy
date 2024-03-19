OPCIONES_VENTA_VISTA = {
    sessionToken            :   getUrlParameter('sessionToken'),
    playerID                :   getUrlParameter('playerID'),
    gameID                  :   getUrlParameter('gameID'),
    TIEMPO_VISTA_VENTA      :   8,   //30 SEC.    DURACIÓN VISTA VENTA
    SEG_BLOQUEO_ANTES_EVENTO:   2,//10,   //           PANTALLA SE BLOQUEA CUANDO FALTA __ SEGS
    TIEMPO_INTERVALO_HISTORIALJACKPOT : 15000,    //CADA CUANTO SE ACTUALIZA HISTORIAL Y JACKPOT
    USUARIO                 :    1,
    TIENDA                  :   $("#datoscaja #tienda").val(),
    CAJA                    :   $("#datoscaja #caja").val(),
    FECHAOPERACION          :   $("#datoscaja #fechaOperacion").val(),
    TURNO                   :   $("#datoscaja #turno").val(),
    idPuntoVenta            :   $("#datoscaja #turno").val(),
    idUbigeo                :   $("#datoscaja #idUbigeo").val(),
    IDAPERTURACAJA          :   $("#datoscaja #idAperturaCaja").val(),
    CC_iD                   :   $("#datoscaja #idAperturaCaja").val(),
    imagen_loadingoverlay_contador      :basePath + "img/loading/load.gif",
    ubicacion_imagenes_juego            :basePath + "img/juegos/",

    sonidos: {
        numeros             : "/sound/numeros_click.wav",
        apuestas_adicionales: "/sound/Botones y otros/button-9.wav",
        apuestas_botones    : "/sound/Botones y otros/button-6.wav",
        apuesta_check       : "/sound/Botones y otros/button-28.wav",
        apuesta_cancel      : "/sound/Botones y otros/button-7.wav",
        buscar_ticket       : "/sound/numeros_click.wav",
        bet     : "/sound/Botones y otros/button-26.wav",
        saldo_restar     : "/sound/Botones y otros/COINS Collect Jackpot Win 03.wav",
        contador_para_vista_cuy : "/sound/clock-ticking-4",

        vista_venta_contador_final : "/sound/Botones y otros/clock-ticking-4.wav",

        vista_cuy_bg : "/sound/Fondo/8-bit loop (loop).mp3",
        vista_venta_bg : "/sound/Fondo/Anttis instrumentals - Background Music 2.mp3",
        vista_cuy_pasos : "/sound/Cuy/000205346_prev.mp3",
        vista_cuy_pasos_portada : "/sound/Cuy/000205346_prev.mp3",
        vista_cuy_ganador : "/sound/Win Lose/brass-fanfare-with-timpani-and-winchimes-reverberated-146260.mp3",

        cliente_vista_error : "sound/Win Lose/meme-fail-alert-locran-1-00-01.mp3"
    },
    sonido : 1,
    

    RECARGAR_TOMBOLA : true,////despues de acabado el conteo .  detener al mostrar modal

    TIMEOUT_HistorialJackpotDatosJson : null, //settimeout para consultar historial
    DETENER_HISTORIALJACKPOT : false,
    ajax_historial : null ,   //variable que contiene ajax para detener historialjackpot

    intervalo_horaservidor : null , //variable setinterval para actualizar reloj
    intervalo_contador : null //variable setinterval para contador para terminar evento
}

OPCIONES_CUY_VISTA =
{
    SEGUNDOS_PARA_ANIMACION_CUY: 3000,// SEG. CUY ESPERA EN PORTADA 
    TIEMPO_GIRO_CAJA           : 1000,//10000,
    TIEMPO_CUY                 : 3000,//20000, //TIEMPO cuy jugando
    TIEMPO_ESPERA_CASAGANADOR  : 1000, ///tiempo espera luego q cuy entra en cas,   .
    TIEMPO_CUY_CHOQUE          : 5000,///tiempo espera cuy en estado de choqu,.
    TIEMPO_GANADOR_PORTADA     : 10000, //TIEMPO ganador div se muestra.
};

// OPCIONES_CUY_VISTA.SEGUNDOS_PARA_ANIMACION_CUY = 3000
// OPCIONES_CUY_VISTA.TIEMPO_GIRO_CAJA            = 10000
// OPCIONES_CUY_VISTA.TIEMPO_CUY                  = 20000
// OPCIONES_CUY_VISTA.TIEMPO_ESPERA_CASAGANADOR   = 1000
// OPCIONES_CUY_VISTA.TIEMPO_CUY_CHOQUE           = 5000
// OPCIONES_CUY_VISTA.TIEMPO_GANADOR_PORTADA      = 10000

SONIDOS_LOOPS = {
    sonido_vista_venta_contador_final: (() => { 
        const audio = new Audio(OPCIONES_VENTA_VISTA.sonidos.vista_venta_contador_final);
        audio.loop = true; 
        return audio; 
    })(),

    sonido_vista_cuy_bg: (() => { 
        const audio = new Audio(OPCIONES_VENTA_VISTA.sonidos.vista_cuy_bg);
        audio.volume = 0.1;
        audio.loop = true; 
        return audio; 
    })() ,
    sonido_vista_venta_bg: (() => { 
        const audio = new Audio(OPCIONES_VENTA_VISTA.sonidos.vista_venta_bg);
        audio.volume = 0.5;
        audio.loop = true; 
        return audio; 
    })(),

    sonido_vista_cuy_pasos_portada: (() => { 
        const audio = new Audio(OPCIONES_VENTA_VISTA.sonidos.vista_cuy_pasos_portada);
        audio.volume = 0.2;
        audio.loop = true;
        return audio; 
    })(),

    sonido_vista_cuy_pasos: (() => { 
        const audio = new Audio(OPCIONES_VENTA_VISTA.sonidos.vista_cuy_pasos);
        audio.loop = true; 
        return audio; 
    })(),

    sonido_vista_cuy_ganador: (() => { 
        const audio = new Audio(OPCIONES_VENTA_VISTA.sonidos.vista_cuy_ganador);
        // audio.loop = true; 
        return audio; 
    })()
}

SONIDOS = {
    numeros_btns:               new Audio(OPCIONES_VENTA_VISTA.sonidos.numeros),
    apuestas_adicionales_btns : new Audio(OPCIONES_VENTA_VISTA.sonidos.apuestas_adicionales),
    apuestas_btns             : new Audio(OPCIONES_VENTA_VISTA.sonidos.apuestas_botones),
    audio_bet_btn :             new Audio(OPCIONES_VENTA_VISTA.sonidos.apuestas_botones),
    check_btn :             new Audio(OPCIONES_VENTA_VISTA.sonidos.apuesta_check),
    cancel_btn :             new Audio(OPCIONES_VENTA_VISTA.sonidos.apuesta_cancel),
    cliente_vista_error :             new Audio(OPCIONES_VENTA_VISTA.sonidos.cliente_vista_error)
    
}

$(document).ready(function () {   
    $("body").css("overflow","hidden");    
    //EventoActual();//en ClienteVistaFunciones.js
    ANIMACION_INICIAR_RENDER();

});

function clientevistaindex_mostrar_venta(){
    SONIDOS_LOOPS.sonido_vista_venta_bg.play();
    // detener_var_correr_spline_portada();
    
    SONIDOS_LOOPS.sonido_vista_cuy_bg.pause();
    SONIDOS_LOOPS.sonido_vista_cuy_pasos_portada.pause();
    SONIDOS_LOOPS.sonido_vista_cuy_pasos.pause();
    SONIDOS_LOOPS.sonido_vista_cuy_ganador.pause();
    $("#VISTA_CUY").hide();
    $("#VISTA_VENTA").show();
    responsivetombola();//updates tbl apuestas height repsonsive
}

function clientevistaindex_mostrar_cuy(){
    SONIDOS_LOOPS.sonido_vista_venta_bg.pause();
    SONIDOS_LOOPS.sonido_vista_cuy_bg.play();
    $("#VISTA_VENTA").hide();
    $("#VISTA_CUY").show();
}