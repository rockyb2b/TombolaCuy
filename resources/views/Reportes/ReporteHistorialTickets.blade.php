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
                                                    <i class="glyphicon glyphicon-th mr-2"></i> Reporte de Historial
                                                    Tickets
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
                                    <button class="btn btn-primary btn-sm col-md-12 col-xs-12" id="btnBuscar"><span
                                                class="glyphicon glyphicon-search"></span> Buscar
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-4  col-xs-12 pull-right">
                            <div class="row">
                                <div class="col-md-12 col-sm-12" id="container-excel"></div>
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
                <div class="panel-body">
                    <form id="frmNuevo" autocomplete="off">
                        {{csrf_field()}}
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="">Fecha Inicio</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                                        <input type="text" class="form-control input-sm Fecha" name="fechaInicio"
                                               required>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="">Fecha Fin</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                                        <input type="text" class="form-control input-sm FechaFin" name="fechaFin"
                                               required>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="">Tiendas</label>
                                    <select multiple="multiple" id="cboTienda" name="tiendas"
                                            class="form-control input-sm multiselect" style="width: 100%;">
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="">Evento</label>
                                    <input type="number" class="form-control input-sm" name="idEvento">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="">Tipo Tickets</label>
                                    <select id="cboTickets" name="TipoTicket"
                                            class="form-control input-sm" style="width: 100%;">
                                        <option value="0">Todos</option>
                                        <option value="1">Ganador</option>
                                        <option value="2">No Ganador</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12" id="ContenedorTabla">
            <div class="panel panel-primary"
                 style="padding-top:10px; padding-left:10px;padding-right:10px;display: none"
                 id="PanelTabla">
                <div class="panel-body">
                    <table class="table table-bordered border-1" id="table_panel">
                        <tfoot>
                        <tr style="background-color: #CCCCCC">
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th class="text-center" id="TotalApostado"></th>
                            <th class="text-center" id="TotalPagado"></th>
                            <th class="text-center" id="TotalUtilidad"></th>
                            <th></th>
                            <th></th>
                        </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
@stop

@push('Js')
    <script src="{{asset('assets/Reporte/ReporteHistorialTickets.js')}}"></script>
@endpush