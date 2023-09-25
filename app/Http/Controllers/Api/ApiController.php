<?php

namespace App\Http\Controllers\Api;

use App\Evento;
use App\Ticket;
use App\UsuarioApi;
use App\Reporte;
use App\ResultadoEvento;
use App\TipoApuesta;
use App\ConfiguracionGeneral;
use Carbon\Carbon;
use Illuminate\Http\Request;
use DateTime;
use App\Http\Controllers\Controller;

class ApiController extends Controller
{
    public function __construct(Request $request){
        $mensaje_error = array();
         $Authorization = $request->header('Authorization');
         $Validation = $request->header('Validation');

        if($Authorization==""){
            array_push($mensaje_error, "No envió Authorization");
            http_response_code(200);
            $response =array("Comment" => "NO ENVIÓ AUTHORIZATION ","Result" =>92);
            echo json_encode($response);
            exit(); 
        }
        if($Validation==""){
            array_push($mensaje_error, "No envió Validation");
            http_response_code(200);
            $response =array("Comment" => "NO ENVIÓ VALIDATION","Result" =>93);
            echo json_encode($response);
            exit(); 
        }

        $decode_api_token = base64_decode($Validation);
        $configuracion=ConfiguracionGeneral::ObtenerConfiguracionEvento();
        $apitoken=$configuracion->ApiToken;
        $decode_api_token_tabla = base64_decode($apitoken);

        if($decode_api_token!=$decode_api_token_tabla){
            array_push($mensaje_error, "Token Incorrecto");
            http_response_code(200);
            $response =array("Comment" => "VALIDATION INCORRECTO, NO RECONOCIDO POR EL SISTEMA","Result" =>94);
            echo json_encode($response);
            exit();
        }

        $api_user_password = substr($Authorization, 6); 
        $decode_api_user_password = base64_decode($api_user_password);
       // $api_user_password = substr($decode_api_user_password, 6); 
        $data_usuario = explode(':', $decode_api_user_password);
        if(count($data_usuario)==0){
            array_push($mensaje_error, "error Authorization ");
            http_response_code(200);
            $response =array("Comment" => "AUTHORIZATION INCORRECTO","Result" =>95);
            echo json_encode($response);
            exit();
        }
        else if(count($data_usuario)<2){
            array_push($mensaje_error, "error Authorization ");
            http_response_code(200);
            $response =array("Comment" => "AUTHORIZATION INCORRECTO","Result" =>95);
            echo json_encode($response);
            exit();
        }
        $login = utf8_encode($data_usuario[0]);
        $pass = utf8_encode($data_usuario[1]);
        $usuario= UsuarioApi::UsuarioValidacion($login,$pass);

        if(count($usuario)==0){
            array_push($mensaje_error, "Usuario no encontrado");
            http_response_code(200);
            $response =array("Comment" => "AUTHORIZATION NO RECONOCIDA POR EL SISTEMA","Result" =>96);
            echo json_encode($response);
            exit();
        }
        else{


        }
    }

    private function validateDate($date, $format = 'Y-m-d\TH:i:s')
    {
        $d = DateTime::createFromFormat($format, $date);
         return $d && $d->format($format) == $date;
    }
    private function validarInteger($valor){
        if(preg_match('/^\d+$/',$valor)) {
             return true;
            } else {
              return false;
            }
    }
    public function BuscarTicket (Request $request)
    {
        $mensaje_error = array();
        $FechaIni = $request->input("FechaIni");
        $validacion=true;
        if($FechaIni==null){
        }
        else if(!$this->validateDate($FechaIni)){
            $validacion=false;
            array_push($mensaje_error, "FechaIni con formato incorrecto  => Y-m-d H:i:s ");
        }

        $FechaFin = $request->input("FechaFin");
         if($FechaFin==null){
            array_push($mensaje_error, "No envió FechaFin");
        }
        else if(!$this->validateDate($FechaFin)){
            $validacion=false;
            array_push($mensaje_error, "FechaFin con formato incorrecto  => Y-m-d H:i:s ");
        }
        $idLocal = $request->input("local");
        if($idLocal==null){
        }
        else if(!$this->validarInteger($idLocal)) {
            $validacion=false;
            array_push($mensaje_error, "local con formato incorrecto  => integer ");
        }

        $idTicket = $request->input("ticket");
        if($idTicket==null){
        }
        else if(!$this->validarInteger($idTicket)) {
            $validacion=false;
            array_push($mensaje_error, "ticket con formato incorrecto  => integer ");
        }

        if($validacion){
            try {
                $hora_servidor = date('Y-m-d H:i:s');
                $respuesta = Ticket::BuscarTicketApi($FechaIni,$FechaFin,$idLocal,$idTicket);

               $parametros=array(  'FechaIni' => $FechaIni,
                        'FechaFin' => $FechaFin,
                        'local' => $idLocal,
                        'ticket' => $idTicket);
                return response()->json(
                                array("Comment" =>"Ok",
                                    "Resultados"=>[
                                                    'respuesta' => $respuesta,
                                                    'parametros' => $parametros,
                                                    'mensaje' => $mensaje_error],
                                    "Result" =>90)
                              );

            } catch (QueryException $ex) {
                $mensaje_error = $ex->errorInfo;
            }
        }
        else{
            $respuesta=null;
              return response()->json(
                                array("Comment" =>"Parámetros Incorrectos",
                                                        "Result" =>97)
                                    
                              );
        }

     


    }

    public function VentaDiaria(Request $request)
    {
        $mensaje_error = array();
        $FechaIni = $request->input("FechaIni");
        $request["fechaInicio"]=$FechaIni;

        $FechaFin = $request->input("FechaFin");
        $request["fechaFin"]=$FechaFin;

        $validacion=true;
        if($FechaIni==null){
            $validacion=false;
            array_push($mensaje_error, "No envió FechaIni");

        }
        else if(!$this->validateDate($FechaIni)){
            $validacion=false;
            array_push($mensaje_error, "FechaIni con formato incorrecto  => Y-m-d H:i:s ");
        }

        if($FechaFin==null){
            array_push($mensaje_error, "No envió FechaFin");
        }
        else if(!$this->validateDate($FechaFin)){
            $validacion=false;
            array_push($mensaje_error, "FechaFin con formato incorrecto  => Y-m-d H:i:s ");
        }
        
       
        $local = $request->input("local");
         $request["tiendas"]=$local;
        if($local==null){
            $request["tiendas"]=="0";
        }
        else if(!$this->validarInteger($local)) {
             $request["tiendas"]=$local;
            $validacion=false;
            array_push($mensaje_error, "local con formato incorrecto  => integer ");
        }

        if($validacion){
            try {
                $respuesta= Reporte::ReporteApuestaJsonApi($request);
                   $parametros=array('FechaIni' => $FechaIni,
                        'FechaFin' => $FechaFin,
                        'local' => $local);
                 return response()->json(
                                array("Comment" =>"Ok",
                                                        "Resultados"=>[
                                                                        'respuesta'=>$respuesta,
                                                                        'parametros' => $parametros,
                                                                        'mensaje' => $mensaje_error,
                                                                        ],
                                                        "Result" =>90)
                                    
                              );
            } catch (QueryException $ex) {
                $mensaje_error = $ex->errorInfo;
            }
        }else{
            $respuesta=null;

              return response()->json(
                                array("Comment" =>"Parámetros Incorrectos",
                                                        "Result" =>97)
                                    
                              );


        }

     

      
    }

}
