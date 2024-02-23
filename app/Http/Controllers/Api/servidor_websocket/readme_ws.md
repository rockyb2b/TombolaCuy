getEventoActual(1)     1=>  JUEGO 1  ,CUY
    GET Evento del Juego  con estado = 1
        GanadorEvento(id_evento) => "SELECT valorGanador FROM resultado_evento AS res WHERE res.idEvento=".$idEvento." GROUP BY valorGanador";

