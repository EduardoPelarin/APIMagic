<?php
class loginController extends controller { 
    private $dados;

    public function __construct() {
        parent::__construct();
        $this->dados = array();
    }

    public function login() {
        $dados = json_decode(file_get_contents('php://input'), true);
        $token = '';
        if (isset($_SERVER['HTTP_AUTHORIZATION'])) {
            $token = $_SERVER['HTTP_AUTHORIZATION'];
        } elseif (isset($_SERVER['REDIRECT_HTTP_AUTHORIZATION'])) {
            $token = $_SERVER['REDIRECT_HTTP_AUTHORIZATION'];
        } elseif (function_exists('apache_request_headers')) {
            $headers = apache_request_headers();
            if (isset($headers['Authorization'])) {
                $token = $headers['Authorization'];
            }
        }        

        if (isset($dados['usuario']) && !empty($dados['usuario'])) {
            $usuario = $dados['usuario'];
        } else {
            output_header(false, 'Usuário não enviado');
        }

        if (isset($dados['senha']) && !empty($dados['senha'])) {
            $senha = $dados['senha'];
        } else {
            output_header(false, 'Senha não enviada');
        }

        $log = new Login();
        $retorno = $log->getLogin($usuario, $senha);
        if ($retorno === "Erro") {
            output_header(false, "Erro no usuario e senha");
            exit;
        }

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            if ($log->isValidToken($token)) {
                output_header(true, "OK");
            }else{
                http_response_code(401);
                output_header(false, "Erro no token: ". $token );
                exit;              
            }
        }      
    }
}
?>
