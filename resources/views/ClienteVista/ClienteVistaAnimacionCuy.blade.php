<!DOCTYPE html>
<html lang="en">
<head>
	<title>Animación</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
	<link rel="shortcut icon" href="{{asset('images/logoat.jpg')}}">
	<link rel="stylesheet" href="{{asset('../components/toastr/toastr.min.css')}}">
	<link rel="stylesheet" href="{{asset('../css/Animacion/estilos_animacion_cuy.css')}}">
	<link rel="stylesheet" href="{{asset('../css/Animacion/ganadorEstilo.css')}}">
	<script src="{{asset('../assets/js/jquery3_3_1.min.js')}}"></script>
	<script src="{{asset('../components/toastr/toastr.min.js')}}"></script>
	<script src="{{asset('../components/loadingoverlay/loadingoverlay.min.js')}}"></script>
	<script src="{{asset('../js/moment-with-locales.js')}}"></script>
	<script src="{{asset('../components/momentjs/moment_locales.min.js')}}"></script>
	<script src="{{asset('../js/moment.js')}}"></script>
	<script src="{{asset('../assets/js/three.js')}}"></script>
	<script src="{{asset('../assets/js/WebGL.js')}}"></script>
	<script src="{{asset('../assets/js/stats.min.js')}}"></script>
	<script src="{{asset('../assets/js/GLTFLoader.js')}}"></script>
	<script src="{{asset('../assets/js/dat.gui.min.js')}}"></script>
	<script src="{{asset('../assets/js/OrbitControls.js')}}"></script>
	<script>
	</script>
</head>

<body >
	<div  class="cuy_cargando" id="DIV_CARGANDO"></div>
    <div id="JUEGO" style="display:none">
        <div id="DIV_ESPERA" class=""></div>
        <div id="DIV_GANADOR" class="off SIN_ANIMACION_children" style="display:none">
            <div class="nroevento_ganador ">
            </div>
            <div class="contenedor_cubo_ganador">
            <div  id="cubo_ganador"class="cubo_ganador_clase">
                <IMG id="imagen_nro_ganador" style="height:100%;"></IMG>
            </div>
            </div>
        </div>

        <div id="top_rotulo" class="borde-lateral">
            </div>
        <div id="DIV_TITULOEVENTO" class="nroevento2 borde SIN_ANIMACION">
            <div id="idevento_titulo" class="neon_div neon" ></div>
        </div>
            
        <div id="DIV_ESPERANDOEVENTO" >
            <div class="titulo_centralizado borde">
                <div id="" class="neon_div neon" style="font-size: 3vh;">¿A dónde va el cuy? ¡Realiza tu apuesta!</div>
            </div>
            <div class="termometro_vertical" style="" id="termotetro_para_iniciar" >
                <div class="cargador_termometro_vertical">
                <div class="inner_vertical" id="barra_loading_tpi" style="height: 100%;"></div>
                </div>
            </div>
            <div class="evento_activacion" id="evento_para_activar" >
                <div style="width:60%">EVENTO ACTUAL</div>
                <div style="width:40%" id=evento_actual_portada></div>
            </div>
            <div class="contador_activacion" id="contador_para_activar">---</div>
        </div>

        <div id="DIV_PAGOSHISTORIAL" class="nuevo_lados borde-lateral">
            <div class="imagen_izq_div">
                <div class="image_corp_div">
                    <img src="img/juegos/icontombola.fw.png" alt="Torito">		
                </div>
            </div>
            <div class="pagos_titulo_div">
                <div class="pagos_titulo_texto">Pagos</div>
            </div>

            <div class="tabla_x_div" style="">
                <div class="tabla_x_contenido_div" style="">
                    <div class="fila_color_div" style="">
                        <div class="fila_color_div1" style="">COLOR</div>
                        <div class="fila_color_div2" style="">
                            <div class="fila_color_x_div2" id="color1" data-color={{$color1}} style="background-color:{{$color1}};color:{{$color1Letra}}">x2
                            </div>
                            <div class="fila_color_x_div2" id="color2" data-color={{$color2}} style="background-color:{{$color2}};color:{{$color2Letra}}">x2
                            </div>
                            <div class="fila_color_x_div2" id="color0" data-color={{$color0}} style="background-color:{{$color0}};color:{{$color0Letra}}">&nbsp;&nbsp;x36  </div>
                        </div>
                    </div>

                    <div class="tabla_x_fila" >
                        <div class="fila_tabla_x_div1" >DOCENA</div>
                        <div class="fila_tabla_x_div2" >x3</div>
                    </div>

                    <div class="tabla_x_fila" >
                        <div class="fila_tabla_x_div1" >PAR / IMPAR</div>
                        <div class="fila_tabla_x_div2" >x2</div>
                    </div>

                    <div class="tabla_x_fila" >
                        <div class="fila_tabla_x_div1" >NÚMERO</div>
                        <div class="fila_tabla_x_div2" >&nbsp;&nbsp;x36</div>
                    </div>
                </div>
            </div>

            <div class="historial_titulo_div">
                <div class="historial_titulo_texto">Historial</div>
            </div>

            <div class="historial_div">
                <div class="historial_tabla" id="historial_tabla" >
                    @foreach($resultado_evento as $fila) 
                    <?php $valor=$fila->valorGanador=="0"?"x":$fila->valorGanador;?>
                    <div class="fila_historial" >
                        <div> {{ $fila->idEvento }}</div> 
                        <div style="color:{{ $fila->rgbLetra }};background-color:{{ $fila->rgb }} ">{{$valor}}</div>
                    </div>
                    @endforeach
                </div>
            </div>
        </div>	

        <div id="DIV_CANVAS" ></div>		
        <div id="DIV_ESTADISTICA"  class="nuevo_lados borde-lateral">
            <div class="imagen_div">
                <div class="image_apuesta_div">
                    <img src="images/logocorp2b.png" alt="Torito" style="width:100%">		
                </div>
            </div>

            <div class="espacio_div"></div>
            <div class="estadistica_titulo_div">
                <div class="estadistica_titulo_texto">Estadísticas</div>
            </div>
            <div class="ultimoseventos_div">
                <div  class="ultimoseventos_texto_div">Últimos 120 eventos</div>
            </div>

            <div class="estadistica_div" >
                <div class="estadistica_tabla_div">
                    <div class="estadistica_tabla_fila_div" >
                        <div>1</div>
                        <div id="1">0</div>
                        <div >13</div>
                        <div id="13">0</div>
                        <div >25</div>
                        <div id="25">0</div>
                    </div>
                    <div class="estadistica_tabla_fila_div" >
                        <div>2</div>
                        <div id="2">0</div>
                        <div >14</div>
                        <div id="14">0</div>
                        <div >26</div>
                        <div id="26">0</div>
                    </div>
                    <div class="estadistica_tabla_fila_div" >
                        <div>3</div>
                        <div id="3">0</div>
                        <div >15</div>
                        <div id="15">0</div>
                        <div >27</div>
                        <div id="27">0</div>
                    </div>
                    <div class="estadistica_tabla_fila_div" >
                        <div>4</div>
                        <div id="4">0</div>
                        <div >16</div>
                        <div id="16">0</div>
                        <div >28</div>
                        <div id="28">0</div>
                    </div>
                    <div class="estadistica_tabla_fila_div" >
                        <div>5</div>
                        <div id="5">0</div>
                        <div >17</div>
                        <div id="17">0</div>
                        <div >29</div>
                        <div id="29">0</div>
                    </div>
                    <div class="estadistica_tabla_fila_div" >
                        <div>6</div>
                        <div id="6">0</div>
                        <div >18</div>
                        <div id="18">0</div>
                        <div >30</div>
                        <div id="30">0</div>
                    </div>
                    <div class="estadistica_tabla_fila_div" >
                        <div>7</div>
                        <div id="7">0</div>
                        <div >19</div>
                        <div id="19">0</div>
                        <div >31</div>
                        <div id="31">0</div>
                    </div>

                    <div class="estadistica_tabla_fila_div" >
                        <div>8</div>
                        <div id="8">0</div>
                        <div >20</div>
                        <div id="20">0</div>
                        <div >32</div>
                        <div id="32">0</div>
                    </div>
                    <div class="estadistica_tabla_fila_div" >
                        <div>9</div>
                        <div id="9">0</div>
                        <div >21</div>
                        <div id="21">0</div>
                        <div >33</div>
                        <div id="33">0</div>
                    </div>
                    <div class="estadistica_tabla_fila_div" >
                        <div>10</div>
                        <div id="10">0</div>
                        <div >22</div>
                        <div id="22">0</div>
                        <div >34</div>
                        <div id="34">0</div>
                    </div>
                    <div class="estadistica_tabla_fila_div" >
                        <div>11</div>
                        <div id="11">0</div>
                        <div >23</div>
                        <div id="23">0</div>
                        <div >35</div>
                        <div id="35">0</div>
                    </div>
                    <div class="estadistica_tabla_fila_div" >
                        <div>12</div>
                        <div id="12">0</div>
                        <div >24</div>
                        <div id="24">0</div>
                        <div >36</div>
                        <div id="36">0</div>
                    </div>
                    <div class="estadistica_tabla_fila_final_div" >
                        <div>x</div>
                        <div id="0">0</div>

                    </div>

                </div>
            </div>

            <div class="espacio_div"></div>

            <div class="estadisticas2_div">
                <div class="estadisticas2_contenido_div" > 
                    <div class="estadisticas2_titulos_div">DOCENAS (ÚLTIMOS 120 EVENTOS)</div>
                    <div class="estadisticas2_div_espacio"></div>
                    <div class="estadisticas2_docenas_div">
                        <div class="estadisticas2_rangos">1-12</div>
                        <div id="1_12">0</div>
                        <div class="estadisticas2_rangos">13-24</div>
                        <div id="13_24" >0</div>
                        <div class="estadisticas2_rangos">25-36</div>
                        <div id="25_36">0</div>
                    </div>
                    <div class="estadisticas2_div_espacio"></div>

                    <div class="estadisticas2_titulos_div">COLORES (ÚLTIMOS 120 EVENTOS)</div>
                    <div class="estadisticas2_div_espacio"></div>
                    
                    <div class="estadisticas2_colores_div">
                        <div id="color1" data-color={{$color1}} style="background-color: {{$color1}};color:{{$color1Letra}}" >0</div>
                        <div id="color2" data-color={{$color2}} style="background-color: {{$color2}} ;color:{{$color2Letra}}">0</div>
                        <div  id="cajaB" data-color={{$color0}} style="background-color: {{$color0}};color:{{$color0Letra}}" >0</div>
                    </div>
                    <div class="estadisticas2_div_espacio"></div>

                    <div class="estadisticas2_titulos_div">NÚMEROS (ÚLTIMOS 120 EVENTOS)</div>
                    <div class="estadisticas2_div_espacio"></div>
                    
                    <div class="estadisticas2_hotcold_tabla_div">
                        <div id="estadisticas_mayores">
                            <div class="hot" >HOT</div>

                        </div>
                        <div id="estadisticas_menores" >
                            <div class="cold">COLD</div>

                        </div>
                    </div>
                </div>
            </div>
        </div>	
    </div>

    <script src="{{asset('../assets/js/clientevista/Funciones_Easing.js')}}"></script>
    <script src="{{asset('../assets/js/clientevista/animacion.js')}}"></script>
    <script src="{{asset('../assets/js/clientevista/animacion_cuy.js')}}"></script>
    <script src="{{asset('../assets/js/clientevista/animacion_cuy_teclas.js')}}"></script>
    <script src="{{asset('../assets/js/clientevista/tween.min.js')}}"></script>
    <script src="{{asset('../assets/js/clientevista/TweenMax.min.js')}}"></script>

    <script src="{{asset('../assets/js/clientevista/jquery.fireworks.js')}}"></script>
    <script src="{{asset('../assets/js/clientevista/jquery.fuegos_artificiales.js')}}"></script>
    <script src="{{asset('../assets/js/clientevista/jquery.confeti.js')}}"></script>
    <script src="{{asset('../assets/js/clientevista/jquery.burn.min.js')}}"></script>
    <script src="{{asset('../assets/js/clientevista/jquery.shiningImage.min.js')}}"></script>

    <script src="{{asset('../assets/js/clientevista/jquery-glowing.js')}}"></script>
    <script src="{{asset('../assets/js/clientevista/jquery.color.js')}}"></script>
    <script src="{{asset('../assets/js/clientevista/jquery.illuminate.0.7.min.js')}}"></script>
    <!-- <script src="{{asset('../assets/js/clientevista/jquery.fittext.js')}}"></script> -->
    <script type="x-shader/x-vertex" id="vertexShader">
            varying vec3 vWorldPosition;
            void main() {
                vec4 worldPosition = modelMatrix * vec4( position, 1.0 );
                vWorldPosition = worldPosition.xyz;
                gl_Position = projectionMatrix * modelViewMatrix * vec4( position, 1.0 );
            }
    </script>
    <script type="x-shader/x-fragment" id="fragmentShader">
            uniform vec3 topColor;
            uniform vec3 bottomColor;
            uniform float offset;
            uniform float exponent;
            varying vec3 vWorldPosition;
            void main() {
                float h = normalize( vWorldPosition + offset ).y;
                gl_FragColor = vec4( mix( bottomColor, topColor, max( pow( max( h , 0.0), exponent ), 0.0 ) ), 1.0 );
            }
    </script>
    <script>    
        ultimos120eventos = {!! json_encode($ultimos120eventos) !!};
        TipoApuestaListado = {!! json_encode($TipoApuestaListado) !!};
        calcular_estadisticas_nuevo();
        function calcular_estadisticas_nuevo(){
            $(TipoApuestaListado).each(function(i,e){
                var valor = e.valorapuesta;
                var Repetidos = ganador_array(valor);
                e.Repetidos = Repetidos
            })
            var estadistica = TipoApuestaListado;
            calcular_estadisticas(estadistica);
        }
        function ganador_array(valorganador){
            var Repetidos = 0;
            $(ultimos120eventos).each(function(i,e){
                var ganador = e.ganador
                if(valorganador == ganador){
                    Repetidos++;
                }
            })
            return Repetidos;
        }
    </script>
</body>
</html>
