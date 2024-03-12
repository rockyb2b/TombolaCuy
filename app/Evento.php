<?php

namespace App;

use Carbon\Carbon;
use DB;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\QueryException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
class Evento extends Model
{
    protected $table = 'evento';

    protected $primaryKey = 'idEvento';

    protected $fillable = [
        'idJuego',
        'nombre',
        'fechaEvento',
        'fechaFinEvento',
        'apuestaMinima',
        'apuestaMaxima',
        'fechaEventoReprogramacion',
        'idMoneda',
        'estadoEvento',
        'estadoAnimacion',
        'tokenAnimacion',
        'segCajaGirando',
        'puntosCuy',

        'sessionToken',
        'playerID',
        'gameID'
    ];

    public $timestamps = false;

    public static function EventoListar()
    {
        $listar = DB::select(DB::raw('SELECT ev.idEvento,
                                        ev.idJuego,
                                        ev.nombre as nombre,
                                        ev.FechaEvento as FechaEvento,
                                        ev.fechaFinEvento  as fechaFinEvento,
                                        ju.logo as logo,
                                        ju.segBloqueoAntesEvento as segBloqueoAntesEvento,
                                        ev.idMoneda,
                                        ev.apuestaMinima as apuestaMinima,
                                        ev.apuestaMaxima as apuestaMaxima    
                                        FROM evento ev
                                        LEFT JOIN juego ju on ju.idJuego= ev.idJuego
                                        WHERE ev.estadoEvento = 1'));
        return $listar;
    }

    public static function EventoActivo($idPuntoVenta ,  $playerID , $gameID)
    {
        $evento = DB::table('evento as ev')
                    ->select(
                        DB::raw('(select COUNT(*) as cantidadganadores FROM ticket WHERE idEvento = ev.idEvento) as jugador'),
                        DB::raw('(select mon.simbolo as simbolo FROM evento ev2 left join moneda mon on mon.idMoneda = ev2.idMoneda WHERE ev2.idEvento = ev.idEvento) as divisa'),
                        'ev.idEvento',
                        'ev.idJuego',
                        'ev.nombre',
                        'ev.FechaEvento as FechaEvento',
                        'ev.fechaFinEvento as fechaFinEvento',
                        'ju.logo as logo',
                        'ju.segBloqueoAntesEvento as segBloqueoAntesEvento',
                        'ev.idMoneda',
                        'ev.apuestaMinima as apuestaMinima',
                        'ev.apuestaMaxima as apuestaMaxima',
                        'ju.apuestaMinima as apuestaMinimaJuego',
                        'ju.apuestaMaxima as apuestaMaximaJuego'
                    )
                    ->leftJoin('juego as ju', 'ju.idJuego', '=', 'ev.idJuego')
                    ->where('ev.estadoEvento', 1)
                    ->where('ju.estado', 1)
                    ->where('ev.playerID', $playerID)
                    ->where('ev.gameID', $gameID)
                    ->first();
        return $evento;
    }


    public static function EventoId($idEvento)
    {

        $listar = DB::select(DB::raw('SELECT ev.idEvento,
                                        ev.nombre AS nombre,
                                        ev.FechaEvento AS FechaEvento,
                                        ev.fechaFinEvento  AS fechaFinEvento,
                                        ju.logo AS logo,
                                        ju.segBloqueoAntesEvento AS segBloqueoAntesEvento,
                                        ev.idMoneda,
                                        ev.apuestaMinima AS apuestaMinima,
                                        ev.apuestaMaxima AS apuestaMaxima,
                                        segBloqueoAntesAnimacion ,
                                        segCajaGirando,
                                        puntosCuy
                                    FROM evento ev
                                    LEFT JOIN juego ju ON ju.idJuego = ev.idJuego
                                    WHERE ev.estadoEvento = 1 and idEvento =' . $idEvento));
        return $listar;
    }

    public static function CantidadGanadorEventoListar($idEvento)
    {
        $listar = DB::select(DB::raw("select  COUNT(*)  as cantidadganadores FROM ticket WHERE idEvento =" . $idEvento));
        return $listar;
    }

    public static function SimboloEvento($idEvento)
    {
        $listar = DB::select(DB::raw("select mon.simbolo as simbolo  FROM evento ev left join moneda mon on mon.idMoneda=ev.idMoneda WHERE IDEVENTO =" . $idEvento));
        return $listar;
    }

    public static function JugadorDatosJson($idEvento)
    {
        $listar = DB::select(DB::raw("select  POL.montoActual FROM pozo_online POL
            INNER JOIN pozo_jackpot PZJ ON PZJ.idPozoJackpot=POL.idPozoJackpot
            INNER JOIN jackpot JACK ON JACK.idJackpot=PZJ.idJackpot
            INNER JOIN jackpot_punto_venta JPV ON JPV.idJackpot=JACK.idJackpot
            WHERE JPV.idPuntoVenta=1
            "));
        return $listar;
    }

    public static function JugadoresEvento($idEvento)
    {
        $listar = DB::select(DB::raw("SELECT COUNT(idTicket) AS cantidadjugadores 
                                        FROM ticket
                                        WHERE idEvento = ".$idEvento."  AND estadoTicket in (1,2)"));
        return $listar;
    }

    public static function JackPotEvento($idPuntoVenta)
    {
        $listar = DB::select(DB::raw("SELECT  POL.montoActual FROM pozo_online POL
			INNER JOIN pozo_jackpot PZJ ON PZJ.idPozoJackpot=POL.idPozoJackpot
			INNER JOIN jackpot JACK ON JACK.idJackpot=PZJ.idJackpot
			INNER JOIN jackpot_punto_venta JPV ON JPV.idJackpot=JACK.idJackpot
			WHERE JPV.idPuntoVenta=" . $idPuntoVenta . "
			"));
        return $listar;
    }

    public static function JackPotSumaEvento($idPuntoVenta)
    {
        $listar = DB::select(DB::raw("SELECT IFNULL(sum(POL.montoActual),0) as sumajackpots 
            FROM pozo_online POL
			INNER JOIN pozo_jackpot PZJ ON PZJ.idPozoJackpot=POL.idPozoJackpot
			INNER JOIN jackpot JACK ON JACK.idJackpot=PZJ.idJackpot
			INNER JOIN jackpot_punto_venta JPV ON JPV.idJackpot=JACK.idJackpot
			WHERE JPV.idPuntoVenta=" . $idPuntoVenta . "
			"));
        return $listar;
    }

    public static function HistorialEvento($ideventoactual)
    {
        $listar = DB::select(DB::raw("SELECT evt.idEvento,
                                        res.`valorGanador`,
                                        ta.rgb AS color,
                                        ta.rgbLetra AS rgbLetra
                                        FROM resultado_evento res
                                        INNER JOIN evento evt ON res.`idEvento` = evt.`idEvento`
                                        LEFT JOIN tipo_apuesta ta ON ta.idTipoApuesta = res.idTipoApuesta
                                        WHERE  
                                        evt.idJuego = (SELECT even.idJuego FROM evento AS even WHERE even.idEvento=" . $ideventoactual . ")
                                        AND (ta.idTipoPago in (1,6) )
                                        AND evt.idEvento != " . $ideventoactual . "  and evt.estadoEvento = 2
                                        ORDER BY evt.`fechaEvento` DESC
                                        LIMIT 18
            "));
        return $listar;
    }

    public static function TipoApuestaListar()
    {
        $listar = DB::select(DB::raw("SELECT tip_apu.valorapuesta,
                        tip_apu.idTipoApuesta ,
                        tip_apu.nombre,
                        tip_apu.rgb,
                        tip_apu.descripcion,
                        tip_apu.rgbLetra, 
                        FLOOR(tip_pag.multiplicadorDefecto) AS multiplicadorDefecto,
                        tip_pag.idTipoPago,
                        tip_pag.plenoMinimo,
                        tip_pag.plenoMaximo,tip_pag.intercalado
                    FROM tipo_apuesta tip_apu 
                    LEFT JOIN tipo_pago tip_pag on tip_pag.idTipopago = tip_apu.idTipoPago
                    WHERE tip_pag.estado = 1"));
        return $listar;
    }

    public static function DineroDefaultListar()
    {
        $listar = DB::select(DB::raw("SELECT * from dinero_default where estado = 1"));
        return $listar;
    }

    public static function RegistrarEventoCuyTorito($juego, $fechaIni, $fechaEventoFin, $posiciones ,$sessionToken = null ,$playerID = null,$gameID = null)
    {
        $token_generado = str_random(8);
        $evento = new Evento();
        $evento->idJuego = $juego->idJuego;
        $evento->nombre = $juego->nombre;
        $evento->fechaEvento = $fechaIni;
        $evento->fechaFinEvento = $fechaEventoFin;
        $evento->apuestaMinima = $juego->apuestaMinima;
        $evento->apuestaMaxima = $juego->apuestaMaxima;
        $evento->idMoneda = $juego->idMoneda;
        $evento->estadoEvento = 1; //  1 ejecución  , 2 terminado
        $evento->estadoAnimacion = 0;
        $evento->tokenAnimacion = $token_generado;
        $evento->puntosCuy = json_encode($posiciones);
        
        $evento->sessionToken = $sessionToken;
        $evento->playerID = $playerID;
        $evento->gameID = $gameID;
        $evento->created_at = date("Y-m-d H:i:s");
        $evento->updated_at = date("Y-m-d H:i:s");
        $evento->save();
        return $evento;
    }


    public static function RegistrarEvento($juego, $fechaIni, $fechaEventoFin, $posiciones)
    {
        $token_generado = str_random(8);
        $evento = new Evento();
        $evento->idJuego = $juego->idJuego;
        $evento->nombre = $juego->nombre;
        $evento->fechaEvento = $fechaIni;
        $evento->fechaFinEvento = $fechaEventoFin;
        $evento->apuestaMinima = $juego->apuestaMinima;
        $evento->apuestaMaxima = $juego->apuestaMaxima;
        $evento->idMoneda = $juego->idMoneda;
        $evento->estadoEvento = 0;
        $evento->estadoAnimacion = 0;
        $evento->tokenAnimacion = $token_generado;
        $evento->puntosCuy = json_encode($posiciones);

        $evento->save();
        return $evento;
    }
    

    public static function EventoActual($IdJuego)
    {
        $resultado = DB::table('evento as e')
            ->join('juego as j', 'j.idJuego', 'e.idJuego')
            ->where('e.idJuego', $IdJuego)
            ->where('estadoEvento', 1)
            ->first();
        return $resultado;
    }

    public static function CambiarEstadoAnimacionEvento($IdEvento, $token_animacion)
    {

        $resultado = false;
        $respuesta = DB::table('evento')
            ->where('idEvento', $IdEvento)
            ->where('tokenAnimacion', $token_animacion)
            ->first();

        if ($respuesta != null) {
            try {
                $evento = Evento::findorfail($IdEvento);
                $evento->estadoAnimacion = 1;
                $evento->save();
                $resultado = true;
            } catch (QueryException $ex) {
            }
        }
        return $resultado;
    }

    public static function EventoTokenAnimacion(string $token_generado, $idEvento)
    {
        $evento = "";
        try {
            $evento = Evento::findorfail($idEvento);
            $evento->tokenAnimacion = $token_generado;
            $evento->save();
        } catch (QueryException $ex) {
        }

        return $evento;
    }

    public static function ValidarTokenAnimacion($idEvento)
    {
        $token = "";
        $evento = Evento::findorfail($idEvento);
        if ($evento->tokenAnimacion != "") {
            $token = $evento->tokenAnimacion;
        }
        return $token;
    }

    public static function ObtenerUltimoEvento($idJuego, $fechaIni, $fechaFin)
    {
        $resultado = DB::table('evento as e')
            ->where('e.idJuego', $idJuego)
            ->whereBetween('e.fechaEvento', array($fechaIni, $fechaFin))
            ->orderBy('idEvento', 'desc')
            ->first();
        return $resultado;
    }

    public static function GenerarEventoJobNuevo()
    {
        $Configuracion = DB::table('configuracion_general')->first();
        if ($Configuracion != null) {
            $fecha_inicio = today()->toDateString() . ' ' . $Configuracion->HoraInicioIntervalo;
            $fecha_fin = today()->toDateString() . ' ' . $Configuracion->HoraFinIntervalo;
        } else {
            $fecha_inicio = today()->startOfDay()->toDateTimeString();
            $fecha_fin = today()->endOfDay()->toDateTimeString();
        }
        $ListaJuego = Juego::JuegoListarLapsoJson();
        foreach ($ListaJuego as $juego) {
            //Evento creado anteriormente
            $evento_creado = Evento::ObtenerUltimoEvento($juego->idJuego, $fecha_inicio, $fecha_fin);
            if ($evento_creado != null) {
                $fechaIni = $evento_creado->fechaFinEvento;
                $fechaFin = "";
                while ($fechaIni < $fecha_fin) {
                    if ($juego->lapsoProxEventoHoras > 0) {
                        $NumeroHoras = $juego->lapsoProxEventoHoras;
                        $fechaFin = Carbon::parse($fechaIni)->addHours($NumeroHoras);
                    } else if ($juego->lapsoProxEventoMinutos > 0) {
                        $NumeroMinutos = $juego->lapsoProxEventoMinutos;
                        $fechaFin = Carbon::parse($fechaIni)->addMinutes($NumeroMinutos);
                    }
                    if ($fechaFin > $fecha_fin) {
                        break;
                    } else {
                        $event = new Evento();
                        $posiciones = $event->generar_posiciones_random();
                        Evento::RegistrarEvento($juego, $fechaIni, $fechaFin->toDateTimeString(), $posiciones);
                        $fechaIni = $fechaFin->toDateTimeString();
                    }
                }
            } else {
                $fechaIni = $fecha_inicio;
                $fechaFin = "";
                while ($fechaIni < $fecha_fin) {
                    if ($juego->lapsoProxEventoHoras > 0) {
                        $NumeroHoras = $juego->lapsoProxEventoHoras;
                        $fechaFin = Carbon::parse($fechaIni)->addHours($NumeroHoras);
                    } else if ($juego->lapsoProxEventoMinutos > 0) {
                        $NumeroMinutos = $juego->lapsoProxEventoMinutos;
                        $fechaFin = Carbon::parse($fechaIni)->addMinutes($NumeroMinutos);
                    }
                    if ($fechaFin >= $fecha_fin) {
                        break;
                    } else {
                        $event = new Evento();
                        $posiciones = $event->generar_posiciones_random();
                        Evento::RegistrarEvento($juego, $fechaIni, $fechaFin->toDateTimeString(), $posiciones);
                        $fechaIni = $fechaFin->toDateTimeString();
                    }
                }
            }
        }
    }

    public static function EventoEjecucionUnico()
    {
        $evento = DB::table('evento')
            ->where('estadoEvento', 1)
            ->first();
        return $evento;
    }

    public static function GenerarResultadoEvento_CambiarEstadoEvento()
    {
        $fechaIni = today()->startOfDay()->toDateTimeString();
        $fechaFin = today()->endOfDay()->toDateTimeString();
        $lista_Juegos = Juego::JuegoListarLapsoJson();

        $evento_activo_dia_diferente = \DB::table('evento')
            ->whereDate('fechaEvento', '!=', now())
            ->where('estadoEvento', 1)
            ->get();
        foreach ($evento_activo_dia_diferente as $edf) {
            $evento = Evento::findorfail($edf->idEvento);
            $evento->estadoEvento = 2;
            $evento->save();
        }

        foreach ($lista_Juegos as $juego) {
            $ListaEventosDia = DB::table('evento as e')
                ->whereBetween('e.fechaEvento', array($fechaIni, $fechaFin))
                ->where('e.idJuego', $juego->idJuego)
                ->get();
            foreach ($ListaEventosDia as $li) {
                if ($li->fechaEvento < now() && $li->fechaFinEvento > now()) {
                    $val = Evento::findorfail($li->idEvento);
                    if ($val->estadoEvento == 0) {
                        $val->estadoEvento = 1;
                        $val->save();
                    }
                } else if ($li->fechaEvento < now() && $li->fechaFinEvento < now() && $li->estadoEvento == 1) {
                    $evento = Evento::findorfail($li->idEvento);
                    $evento->estadoEvento = 2;
                    $evento->save();
                }
            }
        }
    }

///////////////////////NUEVA FUNCIÓN ACTIVACION EVENTOS

    public static function ActivarEventos()
    {
        echo '.';
        $lista_Juegos = Juego::JuegoListarLapsoJson();
        foreach ($lista_Juegos as $juego) {/// foreach  juegos
            $idJuego = $juego->idJuego;
            $hora = now();
            $startTimef = microtime(true);
            echo ":";
            $Evento_para_activar =
                DB::select(DB::raw("SELECT idEvento,fechaFinEvento from evento 
                                            where idJuego=" . $idJuego . "
                                            and estadoEvento=0
                                            and fechaEvento <='$hora' 
                                            and fechaFinEvento >='$hora'"
                )
                );
            echo "_";

            //echo "   CONSULTA : ". (microtime(true) - $startTimef) ." segundos\n";

            if (count($Evento_para_activar) > 0) {
                $idEvento = $Evento_para_activar[0]->idEvento;
                $fechaFinEvento = $Evento_para_activar[0]->fechaFinEvento;
                $ActivarEvento = DB::SELECT(DB::raw("UPDATE evento set estadoEvento=1 where idEvento=" . $idEvento));
                Evento::CerrarEventoMysql($idJuego, $idEvento, $fechaFinEvento);
                echo "$hora ACTIVANDO Ev " . $idEvento . " -Juego " . $idJuego . " - Fin:" . $fechaFinEvento . " ...\n";
            }
        }///fin foreach juegos
        //echo "Tiempo foreachlista : ". (microtime(true) - $startTimef) ." segundos\n";
    }

    public static function ActivarEventos22()
    {
        echo '.';
        $lista_Juegos = Juego::JuegoListarLapsoJson();
        foreach ($lista_Juegos as $juego) {/// foreach  juegos
            $idJuego = $juego->idJuego;
            $hora = now();
            $startTimef = microtime(true);
            echo ":";

            $evento_activo =
                DB::select(DB::raw("select idEvento,fechaFinEvento from evento 
                                            where idJuego=" . $idJuego . "
                                            and estadoEvento=1"
                )
                );
            if (count($evento_activo) > 0) {
                $idEvento = $evento_activo[0]->idEvento;
                $fechaFinEvento = $evento_activo[0]->fechaFinEvento;
                echo " evena acti:" . $idEvento . " ";
                Evento::CerrarEventoYCrearSigMysql($idJuego, $idEvento, $fechaFinEvento);
            } else {
                // echo "  --- ";
                //  $Evento_activar=
                //   DB::unprepared("select @idevento_activar:=idEvento from evento
                //                     where idJuego=".$idJuego."
                //                     and estadoEvento=0
                //                     and fechaEvento <='$hora'
                //                     and fechaFinEvento >='$hora';
                //                     update evento set estadoEvento=1 where idEvento=@idevento_activar
                //                     "
                //                     );
                // Sleep(1);
            };
            echo "_";
            //echo "   CONSULTA : ". (microtime(true) - $startTimef) ." segundos\n";
            // if(count($Evento_para_activar)>0){
            //     $idEvento=$Evento_para_activar[0]->idEvento;
            //     $fechaFinEvento=$Evento_para_activar[0]->fechaFinEvento;
            //     $ActivarEvento=DB::SELECT(DB::raw("update evento set estadoEvento=1 where idEvento=".$idEvento));
            //     Evento::CerrarEventoMysql($idJuego,$idEvento,$fechaFinEvento);
            //     echo "$hora ACTIVANDO Ev ".$idEvento." -Juego ".$idJuego." - Fin:".$fechaFinEvento." ...\n";
            // }
        }///fin foreach juegos
        //echo "Tiempo foreachlista : ". (microtime(true) - $startTimef) ." segundos\n";
    }

    public static function UpdateEvento($id){
        $evento = Evento::find($id); //
        if ($evento) {
            $tiempo_vista_venta = env('TIEMPO_VISTA_VENTA');
            $fecha_inicio = date("Y-m-d H:i:s");
            $fecha_fin = date("Y-m-d H:i:s", strtotime($fecha_inicio . " + $tiempo_vista_venta seconds"));
            $evento->fechaEvento = $fecha_inicio;
            $evento->fechaFinEvento = $fecha_fin;
            $evento->save();
            return true;
        } else {
            return false;
        }
    }
    public static function ActivarEventos2()
    {
        echo '.';
        $lista_Juegos = Juego::JuegoListarLapsoJson();
        foreach ($lista_Juegos as $juego) {/// foreach  juegos
            $idJuego = $juego->idJuego;
            $hora = now();
            $startTimef = microtime(true);
            echo ":";

            $evento_activo =
                DB::select(DB::raw("select idEvento,fechaFinEvento from evento 
                                            where idJuego=" . $idJuego . "
                                            and estadoEvento=1"
                )
                );
            if (count($evento_activo) > 0) {
                Evento::CerrarEventoYCrearSigMysql($idJuego, $idEvento, $fechaFinEvento);
            } else {
                $Evento_activar =
                    DB::select(DB::raw("select @idevento_activar:=idEvento from evento 
                                            where idJuego=" . $idJuego . "
                                            and estadoEvento=0
                                            and fechaEvento <='$hora' 
                                            and fechaFinEvento >='$hora';
                                            update evento set estadoEvento=1 where idEvento=@idevento_activar
                                            "
                    )
                    );
            };
            echo "_";

            //echo "   CONSULTA : ". (microtime(true) - $startTimef) ." segundos\n";

            if (count($Evento_para_activar) > 0) {
                $idEvento = $Evento_para_activar[0]->idEvento;
                $fechaFinEvento = $Evento_para_activar[0]->fechaFinEvento;
                $ActivarEvento = DB::SELECT(DB::raw("update evento set estadoEvento=1 where idEvento=" . $idEvento));
                Evento::CerrarEventoMysql($idJuego, $idEvento, $fechaFinEvento);
                echo "$hora ACTIVANDO Ev " . $idEvento . " -Juego " . $idJuego . " - Fin:" . $fechaFinEvento . " ...\n";
            }
        }///fin foreach juegos
        //echo "Tiempo foreachlista : ". (microtime(true) - $startTimef) ." segundos\n";
    }

    public static function CerrarEventoMysql($idJuego, $idEvento, $fechaFinEvento)
    {
        $nombre_eventomysql = $idJuego . "_" . $idEvento . "_fin";
        $listar = DB::unprepared("DROP EVENT IF EXISTS " . $nombre_eventomysql . ";
            create EVENT " . $nombre_eventomysql . " 
            ON SCHEDULE AT '" . $fechaFinEvento . "'
            DO 
                update evento ev set ev.estadoEvento=2 where ev.idEvento=" . $idEvento);
        return $listar;
    }

    public static function CerrarEventoYCrearSigMysql($idJuego, $idEvento, $fechaFinEvento)
    {
        $nombre_eventomysql = $idJuego . "_" . $idEvento . "_fin";
        $listar = DB::unprepared("  create EVENT  if not exists " . $nombre_eventomysql . "
                                    ON SCHEDULE at '" . $fechaFinEvento . "'
                                    DO BEGIN
                                      select @hora:= now();
                                      select @ideven:= idEvento from evento where idJuego=" . $idJuego . " and fechaFinEvento=@hora;
                                      update evento set estadoEvento=2 where idEvento=@ideven;/*desactivar evento*/
                                      select @ideven_acti:=idEvento from evento where idJuego=" . $idJuego . " and  fechaEvento=@hora ;
                                      update evento set estadoEvento=1 where idEvento=@ideven_acti;/*activar siguiente evento*/
                                    END ");
        return $listar;
    }


//////////////////////////////////////////////////

    public static function CerrarEventoJuego($IdJuego)
    {
        $UltimoEvento = Evento::where('idJuego', $IdJuego)->first();
        $resultado = Evento::findorfail($UltimoEvento->idEvento);
        $resultado->estadoEvento = 2;
        $resultado->save();
    }

    public static function EventosDiaActualGenerados()
    {
        $Configuracion = DB::table('configuracion_general')->first();
        if ($Configuracion != null) {
            $fecha_inicio = today()->toDateString() . ' ' . $Configuracion->HoraInicioIntervalo;
            $fecha_fin = today()->toDateString() . ' ' . $Configuracion->HoraFinIntervalo;
        } else {
            $fecha_inicio = today()->startOfDay()->toDateTimeString();
            $fecha_fin = today()->endOfDay()->toDateTimeString();
        }

        $lista = DB::table('evento as e')
            ->whereBetween('e.fechaEvento', array($fecha_inicio, $fecha_fin))
            ->where('e.estadoEvento', 0)
            ->get();
        return $lista;
    }

    public static function ActualizarEventosNoActivos($IdJuego)
    {
        $fechaIni = today()->startOfDay()->toDateTimeString();
        $fechaFin = today()->endOfDay()->toDateTimeString();
        $eventos = DB::table('evento')
            ->whereBetween('fechaEvento',array($fechaIni,$fechaFin))
            ->where('estadoEvento',0)
            ->where('estadoEvento','!=',1)
            ->get();
        $Juego = Juego::findorfail($IdJuego);
        foreach ($eventos as $evento)
        {
            $data = Evento::findorfail($evento->idEvento);
            $data->apuestaMinima = $Juego->apuestaMinima;
            $data->apuestaMaxima = $Juego->apuestaMaxima;
            $data->save();
        }
    }

    //////////////////////FUNCIONES GENERAR PUNTOS RANDOM
    public function random_posicion($min, $max)
    {
        $numero = (($this->random_0_1() * ($max - $min)) + $min);
        $numero_decimal = number_format((float)$numero, 2, '.', '');
        return $numero_decimal;
    }

    public function generar_posiciones_random()
    {
        $array_puntos = array();
        // rango z=> -2.5  a   2.5
        for ($i = 0; $i < 40; $i++) {
            $randomx = $this->random_0_1() >= 0.5 ? abs($this->random_posicion(0, 2.35)) : -abs($this->random_posicion(0, 2.35));
            $randomz = $this->random_0_1() >= 0.5 ? abs($this->random_posicion(0, 2.35)) : -abs($this->random_posicion(0, 2.35));
            $rotarono = $this->random_0_1() >= 0.5 ? true : false;
            $mostrar_cuydudando = $this->random_0_1() >= 0.5 ? true : false;
            $obj = (object)[
                'x' => $randomx,
                'y' => 0,
                'z' => $randomz,
                'rotarono' => $rotarono,
                'mostrar_cuydudando' => $mostrar_cuydudando
            ];
            array_push($array_puntos, $obj);
        }
        return $array_puntos;
    }

    function random_0_1()
    {
        return (float)rand() / (float)getrandmax();
    }
    /////FIN FUNCIONES GENERAR PUNTOS RANDOM

}
