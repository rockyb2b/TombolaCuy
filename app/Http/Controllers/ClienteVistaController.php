<?php

namespace App\Http\Controllers;

use Illuminate\Database\QueryException;
use Illuminate\Http\Request;
use App\AperturaCaja;
use App\Evento;
use App\Funciones;
use App\TipoApuesta;
use App\ResultadoEvento;
use Auth;
class ClienteVistaController extends Controller
{
    public function __construct()
    {
        return $this->middleware('auth');
    }

    public function ClienteVista()
    {
        $usuarionombre = Auth::user()->usuario;//"BTD OSCAR AGUILAR";
        $usuario = Auth::user()->idUsuario;
        $error = "";
        try {
            $aperturacajadatos = AperturaCaja::AperturaCajaListarActiva($usuario);
            if (count($aperturacajadatos) == 0) {
                $error = "No hay Apertura de Caja";
            }
            $tipoapuesta = Evento::TipoApuestaListar();
            if (count($tipoapuesta) == 0) {
                $error = "No hay Apuestas";
            }
            $divzero = null;
            $primerafila = array();
            $segundafila = array();
            $tercerafila = array();
            $cuartafila = array();
            $quintafila = array();
            $sextafila = array();
            $coloresfila = array();
            $rangosfila = array();
            $par_imparfila = array();
            foreach ($tipoapuesta as $apuesta) {
                if (in_array($apuesta->idTipoApuesta, [39])) {
                    $divzero = $apuesta;
                }
            }
            foreach ($tipoapuesta as $apuesta) {
                if (in_array($apuesta->idTipoApuesta, [1, 2, 3, 4, 5, 6])) {
                    array_push($primerafila, $apuesta);
                }
            }
            foreach ($tipoapuesta as $apuesta) {
                if (in_array($apuesta->idTipoApuesta, [7, 8, 9, 10, 11, 12])) {
                    array_push($segundafila, $apuesta);
                }
            }
            foreach ($tipoapuesta as $apuesta) {
                if (in_array($apuesta->idTipoApuesta, [13, 14, 15, 16, 17, 18])) {
                    array_push($tercerafila, $apuesta);
                }
            }
            foreach ($tipoapuesta as $apuesta) {
                if (in_array($apuesta->idTipoApuesta, [19, 20, 21, 22, 23, 24])) {
                    array_push($cuartafila, $apuesta);
                }
            }
            foreach ($tipoapuesta as $apuesta) {
                if (in_array($apuesta->idTipoApuesta, [25, 26, 27, 28, 29, 30])) {
                    array_push($quintafila, $apuesta);
                }
            }
            foreach ($tipoapuesta as $apuesta) {
                if (in_array($apuesta->idTipoApuesta, [31, 32, 33, 34, 35, 36])) {
                    array_push($sextafila, $apuesta);
                }
            }
            foreach ($tipoapuesta as $apuesta) {
                if (in_array($apuesta->idTipoApuesta, [37, 38, 39])) {
                    array_push($coloresfila, $apuesta);
                }
            }

            foreach ($tipoapuesta as $apuesta) {
                if (in_array($apuesta->idTipoApuesta, [40, 41, 42, 45, 46, 47, 48])) {
                    array_push($rangosfila, $apuesta);
                }
            }
            foreach ($tipoapuesta as $apuesta) {
                if (in_array($apuesta->idTipoApuesta, [43, 44])) {
                    array_push($par_imparfila, $apuesta);
                }
            }
            if (count($aperturacajadatos) > 0) {
                $aperturacajadatos = $aperturacajadatos[0];
            }
            $eventos = Evento::EventoListar();

            if ($aperturacajadatos == null) {
                $eventosdatos = null;
                $jackpotsuma ="";
                $historial=null;
            } else {
                $eventosdatos = Evento::EventoDatosListar($aperturacajadatos->idPuntoVenta);
                if(count($eventosdatos)>0){
                    $idEvento = $eventosdatos[0]->idEvento;
                    $idPuntoVenta = $aperturacajadatos->idPuntoVenta;
                    $divisa=$eventosdatos[0]->divisa;

                    $jackpots = Evento::JackPotEvento($idPuntoVenta);
                    $jackpotsuma = $divisa." ".Evento::JackPotSumaEvento($idPuntoVenta)[0]->sumajackpots;
                    $historial = Evento::HistorialEvento($idEvento);/*del primer evento*/
                }
            }
            if (count($eventos) == 0) {
                $error = "No hay Eventos Registrados";
            }
            $dinerodefault = Evento::DineroDefaultListar();
            if (count($dinerodefault) == 0) {
                $error = "No hay Eventos DineroDefault";
                return view('ClienteVista.ClienteVista', compact("error"));
            }
        } catch (QueryException $ex) {
            $mensaje_error = $ex->errorInfo;
        };
        $hora_servidor = date('Y-m-d H:i:s');
        $style_contenedor = "padding-top:0px";
        return view('ClienteVista.ClienteVista', compact("usuario", "hora_servidor", "aperturacajadatos", "eventos", "dinerodefault", "tipoapuesta",
            "divzero", "primerafila", "segundafila", "tercerafila", "cuartafila", "quintafila", "sextafila", "coloresfila",
            "rangosfila", "par_imparfila", "error", "eventos", "eventosdatos","style_contenedor"));

        // return view('Venta.CajaTabla', compact("usuario", "hora_servidor", "aperturacajadatos", "eventos", "dinerodefault", "tipoapuesta",
        //                                     "divzero", "primerafila", "segundafila", "tercerafila", "cuartafila", "quintafila", "sextafila", "coloresfila",
        //                                     "rangosfila", "par_imparfila", "error", "eventos", "eventosdatos","style_contenedor"));
    }
    
    public function Cargar_Tabla_Venta()
    {
        $usuarionombre = Auth::user()->usuario;//"BTD OSCAR AGUILAR";
        $usuario = Auth::user()->idUsuario;
        $error = "";
        try {
            $hora_servidor = date('Y-m-d H:i:s');
            $aperturacajadatos = AperturaCaja::AperturaCajaListarActiva($usuario);
            if (count($aperturacajadatos) == 0) {
                $error = "No hay Apertura de Caja";
            }
            $tipoapuesta = Evento::TipoApuestaListar();
            if (count($tipoapuesta) == 0) {
                $error = "No hay Apuestas";
                return view('Venta.IndexNuevo', compact("error"));
            }
            $divzero = null;
            $primerafila = array();
            $segundafila = array();
            $tercerafila = array();
            $cuartafila = array();
            $quintafila = array();
            $sextafila = array();
            $coloresfila = array();
            $rangosfila = array();
            $par_imparfila = array();
            foreach ($tipoapuesta as $apuesta) {
                if (in_array($apuesta->idTipoApuesta, [39])) {
                    $divzero = $apuesta;
                }
            }
            foreach ($tipoapuesta as $apuesta) {
                if (in_array($apuesta->idTipoApuesta, [1, 2, 3, 4, 5, 6])) {
                    array_push($primerafila, $apuesta);
                }
            }
            foreach ($tipoapuesta as $apuesta) {
                if (in_array($apuesta->idTipoApuesta, [7, 8, 9, 10, 11, 12])) {
                    array_push($segundafila, $apuesta);
                }
            }
            foreach ($tipoapuesta as $apuesta) {
                if (in_array($apuesta->idTipoApuesta, [13, 14, 15, 16, 17, 18])) {
                    array_push($tercerafila, $apuesta);
                }
            }
            foreach ($tipoapuesta as $apuesta) {
                if (in_array($apuesta->idTipoApuesta, [19, 20, 21, 22, 23, 24])) {
                    array_push($cuartafila, $apuesta);
                }
            }
            foreach ($tipoapuesta as $apuesta) {
                if (in_array($apuesta->idTipoApuesta, [25, 26, 27, 28, 29, 30])) {
                    array_push($quintafila, $apuesta);
                }
            }
            foreach ($tipoapuesta as $apuesta) {
                if (in_array($apuesta->idTipoApuesta, [31, 32, 33, 34, 35, 36])) {
                    array_push($sextafila, $apuesta);
                }
            }

            foreach ($tipoapuesta as $apuesta) {
                if (in_array($apuesta->idTipoApuesta, [37, 38, 39])) {
                    array_push($coloresfila, $apuesta);
                }
            }
            foreach ($tipoapuesta as $apuesta) {
                if (in_array($apuesta->idTipoApuesta, [40, 41, 42, 45, 46, 47, 48])) {
                    array_push($rangosfila, $apuesta);
                }
            }
            foreach ($tipoapuesta as $apuesta) {
                if (in_array($apuesta->idTipoApuesta, [43, 44])) {
                    array_push($par_imparfila, $apuesta);
                }
            }
            if (count($aperturacajadatos) > 0) {
                $aperturacajadatos = $aperturacajadatos[0];
            }
            $eventos = Evento::EventoListar();
            if (count($eventos) == 0) {
                $error = "No hay Eventos Registrados";
            }
            if ($aperturacajadatos == null) {
                $eventosdatos = null;
            } else {
                $eventosdatos = Evento::EventoDatosListar($aperturacajadatos->idPuntoVenta);
            }
            $dinerodefault = Evento::DineroDefaultListar();
            if (count($dinerodefault) == 0) {
                $error = "No hay Eventos DineroDefault";
                return view('Venta.IndexNuevo', compact("error"));
            }
            if (count($eventos) == 0) {
                $error = "No hay Eventos Registrados";
            }
        } catch (QueryException $ex) {
            $mensaje_error = $ex->errorInfo;
        };
        $view = view('Venta.CajaTabla', compact("usuario", "hora_servidor", "aperturacajadatos", "eventos", "eventosdatos", "dinerodefault", "tipoapuesta",
            "divzero", "primerafila", "segundafila", "tercerafila", "cuartafila", "quintafila", "sextafila", "coloresfila",
            "rangosfila", "par_imparfila", "error"))->render();
        return response()->json(['html' => $view, 'error' => $error
        ]);
    }

    public function DatosEstadistica()
    {
        $estadistica = TipoApuesta::EstadisticaUltimosEventos(1);
        return response()->json(['estadistica' => $estadistica]);
    }
}
