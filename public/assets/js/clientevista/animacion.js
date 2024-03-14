$.LoadingOverlay("show");
$(".loadingoverlay").append($('<div id="cargador_overlay" style="font-family:Arial;position: relative; left: 8%;width:7%;height: 10%; text-align:center;font-size:8vh;color:black">--</div>'))
$(".loadingoverlay").css("background-color","rgba(255, 255, 255, 0.3)");

$("#DIV_EVENTOESPERANDO").hide();
$("#DIV_TITULOEVENTO").hide();
CONTROLES = false;
GANADOR_DE_EVENTO = "";
EVENTO_ID = "";
CLIENTEVISTA_ANIMACION = {
    estadistica : null
}

// $(document).ready(function () {
//     //bloquear_teclas_mouse();
//     ANIMACION_INICIAR_RENDER();
// });


var VENTANA_ACTIVA = true;
EVENTO_YA_PASO = false;
window.addEventListener('blur', function() {
   VENTANA_ACTIVA = false;
   console.log("VENTANA_ACTIVA FALSE" );
}, false);

window.addEventListener('focus', function() {
    VENTANA_ACTIVA = true;
    console.log("VENTANA_ACTIVA TRUE" )
}, false);


if (WEBGL.isWebGLAvailable() === false) {
    document.body.appendChild(WEBGL.getWebGLErrorMessage());
}
var scene, renderer, camera, stats;
var model, modelCajaP,modelCuyDudando, modelChoque, modelCaja,modelCuyPremio,modelCuySalto,modelCuyEsperando, skeleton, 
mixer, mixerCaja,mixerCuyDudando,mixerCajaP,mixerCuyPremio,mixerCuyEsperando,mixerCuySalto, clock,clockCuyPremio,clockCuyEsperando,clockCuySalto;
var crossFadeControls = [];
var idleAction, walkAction, runAction;
var idleWeight, walkWeight, runWeight;
var actions, settings;
var singleStepMode = false;
var sizeOfNextStep = 0;
var loaded = false;
var i = 0;
var controls;
var posicionZ = 0;

function getObjeto_caja(nombrebuscar){
    arraycajas = modelCaja.children[0].children[0].children[0].children;
    var objetoretornar = null;
    $(arraycajas).each(function(i,e){
         nombre = e.name;///1.png
        if(nombre == nombrebuscar){
            objetoretornar = e;
            return false;
        }
    })
    return objetoretornar;
}
function get_maderas(){
    maderas = [];
    arraycajas = modelCaja.children[0].children[0].children;
    $(arraycajas).each(function(i,e){
        nombre=e.name;///1.png
        if(nombre == "madera" || nombre == "madera2" ){
            maderas.push(e);
        }
    })
    return maderas;
}

function ANIMACION_INICIAR_RENDER() {
    clock = new THREE.Clock();
    clockCuyDudando = new THREE.Clock();
    clockCajaP = new THREE.Clock();
    clockCuyChoque = new THREE.Clock();
    clockCuyPremio = new THREE.Clock();
    clockCuyEsperando = new THREE.Clock();
    clockCuySalto= new THREE.Clock();
    var container = document.getElementById('DIV_CANVAS');
    camera = new THREE.PerspectiveCamera(60, window.innerWidth / window.innerHeight, 1, 100);
    camera.position.set(0, 10, 0);
    // //controls
    if(CONTROLES){
        controls = new THREE.OrbitControls(camera);
        controls.rotateSpeed = 1.0;
        controls.zoomSpeed = 1.2;
        controls.panSpeed = 0.8;
        controls.autoRotate = true;
    }
    //  controls.addEventListener( 'change',  renderer.render( scene, camera ) ); 
    //escena
    scene = new THREE.Scene();
     hemiLight = new THREE.HemisphereLight(0xffffff, 0x444444);
    hemiLight.position.set(0, 20, 0);
    scene.add(hemiLight);
     dirLight = new THREE.DirectionalLight(0xffffff);
    dirLight.position.set(-3, 20, -15);
    dirLight.castShadow = true;
    camerashadow = 5;
    dirLight.shadow.camera.top = camerashadow;
    dirLight.shadow.camera.bottom = -camerashadow;
    dirLight.shadow.camera.left = -camerashadow;
    dirLight.shadow.camera.right = camerashadow;
    dirLight.shadow.camera.near = 0.1;
    dirLight.shadow.camera.far = 40;
    dirLight.position.y=34;

    dirLight.shadow.mapSize.height=2048;
    scene.add(dirLight);

    camera.lookAt(new THREE.Vector3(0, 0, 0));

    var vertexShader = document.getElementById( 'vertexShader' ).textContent;
    var fragmentShader = document.getElementById( 'fragmentShader' ).textContent;
    var uniforms = {
        "topColor": { value: new THREE.Color( 0x0077ff ) },
        "bottomColor": { value: new THREE.Color( 0xffffff ) },
        "offset": { value: 33 },
        "exponent": { value: 0.6 }
    };
        uniforms[ "topColor" ].value.copy( new THREE.Color(0.1999999,0.5199999,1) );
    var skyGeo = new THREE.SphereBufferGeometry( 80, 120,60 );
    var skyMat = new THREE.ShaderMaterial( {
        uniforms: uniforms,
        vertexShader: vertexShader,
        fragmentShader: fragmentShader,
        side: THREE.BackSide
    } );

    var sky = new THREE.Mesh( skyGeo, skyMat );
    scene.add( sky );

    var loader = new THREE.GLTFLoader();
    // Plano y Cajas
    CAJAS_ARRAY = [];
    var loaderCaja = new THREE.GLTFLoader();

    TIEMPO_RENDER = performance.now();
    loaderCaja.load('images/glb/tablerograss_blanco.glb', function (gltfCaja) {
        todo = gltfCaja;
        modelCaja = gltfCaja.scenes[0];
        modelCaja.traverse(function (object) {
            if (object instanceof THREE.Mesh) {
                object.castShadow = true;
            }
        });
        modelCaja.children[0].children[0].position.y=0.28; 
        var escalatablero = 0.4;
        var escalatablerox = 0.55;
        tablero =  modelCaja.children[0].children[0].children[1];
        tablero.scale.set(escalatablerox,escalatablero,escalatablero);/// suelo 

        suelo = modelCaja.children[0].children[0].children[0];

        modelCaja.name ="TABLA_CAJAS";
        scene.add(modelCaja);
        animacion_cuy_cargar_archivos(); /////////////////////// animacion_cuy.js
        modelCaja.children[0].children[0].children[1].receiveShadow=true;
        CAJAS_ARRAY = modelCaja.children[0].children[0].children[0].children;
        cajax = modelCaja.children[0].children[0].children[2];

    } ,progreso_descarga);

    renderer = new THREE.WebGLRenderer({antialias: true});
    renderer.setPixelRatio(window.devicePixelRatio);

    var ww = window.innerWidth;//*0.6;
    var hh = window.innerHeight;//*0.6;
    renderer.setSize(ww, hh);
    renderer.gammaOutput = true;
    renderer.gammaFactor = 2;
    renderer.shadowMap.enabled = true;
    container.appendChild(renderer.domElement);
}

CONSULTADO_EVENTO = false;
function CargarEstadistica(IdJuego) {    
    var url = document.location.origin + "/" + "api/DataEventoResultadoEventoFk";
    $.ajax({
        url: url,
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify({IdJuego: IdJuego}),
        beforeSend: function () {
          CONSULTADO_EVENTO = true;
        },
        complete: function () {
        },
        success: function (response) { 
            CONSULTADO_EVENTO = false;
            aaa = response;        
            $.each(response.estadistica, function( key, value ) {
                $("#"+value.valorapuesta).text(value.Repetidos);
                $("#"+value.valorapuesta).prev().css("background-color",value.rgb)
                $("#"+value.valorapuesta).prev().css("color",value.rgbLetra)
            });
            var strUltimos12 = "";
            $.each(response.resultado_evento, function( key, value ) {
                if(key < 12){
                    strUltimos12 += '<tr><th class="caja">' + value.idEvento + '</th><th style="color:' + value.rgbLetra + ';background-color:' + value.rgb + '">'+value.valorGanador+'</th></tr>';
                }
            });
            $("#tablaUltimos").html(strUltimos12);
            ocultar_cuy_cargando();
            $.LoadingOverlay("hide");
            ocultar_toasr_nohay_evento();
            ocultar_toasr_servidor_error()
        },
        error: function (jqXHR, textStatus, errorThrown) {
            CONSULTADO_EVENTO = false;
            ocultar_toasr_nohay_evento();
            crear_toasr_servidor_error();
            setTimeout(function(){
                CargarEstadistica(1);
                }
                ,1500
            )
        }
    });
}

function CargarEst() {    
    var url = document.location.origin + "/DatosEstadisticaFK";
    $.ajax({
        url: url,
        type: "POST",
        contentType: "application/json",
        beforeSend: function () {
        },
        complete: function () {
        },
        success: function (response) { 
            CLIENTEVISTA_ANIMACION.estadistica = calcular_estadisticas(response.estadistica);          
        },
        error: function (jqXHR, textStatus, errorThrown) {
        }
    });
}
function crear_toasr_nohay_evento(){
    if(typeof toasr_nohay_evento == "undefined"){
        toastr.options = {
            timeOut: 0,
            extendedTimeOut: 0,
            tapToDismiss: false
        };
        toasr_nohay_evento=toastr.error("No hay Evento Activo...");
    }
    else{
        toasr_nohay_evento.show()
    }
}

function crear_toasr_servidor_error(){
    if(typeof toasr_servidor_error == "undefined"){
        toastr.options = {
            timeOut: 0,
            extendedTimeOut: 0,
            tapToDismiss: false
        };
        toasr_servidor_error = toastr.error("Error Servidor...");
    }
    else{
        toasr_servidor_error.show()
    }
}
function ocultar_toasr_nohay_evento(){
    if(typeof toasr_nohay_evento!="undefined"){
        toasr_nohay_evento.hide();
    }
}
function ocultar_toasr_servidor_error(){ 
    if(typeof toasr_servidor_error!="undefined"){
        toasr_servidor_error.hide();
    }
}
function animacion_iniciar_ready(){
    ocultar_cuy_cargando();
    $.LoadingOverlay("hide");
    ocultar_toasr_nohay_evento();
    ocultar_toasr_servidor_error()
    console.warn(performance.now() +"   ANIMACIÓN CUY , READY");

    clientevistaindex_mostrar_venta();
    EventoActual();
    //pedir_eventoJSON();///INICIO_ANIMACION_CUY despues de recibir hora de servidor ///////////////************///
    // EVENTO_DATOS = JSON.parse(jsondecode.mensaje);
    // accion_evento(EVENTO_DATOS); /////////////////////////////////////////******//////////////////
}

// OPCIONES_VENTA_VISTA = {
//     sessionToken            :   getUrlParameter('sessionToken'),
//     playerID                :   getUrlParameter('playerID'),
//     gameID                  :   getUrlParameter('gameID'),

// }
function getUrlParameter(name) {
    name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
    var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
    var results = regex.exec(location.search);
    return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
}
function get_evento_ganador(id_evento){// AJAX GET GANADOR DE EVENTO E INICIAR ANIMACION CUY 
    var ajax_temp = $.ajax({
        type: 'POST',
        url:  'ClienteVistaGanadorEvento',
        data: {
            sessionToken :  OPCIONES_VENTA_VISTA.sessionToken,
            playerID :      OPCIONES_VENTA_VISTA.playerID,
            gameID :        OPCIONES_VENTA_VISTA.gameID,
            id_evento    :  id_evento,
        },
        beforeSend:function(){
        },
        success: function (response) {
            EVENTO_DATOS = JSON.parse(response);
            accion_evento(EVENTO_DATOS); /////////////////////////////////////////******//////////////////
        },
        error:function(){}
    });
    return ajax_temp;
}
function animacion_finalizar_evento_estado(id_evento, callback){// AJAX 
    var ajax_temp = $.ajax({
        type: 'POST',
        url:  'ClienteVistaFinalizarEvento',
        data: {
            sessionToken :  OPCIONES_VENTA_VISTA.sessionToken,
            playerID :      OPCIONES_VENTA_VISTA.playerID,
            gameID :        OPCIONES_VENTA_VISTA.gameID,
            id_evento      : id_evento,
        },
        beforeSend:function(){
        },
        success: function (response) {
            var resp = JSON.parse(response);
            if (resp.error == false)
            {
                callback();
            }
            else {
                toastr.error("Error Servidor...");
            }
        },
        error:function(){}
    });
    return ajax_temp;
}
function accion_evento(DATOS) {
    var  EVENTO_ACTUAL = DATOS.evento;
    EVENTO_ID = EVENTO_ACTUAL.evento_id_actual;
    var hora_servidor = DATOS.hora_servidor;
    if (EVENTO_ID != "") {
        pedir_hora = false;
        GANADOR_DE_EVENTO = EVENTO_ACTUAL.evento_valor_ganador;
        if (GANADOR_DE_EVENTO == null) {
            console.warn(" ---  NO HAY GANADOR_DE_EVENTO " + EVENTO_ID);
        }
        $("#evento_actual_portada").text("#" + EVENTO_ID);
        TIEMPO_GANADOR_PORTADA = 10000;
        TIEMPO_GIRO_CAJA = (EVENTO_ACTUAL.segCajaGirando) * 1000;
        TIEMPO_CUY = (EVENTO_ACTUAL.segBloqueoAntesAnimacion * 1000) - TIEMPO_GIRO_CAJA; //EVENTO_ACTUAL.tiempo_cuy_moviendo;
        TIEMPO_CUY_CHOQUE = 5000;///tiempo espera cuy en estado de choque
        TIEMPO_ESPERA_CASAGANADOR = 1000; ///tiempo espera luego q cuy entra en casa
        PUNTOS_CUY = JSON.parse(EVENTO_ACTUAL.puntos_cuy);
        FECHA_INICIO_EVENTO = EVENTO_ACTUAL.fecha_evento_ini_actual;
        FECHA_INICIO_EVENTO = moment(FECHA_INICIO_EVENTO, "YYYY-MM-DD HH:mm:ss a");
        FECHA_FIN_EVENTO = EVENTO_ACTUAL.fecha_evento_fin_actual;
        FECHA_FIN_EVENTO = moment(FECHA_FIN_EVENTO, "YYYY-MM-DD HH:mm:ss a");
        FECHA_ANIMACION = EVENTO_ACTUAL.fecha_animacion;
        FECHA_ANIMACION = moment(FECHA_ANIMACION, "YYYY-MM-DD HH:mm:ss a");
        segundos_total_espera_evento=FECHA_ANIMACION.diff(FECHA_INICIO_EVENTO, 'seconds');

        ahora = moment(hora_servidor); //.format("YYYY-MM-DD HH:mm:ss a");
        var segundos_para_fin_evento = 0;
        // segundos_para_animacion = FECHA_ANIMACION.diff(ahora, 'seconds');
        var segundos_para_animacion = 3;

        accion_cuy(EVENTO_ACTUAL,segundos_para_animacion,segundos_para_fin_evento); //////////////////////////////////////////////////

    } else {
        crear_toasr_nohay_evento();
        console.warn("No hay evento activo");
        if (typeof timeout_nohayevento != "undefined") {
        } else {
            timeout_nohayevento = setTimeout(function() {
                animacion_iniciar_ready();
                clearTimeout(timeout_nohayevento);
                delete timeout_nohayevento;
            }, 3000)
        }
    }
}
function accion_cuy(evento, seg_para_animacion , seg_para_finevento) {
    var id_evento = evento.evento_id_actual;
    var ganador_evento = evento.evento_valor_ganador;
    var fecha_fin = evento.fecha_evento_fin_actual;
    var fecha_fin_ev = moment(fecha_fin, "YYYY-MM-DD HH:mm:ss a");
    if (seg_para_animacion > 0) { ///EN rango animacion
        setTimeout(function() {
          ///barra carga cuy
           mostrar_div_eventoesperando();
          $("#barra_loading_tpi").animate({
              height: "0%"
          }, (seg_para_animacion) * 1000, function() {
              setTimeout(function(){
                  if(typeof $("#termotetro_para_iniciar").data("illuminate")!="undefined"){
                      $("#termotetro_para_iniciar").data("illuminate").destruir();
                  }
                  callback_animacion(id_evento);
              },1000)
              ;
          });
          ///fin barra cuy
          ///contador inicio cuy
          actualizar_contador_texto_latido(seg_para_animacion,TEXTO_CONTADOR);
          ////fin contador inicio cuy
        }, 1000);
  } else { //////seg animacionm else
      toastr.options = opciones_toast_mantener;
      console.log(performance.now() + " esperando fecha fin evento actual " + id_evento + ",para recargar " + fecha_fin_ev);
      if (seg_para_finevento > 0) {
          mostrar_div_eventoesperando();
          toast_eventoterminar = toastr.info("Esperando que termine evento actual");
          $("#barra_loading_tpi").animate({
              height: "0%"
          }, (seg_para_finevento) * 1000, function() {
              callback_esperar_termino_evento(ganador_evento);
          });
          actualizar_contador_texto(seg_para_finevento,TEXTO_ESPERAR_TERMINO_EVENTO);
      } else {
          toastr_eventofinalizo = toastr.info(" Evento actual ya finalizó")
          if (typeof timeout_eventofinalizo != "undefined") {
              //clearTimeout(timeout_eventofinalizo);
          } else {
              timeout_eventofinalizo = setTimeout(function() {
                  toastr_eventofinalizo.hide();
                  clearTimeout(timeout_eventofinalizo);
                  delete timeout_eventofinalizo;
                  animacion_iniciar_ready();
              }, 4000)
          }
      } ///else segundos_para_fin_evento >0
  } //fin else
} ///fin accion cuy
function callback_animacion(EVENTO_ID){
    detener_var_correr_spline_portada();
    ocultar_termometro_contador();
    ocultar_div_eventoesperando(
            function(){
                actualizar_evento_titulo(EVENTO_ID);
                buscando_evento = false;
                INICIO_ANIMACION_CUY(); ////////////////////////////////////////
            }

        );
}
function actualizar_contador_texto_latido(tiempo_en_segundos,texto){
    $("#contador_para_activar").text(texto + " " + tiempo_en_segundos +" seg.");
    var conta = tiempo_en_segundos - 1;
    conteo_ = setInterval(function() {
        $("#contador_para_activar").text(texto + " " + conta +" seg. ");
        if (conta < 1) {
            clearInterval(conteo_);
        }else if(conta < 11){
            efecto_brillo = $('#termotetro_para_iniciar')
                .illuminate({
                    'intensity': '1.9',
                    'color': 'white',
                    'blink': 'true',
                    'blinkSpeed': '500',
                    'outerGlow': 'true',
                    'outerGlowSize': '10px',
                    'outerGlowColor': '#BD0000'
                            });
                    // $("#termotetro_para_iniciar").addClass("latido_animacion_2");
        }
        conta = parseInt(conta) - 1;
    }, 1000);
}
function getColor(array_estadistica, buscar) {
    obj = {};
    $(array_estadistica).each(function(i, e) {
        if (e.valorapuesta == buscar) {
            obj = e;
            return false;
        }
    });
    return obj;
}
function calcular_estadisticas(array_estadisticas){
    var estadistica = array_estadisticas;
    $.each(estadistica, function( key, value ) {
        $("#"+value.valorapuesta).text(value.Repetidos);
        $("#"+value.valorapuesta).prev().css("background-color",value.rgb)
        $("#"+value.valorapuesta).attr("data-color",value.rgb)
        $("#"+value.valorapuesta).data("color",value.rgb)
        $("#"+value.valorapuesta).prev().css("color",value.rgbLetra)
    });
    var rgb1 = $("#color1").attr("data-color");
    var rgb2 = $("#color2").attr("data-color");
    var rgb3 = $("#cajaB").attr("data-color");
    var rango1_12 = 0;
    var rango13_24 = 0;
    var rango25_36 = 0;
    var color1 = 0;
    var color2 = 0;
    var color3 = 0;

    $(estadistica).each(function(i,e){
        var valor = parseInt(e.valorapuesta)
        var repetidos = parseInt(e.Repetidos);
        color = e.rgb;
        if(valor>0 && valor<=12){
            rango1_12 = rango1_12 + repetidos;
        }
        if(valor>12 && valor<=24){
            rango13_24 = rango13_24 + repetidos;
        }
        if(valor>24 && valor<=36){
            rango25_36 = rango25_36 + repetidos;
        }
        if(valor == 0){
            color0 = repetidos;
        }
        if(color == rgb1){
            color1 = color1+repetidos;
        }
        if(color == rgb2){
            color2 = color2+repetidos;
        }
        if(color == rgb3){
            color3 = color3+repetidos;
        }
    })
    estadistica.sort(function(a,b){
        if(a.Repetidos > b.Repetidos){ return 1}
            if(a.Repetidos < b.Repetidos){ return -1}
                return 0;
        });
    var mayores = [];
    var menores = [];
    $(estadistica).each(function(i,e){
        if(i < 5){
            menores.push(e);
        }
        if(i >= estadistica.length-5){
            mayores.push(e);
        }

    })
    $("#estadisticas_menores").empty().append($("<div class='cold'>").text("COLD"));
    $(menores).each(function(i,e){
        var fondo = e.rgb;
        var colorletra = e.rgbLetra;
        var valor = e.valorapuesta;
        if(valor == "0"){
            valor = "x";
        }
        $("#estadisticas_menores")
        .append(
            $("<div>").attr("style","background-color: "+fondo+"; color: "+colorletra).text(valor)
            )
    })

    $("#estadisticas_mayores").empty().append($("<div class='hot'>").text("HOT"));
        mayores.sort(function(a,b){
            if(a.Repetidos < b.Repetidos){ return 1}
            if(a.Repetidos > b.Repetidos){ return -1}
            return 0;
        });

    $(mayores).each(function(i,e){
        var fondo = e.rgb;
        var colorletra = e.rgbLetra;
        var valor = e.valorapuesta;
        if(valor=="0"){valor="x";}

        $("#estadisticas_mayores")
        .append(
            $("<div>").attr("style","background-color: "+fondo+"; color: " + colorletra).text(valor)
            )
    })
    var div_estadistica = $("#DIV_ESTADISTICA");
    $("#1_12",div_estadistica).text(rango1_12);
    $("#13_24",div_estadistica).text(rango13_24);
    $("#25_36",div_estadistica).text(rango25_36);
    $("#color1",div_estadistica).text(color1);
    $("#color2",div_estadistica).text(color2);
    $("#cajaB",div_estadistica).text(color3);
    return estadistica;
} 