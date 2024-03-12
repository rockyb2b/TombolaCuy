<DIV CLASS="CONTENEDOR_TOMBOLACUY" style="padding-top:0px">
    <div class="row" style="display:none">
        <div class="col-md-12">
            <div class="panel panel-primary">
                <div class="panel-body" id="datoscaja">
                    <div class="row">
                        <div class="col-md-7 col-xs-12 col-sm-12">
                            <h6>
                                <i class="glyphicon glyphicon-th mr-2"></i>
                                Venta Caja    
                            </h6>
                        </div>
                        <div class="col-md-5 col-xs-12 col-sm-12">
                        </div>
                    </div>
                    <hr style="margin-top: 0px;">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <div class="input-group">
                                    <div class="input-group-addon bg-primary text-white">TIENDA</div>
                                    <input type="text" class="form-control input-sm" id="tienda"  value="1" readonly>
                                    <input type="hidden" class="form-control input-sm" id="idPuntoVenta" value="1" >
                                    <input type="hidden" class="form-control input-sm" id="idUbigeo" value="1" >
                                    <input type="hidden" class="form-control input-sm" id="idAperturaCaja" value="1" >
                                    <input type="hidden" class="form-control input-sm" id="cc_id" value="1" >
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <div class="input-group">
                                    <div class="input-group-addon bg-primary text-white">CAJA</div>
                                    <input type="text" class="form-control input-sm" id="caja" value="1" readonly>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <div class="input-group">
                                    <div class="input-group-addon bg-primary text-white">FECHA</div>
                                    <input type="text" class="form-control input-sm" id="fechaOperacion"  value="{{ date('Y-m-d H:i:s') }}"  readonly>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <div class="input-group">
                                    <div class="input-group-addon bg-primary text-white">TURNO</div>
                                    <input type="text" class="form-control input-sm" id="turno" value="1" readonly>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div><!--fin  CLASS row-->
    <div class="TOMBOLACUY" style="display:none;/*height:89vh;/">
        <div class=" rowcabecera">
            <div class=" rowcabecera_nombres">
                <div style="width:22%" class="">
                    <div> HORA</div>
                </div>
                <div style="width:20%"class="">
                    <div>PRÓXIMO EN</div> 
                </div>
                <div style="width:15%"class="">
                        <div>JUGADOR</div>
                </div>
                <div style="width:10%" class="">
                        <div>DIVISA</div>  
                </div>
                <div style="width:33%;justify-content:end;padding-right:1.6%" class="">
                    <div>SALDO</div>  
                </div>
            </div>
            <div class=" rowcabecera_datos" id="row_datosevento">
                <div style="width:22%;display:block" class="" >
                    <div style="display:flex;width:100%">
                        <div id="fechaServidor" style="display:flex;width:100%;border:0" >
                        </div>
                    </div>
                </div>
                <div style="width:20%;" class="">
                    <div style="width:50%;border-right:0px;display:flex;" id="proximo_en2" class="countdown">
                        -
                    </div>
                    <div style="display:flex;width:50%">
                        <div id="progreso" style="padding: 0;display:block;float:right;width: 80%;margin:auto;height:45%; background:rgba(0, 0, 0, 0) linear-gradient(to right,#2196f3, #8bc34a, #f44336) repeat scroll 0 0; border-radius:5px 0px 0px 5px">
                            <div id="barra_loading" style = "float:right;width:100%;height:100%;background-color: green;">
                            </div>
                        </div>
                    </div>
                </div>
                <div style="width:15%;" id="jugador">-
                </div>
                <div style="width:10%;"  id="divisa">
                </div>
                <div style = "width:33%;
                            text-align:right;
                            font-size: 3vh;
                            background-color: #a5201b;
                            box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.1), inset 0 -3px 2px rgba(0, 0, 0, 0.12), 0 5px 5px rgba(0, 0, 0, 0.4), 0 0 5px rgba(0, 0, 0, 0.4), inset 0 -15px 10px rgba(0, 0, 0, 0.25);
                            padding-right: 1.6%;
                            display:flex;
                            align-item:center;
                            justify-content:end" 
                        id="saldosuma">0.00
                </div>
            </div><!--fin rowcabecera_datos-->
        </div><!--FIN rowcabecera-->
        <div class=" row_medio">
            <div class="columna_principalizquierda"  >
                <div  class="tabla_pleno">
                    <div class="row_pleno" >
                        <div class="div_pleno">
                            NÚMEROS
                        </div>
                    </div>
                    <div class="contenedor_tablaprincipal2"  style="height:90%">
                        <div class="" id="numeros_tabla2">
                            <!--TABLA DE NUMEROS PRINCIPAL-->
                            <div class=" margen_numeros">
                            </div>
                            <div class=" numeros_rect2">
                                    @foreach($primerafila as $div) 
                                        <div 
                                        data-idTipoPago="{{$div->idTipoPago}}" 
                                        data-idTipoApuesta="{{$div->idTipoApuesta}}" 
                                        style="background-color:{{$div->rgb}};color:{{$div->rgbLetra}}" 
                                        data-tipo="numero" 
                                        data-color="{{$div->rgb}}"
                                        data-valor={{$div->valorapuesta}} 
                                        data-cuota={{$div->multiplicadorDefecto}} 
                                        >{{$div->valorapuesta}}
                                    </div>
                                    @endforeach
                            </div>
                                <div class=" margen_bottom_numeros">
                                </div>
                                <div class=" margen_numeros">
                                </div>
                                <div class=" numeros_rect2">
                                    @foreach($segundafila as $div) 
                                        <div 
                                        data-idTipoApuesta="{{$div->idTipoApuesta}}" 
                                        data-idTipoPago="{{$div->idTipoPago}}" 
                                                style="background-color:{{$div->rgb}};color:{{$div->rgbLetra}}" 
                                        data-tipo="numero" 
                                        data-color="{{$div->rgb}}"
                                        data-valor={{$div->valorapuesta}} 
                                        data-cuota={{$div->multiplicadorDefecto}} 
                                        >{{$div->valorapuesta}}
                                            </div>
                                    @endforeach
                            </div>
                            <div class=" margen_bottom_numeros"></div>
                            <div class=" margen_numeros"></div>
                            <div class=" numeros_rect2">
                                @foreach($tercerafila as $div) 
                                    <div 
                                    data-idTipoApuesta="{{$div->idTipoApuesta}}" 
                                    data-idTipoPago="{{$div->idTipoPago}}" 
                                    style="background-color:{{$div->rgb}};color:{{$div->rgbLetra}}" 

                                    data-tipo="numero" 
                                    data-color="{{$div->rgb}}"
                                    data-valor={{$div->valorapuesta}} 
                                    data-cuota={{$div->multiplicadorDefecto}} 
                                    >{{$div->valorapuesta}}</div>
                                @endforeach
                            </div>
                            <div class=" margen_bottom_numeros"></div>
                            <div class=" margen_numeros"></div>
                            <div class=" numeros_rect2">
                                @foreach($cuartafila as $div) 
                                    <div 
                                    data-idTipoApuesta="{{$div->idTipoApuesta}}" 
                                    data-idTipoPago="{{$div->idTipoPago}}" 
                                                    style="background-color:{{$div->rgb}};color:{{$div->rgbLetra}}" 
                                    
                                    data-tipo="numero" 
                                    data-color="{{$div->rgb}}"
                                    data-valor={{$div->valorapuesta}} 
                                    data-cuota={{$div->multiplicadorDefecto}} 
                                    >{{$div->valorapuesta}}</div>
                                @endforeach
                            </div>
                            <div class=" margen_bottom_numeros"></div>
                            <div class=" margen_numeros"></div>
                            <div class=" numeros_rect2">
                                @foreach($quintafila as $div) 
                                    <div 
                                    data-idTipoApuesta="{{$div->idTipoApuesta}}" 
                                    data-idTipoPago="{{$div->idTipoPago}}" 
                                                    style="background-color:{{$div->rgb}};color:{{$div->rgbLetra}}" 
                                    
                                    data-tipo="numero" 
                                    data-color="{{$div->rgb}}"
                                    data-valor={{$div->valorapuesta}} 
                                    data-cuota={{$div->multiplicadorDefecto}} 
                                    >{{$div->valorapuesta}}</div>
                                @endforeach
                            </div>
                            <div class=" margen_bottom_numeros"></div>
                            <div class=" margen_numeros"></div>
                            <div class=" numeros_rect2">
                                @foreach($sextafila as $div) 
                                    <div 
                                    data-idTipoApuesta="{{$div->idTipoApuesta}}" 
                                    data-idTipoPago="{{$div->idTipoPago}}" 
                                                    style="background-color:{{$div->rgb}};color:{{$div->rgbLetra}}" 
                                    
                                    data-tipo="numero" 
                                    data-color="{{$div->rgb}}"
                                    data-valor={{$div->valorapuesta}} 
                                    data-cuota={{$div->multiplicadorDefecto}} 
                                    >{{$div->valorapuesta}}</div>
                                @endforeach
                            </div>
                                <div class=" margen_bottom_numeros"></div>
                                            <!--  <div class="rowhistorial">
                                    <div class="historial">HISTORIAL</div>
                                </div>-->
                        </div>
                            <!--div col 10-->
                            <!-- <div class="col-xs-12 col-md-1"></div> -->
                    </div><!--contenedor_tablaprincipal-->
                </div><!--FIN TABLA PLENO-->
                <div class="tabla_apuestas_adicionales" >
                    <div class="apuestas_adicionales">
                        <div class=" apuestasadicionales_titulo" >
                            <div class="apuestasadicionales_titulo_div">APUESTAS ADICIONALES</div>
                        </div>
                        <div class="apuestasadicionalescontenedor" >
                            <?php if(count($coloresfila) > 0){ ?>
                            <div class="apuestacondicional_fila">
                                <div class="apuestacondicional_fila_nombre">COLORES</div>
                                <div class="apuestacondicional_fila_datos">
                                        @foreach($coloresfila as $div) 
                                            <div 
                                            data-idTipoApuesta="{{$div->idTipoApuesta}}" 
                                            data-idTipoPago="{{$div->idTipoPago}}" 
                                            style="background-color:{{$div->rgb}};color:{{$div->rgbLetra}}" 
                                            data-tipo="color" 
                                            <?php $datacolor = $div->nombre; ?>
                                            data-color="{{$datacolor}}"
                                            data-color2="{{$div->rgb}}"
                                            data-descripcion="{{$div->descripcion}}"
                                            data-valor = {{$div->nombre}}" 
                                            data-cuota = {{$div->multiplicadorDefecto}} 
                                            >{{$div->nombre}}</div>
                                        @endforeach
                                </div>      
                            </div>
                            <?php }?>

                            <?php if(count($rangosfila) > 0){ ?>
                            <div class="apuestacondicional_fila" style="" >
                                <div class="apuestacondicional_fila_nombre">RANGOS <?php echo count($rangosfila);?></div>
                                <div class="apuestacondicional_fila_datos">
                                        @foreach($rangosfila as $div) 
                                            <div 
                                            data-idTipoApuesta="{{$div->idTipoApuesta}}" 
                                            data-idTipoPago="{{$div->idTipoPago}}" 
                                            style="background-color:{{$div->rgb}}" 
                                            data-tipo="rango" 
                                            <?php
                                            $datacolor=$div->rgb;
                                            ?>
                                            data-color="{{$datacolor}}"
                                            data-valor={{$div->nombre}} 
                                            data-cuota={{$div->multiplicadorDefecto}} 
                                            >{{$div->nombre}}
                                        </div>
                                        @endforeach
                                </div>      
                            </div>
                            <?php }?>

                            <?php if(count($par_imparfila) > 0){ ?>
                                <div class="apuestacondicional_fila">
                                    <div class="apuestacondicional_fila_nombre">PAR/IMPAR</div>
                                    <div class="apuestacondicional_fila_datos">
                                            @foreach($par_imparfila as $div) 
                                                <div 
                                                data-idTipoApuesta="{{$div->idTipoApuesta}}" 
                                                data-idTipoPago="{{$div->idTipoPago}}" 
                                                style="background-color:{{$div->rgb}}" 
                                                data-tipo="par_impar" 
                                                <?php
                                                $datacolor=$div->rgb;

                                                ?>
                                                data-color="{{$datacolor}}"
                                                data-valor={{$div->nombre}} 
                                                data-cuota={{$div->multiplicadorDefecto}} 
                                                >{{$div->nombre}}</div>
                                            @endforeach
                                    </div>     
                                </div>
                            <?php }?>
                        <!-- <div class="rectangulo_rojo">1</div> -->
                        </div>    

                    </div><!--FIN class apuestas_adicionales-->
            <!--fin div rowhisto hisotrila numeros-->
                </div><!--fin div tabla_apuestas_adicionales-->


                <div class="tabla_historial">
                    <div class=" tabla_historial_titulo" ><div class="tabla_historial_titulo_div">HISTORIAL</div></div>
                    <div class=" historial_numeros" style="height:79%">
                    </div>    
                </div>
        <!--fin div rowhisto hisotrila numeros-->

            </div><!-- columna principal_izqueirda -->
            <div class="columna_principalderecha">

                <div class="tituloconfiguracionevento">
                    <div class="izquierda">
                        <div CLASS="nombre_tituloconfiguracionevento"></div>
                    </div>
                    <div class="derecha" style="padding-right">
                        <div class="id_tituloconfiguracionevento"></div>   
                    </div>
                </div>
                <div class="rowtablaeventos">
                    <table class="table table-condensed table-stripedVenta" id="tabla_eventos">
                        <thead>
                            <tr>
                                <th>ID EVENTO</th>
                                <th>SELECCIÓN</th>
                                <th>CUOTA</th>
                                <th>APUESTA </th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div><!--rowtablaeventos-->
                <div style="height:2%;width:100%">
                </div>
                <div class="rowtableeventos_footer">
                    <div class="apuesta">
                        <div class="rowtableeventos_footer_apuesta">APUESTA</div>
                    </div>
                    <div class="valorestotalmax" style="padding-right:7%;height:100%">
                        <div id="valor_total" style="width:100%;height:50%;display:flex;align-items: center;" > 
                                <div style="width:30%;float:left;text-align:right">TOTAL:</div>
                                <div style="width:15%;float:left;text-align:right" class="div"></div>
                                <div style="width:50%;float:left;text-align:right;" class="val">0.00</div>
                        </div>
                        <div id="valor_maximo" style="width:100%;height:50%;display:flex;align-items: center;">
                            <div style="width:30%;float:left;text-align:right">MAX:</div>
                                <div style="width:15%;float:left;text-align:right" class="div"></div>

                            <div style="width:50%;float:left;text-align:right;" class="val">0.00</div>
                        </div>
                    </div>
                </div>
            <!--rowtableeventos_footer-->
                <div class="rowapuestas" id="div_apuestas">
                        @foreach($dinerodefault as $apuesta) 
                            <div class="rowapuestasdiv" 
                            data-valor="{{$apuesta->monto}}"
                            data-tipo="apuesta"
                            >
                            {{$apuesta->monto}}
                            </div>
                        @endforeach
                    <!--      <div class="rowapuestasdiv">
                    </div> -->
                </div>
                <!--rowapuestas-->
                <div class="rowbotones" id="div_botones">
                    <div class="rowbotonesdiv check icon icon-2x fa fa-check">
                    </div> 
                    <div class="rowbotonesdiv cerrar icon icon-2x fa fa-close">
                    </div>                                        
                    <div class="rowbotonesdiv bet icon icon-2x fa fa-print">
                    </div> 
                </div>
                <!--rowapuestas-->
                <div style="width:100%;height:1%"></div>
            </div><!--FIN class columna_principalderecha-->
        </div><!--fin row medio -->
        <div class="rowconfiguracioneventosdiv" id="div_configuracioneventos">
            <div class="eventos_fila_izq" style="padding-left: 6px;padding-right: 6px;">
                <?php if ($eventosdatos != null){?>
                    <div class = "configuracioneventosdiv" 
                        data-id = "{{ $eventosdatos->idEvento }}"
                        data-idJuego = "{{ $eventosdatos->idJuego }}"
                        data-nombre = "{{ $eventosdatos->nombre }}"
                        data-apuestaMinima = "{{ $eventosdatos->apuestaMinima }}"
                        data-apuestaMaxima = "{{ $eventosdatos->apuestaMaxima }}"

                        data-apuestaMinimajuego = "{{ $eventosdatos->apuestaMinimaJuego }}"
                        data-apuestaMaximajuego = "{{ $eventosdatos->apuestaMaximaJuego }}"
                        
                        data-FechaEvento = "{{ $eventosdatos->FechaEvento }}"
                        data-fechaFinEvento = "{{ $eventosdatos->fechaFinEvento }}"
                        data-segBloqueoAntesEvento = "{{ $eventosdatos->segBloqueoAntesEvento }}"
                        data-idMoneda = "{{ $eventosdatos->idMoneda }}"

                        data-jugador = "{{$eventosdatos->jugador}}"
                        data-divisa = "{{$eventosdatos->divisa}}"
                        data-logo = "{{$eventosdatos->logo}}"
                    > 
                        <div style="width: 30%; height: 100%;/*float:left;*/position:relative;margin:auto;">
                            <img style="width:100%;height:80%;position: absolute; left: 50%; transform: translate(-50%, -50%); top: 50%;" src="img/juegos/{{$eventosdatos->logo}}">
                        </div>
                    </div>
                <?php }?>
            </div>
            <div class="eventos_fila_der">
                <!-- <div id="reimprimir" class="icon icon-2x fa fa-print" ></div> -->
                <!-- <div id="cancelar" class="icon icon-2x fa fa-close"></div> -->
                <div id="recargar_boton" >
                    <div class="icon icon-2x fa fa-refresh divboton" data-toggle="tooltip" title="Recargar">
                    </div>
                </div>                
            </div>
        </div><!--fin rowconfiguracioneventosdiv-->
    </div><!--JUEGO TOMBOLACUY-->
</DIV>
<?php //}?>
@include('Venta.ModalesCajaTabla');
<!-- </div>
</div> -->
<!--FIN  panel-body-->
<!-- 
</div>
</div> -->
<?  //php }?>
<!-- </div> -->
@push('Js')
<!-- <?php if($error!=""){?>
    <script>toastr.error("<?php echo $error;?>")</script>
<?php }?> -->
@endpush