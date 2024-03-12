$(document).ready(function () {   

    $("body").css("overflow","hidden");
    // INICIAR();
    EventoActual();
});

function INICIAR(evento = null)
{
    $(".TOMBOLACUY").show();
    /////////onClick de Juegos/Eventos
    // var divs_juego = $("#div_configuracioneventos .configuracioneventosdiv");
    // divs_juego.off("click").on("click",function(){
    //     $(".TOMBOLACUY").css("cursor","wait");
    //     divs_juego.removeClass("seleccionadoevento");
    //     $(this).addClass("seleccionadoevento");    
        
    //     detenerHistorialJackpot();
    //     //DETENER_HISTORIALJACKPOT = false;
    //     EventoDatosJsonNuevo(this);/// pide hora        
    // })
    //// FIN  Onclick eventos
    setTimeout(function(){
        $("#div_configuracioneventos .eventos_fila_izq>div").eq(0).click();
    },5)

    eventos_botones(evento); ////botones 1-22, rangos, colores ,  botones apuestas(1,2,4,5,10,20,50,100)  , botones check, x, buscar,imprimir
    eventos_botones_modalbuscar(evento); ///botones del modal buscar=>  1-9 , buscar
    responsivetombola();
    $(window).resize(function () {
        responsivetombola();
        var heighttbody = $(".rowtablaeventos").height()-$("#tabla_eventos thead").height();
        $("#tabla_eventos tbody").height(heighttbody);
    }).trigger('resize');


    
    // eventoactual = {};
    // eventoactual.FechaEvento    = $(divelemento).attr("data-FechaEvento");
    // eventoactual.fechaFinEvento = $(divelemento).attr("data-fechaFinEvento");
    // eventoactual.nombre         = $(divelemento).attr("data-nombre");
    // eventoactual.IdEvento       = $(divelemento).attr("data-id");
    // eventoactual.apuestaMinima  = $(divelemento).attr("data-apuestaMinima");
    // eventoactual.apuestaMaxima  = $(divelemento).attr("data-apuestaMaxima");

    // eventoactual.apuestaMinimaJuego = $(divelemento).attr("data-apuestaMinimaJuego");
    // eventoactual.apuestaMaximaJuego = $(divelemento).attr("data-apuestaMaximaJuego");

    // eventoactual.segBloqueoAntesEvento = OPCIONES_VENTA_VISTA.SEGBLOQUEOANTESEVENTO;
    // eventoactual.idMoneda = $(divelemento).attr("data-idMoneda");
    // eventoactual.Imagen = "img/juegos/"+$(divelemento).attr("data-logo");
    // eventoactual.divisa = $(divelemento).attr("data-divisa");

    EventoDatosJsonNuevo(evento);/// pide hora        

}
