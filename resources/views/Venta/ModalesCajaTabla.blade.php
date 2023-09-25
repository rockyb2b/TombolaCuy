<!-- modal_imprimir=> modal Imprimir despues de comprar ticket--> 
<!--modal_imprimir_cancelar=> modal Imprimir antes de cancelar-->


<div class="modal" id="modal_imprimir" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Impresión</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
          <div class="modal-body" style="overflow:auto">
             <div style="text-align:center">
                <div id="divimpresion_guardarticket" style="box-shadow:0 0 10px black;width:80mm;margin:auto">
                    <div class="ticket" style="display:inline-block;font-size:10pt;width:80mm;padding:6mm 8mm 6mm 6mm">
                        <div class="imagen" style="width:100%;text-align:center;display:block;padding:4px">
                            <img id="imagen_evento"  width="130" height="85">
                        </div>

                    <!--     <div class="titulo" style="width: 100%; text-align: center; display: flex; align-items: center;/*border-bottom:1px solid*/;padding-bottom:5px">
                            <div style="width:100%">
                            <img id="imagen_apuestatotal" width="180" height="80" src="{{asset('img/logoticket.png')}}">
                        </div>
                        </div> -->
                      
                        <div class="datos" style="width:100%;display:table;padding-top:4px;margin-bottom: 6px">
                            <div style="width:100%;border-top:2px dotted;display:table">
                                <div style="width:50%;float:LEFT;text-align:left">ID Ticket</div>
                                <div style="width:50%;float:LEFT;text-align:right" id="IDTique"></div>
                            </div>
                            <div style="width:100%;display:table">

                                <div style="width:50%;float:LEFT;text-align:left">ID Unidad</div>
                                <div style="width:50%;float:LEFT;text-align:right" id="IDUnidad"></div>
                            </div>

                             <div style="width:100%;display:table;padding-bottom:4px;" id="">
                                <div style="width:50%;float:LEFT;text-align:left">Impreso en </div>
                                <div style="width:50%;float:LEFT;text-align:right" id="impreso_por2"></div>
                            </div>


                            <div style="width:100%;display:table">

                                <div style="width:50%;float:LEFT;text-align:left">Nro Evento</div>
                                <div style="width:50%;float:LEFT;text-align:right" id="NroEvento"></div>
                            </div>
                            <div style="width:100%;display:table">
                                <div style="width:50%;float:LEFT;text-align:left">Desc.</div>
                                <div style="width:50%;float:LEFT;text-align:right" id="descripcion"></div>
                            </div>
                            <div style="width:100%;display:table;border-top:2px dotted;padding-bottom:4px;padding-top:4px" id="datos_filas">
                            </div>

                            <div style="width:100%;display:table;border-top:2px dotted;padding-bottom:4px;padding-top:4px" id="totales_ticket">
                                <div style="width:50%;float:LEFT;text-align:left">Total del Ticket</div>
                                <div style="width:50%;float:LEFT;text-align:right" id="total_ticket"></div>
                            </div>
                            <div style="width:100%;display:table;border-top:2px dotted;padding-top:4px" id="">

                                <div style="width:50%;float:LEFT;text-align:left;">Impreso En</div>
                                <div style="width:50%;float:LEFT;text-align:right" id="impreso_en"></div>
                            </div>
                            <div style="width:100%;display:table;padding-bottom:4px;" id="">
                                <div style="width:50%;float:LEFT;text-align:left">Impreso por </div>
                                <div style="width:50%;float:LEFT;text-align:right" id="impreso_por"></div>
                            </div>
                            <div style="width:100%;display:table;border-top:2px dotted;padding-top:4px" id="">
                                <div style="width:50%;float:LEFT;text-align:left;">Premio Máximo a Pagar </div>
                                <div style="width:50%;float:LEFT;text-align:right" id="PremioMaximoAPagar"></div>
                            </div>
                            <div style="width:100%;display:table" id="">
                                <div style="width:50%;float:LEFT;text-align:left">Premio Máximo Potencial</div>
                                <div style="width:50%;float:LEFT;text-align:right" id="PremioMaximoPotencial"></div>
                            </div>
                        </div>
                        <div class="footer" style="width:100%;text-align:center"></div>
                        <div class="codigoqr_barra" style="width:100%;text-align:center;display:block;padding:4px">
                            <img style="width:70%" id="imagen_codigobarra"  width="140" height="86">
                        </div>

                    <!--     <div class="codigoqr_barra" style="width:100%;margin-bottom:8mm;display:table">
                            <div id="codigo_barra" style="float: LEFT; width:50%;padding-top:20px;text-align:center">
                                <img id="imagen_codigobarra"width="114" height="80">
                             </div>
                             <div id="codigo_qr" style="float: left; width:50%;text-align:right"><img id="imagen_qrcode"  width="120" height="120"></div>
                         </div> -->
                    </div>
                </div>
            </div><!--FIN DIV WRAPPER-->
         </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-primary" id="btnimprimir">Imprimir</button>
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        </div>
       </div>
    </div>
</div>



<div class="modal" id="modal_imprimir_cancelar333" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title">Impresión CANCELAR</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
  <div class="modal-body" style="overflow:auto">
     <div style="text-align:center">
        <div id="divimpresion" style="box-shadow:0 0 10px black;width:80mm;margin:auto">
            <div class="ticket" style="display:inline-block;font-size:10pt;width:80mm;padding:6mm 8mm 6mm 6mm">
                  <div class="imagen" style="width:100%;text-align:center;display:block;padding:4px">
                    <img id="imagen_evento"  width="130" height="85"></div>

              <!--   <div class="titulo" style="width: 100%; text-align: center; display: flex; align-items: center;/*border-bottom:1px solid*/;padding-bottom:5px">
                    <div style="width:100%">
                    <img id="imagen_apuestatotal" width="180" height="80" src="{{asset('img/logoticket.png')}}">
                </div>
                </div> -->
              
                <div class="datos" style="width:100%;display:table;padding-top:4px">
                    <div style="width:100%;border-top:2px dotted;display:table">
                        <div style="width:50%;float:LEFT;text-align:left">ID Ticket</div>
                        <div style="width:50%;float:LEFT;text-align:right" id="IDTique"></div>
                    </div>
                    <div style="width:100%;display:table">

                        <div style="width:50%;float:LEFT;text-align:left">ID Unidad</div>
                        <div style="width:50%;float:LEFT;text-align:right" id="IDUnidad"></div>
                    </div>

                     <div style="width:100%;display:table;padding-bottom:4px;" id="">
                        <div style="width:50%;float:LEFT;text-align:left">Impreso en </div>
                        <div style="width:50%;float:LEFT;text-align:right" id="impreso_por2"></div>
                    </div>


                    <div style="width:100%;display:table">

                        <div style="width:50%;float:LEFT;text-align:left">Nro Evento</div>
                        <div style="width:50%;float:LEFT;text-align:right" id="NroEvento"></div>
                    </div>
                    <div style="width:100%;display:table">
                        <div style="width:50%;float:LEFT;text-align:left">Desc.</div>
                        <div style="width:50%;float:LEFT;text-align:right" id="descripcion"></div>
                    </div>
                    <div style="width:100%;display:table;border-top:2px dotted;padding-bottom:4px;padding-top:4px" id="datos_filas">
                    </div>

                    <div style="width:100%;display:table;border-top:2px dotted;padding-bottom:4px;padding-top:4px" id="totales_ticket">
                        <div style="width:50%;float:LEFT;text-align:left">Total del Ticket</div>
                        <div style="width:50%;float:LEFT;text-align:right" id="total_ticket"></div>
                    </div>
                    <div style="width:100%;display:table;border-top:2px dotted;padding-top:4px" id="">

                        <div style="width:50%;float:LEFT;text-align:left;">Impreso En</div>
                        <div style="width:50%;float:LEFT;text-align:right" id="impreso_en"></div>
                    </div>
                    <div style="width:100%;display:table;padding-bottom:4px;" id="">
                        <div style="width:50%;float:LEFT;text-align:left">Impreso por </div>
                        <div style="width:50%;float:LEFT;text-align:right" id="impreso_por"></div>
                    </div>
                    <div style="width:100%;display:table;border-top:2px dotted;padding-top:4px" id="">
                        <div style="width:50%;float:LEFT;text-align:left;">Premio Máximo a Pagar </div>
                        <div style="width:50%;float:LEFT;text-align:right" id="PremioMaximoAPagar"></div>
                    </div>
                    <div style="width:100%;display:table" id="">
                        <div style="width:50%;float:LEFT;text-align:left">Premio Máximo Potencial</div>
                        <div style="width:50%;float:LEFT;text-align:right" id="PremioMaximoPotencial"></div>
                    </div>
                </div>
                <div class="footer" style="width:100%;text-align:center"></div>
                <div class="codigoqr_barra" style="width:100%;margin-bottom:8mm;display:table">
                    <div id="codigo_barra" style="float: LEFT; width:50%;padding-top:20px;text-align:center">
                        <img id="imagen_codigobarra"width="114" height="80">
                     </div>
                     <div id="codigo_qr" style="float: left; width:50%;text-align:right"><img id="imagen_qrcode"  width="120" height="120"></div>
                 </div>
            </div>
        </div>
    </div><!--FIN DIV WRAPPER-->
 </div>
<div class="modal-footer">
    <button type="button" class="btn btn-primary" id="btnCancelar">CANCELAR</button>
    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
</div>
               </div>
    </div>
</div>




<div class="modal" id="modal_buscar_pagados" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">BUSCAR TICKET PAGADOS</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body" style="overflow:auto">
                 <div class="row">
                    <div class="col-md-12">
                       <form class="form-inline">
                            <div class="form-group" style="padding-left:1%">
                                <label for="inputPassword2" class="sr-only">Nro Ticket</label>
                                <input class="form-control" id="ticket_txt" placeholder="Ticket" type="text">
                            </div>
                            <button type="submit" class="btn btn-success" id="btn_buscar_ticket">Buscar</button>
                        </form>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="digitador">
                            <div class="digito">7</div>
                            <div class="digito">8</div>
                            <div class="digito">9</div>
                            <div class="digito">4</div>
                            <div class="digito">5</div>
                            <div class="digito">6</div>
                            <div class="digito">1</div>
                            <div class="digito">2</div>
                            <div class="digito">3</div>
                            <div class="borrar">BORRAR</div>
                            <div class="digito">0</div>
                            <div class="buscar_div" id="buscar_div">BUSCAR</div>
                        </div>
                    </div>
                </div>
            </div><!--FIN DIV WRAPPER-->
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>



 <div class="modal" id="modal_buscar_cancelar_ticket" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">BUSCAR TICKET PARA CANCELAR</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body" style="overflow:auto">
                 <div class="row">
                    <div class="col-md-12">
                       <form class="form-inline">
                            <div class="form-group" style="padding-left:1%">
                                <label for="inputPassword2" class="sr-only">Nro Ticket</label>
                                <input class="form-control" id="ticket_txt" placeholder="Ticket" type="text">
                            </div>
                            <button type="submit" class="btn btn-success" id="btn_buscar_ticket">Buscar</button>
                        </form>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="digitador">
                            <div class="digito">7</div>
                            <div class="digito">8</div>
                            <div class="digito">9</div>
                            <div class="digito">4</div>
                            <div class="digito">5</div>
                            <div class="digito">6</div>
                            <div class="digito">1</div>
                            <div class="digito">2</div>
                            <div class="digito">3</div>
                            <div class="borrar">BORRAR</div>
                            <div class="digito">0</div>
                            <div class="buscar_div" id="buscar_div">BUSCAR</div>
                        </div>
                    </div>
                </div>
            </div><!--FIN DIV WRAPPER-->
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>




 <div class="modal" id="modal_buscar_para_reimprimir_cancelar_ticket" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">BUSCAR TICKET ...</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body" style="overflow:auto">
                 <div class="row">
                    <div class="col-md-12">
                       <form class="form-inline">
                            <div class="form-group" style="padding-left:1%">
                                <label for="inputPassword2" class="sr-only">Nro Ticket</label>
                                <input class="form-control" id="ticket_txt" placeholder="Ticket" type="text">
                            </div>
                            <button type="submit" class="btn btn-success" id="btn_buscar_ticket">Buscar</button>
                        </form>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="digitador">
                            <div class="digito">7</div>
                            <div class="digito">8</div>
                            <div class="digito">9</div>
                            <div class="digito">4</div>
                            <div class="digito">5</div>
                            <div class="digito">6</div>
                            <div class="digito">1</div>
                            <div class="digito">2</div>
                            <div class="digito">3</div>
                            <div class="borrar">BORRAR</div>
                            <div class="digito">0</div>
                            <div class="buscar_div" id="buscar_div">BUSCAR</div>
                        </div>
                    </div>
                </div>
            </div><!--FIN DIV WRAPPER-->
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>



<div class="modal" id="modal_buscar" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">TICKET</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body" style="overflow:auto">
                 <div class="row">
                    <div class="col-md-12">
                       <form class="form-inline">
                            <div class="form-group" style="padding-left:1%">
                                <label for="inputPassword2" class="sr-only">Nro Ticket</label>
                                <input class="form-control" id="ticket_txt" placeholder="Ticket" type="text">
                            </div>
                            <button type="submit" class="btn btn-success" id="btn_buscar_ticket">Buscar</button>
                        </form>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="digitador">
                            <div class="digito">7</div>
                            <div class="digito">8</div>
                            <div class="digito">9</div>
                            <div class="digito">4</div>
                            <div class="digito">5</div>
                            <div class="digito">6</div>
                            <div class="digito">1</div>
                            <div class="digito">2</div>
                            <div class="digito">3</div>
                            <div class="borrar">BORRAR</div>
                            <div class="digito">0</div>
                            <div class="buscar_div" id="buscar_div">BUSCAR</div>
                        </div>
                    </div>
                </div>
            </div><!--FIN DIV WRAPPER-->
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>

<div class="modal" id="modal_imprimir_pago" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
        <div class="modal-header">

            <div class="cabeza_modal">
                <div id="titulo_modal" style="width:90%">
                    <div id="resultado_evento" style="padding-bottom:7px;"></div>
                    <div id="resultado_ticket"></div>
                </div>
                  
                <div class="cerrar_modal" data-dismiss="modal" aria-label="Close">X</div>
            </div>


         <!--    <h5 class="modal-title">Impresión</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                 <span aria-hidden="true">&times;</span>
            </button> -->
       </div>
       <div class="modal-body" style="overflow:auto">
            <div style="text-align:center">
                <div id="divimpresion_pago" style="box-shadow:0 0 10px black;width:80mm;margin:auto">
                    <div class="ticket" style="display:inline-block;font-size:10pt;width:80mm;padding:6mm 8mm 6mm 6mm">
                        <div class="imagen" style="width:100%;text-align:center;display:block;padding:4px">
                            <img id="imagen_evento"  width="130" height="85">
                        </div>
                    <!--     <div class="titulo" style="width: 100%; text-align: center; display: flex; align-items: center;;padding-bottom:5px">
                            <div style="width:100%">
                                 <img id="imagen_apuestatotal" width="180" height="80">
                            </div>
                        </div> -->

                        <div style="width:100%;display:table;border-top:2px dotted;;border-bottom:2px dotted;padding-bottom:4px;padding-top:4px;word-spacing:13px;letter-spacing:3px" id="totales_ticket">
                            <div style="width:100%;;text-align:center">TICKET DE PAGO</div>
                        </div>

                        <div class="datos" style="width:100%;display:table;padding-top:4px;padding-top:17px">
                            <div style="width:100%;border-top:2px dotted;display:table">
                                <div style="width:50%;float:LEFT;text-align:left">ID Ticket</div>
                                <div style="width:50%;float:LEFT;text-align:left" id="IDTique"></div>
                            </div>
                            <div style="width:100%;display:table">
                                <div style="width:50%;float:LEFT;text-align:left">ID Unidad</div>
                                <div style="width:50%;float:LEFT;text-align:left" id="IDUnidad"></div>
                            </div>

                            <div style="width:100%;display:table;" id="">
                                <div style="width:50%;float:LEFT;text-align:left">Impreso en </div>
                                <div style="width:50%;float:LEFT;text-align:left" id="impreso_por2"></div>
                            </div>
                            <div style="width:100%;display:table">
                                <div style="width:50%;float:LEFT;text-align:left">Nro Evento</div>
                                <div style="width:50%;float:LEFT;text-align:left" id="NroEvento"></div>
                            </div>
                            <div style="width:100%;display:table">
                                <div style="width:50%;float:LEFT;text-align:left">Desc.</div>
                                <div style="width:50%;float:LEFT;text-align:left" id="descripcion"></div>
                            </div>
                            <div style="width:100%;display:table;border-top:2px dotted;padding-bottom:4px;padding-top:4px" id="datos_filas">
                            </div>
                            <div style="width:100%;display:table;border-top:2px dotted;padding-bottom:4px;padding-top:4px" id="totales_ticket">
                                <div style="width:50%;float:LEFT;text-align:left">Cantidad Ganada</div>
                                <div style="width:50%;float:LEFT;text-align:right" id="total_ticket"></div>

                            </div>
                            <div style="width:100%;display:table;border-top:2px dotted;padding-top:4px" id="">
                                <div style="width:50%;float:LEFT;text-align:left;">Impreso En</div>
                                <div style="width:50%;float:LEFT;text-align:right" id="impreso_en"></div>

                            </div>
                            <div style="width:100%;display:table;padding-bottom:6pt;" id="">
                                <div style="width:50%;float:LEFT;text-align:left">Impreso por </div>
                                <div style="width:50%;float:LEFT;text-align:right" id="impreso_por"></div>
                            </div>
    <!-- 
                                 <div style="width:100%;display:table;border-top:2px dotted;padding-top:8pt" id="">
                                    <div style="width:60%;float:LEFT;text-align:left;">Premio Máximo a Pagar </div>
                                    <div style="width:40%;float:LEFT;text-align:right" id="PremioMaximoAPagar"></div>

                                </div> -->

                        </div>
                        <div class="footer" style="width:100%;text-align:center">
                        </div>

                    </div>
                </div>
            </div><!--FIN DIV WRAPPER-->
        </div><!--FIN modal-body-->
        <div class="modal-footer">
            <button type="button" class="btn btn-primary" id="btnimprimir">Imprimir</button>
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        </div>
    </div>
 </div>
</div><!--fin  modal_imprimir_pago-->














<div class="modal" id="modal_imprimir_cancelar" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title">Ticket </h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                 <span aria-hidden="true">&times;</span>
            </button>
       </div>
         <div class="modal-body" style="overflow:auto">
     <div style="text-align:center">
        <div id="divimpresion" style="box-shadow:0 0 10px black;width:80mm;margin:auto">
            <div class="ticket" style="display:inline-block;font-size:10pt;width:80mm;padding:6mm 8mm 6mm 6mm">
                  <div class="imagen" style="width:100%;text-align:center;display:block;padding:4px">
                    <img id="imagen_evento"  width="130" height="85"></div>

              <!--   <div class="titulo" style="width: 100%; text-align: center; display: flex; align-items: center;/*border-bottom:1px solid*/;padding-bottom:5px">
                    <div style="width:100%">
                    <img id="imagen_apuestatotal" width="180" height="80" src="{{asset('img/logoticket.png')}}">
                </div>
                </div> -->
              
                <div class="datos" style="width:100%;display:table;padding-top:4px">
                    <div style="width:100%;border-top:2px dotted;display:table">
                        <div style="width:50%;float:LEFT;text-align:left">ID Ticket</div>
                        <div style="width:50%;float:LEFT;text-align:right" id="IDTique"></div>
                    </div>
                    <div style="width:100%;display:table">

                        <div style="width:50%;float:LEFT;text-align:left">ID Unidad</div>
                        <div style="width:50%;float:LEFT;text-align:right" id="IDUnidad"></div>
                    </div>

                     <div style="width:100%;display:table;" id="">
                        <div style="width:50%;float:LEFT;text-align:left">Impreso en </div>
                        <div style="width:50%;float:LEFT;text-align:right" id="impreso_por2"></div>
                    </div>


                    <div style="width:100%;display:table">

                        <div style="width:50%;float:LEFT;text-align:left">Nro Evento</div>
                        <div style="width:50%;float:LEFT;text-align:right" id="NroEvento"></div>
                    </div>
                    <div style="width:100%;display:table">
                        <div style="width:50%;float:LEFT;text-align:left">Desc.</div>
                        <div style="width:50%;float:LEFT;text-align:right" id="descripcion"></div>
                    </div>
                    <div style="width:100%;display:table;border-top:2px dotted;padding-bottom:4px;padding-top:4px" id="datos_filas">
                    </div>

                    <div style="width:100%;display:table;border-top:2px dotted;padding-bottom:4px;padding-top:4px" id="totales_ticket">
                        <div style="width:50%;float:LEFT;text-align:left">Total del Ticket</div>
                        <div style="width:50%;float:LEFT;text-align:right" id="total_ticket"></div>
                    </div>
                    <div style="width:100%;display:table;border-top:2px dotted;padding-top:4px" id="">

                        <div style="width:50%;float:LEFT;text-align:left;">Impreso En</div>
                        <div style="width:50%;float:LEFT;text-align:right" id="impreso_en"></div>
                    </div>
                    <div style="width:100%;display:table;padding-bottom:4px;" id="">
                        <div style="width:50%;float:LEFT;text-align:left">Impreso por </div>
                        <div style="width:50%;float:LEFT;text-align:right" id="impreso_por"></div>
                    </div>
                    <div style="width:100%;display:table;border-top:2px dotted;padding-top:4px" id="">
                        <div style="width:50%;float:LEFT;text-align:left;">Premio Máximo a Pagar </div>
                        <div style="width:50%;float:LEFT;text-align:right" id="PremioMaximoAPagar"></div>
                    </div>
                    <div style="width:100%;display:table" id="">
                        <div style="width:50%;float:LEFT;text-align:left">Premio Máximo Potencial</div>
                        <div style="width:50%;float:LEFT;text-align:right" id="PremioMaximoPotencial"></div>
                    </div>
                </div>
                <div class="footer" style="width:100%;text-align:center"></div>

                     <div style="width:100%;display:table;border-top:2px dotted;;border-bottom:2px dotted;padding-bottom:4px;padding-top:4px;word-spacing:13px;letter-spacing:3px;margin-bottom:2mm;margin-top:2mm" >
                            <div style="width:100%;;text-align:center">COPIA</div>
                    </div>
                    <div class="codigoqr_barra" style="width:100%;text-align:center;display:block;padding:4px">
                        <img style="width:75%" id="imagen_codigobarra"  width="140" height="86">
                    </div>
                <!-- <div class="codigoqr_barra" style="width:100%;margin-bottom:8mm;display:table">
                    <div id="codigo_barra" style="float: LEFT; width:50%;padding-top:20px;text-align:center">
                        <img id="imagen_codigobarra"width="114" height="80">
                     </div>
                     <div id="codigo_qr" style="float: left; width:50%;text-align:right"><img id="imagen_qrcode"  width="120" height="120"></div>
                 </div> -->
            </div>
        </div>
    </div><!--FIN DIV WRAPPER-->
 </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-primary" id="btnCancelar">CANCELAR TICKET</button>
            <button type="button" class="btn btn-primary" id="btnReImprimir">IMPRIMIR</button>
            <button type="button" class="btn btn-secondary" data-dismiss="modal">CERRAR</button>
        </div>
    </div>
 </div>
</div><!--fin  modal_imprimir_pago