OPCIONES_VENTA_VISTA = {
    sessionToken            :   getUrlParameter('sessionToken'),
    playerID                :   getUrlParameter('playerID'),
    gameID                  :   getUrlParameter('gameID'),
    TIEMPO_VISTA_VENTA      :   30,   //30 SEC.    DURACIÓN VISTA VENTA
    SEG_BLOQUEO_ANTES_EVENTO:   2,//10,   //           PANTALLA SE BLOQUEA CUANDO FALTA __ SEGS
    TIEMPO_INTERVALO_HISTORIALJACKPOT : 3000,    //CADA CUANTO SE ACTUALIZA HISTORIAL Y JACKPOT
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
        apuestas_adicionales: "/sound/numeros_click.wav",
        apuesta_check       : "/sound/numeros_click.wav",
        apuesta_cancel       : "/sound/numeros_click.wav",
        buscar_ticket       : "/sound/numeros_click.wav",
        imprimir_ticket     : "/sound/numeros_click.wav"
    },
    RECARGAR_TOMBOLA : true,////despues de acabado el conteo .  detener al mostrar modal

    TIMEOUT_HistorialJackpotDatosJson : null, //settimeout para consultar historial
    DETENER_HISTORIALJACKPOT : false,
    ajax_historial : null ,   //variable que contiene ajax para detener historialjackpot

    intervalo_horaservidor : null , //variable setinterval para actualizar reloj
    intervalo_contador : null //variable setinterval para contador para terminar evento
}


$(document).ready(function () {   
    $("body").css("overflow","hidden");    
    EventoActual();//en ClienteVistaFunciones.js
});
