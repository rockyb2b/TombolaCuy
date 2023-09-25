<?php

namespace App;

use App\ApiApuestaTotal\ValidarApi;
use DB;
use Illuminate\Database\Eloquent\Model;

class UsuarioApi extends Model
{
    protected $table = 'usuario_api';

    protected $primaryKey = 'idUsuarioApi';

    public $timestamps = false;

    public $fillable = ['nombre', 'password'];

    public static function UsuarioValidacion($usuario, $password)
    {
        $listar = DB::table('usuario_api')
            ->where('nombre', $usuario)
            ->where('password', $password)
            ->get();
        return $listar;
    }

 

}
