<?php

namespace App\Http\Controllers;

use Illuminate\Database\QueryException;
use Illuminate\Http\Request;
use App\TipoApuesta;
use App\ResultadoEvento;
class AnimacionController extends Controller
{
    public function __construct()
    {
        return $this->middleware('auth');
    }

    public function AnimacionVista()
    {
    	$listaTipoApuesta=TipoApuesta::TipoApuestaListarJson();
    	foreach($listaTipoApuesta as $TipoApuesta){
    		if($TipoApuesta->idTipoApuesta==37){
                $color1=$TipoApuesta->rgb;
    			$color1Letra=$TipoApuesta->rgbLetra;
    		}
    		if($TipoApuesta->idTipoApuesta==38){
    			$color2=$TipoApuesta->rgb;
                $color2Letra=$TipoApuesta->rgbLetra;
    		}
    		 if($TipoApuesta->idTipoApuesta==39){
    			$color0=$TipoApuesta->rgb;
                $color0Letra=$TipoApuesta->rgbLetra;
    		}
    	}

        $IdJuego=1;//juego CUY
        $resultado_evento = ResultadoEvento::ResultadosEventoJuego($IdJuego);
        // $estadistica = TipoApuesta::EstadisticaUltimosEventos($IdJuego);
        $ultimos120eventos = TipoApuesta::Ultimos120eventos($IdJuego);
        $TipoApuestaListado = TipoApuesta::TipoApuestaListado();

        return view('Animacion.AnimacionVista', compact("color1","color2","color0","color1Letra","color2Letra","color0Letra","resultado_evento","ultimos120eventos","TipoApuestaListado"));
    }    



    public function DatosEstadistica()
    {
        $estadistica = TipoApuesta::EstadisticaUltimosEventos(1);
        return response()->json(['estadistica' => $estadistica]);
    }

}
