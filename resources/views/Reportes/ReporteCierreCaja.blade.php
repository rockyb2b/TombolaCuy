@extends('Shared.layout')

@section('body-class')
    sidebar-style loaded
@stop

@section('content')
    <div class="row">
        <div class="col-md-6">
            <div class="panel panel-primary">
                <div class="panel-body" style="padding-bottom: 10px;">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="block">
                                <div class="block-content-outer">
                                    <div class="block-content-inner">
                                        <div class="row">
                                            <div class="col-md-12 col-xs-12 col-sm-12">
                                                <h6>
                                                    <i class="glyphicon glyphicon-th mr-2"></i> Cierre de Caja
                                                </h6>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="panel panel-primary">
                <div class="panel-body">
                    <div class="row">
                             <div class="col-md-4 col-sm-4  col-xs-12 pull-right">
                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                                    <button class="btn btn-info btn-sm col-md-12 col-xs-12" id="btnImprimir"><span
                                                class="glyphicon glyphicon-folder-close m-r-10"></span> Imprimir
                                    </button>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4 col-sm-4  col-xs-12 pull-right">
                            <div class="row">
                                <div class="col-md-12 col-sm-12">
                                    <button class="btn btn-danger btn-sm col-md-12 col-xs-12" id="btnCierreCaja"><span
                                                class="glyphicon glyphicon-folder-close m-r-10"></span> Cierre de Caja
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-md-12">
            <div class="panel panel-primary">
                <input type="hidden" id="idAperturaCaja">
                <div class="panel-body">
                    <table id="table" class="table table-bordered table-striped" style="width:100%"></table>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" tabindex="-1" role="dialog" id="ModalConfirmacion">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title text-center">Confirmación de Cierre de Caja</h4>
                </div>
                <div class="modal-body">
                    <h4 class="text-center">¿Esta seguro de cerrar caja?</h4>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="btnConfirmar">Confirmar</button>
                </div>
            </div>
        </div>
    </div>




<div class="modal" id="modal_imprimir_cierre" tabindex="-1" role="dialog">
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
       </div>
       <div class="modal-body" style="overflow:auto">
            <div style="text-align:center">
                <div id="divimpresion_pago" style="box-shadow:0 0 10px black;width:80mm;margin:auto">
                    <div class="ticket" style="display:inline-block;font-size:10pt;width:80mm;padding:6mm 8mm 6mm 6mm">
                    <!--     <div class="imagen" style="width:100%;text-align:center;display:block;padding:4px">
                            <img id="imagen_evento"  width="130" height="85">
                        </div> -->
                        <div class="titulo" style="width: 100%; text-align: center; display: flex; align-items: center;padding-bottom:5px">
                            <div style="width:100%">
                                <img id="imagen_apuestatotal" width="180" height="80" src="{{asset('img/logoticket.png')}}">
                             </div>
                        </div>
                        <div style="width:100%;display:table;border-top:2px dotted;;border-bottom:2px dotted;padding-bottom:4px;padding-top:4px;word-spacing:13px;letter-spacing:3px" id="totales_ticket">
                            <div style="width:100%;;text-align:center">INFORME LIQUIDACIÓN</div>
                        </div>

                        <div class="datos" style="width:100%;display:table;padding-top:4px;padding-top:17px">
                              <div style="width:100%;display:table">
                                <div style="width:50%;float:LEFT;text-align:left">ID Unidad</div>
                                <div style="width:50%;float:LEFT;text-align:left" id="IDUnidad"></div>
                            </div>
                            <div style="width:100%;display:table">
                                <div style="width:50%;float:LEFT;text-align:left">Moneda</div>
                                <div style="width:50%;float:LEFT;text-align:left" id="Moneda_valor"></div>
                            </div>
                             <div style="width:100%;display:table">
                                <div style="width:50%;float:LEFT;text-align:left">Id del Informe</div>
                                <div style="width:50%;float:LEFT;text-align:left" id="IdInforme"></div>
                            </div>
                          

                            <div style="width:100%;display:table;" id="">
                                <div style="width:50%;float:LEFT;text-align:left">Impreso en </div>
                                <div style="width:50%;float:LEFT;text-align:left" id="Impreso_en"></div>
                            </div>
                              <div style="width:100%;display:table;" id="">
                                <div style="width:50%;float:LEFT;text-align:left">Impreso por </div>
                                <div style="width:50%;float:LEFT;text-align:left" id="Impreso_por"></div>
                            </div>
                           
                            <div style="width:100%;display:table;border-top:2px dotted;padding-bottom:4px;padding-top:4px" id="datos_filas">
                                <div style="width:100%;display:table;" id="">
                                    <div style="width:25%;float:LEFT;text-align:left">-</div>
                                    <div style="width:25%;float:LEFT;text-align:right">Ventas </div>
                                    <div style="width:25%;float:LEFT;text-align:right" >Cancelar</div>
                                    <div style="width:25%;float:LEFT;text-align:right" >Neto</div>
                                </div>

                                <div style="width:100%;display:table;" id="">
                                    <div style="width:25%;float:LEFT;text-align:right;font-weight: bold">Ventas</div>
                                    <div style="width:25%;float:LEFT;text-align:right" id="venta_valor"> </div>
                                    <div style="width:25%;float:LEFT;text-align:right" >&nbsp;</div>
                                    <div style="width:25%;float:LEFT;text-align:right" >&nbsp;</div>
                                </div>
                               <div style="width:100%;display:table;" id="">
                                    <div style="width:25%;float:LEFT;text-align:right;font-weight: bold">Cancelar</div>
                                    <div style="width:25%;float:LEFT;text-align:right" > &nbsp;</div>
                                    <div style="width:25%;float:LEFT;text-align:right" id="cancelar_valor"></div>
                                    <div style="width:25%;float:LEFT;text-align:right" >&nbsp;</div>
                                </div>
                                 <div style="width:100%;display:table;" id="">
                                    <div style="width:25%;float:LEFT;text-align:right;font-weight: bold">Neto Ventas</div>
                                    <div style="width:25%;float:LEFT;text-align:right"> &nbsp;</div>
                                    <div style="width:25%;float:LEFT;text-align:right" >&nbsp;</div>
                                    <div style="width:25%;float:LEFT;text-align:right"  id="netoventas_valor"></div>
                                </div>

                            </div>
                            <div style="width:100%;display:table;border-top:2px dotted;padding-bottom:4px;padding-top:4px" id="totales_ticket">
                                <div style="width:50%;float:LEFT;text-align:left">Saldo Neto</div>
                                <div style="width:50%;float:LEFT;text-align:right" id="saldoneto_valor"></div>

                            </div>
                            <div style="width:100%;display:table;border-top:2px dotted;padding-top:4px;margin-bottom:70px" id="">
                                <div style="width:55%;float:LEFT;text-align:left;">Firma Empleado:</div>
                                <div style="width:45%;float:LEFT;text-align:right" >Firma Gerente:</div>

                            </div>


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


@stop @push('Js')
    <script src="{{asset('assets/Reporte/ReporteCierreCaja.js')}}"></script>
@endpush