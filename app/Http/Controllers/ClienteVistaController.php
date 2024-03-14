<?php

namespace App\Http\Controllers;

use Illuminate\Database\QueryException;
use Illuminate\Http\Request;
use App\AperturaCaja;
use App\Evento;
use App\Juego;
use App\Ticket;
use App\Funciones;
use App\TipoApuesta;
use App\Apuesta;
use App\ResultadoEvento;
use App\Random\Brandom;

class ClienteVistaController extends Controller
{
    public function __construct()
    {
    }
    public function ClienteVistaCuy(Request $request)
    {   //?sessionToken=1&playerID=2&gameID=3
        $sessionToken = $request->input('sessionToken');
        $playerID = $request->input('playerID');
        $gameID = $request->input('gameID');
        if( !$sessionToken || !$playerID || !$gameID)
        {
            dd("Faltan Parámetros");
        }
        $error = "";
        try {
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
            //evento 
            $event = new Evento();
            $posiciones = $event->generar_posiciones_random();
            $tiempo_vista_venta = env('TIEMPO_VISTA_VENTA');

            // USAR EVENTO ACTIVO QUE NO FUE TERMINADO O CREAR EVENTO
            $eventosdatos = Evento::EventoActivo(1 , $playerID , $gameID);
            if($eventosdatos){
                Evento::UpdateEvento($eventosdatos->idEvento);
                $idEvento = $eventosdatos->idEvento;
                $idPuntoVenta = 1;
            }
            else 
            {
                $fecha_inicio = date("Y-m-d H:i:s");
                $fecha_fin = date("Y-m-d H:i:s", strtotime($fecha_inicio . " + $tiempo_vista_venta seconds"));
                $juego = Juego::GetJuegoJson();
                $eventosdatos = Evento::RegistrarEventoCuyTorito($juego, $fecha_inicio , $fecha_fin, $posiciones , $sessionToken , $playerID , $gameID);

                $random = new BRandom();
                $numero_random = $random->IRandom(0, 36);
                TipoApuesta::TipoApuestaColor($numero_random, $eventosdatos->idEvento);
            }
            
            $dinerodefault = Evento::DineroDefaultListar(); 
            if (count($dinerodefault) == 0) {
                $error = "No hay Eventos DineroDefault";
                return view('ClienteVista.ClienteVista', compact("error"));
            }
        } catch (QueryException $ex) {
            $mensaje_error = $ex->errorInfo;
        };

        $listaTipoApuesta = TipoApuesta::TipoApuestaListarJson();
    	foreach($listaTipoApuesta as $TipoApuesta){
    		if($TipoApuesta->idTipoApuesta == 37){
                $color1 = $TipoApuesta->rgb;
    			$color1Letra = $TipoApuesta->rgbLetra;
    		}
    		if($TipoApuesta->idTipoApuesta == 38){
    			$color2 = $TipoApuesta->rgb;
                $color2Letra = $TipoApuesta->rgbLetra;
    		}
    		 if($TipoApuesta->idTipoApuesta == 39){
    			$color0 = $TipoApuesta->rgb;
                $color0Letra = $TipoApuesta->rgbLetra;
    		}
    	}
        $IdJuego = 1;//juego CUY
        $resultado_evento = ResultadoEvento::ResultadosEventoJuego($IdJuego);
        $ultimos120eventos = TipoApuesta::Ultimos120eventos($IdJuego);
        $TipoApuestaListado = TipoApuesta::TipoApuestaListado();


        $hora_servidor = date('Y-m-d H:i:s');
        return view('ClienteVista.ClienteVistaCuy', compact(
                        "sessionToken","playerID", "gameID",
                        "hora_servidor",   "dinerodefault", "tipoapuesta",
                        "divzero", "primerafila", "segundafila", "tercerafila", "cuartafila", "quintafila", "sextafila",
                        "rangosfila", "par_imparfila","coloresfila","error", "eventosdatos"
                        ,"color1","color2","color0","color1Letra","color2Letra","color0Letra","resultado_evento","ultimos120eventos","TipoApuestaListado"
            )
        );

    }


    public function ClienteVista(Request $request)
    {   //?sessionToken=1&playerID=2&gameID=3
        $sessionToken = $request->input('sessionToken');
        $playerID = $request->input('playerID');
        $gameID = $request->input('gameID');
        if( !$sessionToken || !$playerID || !$gameID)
        {
            dd("Faltan Parámetros");
        }
        $error = "";
        try {
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
            //evento 
            $event = new Evento();
            $posiciones = $event->generar_posiciones_random();
            $tiempo_vista_venta = env('TIEMPO_VISTA_VENTA');

            // USAR EVENTO ACTIVO QUE NO FUE TERMINADO O CREAR EVENTO
            $eventosdatos = Evento::EventoActivo(1 , $playerID , $gameID);
            if($eventosdatos){
                Evento::UpdateEvento($eventosdatos->idEvento);
                $idEvento = $eventosdatos->idEvento;
                $idPuntoVenta = 1;
            }
            else 
            {
                $fecha_inicio = date("Y-m-d H:i:s");
                $fecha_fin = date("Y-m-d H:i:s", strtotime($fecha_inicio . " + $tiempo_vista_venta seconds"));
                $juego = Juego::GetJuegoJson();
                $eventosdatos = Evento::RegistrarEventoCuyTorito($juego, $fecha_inicio , $fecha_fin, $posiciones , $sessionToken , $playerID , $gameID);

                $random = new BRandom();
                $numero_random = $random->IRandom(0, 36);
                TipoApuesta::TipoApuestaColor($numero_random, $eventosdatos->idEvento);
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
        return view('ClienteVista.ClienteVista', compact(
                "sessionToken","playerID", "gameID",
                "hora_servidor",   "dinerodefault", "tipoapuesta",
                "divzero", "primerafila", "segundafila", "tercerafila", "cuartafila", "quintafila", "sextafila",
                "rangosfila", "par_imparfila","coloresfila",
                "error", "eventosdatos"
            )
        );
    }
    
    public function ClienteVistaCajaTablaFk(Request $request)
    {
        $sessionToken = $request->input('sessionToken');
        $playerID = $request->input('playerID');
        $gameID = $request->input('gameID');
        if( !$sessionToken || !$playerID || !$gameID)
        {
            dd("Faltan Parámetros");
        }
        $error = "";
        try {
            $hora_servidor = date('Y-m-d H:i:s');
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
            
            $event = new Evento();
            $posiciones = $event->generar_posiciones_random();
            $tiempo_vista_venta = env('TIEMPO_VISTA_VENTA');

            // $eventosdatos = Evento::EventoDatosListar($aperturacajadatos->idPuntoVenta);
            $eventosdatos = Evento::EventoActivo(1 , $playerID , $gameID);
            if($eventosdatos){
                Evento::UpdateEvento($eventosdatos->idEvento);
                $idEvento = $eventosdatos->idEvento;
                $idPuntoVenta = 1;
            }
            else 
            {
                $fecha_inicio = date("Y-m-d H:i:s");
                $fecha_fin = date("Y-m-d H:i:s", strtotime($fecha_inicio . " + $tiempo_vista_venta seconds"));
                $juego = Juego::GetJuegoJson();
                $eventosdatos = Evento::RegistrarEventoCuyTorito($juego, $fecha_inicio , $fecha_fin, $posiciones , $sessionToken , $playerID , $gameID);

                $random = new BRandom();
                $numero_random = $random->IRandom(0, 36);
                TipoApuesta::TipoApuestaColor($numero_random, $eventosdatos->idEvento);
            }
            
            $dinerodefault = Evento::DineroDefaultListar();
            if (count($dinerodefault) == 0) {
                $error = "No hay Eventos DineroDefault";                
                return view('ClienteVista.ClienteVista', compact("error"));
            }
        } catch (QueryException $ex) {
            $mensaje_error = $ex->errorInfo;
        };
        $view = view('ClienteVista.ClienteVistaCajaTabla', compact(
                            "sessionToken","playerID", "gameID",
                            "hora_servidor", "dinerodefault", "tipoapuesta",
                            "divzero", "primerafila", "segundafila", "tercerafila", "cuartafila", "quintafila", "sextafila",
                            "rangosfila", "par_imparfila","coloresfila",
                            "error", "eventosdatos")
                    ) ->render();
        return response()->json(['html' => $view, 'error' => $error , 'eventoactual' => $eventosdatos
        ]);
    }
    public function EventoActual(Request $request)
    {
        $sessionToken = $request->input('sessionToken');
        $playerID = $request->input('playerID');
        $gameID = $request->input('gameID');
        if( !$sessionToken || !$playerID || !$gameID)
        {
            dd("Faltan Parámetros");
        }
        $error = "";
        try {
            $hora_servidor = date('Y-m-d H:i:s');
            $tiempo_vista_venta = env('TIEMPO_VISTA_VENTA');
            // $eventosdatos = Evento::EventoDatosListar($aperturacajadatos->idPuntoVenta);
            $eventosdatos = Evento::EventoActivo(1 , $playerID , $gameID);
            if($eventosdatos){
                Evento::UpdateEvento($eventosdatos->idEvento);
                $idEvento = $eventosdatos->idEvento;
                $idPuntoVenta = 1;
            }
            else 
            {
                $event = new Evento();
                $posiciones = $event->generar_posiciones_random();
                $fecha_inicio = date("Y-m-d H:i:s");
                $fecha_fin = date("Y-m-d H:i:s", strtotime($fecha_inicio . " + $tiempo_vista_venta seconds"));
                $juego = Juego::GetJuegoJson();
                $eventosdatos = Evento::RegistrarEventoCuyTorito($juego, $fecha_inicio , $fecha_fin, $posiciones , $sessionToken , $playerID , $gameID);

                $random = new BRandom();
                $numero_random = $random->IRandom(0, 36);
                TipoApuesta::TipoApuestaColor($numero_random, $eventosdatos->idEvento);
            }
        } catch (QueryException $ex) {
            $mensaje_error = $ex->errorInfo;
        };
       
        return response()->json([ 'error' => $error , 'eventoactual' => $eventosdatos ,'hora_servidor' => $hora_servidor]
                                );
    }

    public function HistorialJackpotDatosJsonFk(Request $request)
    {
        $mensaje_error = "";
        $idEvento = $request->input("idEvento");
        try {
            $hora_servidor = date('Y-m-d H:i:s');
            $historial = Evento::HistorialEvento($idEvento);
        } catch (QueryException $ex) {
            $mensaje_error = $ex->errorInfo;
        }
        return response()->json([
            'hora_servidor' => $hora_servidor,
            'historial' => $historial,
            'jugadores'=> 1,
            'mensaje' => $mensaje_error]);
    }
    public function DatosEstadistica()
    {
        $estadistica = TipoApuesta::EstadisticaUltimosEventos(1);
        return response()->json(['estadistica' => $estadistica]);
    }
    public function GuardarApuestaCliente(Request $request)
    {
        $sessionToken = $request->input('sessionToken');
        $playerID = $request->input('playerID');
        $gameID = $request->input('gameID');
        if( !$sessionToken || !$playerID || !$gameID)
        {
            dd("Faltan Parámetros");
        }

        $respuesta = false;
        $mensaje_error = "";
        try {
            $datos = $request->datos;
            $ticketobjeto = $datos["TicketObjeto"];
            $apuestas = $datos["Apuestas"];
            $ticketobjeto = $request->merge($ticketobjeto);
            $data = Ticket::GuardarTicket($ticketobjeto);
            $id_ticketinsertado = $data->idTicket;
            
            foreach ($apuestas as $apu) {
                $apu["idTicket"] = $id_ticketinsertado;
                Apuesta::GuardarApuestas($apu);
            }

            $respuesta = true;
        } catch (QueryException $ex) {
            $mensaje_error = $ex->errorInfo;
        }
        return response()->json(['respuesta' => $respuesta,
            'mensaje' => $mensaje_error,
            'id_ticketinsertado' => $data,
            'apuestas' => $apuestas
        ]);
    }
    /*ANIMACION CUY */
    public function ClienteVistaAnimacionCuy()
    {
    	$listaTipoApuesta = TipoApuesta::TipoApuestaListarJson();
    	foreach($listaTipoApuesta as $TipoApuesta){
    		if($TipoApuesta->idTipoApuesta == 37){
                $color1 = $TipoApuesta->rgb;
    			$color1Letra = $TipoApuesta->rgbLetra;
    		}
    		if($TipoApuesta->idTipoApuesta == 38){
    			$color2 = $TipoApuesta->rgb;
                $color2Letra = $TipoApuesta->rgbLetra;
    		}
    		 if($TipoApuesta->idTipoApuesta == 39){
    			$color0 = $TipoApuesta->rgb;
                $color0Letra = $TipoApuesta->rgbLetra;
    		}
    	}
        $IdJuego = 1;//juego CUY
        $resultado_evento = ResultadoEvento::ResultadosEventoJuego($IdJuego);
        $ultimos120eventos = TipoApuesta::Ultimos120eventos($IdJuego);
        $TipoApuestaListado = TipoApuesta::TipoApuestaListado();
        return view('ClienteVista.ClienteVistaAnimacionCuy', compact("color1","color2","color0","color1Letra","color2Letra","color0Letra","resultado_evento","ultimos120eventos","TipoApuestaListado"));
    } 
    public function GanadorEvento(Request $request)
    {
        $sessionToken = $request->input('sessionToken');
        $playerID = $request->input('playerID');
        $gameID = $request->input('gameID');
        $id_evento = $request->input('id_evento');
        $eventosdatos = Evento::EventoActivo(1 , $playerID , $gameID);
        $mensaje_error = "";
        $ganador = false;
        try {
            $ganador = ResultadoEvento::ValorGanadorEvento($id_evento);
            $evento_actual = Evento::EventoId($id_evento)[0];
            $fecha_ini_actual = $evento_actual->FechaEvento;
            $fecha_fin_actual = $evento_actual->fechaFinEvento;
            $segundos_agregados = $evento_actual->segBloqueoAntesAnimacion;
            $fecha_animacion = date("Y-m-d H:i:s a", strtotime('-'.$segundos_agregados.' seconds', strtotime($fecha_fin_actual)));
            $array_evento = [
                'fecha_evento_ini_actual' => $fecha_ini_actual,
                'fecha_evento_fin_actual' => $fecha_fin_actual,
                'fecha_animacion' => $fecha_animacion,
                'evento_id_actual' => $evento_actual->idEvento,
                'evento_valor_ganador' => $ganador->valorGanador,
                'segBloqueoAntesAnimacion' => $segundos_agregados,
                'segCajaGirando' => $evento_actual->segCajaGirando,
                'puntos_cuy'=> $evento_actual->puntosCuy// $this->generar_posiciones_random()
            ];
            return json_encode([
                'evento' => $array_evento, 'hora_servidor'=>date("Y-m-d H:i:s")
            ]);


        } 
        catch (QueryException $ex) {
            $mensaje_error = $ex->errorInfo;
        }
        return response()->json([
            'mensaje' => $mensaje_error,
            'ganador' => $ganador,
            'hora_servidor' => date("Y-m-d H:i:s")
        ]);
    }
    public function ClienteVistaFinalizarEvento(Request $request)
    {
        $sessionToken = $request->input('sessionToken');
        $playerID = $request->input('playerID');
        $gameID = $request->input('gameID');
        $id_evento = $request->input('id_evento');
        $mensaje_error = "";
        $ganador = false;
        try {
            $evento = Evento::FinalizarEvento($id_evento);
            return json_encode([
                'error' => !$evento,
                'hora_servidor'=>date("Y-m-d H:i:s")
            ]);
        } 
        catch (QueryException $ex) {
            $mensaje_error = $ex->errorInfo;
        }
        return response()->json([
            'mensaje' => $mensaje_error,
            'hora_servidor' => date("Y-m-d H:i:s")
        ]);
    }
}
