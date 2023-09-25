<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use DB;

class Ticket extends Model
{
    protected $table = 'ticket';

    protected $primaryKey = 'idTicket';

    public $timestamps = false;

    public $fillable = ['idAperturaCaja', 'idEvento', 'codigoQR', 'nroTicketParticipante', 'ganador', 'estadoTicket', 'montoTotal', 'fechaPago', 'idAperturaCajaPago','PremioMaximoPagar','PremioMaximoPotencial' ];


    public static function TicketListarJson()
    {
        $listar = Ticket::all();
        return $listar;
    }
  public static function BuscarTicketApi($fecha,$fechafin,$idlocal,$idticket)
    {

        $buscar_fecharegistro="";
        if($fecha!=null && $fechafin!=null){
            $buscar_fecharegistro="tick.fechaRegistro between '".$fecha."' and '".$fechafin."'";
        }
          if($fecha==null && $fechafin==null){
            $buscar_fecharegistro="";
        }
        if($fecha==null && $fechafin!=null){
            $buscar_fecharegistro="tick.fechaRegistro <'".$fechafin."'";
        }
         if($fecha!=null && $fechafin==null){
            $buscar_fecharegistro="tick.fechaRegistro >'".$fecha."'";
        }
        $buscar_idticket=$idticket==null?"":" tick.idTicket=".$idticket;
        $buscar_idlocal=  $idlocal==null?"":" pun_ven.idPuntoVenta=".$idlocal;

        $consultawhere=$buscar_fecharegistro;

if($buscar_idticket!=""){
       if($consultawhere!=""){$consultawhere=$consultawhere." and ";}
        $consultawhere=$consultawhere." ".$buscar_idticket;
}
     
if($buscar_idlocal!=""){

        if($consultawhere!=""){$consultawhere=$consultawhere." and ";}
        $consultawhere=$consultawhere." ".$buscar_idlocal;
}
        if($consultawhere!=""){$consultawhere=" where ".$consultawhere;}
        $listar = DB::select(DB::raw("select 
                                        tick.idTicket,
                                        pun_ven.idPuntoVenta,
                                        tick.idEvento,
                                        ju.nombre as juego_nombre,
                                        tick.estadoTicket,
                                        (CASE tick.estadoTicket
                                            WHEN '0' THEN 'Anulado'
                                            WHEN '1' THEN 'Ejecución'
                                            WHEN '2' THEN 'Pagado'
                                            WHEN '2' THEN 'Suspendido'
                                            ELSE 'Sin estado' END
                                        )
                                        as ticket_estado,
                                        tick.fechaRegistro as ticket_fechaRegistro,
                                        tick.fechaPago as ticket_fechaPago,
                                        tick.fechaCancelacion ticket_fechaCancelacion,
                                        tick.montoTotal as ticket_montoTotal,
                                        mon.simbolo as moneda_simbolo,
                                        tick.codigoQR as ticket_codigoQR,
                                        ap_caj.idAperturaCaja,ap_caj.idTurno,
                                        caj.idCaja,

                                        pun_ven.nombre as PuntoVentaNombre,
                                        emp.razonSocial AS empresa_razonSocial,emp.ruc as empresa_ruc
                                        from ticket tick
                                        left join apertura_caja ap_caj on ap_caj.idAperturaCaja=tick.idAperturaCaja
                                        left join caja caj on caj.idCaja=ap_caj.idCaja
                                        left join punto_venta pun_ven on pun_ven.idPuntoVenta=caj.idPuntoVenta
                                        left join empresa emp on emp.idEmpresa=pun_ven.idEmpresa
                                        left join users usu on usu.idUsuario=ap_caj.usuario
                                        left join evento ev on ev.idEvento= tick.idEvento
                                        left join juego ju on ju.idJuego= ev.idJuego
                                        left join moneda mon on mon.idMoneda =ev.idMoneda ".$consultawhere
                                        
));
        return $listar;
    }
    public static function GuardarTicket(Request $request)
    {
        $Ticket = new Ticket();
        $Ticket->idAperturaCaja = $request->input('idAperturaCaja');
        $Ticket->idEvento = $request->input('idEvento');
        $Ticket->codigoQR = $request->input('codigoQR');
        $Ticket->nroTicketParticipante = $request->input('nroTicketParticipante');
        $Ticket->ganador = $request->input('ganador');
        $Ticket->estadoTicket = $request->input('estadoTicket');
        $Ticket->montoTotal = $request->input('montoTotal');
        $Ticket->fechaRegistro = date('Y-m-d H:i:s');
        $Ticket->PremioMaximoPagar = $request->input('PremioMaximoPagar_guardar');
        $Ticket->PremioMaximoPotencial = $request->input('PremioMaximoPotencial_guardar');
        $Ticket->save();
        return $Ticket;
    }

    public static function TicketPagarEstado($idTicket, $idAperturaCaja)
    {
        $Ticket = Ticket::findorfail($idTicket);
        $Ticket->estadoTicket = 2;
        $Ticket->fechaPago = date('Y-m-d H:i:s');
        $Ticket->idAperturaCajaPago = $idAperturaCaja;//punto venta;
        $Ticket->save();
        return $Ticket;
    }

        public static function TicketCancelarEstado($idTicket)
    {
        $Ticket = Ticket::findorfail($idTicket);
        $Ticket->fechaCancelacion = date('Y-m-d H:i:s');
        $Ticket->estadoTicket = 0;/*Anulado*/
        $Ticket->save();
        return $Ticket;
    }

public static function BuscarTickets_paraCancelar($idTicket){
       $listar = DB::select(DB::raw(' 
                 select tick.idTicket,
                 tick.estadoTicket ,
                 tick.idEvento,
                 tick.montoTotal,
                 tick.fechaRegistro,
                 tick.fechaPago,
                ev.fechaEvento , 
                ev.fechaFinEvento
                 from ticket as tick
                 left join evento ev on ev.idEvento = tick.idEvento 
                 where  tick.idTicket='.$idTicket));
        return $listar;
} 

public static function TicketCabeceraDatos($idTicket){
         $listar = DB::select(DB::raw(' select
                    tick.idTicket,
                                pun_ven.idPuntoVenta,
                                mon.simbolo     ,   
                                ju.logo,
                    pun_ven.cc_id as IdUnidad,
                    pun_ven.nombre as tienda,
                    ev.idEvento as Nro_Evento,
                    ju.nombre as Descr,
                    tick.fechaRegistro as ImpresoEn,

                    usu.usuario,

                    ev.apuestaMaxima,
                    tick.PremioMaximoPagar,
                   tick.PremioMaximoPotencial
                    from ticket tick
                    left join evento ev on ev.idEvento=tick.idEvento
                    left join juego ju on ju.idJuego= ev.idJuego
                    left join apertura_caja as ap_caj on ap_caj.idAperturaCaja=tick.idAperturaCaja
                    left join caja as caj on caj.idCaja=ap_caj.idCaja
                    left join punto_venta as pun_ven on pun_ven.idPuntoVenta= caj.idPuntoVenta
                    left join users usu on usu.idUsuario=ap_caj.usuario
                     left join moneda mon on mon.idMoneda=ev.idMoneda
                    where tick.idTicket='.$idTicket));
        return $listar;
}
public static function TicketApuestasDatos($idTicket){
         $listar = DB::select(DB::raw(' select              
                tick.idEvento,
                tip_apu.descripcion,  
                ap.multiplicadorDefecto,
                ap.montoApostado   
                from apuesta ap    
                left join ticket tick on tick.idTicket=ap.idTicket
                left join evento ev on ev.idEvento =tick.idEvento
                left join tipo_apuesta tip_apu on tip_apu.idTipoApuesta= ap.idTipoApuesta
                left join tipo_pago tip_pag on tip_pag.idTipoPago=tip_apu.idTipoPago
                where ap.idTicket='.$idTicket));
        return $listar;
}

public static function BuscarTickets_paraCancelarEventoenProceso($idTicket){
   $listar = DB::select(DB::raw('
                select tick.idTicket,tick.estadoTicket ,tick.idEvento,tick.montoTotal,
                tick.fechaRegistro,tick.fechaPago, ev.fechaEvento , ev.fechaFinEvento,
                DATE_SUB(ev.fechaFinEvento,INTERVAL ju.segBloqueoAntesEvento SECOND) AS FechaAnimacion,ju.segBloqueoAntesAnimacion
                 from ticket as tick
                 left join evento ev on ev.idEvento = tick.idEvento 
                 left join juego ju on ju.idJuego = ev.idJuego
                 where now() between ev.fechaEvento and DATE_SUB(ev.fechaFinEvento,INTERVAL ju.segBloqueoAntesEvento SECOND)
    and tick.idTicket='.$idTicket));
    return $listar;
} 
    public static function BuscarGanadoresTicketidEvento($idEvento, $idTicket)
    {
/////////////////BUSCAR APUESTAS  DEL IDTICKET   QUE ESTEN  RESULTADO EVENTO  CON $idEvento
        $listar = DB::select(DB::raw('select apu.idTipoApuesta ,tipapu.valorapuesta as TipoApuestaValor,tipapu.nombre as TipoApuestaNombre,tipopago.nombre as TipoPagoNombre
            from apuesta AS apu
            left join tipo_apuesta tipapu on tipapu.idTipoApuesta=apu.idTipoApuesta
            left join tipo_pago tipopago on tipopago.idTipoPago=tipapu.idTipoPago
             where apu.idTicket=(select tick.idTicket from ticket tick where tick.idTicket=' . $idTicket . ')
             and  apu.idTipoApuesta 
            in 
            (
                SELECT idTipoApuesta FROM
                (
                    SELECT idTipoApuesta
                    FROM resultado_evento where idEvento=' . $idEvento . '
                    GROUP BY idTipoApuesta
                    
                ) AS subquery
            )


            '));
        return $listar;
    }

    public static function BuscarGanadoresTicket($idTicket)
    {
/////////////////BUSCAR APUESTAS  DEL IDTICKET   QUE ESTEN  en RESULTADO EVENTO  CON idEvento del ticket
        $listar = DB::select(DB::raw('
                    select  ju.logo,pun_ven.cc_id,pun_ven.nombre as puntoventanombre,
                    tick.estadoTicket,apu.idApuesta,apu.idTicket,apu.idTipoApuesta ,tipapu.valorapuesta as TipoApuestaValor,resev.idResultadosEvento,
                    resev.multiplicadorApuestaGanada, apu.montoApostado,
                    tipapu.descripcion as TipoApuestaNombre,
                    tipopago.nombre as TipoPagoNombre, tick.idEvento,ev.nombre as EventoNombre, ev.apuestaMaxima,
                     tick.PremioMaximoPagar, tick.PremiomaximoPotencial,
                     usu.usuario as UsuarioCompra,
                     mon.simbolo
                    from apuesta AS apu
                    left join ticket tick on tick.idTicket= apu.idTicket
                    left join evento ev on ev.idEvento = tick.idEvento
                    left join juego ju on ju.idJuego=ev.idJuego
                    left join tipo_apuesta tipapu on tipapu.idTipoApuesta=apu.idTipoApuesta
                    left join tipo_pago tipopago on tipopago.idTipoPago=tipapu.idTipoPago 
                    left join resultado_evento resev on resev.idTipoApuesta= tipapu.idTipoApuesta

                    left join moneda mon on mon.idMoneda =ev.idMoneda
                    LEFT JOIN apertura_caja ap_caj on ap_caj.idAperturaCaja=tick.idAperturaCaja
                       left join caja caj on caj.idCaja = ap_caj.idCaja
                    left join punto_venta pun_ven on pun_ven.idPuntoVenta=caj.idPuntoVenta
                    left join users usu on usu.idUsuario=ap_caj.usuario

                     where apu.idTicket=' . $idTicket . '  and resev.idEvento=tick.idEvento
                     and  apu.idTipoApuesta 
                    in 
                    (
                        SELECT idTipoApuesta FROM
                        (
                            SELECT idTipoApuesta
                            FROM resultado_evento /*where idEvento=1953*/
                            GROUP BY idTipoApuesta
                            
                        ) AS subquery
                    )

            '));
        return $listar;
    }


        public static function BuscarGanadoresTicketparaCancelar($idTicket)
    {
/////////////////BUSCAR APUESTAS  DEL IDTICKET   QUE ESTEN  en RESULTADO EVENTO  CON idEvento del ticket y ticket con evento activo
        $listar = DB::select(DB::raw('
                         set @hora:= now();
 select  
 ev.fechaEvento , ev.fechaFinEvento,
 tick.estadoTicket,apu.idApuesta,apu.idTicket,apu.idTipoApuesta ,tipapu.valorapuesta as TipoApuestaValor,resev.idResultadosEvento,
                    resev.multiplicadorApuestaGanada, apu.montoApostado,
                    tipapu.nombre as TipoApuestaNombre,
                    tipopago.nombre as TipoPagoNombre, tick.idEvento,ev.nombre as EventoNombre, ev.apuestaMaxima
                    from apuesta AS apu
                    left join ticket tick on tick.idTicket= apu.idTicket
                    left join evento ev on ev.idEvento = tick.idEvento
                    left join tipo_apuesta tipapu on tipapu.idTipoApuesta=apu.idTipoApuesta
                    left join tipo_pago tipopago on tipopago.idTipoPago=tipapu.idTipoPago 
                    left join resultado_evento resev on resev.idTipoApuesta= tipapu.idTipoApuesta

                     where apu.idTicket=' . $idTicket . '  and resev.idEvento=tick.idEvento
                     and @hora between ev.fechaEvento and ev.fechaFinEvento
                     and  apu.idTipoApuesta 
                    in 
                    (
                        SELECT idTipoApuesta FROM
                        (
                            SELECT idTipoApuesta
                            FROM resultado_evento 
                            GROUP BY idTipoApuesta
                            
                        ) AS subquery
                    )

            '));
        return $listar;
    }





    public static function BuscarApuestasIdTicket($idTicket)
    {
/////////////////BUSCAR APUESTAS  DEL IDTICKET   QUE ESTEN  RESULTADO EVENTO  CON $idEvento
        $listar = DB::select(DB::raw("
                               
                                select   tick.idTicket,tick.idEvento,tick.estadoTicket,tipoapuesta.idTipoApuesta, tipoapuesta.valorapuesta, tipopago.nombre 
                                ,pu_ve.idPuntoVenta
                                ,pu_ve.nombre as PuntoVentaNombre
                                from apuesta 
                                left join tipo_apuesta tipoapuesta on  tipoapuesta.idTipoApuesta=apuesta.idTipoApuesta 
                                left join tipo_pago tipopago on tipopago.idTipoPago = tipoapuesta.idTipoPago
                                left join ticket tick on tick.idTicket=apuesta.idTicket

                                  left join apertura_caja ap_ca on ap_ca.idAperturaCaja=tick.idAperturaCaja
                                left join caja ca on ca.idCaja= ap_ca.idCaja 
                                left join punto_venta pu_ve on pu_ve.idPuntoVenta=ca.idPuntoVenta


                                where apuesta.idTicket='" . $idTicket . "'
                                "));
        return $listar;
    }


    public static function ConsultarTicketEventoTermino($idTicket)
    {
/////////////////BUSCAR APUESTAS  DEL IDTICKET   QUE ESTEN  RESULTADO EVENTO  CON $idEvento
        $listar = DB::select(DB::raw("
                               
                                select  tick.idTicket,ev.fechaFinEvento  FROM ticket tick 
                                left join evento ev on ev.idEvento=tick.idEvento
                                where tick.idTicket=".$idTicket." and now()>ev.fechaFinEvento"));
        return $listar;
    }




    public static function ResultadosEvento($idEvento)
    {
/////////////////BUSCAR APUESTAS  DEL IDTICKET   QUE ESTEN  RESULTADO EVENTO  CON $idEvento
        $listar = DB::select(DB::raw('
                                SELECT *
                            FROM resultado_evento where idEvento=' . $idEvento . '
                            
                                '));
        return $listar;
    }


    public static function MontoTickets_idAperturaCaja($idAperturaCaja)
    {
        $listar = DB::select(DB::raw('
        SELECT sum(montoTotal) as monto FROM `ticket` WHERE idAperturaCaja=' . $idAperturaCaja));
        return $listar;
    }

    public static function MontoPuntoVenta($idPuntoVenta)
    {
        $listar = DB::select(DB::raw('
                SELECT monto FROM `punto_venta_tipo_alerta`  as monto WHERE idPuntoVenta=' . $idPuntoVenta));
        return $listar;
    }

    public static function ValidarPagoPagoMaximoEvento($idticket, $pagado)
    {
        $data = Ticket::findorfail($idticket);
        $evento = Evento::findorfail($data->idEvento);
        $monto_maximo_pagar_evento = $evento->apuestaMaxima;
        $total = 0;
        if ($pagado > $monto_maximo_pagar_evento) {
            $total = $monto_maximo_pagar_evento;
        } else {
            $total = $pagado;
        }
        return $total;
    }

    public static function ValidarPagosAperturaCaja($idAperturaCaja)
    {
        $data = DB::select(DB::raw("SELECT 
        t.idTicket,
        IFNULL((select sum(ge.montoAPagar) from ganador_evento ge
        inner join apuesta a on a.idApuesta=ge.idApuesta
        inner join ticket ti on ti.idTicket=a.idTicket
        where ti.idTicket= t.idTicket),0) Pagos,
        t.idEvento 
        FROM ticket t
        WHERE t.idAperturaCaja = $idAperturaCaja"));

        $total = 0;
        foreach ($data as $d){
            $evento = Evento::findorfail($d->idEvento);
            $pagos = $d->Pagos;
            $limitante_evento = $evento->apuestaMaxima;
            if($pagos>$limitante_evento){
                $total += $limitante_evento;
            }else{
                $total += $pagos;
            }
        }
        return $total;
    }
}
