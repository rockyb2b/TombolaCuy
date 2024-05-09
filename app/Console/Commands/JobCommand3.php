<?php

namespace App\Console\Commands;

use App\Evento;
use App\ResultadoEvento;
use App\TipoApuesta;
use App\Random\Brandom;
use Illuminate\Console\Command;

class JobCommand3 extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'command:name3';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Generar Ganadores de Eventos';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        $random = new BRandom();
        $eventos = Evento::EventosDiaActualGenerados();//lista  eventos del dia desde config  Horainicio hasta Horafin
        $lista = [];
        foreach ($eventos as $e) {            
            $numero_random = $random->IRandom(0, 36);
            $totalValorGanador = ResultadoEvento::ValidarCantidadValorGanadorEvento($e->idEvento);
            if(count($totalValorGanador) == 0){
                $lista [] = [
                    'idEvento' => $e->idEvento,
                    'random' => $numero_random];
            }
        }
        if(count($lista) != 0){
            foreach ($lista as $l) {
                TipoApuesta::TipoApuestaColor($l['random'], $l['idEvento']);
            }
        }
    }
}
