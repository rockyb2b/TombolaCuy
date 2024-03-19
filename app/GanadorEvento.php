<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use DB;

class GanadorEvento extends Model
{
    protected $table = 'ganador_evento';

    protected $primaryKey = 'idGanadorEvento';

    public $timestamps = false;

    public $fillable = ['idApuesta', 'fechaPago','montoAPagar'];


    

    public static function GuardarGanadorEvento(Request $request)
    {
        $GanadorEvento = new GanadorEvento();
        $GanadorEvento->idApuesta = $request->input('idApuesta');
        $GanadorEvento->fechaPago = date('Y-m-d H:i:s');

        $montoAPagar=$request->input('montoApostado')*$request->input('multiplicadorApuestaGanada');
        $GanadorEvento->montoAPagar = $montoAPagar;
        $GanadorEvento->save();
        return $GanadorEvento;
    }

    public static function GuardarGanadorEventoTorito($id_apuesta, $monto_pagar)
    {
        $ganador_evento = new GanadorEvento();
        $ganador_evento->idApuesta  = $id_apuesta;
        $ganador_evento->montoAPagar  = $monto_pagar;
        $ganador_evento->fechaPago = date("Y-m-d H:i:s");
        $ganador_evento->save();
        return $ganador_evento;
    }



  
}
