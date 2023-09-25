<?php

namespace App;

use DB;
use Illuminate\Database\Eloquent\Model;

class ResultadoEvento extends Model
{
    protected $table = 'resultado_evento';

    protected $primaryKey = 'idResultadosEvento';

    public $timestamps = false;

    public static function ValorGanadorEvento($idEvento)
    {
        $resultado = DB::table('resultado_evento')
            ->select('valorGanador')
            ->where('idEvento', $idEvento)
            ->groupBy('valorGanador')
            ->first();
        return $resultado;
    }

    public static function ResultadoEventoContador($idEvento){
        $resultado = DB::table('resultado_evento')
            ->where('idEvento',$idEvento)
            ->count();
        return $resultado;
    }

    public static function ResultadosEvento($IdJuego)
    {
        $resultado = DB::table('resultado_evento as re')
            ->select('e.idEvento', 're.valorGanador','tipoapuesta.rgb','tipoapuesta.rgbLetra')
            ->join('evento as e', 'e.idEvento', 're.idEvento')
            ->join('tipo_apuesta as tipoapuesta','tipoapuesta.idTipoApuesta','re.idTipoApuesta')
            ->where('e.idJuego', $IdJuego)
            ->where('re.estado', 1)
            ->whereIn('re.idTipoPago', array(1, 6))
            ->where('e.estadoEvento', '=', 2)
            ->orderBy('re.idEvento', 'DESC')
            ->take(20)
            ->get();
        return $resultado;
    }


///**historial*///
   public static function ResultadosEventoJuego($idJuego)
    {

         $cantidad=12;
        $lista = DB::select(DB::raw(" select e.idEvento, re.valorGanador,tipoapuesta.rgb,tipoapuesta.rgbLetra 
                    from resultado_evento  as re
                    left join evento as e  on e.idEvento=re.idEvento
                    left join tipo_apuesta as tipoapuesta on tipoapuesta.idTipoApuesta=re.idTipoApuesta
                      where e.idJuego=".$idJuego." and re.estado=1 and tipoapuesta.idTipoPago in (1,6)
                       and e.estadoevento=2  
                      order by re.idEvento desc limit ".$cantidad));
        return $lista;
    }


    public static function ValidarCantidadValorGanadorEvento($idEvento){
        $resultado = DB::table('resultado_evento as re')
            ->where('re.idEvento',$idEvento)
            ->groupBy('re.valorGanador')
            ->get();
        return $resultado;
    }

}
