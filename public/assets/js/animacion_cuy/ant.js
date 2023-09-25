///////////////////////*funciones ant  animacion.js*/

function timeout_conexionwebsockets(){
   //   inicio_intento_conexion=performance.now();
   // detener_timeout_conexionwebsockets();
   // revisar_ya_conecto=setInterval(function(){
   //                              if(CONECTADO__A_SERVIDORWEBSOCKET){//SI EN 1 SEG YA CONECTO
   //                                  ocultar_toasr_websockets_error();
   //                                  clearInterval(revisar_ya_conecto);
   //                              }
   //                              else{
   //                                  if((performance.now()-inicio_intento_conexion)>TIMEOUT_CONEXIONWEBSOCKETS_CORTAR){
   //                                      if(typeof socket!="undefined" && socket!=null){
   //                                          socket.close();socket=null;
   //                                      }
   //                                      clearInterval(revisar_ya_conecto);

   //                                  }
   //                                 crear_toastr_websockets_error();
   //                              }
   //                      },1000);

}



function CargarEstadistica(IdJuego) {    
    var url = document.location.origin + "/" + "api/DataEventoResultadoEventoFk";
    $.ajax({
        url: url,
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify({IdJuego: IdJuego}),
        beforeSend: function () {
          CONSULTADO_EVENTO=true;
        },
        complete: function () {
        },
        success: function (response) { 

                
            CONSULTADO_EVENTO=false;
            aaa=response;        
            $.each(response.estadistica, function( key, value ) {
                $("#"+value.valorapuesta).text(value.Repetidos);
                $("#"+value.valorapuesta).prev().css("background-color",value.rgb)
                $("#"+value.valorapuesta).prev().css("color",value.rgbLetra)
            });
            var strUltimos12="";
            $.each(response.resultado_evento, function( key, value ) {
                if(key<12){
                          strUltimos12+='<tr><th class="caja">'+value.idEvento+'</th><th style="color:'+value.rgbLetra+';background-color:'+value.rgb+'">'+value.valorGanador+'</th></tr>';
                }
            });
            $("#tablaUltimos").html(strUltimos12);


            $("#DIV_CARGANDO").hide();
            $.LoadingOverlay("hide");

         ocultar_toasr_nohay_evento();
           ocultar_toasr_servidor_error()
            ///NUEVOOOOOOOOOO
                     //   iniciar_websocketservidor();


            ///

            // if(typeof response.evento!="undefined"){
            //     if(response.evento.evento_id_actual!=""){/// SI RESPONSE EVENTO TIENE ID EVENTO
            //         EVENTO_ACTUAL=response.evento;

            //         EVENTO_ID= EVENTO_ACTUAL.evento_id_actual;
            //         GANADOR_DE_EVENTO =EVENTO_ACTUAL.evento_valor_ganador;
            //         TIEMPO_GIRO_CAJA=(EVENTO_ACTUAL.segCajaGirando)*1000;
            //        TIEMPO_CUY = (EVENTO_ACTUAL.segBloqueoAntesAnimacion*1000)-TIEMPO_GIRO_CAJA;//EVENTO_ACTUAL.tiempo_cuy_moviendo;
            //     // TIEMPO_GIRO_CAJA=2000;
            //     //     TIEMPO_CUY =10000000;
            //         PUNTOS_CUY=JSON.parse(EVENTO_ACTUAL.puntos_cuy);
            //         $("#termotetro_para_iniciar").show();/////CONTADOR PARA EVENTO

            //         if(socket!=null && socket.readyState==1){////SOCKET YA INICIADO
            //               inicio_pedir_hora=performance.now();
            //               pedir_hora=true;
            //               timeout_pedir_hora=setInterval(function(){
            //                     if(pedir_hora){ ///SI EN 1 SEG NO RECIBIO HORA =>  TOASTRERROR 
            //                         crear_toastr_websockets_error();
            //                     }
            //                     else{
            //                         clearInterval(timeout_pedir_hora);
            //                     }
            //               },1000);
            //               console.warn("YA CONECTADO, pedir hora  estado socket=>"+socket.readyState);
            //               pedir_hora_server();///INICIO_ANIMACION_CUY despues de recibir hora de servidor
            //         }
            //         else{
            //               console.warn("INICIANDO CONEXIÓN ");
            //               CONECTADO__A_SERVIDORWEBSOCKET=false;
            //               // inicio_intento_conexion=performance.now();
            //               intentando_conectarwebsocket=true;
            //               if(typeof socket!="undefined" && socket!=null){socket.close();socket=null;}
            //               connectarWebSockets(IPSERVIDOR_WEBSOCKETS,PUERTO_WEBSOCKETS);  ///en archivo ClaseWebSockets.js
            //               timeout_conexionwebsockets();
            //               //   revisar_ya_conecto=setInterval(function(){
            //               //           if(CONECTADO__A_SERVIDORWEBSOCKET){//SI EN 1 SEG YA CONECTO
            //               //               if(typeof toasr_websockets_error!="undefined"){
            //               //                   toasr_websockets_error.hide();
            //               //               }
            //               //               clearInterval(revisar_ya_conecto);
            //               //           }
            //               //           else{
            //               //               if((performance.now()-inicio_intento_conexion)>TIMEOUT_CONEXIONWEBSOCKETS){
            //               //                   socket.close();
            //               //                   clearInterval(revisar_ya_conecto);

            //               //               }
            //               //              crear_toastr_websockets_error();
            //               //           }
            //               //   },1000);
            //         } 
            //     }///
            //     else{////NO HAY EVENTO
            //         crear_toasr_nohay_evento();
            //       console.warn("No hay evento activo");
            //       setTimeout(function(){
            //         CargarEstadistica(1);
            //       },1000)
            //     }
            // }
            ////fin if eresponse evento
        },
        error: function (jqXHR, textStatus, errorThrown) {
          CONSULTADO_EVENTO=false;
         ocultar_toasr_nohay_evento();
          crear_toasr_servidor_error();
          setTimeout(function(){
            CargarEstadistica(1);
          }
            ,1500)

        }
    });
}

///////////////////////*FIN  funciones ant  animacion.js*/



///////////////////////*funciones ant  animacion_cuy.js*/


ARRAY_PUNTOSCAJAS=[];

ARRAY_PUNTOSCAJAS.push({nombre:26,posicion:{x:-0.30980586278363836,y:0,z:-3.3762877429185947} })
ARRAY_PUNTOSCAJAS.push({nombre:3,posicion:{x:-0.949006568309034,y:0,z:-3.356998701580594}})
ARRAY_PUNTOSCAJAS.push({nombre:35,posicion:{x:-1.4167106765152129,y:0,z:-3.1356755102510894} })
ARRAY_PUNTOSCAJAS.push({nombre:12,posicion:{x:-1.8540938062507262,y:0,z:-2.791641244935619} })
ARRAY_PUNTOSCAJAS.push({nombre:28,posicion:{x:-2.3978601268406794,y:0,z:-2.467785601362559}})
ARRAY_PUNTOSCAJAS.push({nombre:7,posicion:{x:-2.765080554750653,y:0,z:-2.0221378996133974} })
ARRAY_PUNTOSCAJAS.push({nombre:29,posicion:{x:-2.9853090380374905,y:0,  z:-1.541500347580593} })
ARRAY_PUNTOSCAJAS.push({nombre:18,posicion:{x:-3.224733808882785,y:0,z:-0.9138055339476931} })
ARRAY_PUNTOSCAJAS.push({nombre:22,posicion:{x:-3.4912757475952065,y:0,z:-0.44938379926419136} })
ARRAY_PUNTOSCAJAS.push({nombre:9,posicion:{x:-3.476497,  y:0 , z:0.23360957} })
ARRAY_PUNTOSCAJAS.push({nombre:31,posicion:{x:-3.35743326 ,y:0,z:0.7374220786} })
ARRAY_PUNTOSCAJAS.push({nombre:14,posicion:{x:-3.28769929 ,y:0,z:1.28942981} })
ARRAY_PUNTOSCAJAS.push({nombre:20,posicion:{x: -2.8653985,y:0,z:1.736809} })
ARRAY_PUNTOSCAJAS.push({nombre:1,posicion:{x:-2.51463235,y:0,z:2.18843981} })
ARRAY_PUNTOSCAJAS.push({nombre:33,posicion:{x: -2.18747530,y:0,z:2.60356937} })
ARRAY_PUNTOSCAJAS.push({nombre:16,posicion:{x: -1.593648, y:0,z:2.85932161} })
ARRAY_PUNTOSCAJAS.push({nombre:24,posicion:{x:-1.088638265020644,y:0,z:3.2145740703933443} })
ARRAY_PUNTOSCAJAS.push({nombre:5,posicion:{x:-0.5348062371620586,y:0,z:3.301620951663683} })
ARRAY_PUNTOSCAJAS.push({nombre:10,posicion:{x:-0.02302394273425558,y:0,z:3.5234013240937334}    })
ARRAY_PUNTOSCAJAS.push({nombre:23,posicion:{x:0.5254609302769983,y:0,z:3.3041370243871855} })
ARRAY_PUNTOSCAJAS.push({nombre:8,posicion:{x:1.1413224681962724,y:0,z:3.2268432103527904} })
ARRAY_PUNTOSCAJAS.push( { nombre:30 ,posicion:{x:1.6125922448708456,y:0,z:2.9984823398983607}  }   )
ARRAY_PUNTOSCAJAS.push( { nombre:11 ,posicion:{x:2.164808512786406,y:0,z:2.7421715169359664}  }   )
ARRAY_PUNTOSCAJAS.push( { nombre:36 ,posicion:{x:2.651818597146128,y:0,z:2.3733912998766367} }   )
ARRAY_PUNTOSCAJAS.push( { nombre:13 ,posicion:{x:2.9243464869306433,y:0,z:1.831102276556383}  }   )
ARRAY_PUNTOSCAJAS.push( { nombre:27 ,posicion:{x:3.0508343404937066,y:0,z:1.2188483240919867}   }   )
ARRAY_PUNTOSCAJAS.push( { nombre:6 ,posicion:{x:3.32875742450882,y:0,z:0.7543380207997183}  }   )
ARRAY_PUNTOSCAJAS.push( { nombre:34 ,posicion:{x:3.377377358498914,y:0,z:0.12394453640106479}  }   )
ARRAY_PUNTOSCAJAS.push( { nombre:17 ,posicion:{x:3.4183559221406865,y:0,z:-0.36684366594296364}  }   )
ARRAY_PUNTOSCAJAS.push( { nombre:25 ,posicion:{x:3.263097590331593,y:0,z:-0.9840921494909135}  }   )
ARRAY_PUNTOSCAJAS.push( { nombre:2 ,posicion: {x:3.037643184345156,y:0,z:-1.5227852729244755} }   )
ARRAY_PUNTOSCAJAS.push( { nombre:21 ,posicion:{x:2.7196177221423063,y:0,z:-1.959217585937729}  }   )
ARRAY_PUNTOSCAJAS.push( { nombre:4 ,posicion: {x:2.3607702253224208,y:0,z:-2.3638512662486857} }   )
ARRAY_PUNTOSCAJAS.push( { nombre:19 ,posicion: {x:2.002183195861022,y:0,z:-2.910166458303999} }   )
ARRAY_PUNTOSCAJAS.push( { nombre:15 ,posicion:{x:1.448259415771182,y:0,z:-3.172386117998001} }   )
ARRAY_PUNTOSCAJAS.push( { nombre:32 ,posicion: {x:0.931038104276527,y:0,z:-3.348998139977028} }   )
ARRAY_PUNTOSCAJAS.push( { nombre:0 ,posicion: {x:0.21479664977962323,y:0,z:-2.8940485718326103} }   )


function get_cajaanterior(numero){
    cajaobjeto={};
    $(ARRAY_PUNTOSCAJAS).each(function(i,e){
        if(e.nombre==numero){
            cajaobjeto=e;
            return false;
        }
    })
    return cajaobjeto;
}


function hexToRgb(hex) {
    var shorthandRegex = /^#?([a-f\d])([a-f\d])([a-f\d])$/i;
    hex = hex.replace(shorthandRegex, function(m, r, g, b) {
        return r + r + g + g + b + b;
    });

    var result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);
    return result ? {
        r: parseInt(result[1], 16),
        g: parseInt(result[2], 16),
        b: parseInt(result[3], 16)
    } : null;
}



function mover_cuyrandom() {    ///var_cuymoviendo  => animationframe
    if (!CUY_CORRIENDO) {  return;}
    mostrar_cuymoviendo();

    // funcion_ease=EasingFunctions_array[0].funcion;//linear
    funcion_ease=EasingFunctions_array[bfuncion_easing_indice].funcion;//usar random de generarrandompunto b

    var newX = lerp(a.x, b.x, funcion_ease(t));  
    var newY = lerp(a.y, b.y, funcion_ease(t));  
    var newZ = lerp(a.z, b.z, funcion_ease(t));  
    model.position.set(newX,0,newZ); 
    //t += dt;
    t=parseFloat(t+dt).toFixed(5);
    t=parseFloat(t);
    //console.warn("x=> " + newX + "  y=>" + newY + "  z= " + newZ);
    mixer.update(clock.getDelta());
    renderer.render(scene, camera);
    var_cuymoviendo = requestAnimationFrame(mover_cuyrandom);
    if(t>=1)
    {
        // console.warn("LLEGÓ ccc");
        model.position.set(b.x, b.y, b.z); ///ajustar posición si no llegó exacto
        a = { x: model.position.x, y: model.position.y, z: model.position.z };   //////nueva posicion
        cancelAnimationFrame(var_cuymoviendo);
        detener_animacion();///ant
        detener_var_cuymoviendo();
        detener_var_cuy_rotando();

        actualizar_cuyes_posicion();

        fin_tiempo=performance.now();
        milisegundos=(fin_tiempo-inicio_tiempo);
        // console.warn("tiempo => "+t+"   segundos :"+parseFloat(milisegundos/1000).toFixed(2) +"   -    milliseconds :"+ milisegundos  );
        // cuydudando();

        // if(milisegundos>TIEMPO_RANDOM){
        //             posicion_fin_caja= new THREE.Vector3();
        //             if(GANADOR_DE_EVENTO=="x" || GANADOR_DE_EVENTO=="0"){
        //                 getObjeto_caja("madera").getWorldPosition(posicion_fin_caja);
        //             }
        //             else{
        //                 getObjeto_caja(GANADOR_DE_EVENTO).getWorldPosition(posicion_fin_caja);
        //             }
        //             posicion_fin_caja.y=0;
        //                     CUY_CORRIENDO = false;
        //                     puntosspline=[];
        //                     posicionmodel=new THREE.Vector3();
        //                     model.getWorldPosition(posicionmodel);
                            
        //                     puntootro.y=0;
        //                     puntosspline.push(posicionmodel);
        //                     puntosspline.push(puntootro);
        //                     puntosspline.push(posicion_fin_caja);
        //                     spline= new THREE.SplineCurve3(puntosspline);
        //                     // linea_camino();
        //                     t=0;
        //                     correr_spline();
        // }
        // else{
        //     mostrar_cuydudando=Math.random()>=0.5?true:false;
        //     if(mostrar_cuydudando){
        //         detener_var_cuydudando();
                
        //         cuydudando();
        //         tiempodudando=Math.random() * (10 - 1) + 1; 
        //         setTimeout(function(){
        //            generar_nueva_posicion_random();//b
        //            random_tiempo();
        //         },tiempodudando*100);
        //     }
        //     else{
        //         detener_var_cuydudando();

        //         generar_nueva_posicion_random();//b
        //         random_tiempo();
        //     }
        // }  ///fin else ms >tiempo

        if (milisegundos > TIEMPO_RANDOM) {////tiempo de animacion cuy paso, ir a caja ganador posicion
            if(!mover_a_ganador){
                    mover_a_ganador=true;
                    // b=get_caja(GANADOR_DE_EVENTO).posicion;
                    if(GANADOR_DE_EVENTO=="x" || GANADOR_DE_EVENTO=="0"){
                          bfuncion_easing_indice=7;//easeInQuart
                          console.log("X o O");
                         // b=ARRAY_PUNTOSCAJAS[ARRAY_PUNTOSCAJAS.length-1].posicion;
                         // b=getObjeto_caja("madera").getWorldPosition();
                         b=new THREE.Vector3();
                         getObjeto_caja("madera").getWorldPosition(b);
                         random_tiempo();
                    }else{

                            posicion_fin_caja= new THREE.Vector3();
                            getObjeto_caja(GANADOR_DE_EVENTO).getWorldPosition(posicion_fin_caja);
                            posicion_fin_caja.y=0;
                            CUY_CORRIENDO = false;
                            puntosspline=[];
                            posicionmodel=new THREE.Vector3();
                            model.getWorldPosition(posicionmodel);

                            puntootro.y=0;
                            puntosspline.push(posicionmodel);
                            puntosspline.push(puntootro);
                            puntosspline.push(posicion_fin_caja);
                            // spline= new THREE.SplineCurve3(puntosspline);
                            spline= new THREE.CatmullRomCurve3(puntosspline);
                            // linea_camino();
                            t=0;
                            dtSPLINE=0.025;
                            dist_spline=spline.getLength();
                            console.info("dist_spline "+dist_spline);
                            if(dist_spline>4){
                                dtSPLINE=0.009;
                            }
        //                     // linea_camino();
                            correr_spline();
                           // b=get_caja(GANADOR_DE_EVENTO).posicion;
                    }
                    //console.log(b);
                   // random_tiempo();
            }  
            else { ///movera ganador true  => CUY EN POSICION DE CAJA, FINALIZAR ANIMACION
                CUY_CORRIENDO = false;
                if(model.position.x== posicionmadera.x && model.position.z== posicionmadera.z)
                {
                    modelCuyChoque.position.y=-0.1;
                    cuychoque();
                    cajax_animacion();///caja x voltear
                }
                model.visible=false;
                callback_ganador();
                fin_tiempof = performance.now();
                milisegundosf = (fin_tiempof - inicio_tiempo);
                console.info("TIEMPO FINAL=> segundos: " +parseFloat(milisegundosf/1000).toFixed(2)+" ,  milliseconds : "+ milisegundosf );
               // delete funcion_callback;
             }
            console.info("fin");
        }///ms > tiempo
        else{
            mostrar_cuydudando=b.mostrar_cuydudando;//Math.random()>=0.5?true:false;
            if(mostrar_cuydudando){
                detener_var_cuydudando();
                
                cuydudando();
                tiempodudando=Math.random() * (10 - 1) + 1; 
                setTimeout(function(){
                   generar_nueva_posicion_random();//b
                   random_tiempo();
                },tiempodudando*100);
            }
            else{
                detener_var_cuydudando();
                generar_nueva_posicion_random();//b
                random_tiempo();
            }
        }  ///fin else ms >tiempo
    }  ///fin t>1
}


function iniciar_tiempo_random(tiempo) {
    TIEMPO_RANDOM=tiempo;
    inicio_tiempo = performance.now();
    mover_a_ganador=false;

    detener_var_cuydudando();
    cuydudando();
    setTimeout(function(){
        detener_var_cuydudando();
        generar_nueva_posicion_random();//b
        // console.info(b);
        //esta=typeof var_cuymoviendo === "undefined"?"true":"false";
        //console.warn(esta);
        // rotarono=b.rotarono;
        // mostrar_cuydudando=b.mostrar_cuydudando;
        random_tiempo();
    },3500);

}


function random_tiempo(){
    if (typeof var_cuymoviendo === "undefined") {
        rotarono=b.rotarono;//Math.random() >= 0.5 ?true:false;
        //rotarono=false;
        t = 0;  ///coeficiente
        aumento = 0;
     
        mostrar_cuymoviendo();
        mixer.update(clock.getDelta());
        renderer.render(scene, camera);
        if(rotarono){
            q1 = new THREE.Quaternion().copy(model.quaternion);
            model.lookAt(b.x,b.y,b.z);
            q2 = new THREE.Quaternion().copy(model.quaternion); timerotacion = 0;
        }

        detener_animacion();///ant
        detener_var_cuymoviendo();
        detener_var_cuychoque();
        detener_var_cuydudando();
        detener_var_cuy_rotando();

        if(rotarono){
            callback_rotacion = function () { ///se ejecuta al acabar  cuy_rotacion();
                detener_var_cuymoviendo();
                CUY_CORRIENDO=true;
                mover_cuyrandom();
            }
            CUY_ROTANDO=true;
            detener_var_cuy_rotando();
            cuy_rotacionrandom();
        }else{
            CUY_ROTANDO=false;
            model.lookAt(b.x, b.y, b.z);
            modelCuyDudando.lookAt(b.x, b.y, b.z);
            modelCuyChoque.lookAt(b.x, b.y, b.z);
            t=0;
            aver=CUY_CORRIENDO?"true":"false";
              // console.warn("t else:::::  "+t +" "+b.x+" "+b.y+" "+b.z +"  cuycorriendo  = "+ aver);
            detener_var_cuymoviendo();
            detener_var_cuydudando();
            detener_var_cuychoque();
            CUY_CORRIENDO=true;
            mover_cuyrandom();
        }

        // callback_rotacion = function () { ///se ejecuta al acabar  cuy_rotacion();
        //     mover_cuyrandom();
        // }
        // CUY_ROTANDO=true;
        // //console.info("rotando true");
        // cuy_rotacionrandom();
    } else {
        cancelAnimationFrame(var_cuymoviendo);
    } 
}


function mover_cuy_rapido2() {    ///var_cuymoviendo  => animationframe
    if (!CUY_CORRIENDO) {  return;}
    mostrar_cuymoviendo();
  //thrust=0.01;
x=model.position.x;
z=model.position.z;
   tx = (b.x - x).toFixed(10);tx=parseFloat(tx);
 tz = (b.z - z).toFixed(10);tz=parseFloat(tz);
 dist = Math.sqrt(tx*tx+tz*tz);
 dist=dist.toFixed(10);dist=parseFloat(dist);
 if(x>=b.x){dist=0;}
    rad = Math.atan2(tz,tx);
    angle = rad/Math.PI * 180;
    velX = (tx/dist)*thrust;
    velZ = (tz/dist)*thrust;
console.log(dist+"  x:"+x+" z:"+z);

 if(dist>0){
    x=(x+velX).toFixed(10);
    z=(z+velZ).toFixed(10);
          model.position.set(parseFloat(x),
                             0,
                              parseFloat(z)); 
            mixer.update(clock.getDelta());
    renderer.render(scene, camera);
    var_cuymoviendo = requestAnimationFrame(mover_cuy_rapido2);
}  
  
  
else
    {
console.log(model.position.x+"  - "+model.position.z);
        //model.position.set(b.x, b.y, b.z); ///ajustar posición si no llegó exacto
        a = { x: model.position.x, y: model.position.y, z: model.position.z };   //////nueva posicion
        detener_var_cuymoviendo();
        detener_var_cuy_rotando();
        actualizar_cuyes_posicion();
            if(!mover_a_ganador){
                    mover_a_ganador=true;
                    // b=get_caja(GANADOR_DE_EVENTO).posicion;
                    if(GANADOR_DE_EVENTO=="x"){
                         b=ARRAY_PUNTOSCAJAS[ARRAY_PUNTOSCAJAS.length-1].posicion;
                    }else{
                        b=get_caja(GANADOR_DE_EVENTO).posicion;
                    }
            }  
            else {
                CUY_CORRIENDO = false;
                if(ARRAY_PUNTOSCAJAS[ARRAY_PUNTOSCAJAS.length-1].posicion.x==model.position.x && ARRAY_PUNTOSCAJAS[ARRAY_PUNTOSCAJAS.length-1].posicion.y==model.position.y ){
                    modelCuyChoque.position.y=-0.1;
                    cuychoque();
                    cajax_animacion();
                }
             }
      
    }  ///fin t>1
}


function mover_rapido(ganador){
    mover_a_ganador=ganador;
    rotarono=Math.random() >= 0.5 ?true:false;
        //rotarono=false;

        t = 0;  ///coeficiente
        timerotacion=0;
     
        mostrar_cuymoviendo();
        mixer.update(clock.getDelta());
        renderer.render(scene, camera);
        if(rotarono){
            q1 = new THREE.Quaternion().copy(model.quaternion);
            model.lookAt(b.x,b.y,b.z);
            q2 = new THREE.Quaternion().copy(model.quaternion);
        }
        detener_var_cuymoviendo();
        detener_var_cuychoque();
        detener_var_cuydudando();
        detener_var_cuy_rotando();
          
        if(rotarono){
            callback_rotacion = function () { ///se ejecuta al acabar  cuy_rotacion();
                detener_var_cuymoviendo();
                CUY_CORRIENDO=true;
                mover_cuy_rapido();
            }
            CUY_ROTANDO=true;
            detener_var_cuy_rotando();
            cuy_rotacionrapido();
        }else{
            CUY_ROTANDO=false;
            model.lookAt(b.x, b.y, b.z);
            modelCuyDudando.lookAt(b.x, b.y, b.z);
            modelCuyChoque.lookAt(b.x, b.y, b.z);
            t=0;
            aver=CUY_CORRIENDO?"true":"false";
              // console.warn("t else:::::  "+t +" "+b.x+" "+b.y+" "+b.z +"  cuycorriendo  = "+ aver);
            detener_var_cuymoviendo();
            detener_var_cuydudando();
            detener_var_cuychoque();
            CUY_CORRIENDO=true;
            mover_cuy_rapido();
        }

}

///////////////////////*FIN funciones ant  animacion_cuy.js*/

/////////////funciones ant ClaseWebSocketsCuy.js

function hora(){
  setInterval(function(){
         // time=ServerDate();
        $("#liveclock").text(ServerDate().getHours()+":"+ServerDate().getMinutes()+":"+ServerDate().getSeconds())
  },1000)
}



function init(host,port){
    // host="wss://sorteoat.local/wss2/";
  //host="wss://192.168.1.60:89/wss2/"
   var protocol = 'ws://'; 
  if (window.location.protocol === 'https:') {
         protocol = 'wss://';
         host=protocol+window.location.host+"/ws_cuy/";
  }
  else{
      host="ws://"+host+":"+port;
  }
  console.info("CONECTANDO A "+host);

  url=host;
  // console.info("CONECTANDO A "+host);
  try{
    
        console.log(performance.now() +" CREANDO SOCKET "+ url);
        socket = new WebSocket(host);
        console.log(performance.now()+" "+ socket.readyState);
        //log('WebSocket - status '+socket.readyState);
        socket.onopen    = function(msg){
                if(typeof timeout_eventofinalizo!="undefined"){
                    console.log("DETENIENDO timeout_eventofinalizo");
                    clearTimeout(timeout_eventofinalizo);
                }
                if(typeof timeout_nohayevento!="undefined"){
                    console.log("DETENIENDO timeout_nohayevento");
                    clearTimeout(timeout_nohayevento);
                }
                
                if(typeof toastr_errorconexion!="undefined"){
                    toastr_errorconexion.hide();  
                }
                 
                    detener_timeout_conexionwebsockets()                
                    if(typeof toasr_websockets_error!="undefined"){
                            toasr_websockets_error.hide();
                        }
                    logwarn(performance.now() +" Conectado a "+url +" ; estado= "+this.readyState); /////3  => desconectado    0  no conectado,   1  conectado
                   // setTimeout(function(){
                      //pedir_evento()
                      //console.info("pidiendo horaaaaaaaaaaaaaaaaaaaaaaaa despues de onopen");
                      intentando_conectarwebsocket=false;
                      CONECTADO__A_SERVIDORWEBSOCKET=true;
                        // pedir_hora_server();
                        pedir_eventoJSON();
          //          },1)
         };
        socket.onmessage = function(msg){ 
          aaaaa=msg;
          try{
            jsondecode=JSON.parse(msg.data);
            id=jsondecode.id;
            this.id=id;
            mensaje=jsondecode.mensaje;
            tipo=jsondecode.tipo;
            console.log("ID SOCKET  =========="+ id);
          }
          catch(ex){
            mensaje=msg.data;
            tipo="date";

          }
              // mensaje=msg.data;

          if(typeof toastr_errorconexion!="undefined"){
                                toastr_errorconexion.hide();  
            }
               if(typeof toasr_websockets_error!="undefined"){
                toasr_websockets_error  .hide();  
            }

               switch(tipo){
                   case "date":
                            pedir_hora=false;
                            // ahora=moment(msg.data);//.format("YYYY-MM-DD HH:mm:ss a");
                            ahora=moment(mensaje);//.format("YYYY-MM-DD HH:mm:ss a");
                            FECHA_INICIO_EVENTO=EVENTO_ACTUAL.fecha_evento_ini_actual;
                            FECHA_INICIO_EVENTO=moment(FECHA_INICIO_EVENTO, "YYYY-MM-DD HH:mm:ss a");

                            FECHA_FIN_EVENTO=EVENTO_ACTUAL.fecha_evento_fin_actual;
                            FECHA_FIN_EVENTO=moment(FECHA_FIN_EVENTO, "YYYY-MM-DD HH:mm:ss a");

                            segundos_para_fin_evento=FECHA_FIN_EVENTO.diff(ahora,'seconds');

                            FECHA_ANIMACION=EVENTO_ACTUAL.fecha_animacion;
                            FECHA_ANIMACION=moment(FECHA_ANIMACION, "YYYY-MM-DD HH:mm:ss a");

                            // console.info("F.ACTUAL   =  "+ ahora.format("YYYY-MM-DD HH:mm:ss a")+" -  F.ANIMACIÓN  = "+moment(FECHA_ANIMACION).format("YYYY-MM-DD HH:mm:ss a"));
                            segundos_para_animacion=FECHA_ANIMACION.diff(ahora,'seconds');
                            if(logueo_websockets){
                                console.info("INI=  "+FECHA_INICIO_EVENTO.format("YYYY-MM-DD HH:mm:ss a") + " -  FIN= "+FECHA_FIN_EVENTO.format("YYYY-MM-DD HH:mm:ss a")
                                        +"ACTUAL=  "+ ahora.format("YYYY-MM-DD HH:mm:ss a")+" - ANIMACIÓN= "+moment(FECHA_ANIMACION).format("YYYY-MM-DD HH:mm:ss a")
                                        +"--SEG. PARA ANIMACIÓN= "+segundos_para_animacion

                              );
                            }
                            // console.warn("SEG. PARA ANIMACIÓN= "+segundos_para_animacion);
                            seg_animacion=segundos_para_animacion*1000;

                            //segundos_para_animacion=1;
                           if(segundos_para_animacion>0){ ///EN rango animacion
                                setTimeout(function(){
                                    ///barra carga cuy
                                      $("#barra_loading_tpi").animate(
                                         {width:"100%"}
                                        ,(segundos_para_animacion)*1000
                                        ,function(){
                                                  $("#idevento_titulo").text(EVENTO_ID);
                                                  $("#termotetro_para_iniciar").hide();
                                                  buscando_evento=false;
                                                  INICIO_ANIMACION_CUY();////////////////////////////////////////
                                        }
                                       ); 
                                    ///fin barra cuy
                                      ///contador inicio cuy
                                      $("#contador_para_activar").text(segundos_para_animacion);
                                      var conta=segundos_para_animacion-1;
                                      conteo_=setInterval(function(){
                                          $("#contador_para_activar").text(conta);
                                          if(conta<1){clearInterval(conteo_);}
                                          conta=parseInt(conta)-1;
                                      },1000);
                                      ////fin contador inicio cuy

                                },1000);
                           }else{
                                toastr.options = {
                                timeOut: 0,
                                extendedTimeOut: 0,
                                tapToDismiss: false
                                };
                                if(logueo_websockets){
                                  console.log("esperando fecha fin evento "+EVENTO_ID+" actual,para recargar " +FECHA_FIN_EVENTO.format("YYYY-MM-DD HH:mm:ss a")) ;
                                }
                                if(segundos_para_fin_evento>0){

                                  toast_eventoterminar=toastr.info("Esperando que termine evento actual");
                                   $("#barra_loading_tpi").animate(
                                       {width:"100%"}
                                      ,(segundos_para_fin_evento)*1000
                                      ,function(){
                                        $("#barra_loading_tpi").css("width","0%");
                                            toast_eventoterminar.hide();
                                            CargarEstadistica(1);
                                      }
                                    );
                                   $("#contador_para_activar").text(segundos_para_fin_evento);
                                       var conta=(segundos_para_fin_evento)-1;
                                    conteo_=setInterval(function(){
                                      $("#contador_para_activar").text(conta);
                                      if(conta<1){clearInterval(conteo_);}
                                      conta=parseInt(conta)-1;
                                    },1000);


                                }else{
                                    
                                    if(!CONSULTADO_EVENTO){
                                          // toastr_eventofinalizo=toastr.error("Evento actual ya finalizó");
                                          crear_toastr_eventofinalizo();
                                          if(typeof timeout_consultar_evento!="undefined"){
                                              clearTimeout(timeout_consultar_evento);
                                          }
                                          timeout_consultar_evento=setTimeout(function(){
                                                    ocultar_toastr_eventofinalizo()
                                                    detener_timeout_conexionwebsockets();
                                                        console.log(segundos_para_fin_evento+ " CargarEstadistica ev ac ya finlai");
                                                        CargarEstadistica(1);
                                                    
                                          },4000);
                                    }
                                   //  iii=0;
                                   //  intervalo_fin_evento=setInterval(function(){
                                   //      if(iii>segundos_para_fin_evento){
                                   //          toastr_eventofinalizo.hide();
                                   //          detener_timeout_conexionwebsockets();
                                   //          console.log(segundos_para_fin_evento+ " CargarEstadistica ev ac ya finlai");
                                   //          if(!CONSULTADO_EVENTO){
                                   //              CargarEstadistica(1);
                                   //          }
                                   //          clearInterval(intervalo_fin_evento);
                                   //      }
                                   //      iii++;
                                   // },1000);

                                }

                              }//fin else

                          break;
                          // case "dateJSON":
                          //   console.info(jsondecode);
                          //   EVENTO_DATOS=JSON.parse(jsondecode.mensaje);
                          //   // EVENTO_=EVENTO_DATOS.evento;
                          //   accion_evento(EVENTO_DATOS);/////////////////////////////////////////******//////////////////
                          // break;
                          case "eventoJSON":
                            pedir_hora=false;
                            //console.info(jsondecode);
                            EVENTO_DATOS=JSON.parse(jsondecode.mensaje);
                            accion_evento(EVENTO_DATOS);/////////////////////////////////////////******//////////////////
                          break;
                 //reloj_websockets(msg.data,eventoactual.fechaFinEvento,eventoactual.segBloqueoAntesEvento);
              }

         };
      socket.onerror=function(msg){
        socket.close();
            intentando_conectarwebsocket=false; 
            console.log(performance.now()+" on error "+" SOCKET STATE="+socket.readyState);

            //socket=null;
            CONECTADO__A_SERVIDORWEBSOCKET=false;
            // logwarn("on error sockets");
       };
      socket.onclose   = function(msg){
////////////socket readystate = 3  CLOSED

            if(typeof timeout_eventofinalizo!="undefined"){
            console.log("DETENIENDO timeout_eventofinalizo");
              clearTimeout(timeout_eventofinalizo);
            }
            console.log(performance.now()+"  on close "+" SOCKET STATE="+socket.readyState );
            if(typeof socket!="undefined" && socket!=null){socket.close();}
                 socket=null;
                 yahay_timeourparareconexion=false;
                 if(typeof timeout_reconectar!="undefined"){
                    console.warn("ya hay timeout_reconectar");
                  yahay_timeourparareconexion=true;}

                 if(yahay_timeourparareconexion==false){
                    console.info("declarando  timeout_reconectar")
                       timeout_reconectar=setTimeout(function(){

                          intentando_conectarwebsocket=false; 
                               CONECTADO__A_SERVIDORWEBSOCKET=false;
                            
                                if(RECONECTAR_WEBSOCKET){
                                  crear_toasr_websockets_error();
                                  logwarn(performance.now()+" Desconectado-status "+this.readyState+" ;Reintentando conectar en 2 segundos");
                                              console.log("reconectar socket ");//+socket.readyState);
                                              intentando_conectarwebsocket=true;
                                              socket=null;
                                                    clearTimeout(timeout_reconectar);delete timeout_reconectar;

                                              if(ANIMACION_CUY==false){
                                                    iniciar_websocketservidor();
                                                   // timeout_conexionwebsockets();
                                              }
                                          
                                            //}
                                  // },1000);
                                  }

                          },5000);

                 }

                                 
      };///fin on close
  } //fin try
  catch(ex){ 
    CONECTADO__A_SERVIDORWEBSOCKET=false;
    console.warn("try catch error")
    logerror(ex); 
  }
}
/////////////funciones ant ClaseWebSocketsCuy.js
