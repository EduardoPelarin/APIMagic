<?php
class CartasController extends controller{ 

	private $dados;

	public function __construct(){
		parent::__construct();
		$this->dados = array();
	}

	public function index(){
		output_header(false,'método de consulta inválido');		
	}

	public function cadastraCartas(){
        $dados = json_decode(file_get_contents('php://input'), true);
        

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $log = new Login();
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
        	$nome = $dados['nome'];
        	$tipo = $dados['tipo'];
        	$custo_mana = $dados['custo_mana'];
        	$descricao = $dados['descricao'];
        	$raridade = $dados['raridade'];
        	$colecao = $dados['colecao'];    
        	$imagens = $dados['imagem'];    

           	if(($nome === "") || ($tipo === "") || ($custo_mana === "") || ($descricao === "") || ($raridade === "") || ($colecao === "") || ($imagens === "")){
           		output_header(false,"Informe todos os dados " . $e);
           		exit;
           	}    

            if ($log->isValidToken($token)) {
            	try {
            	    $carta = new Cartas();
					$retorno = $carta->cadastroCarta($nome, $tipo, $custo_mana, $descricao, $raridade, $colecao, $imagens);
					output_header(true, "OK");
    	    	} catch (Exception $e) {
    	    		output_header(false,"Erro no cadastro das cartas: " . $e);
    	    	}    	            	

            }else{    
                http_response_code(401);
                output_header(false,"Token inválido");
                exit;			
            }
        }  		        
	}


	public function lista(){
        $dados = json_decode(file_get_contents('php://input'), true);	
		
	    if ($_SERVER['REQUEST_METHOD'] === 'GET')  {
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
	        $log = new Login();
	        if ($log->isValidToken($token)) {
            	try {
			        if (isset($dados['search']) && !empty($dados['search'])) {
			        	$search = $dados['search'];
	            	    $carta = new Cartas();
						$retorno = $carta->getNome($search);
						output_header(true,'Consulta Realizada',$retorno);
						exit;
			        } else {
	            	    $carta = new Cartas();
						$retorno = $carta->getAll();
						output_header(true,'Consulta Realizada',$retorno);
						exit;
			        }					
    	    	} catch (Exception $e) {
    	    		output_header(false,'Erro: '. $e);
    	    	}  
	        }else{
	            http_response_code(401);
	            output_header(false, 'Token invalido'. $token);
	            exit;	        	
	        }
	    }		
	}


	public function deck(){
        $dados = json_decode(file_get_contents('php://input'), true);	
		
	    if ($_SERVER['REQUEST_METHOD'] === 'GET')  {
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
	        $log = new Login();
	        if ($log->isValidToken($token)) {
            	try {
            	    $carta = new Cartas();
					$retorno = $carta->getDeck();
					output_header(true,'Consulta Realizada com sucesso',$retorno);
					exit;			
    	    	} catch (Exception $e) {
    	    		output_header(false,'Erro: '. $e);
    	    	}  
	        }else{
	            http_response_code(401);
	            output_header(false, 'Token invalido'. $token);
	            exit;	        	
	        }
	    }		
	}	
	
	public function cadastraDeck(){
        $dados = json_decode(file_get_contents('php://input'), true);	
		$cartas = $dados['idCarta'];

		
	    if ($_SERVER['REQUEST_METHOD'] === 'POST')  {
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
	        $log = new Login();
	        if ($log->isValidToken($token)) {
            	try {
            	    $carta = new Cartas();
					$retorno = $carta->postDeck($cartas);
					output_header(true,'Insert Realizado',$retorno);
					exit;			
    	    	} catch (Exception $e) {
    	    		output_header(false,'Erro: '. $e);
    	    	}  
	        }else{
	            http_response_code(401);
	            output_header(false, 'Token invalido'. $token);
	            exit;	        	
	        }
	    }		
	}	

	public function removeDeck(){
        $dados = json_decode(file_get_contents('php://input'), true);	
		$cartas = $dados['idCarta'];
	    if ($_SERVER['REQUEST_METHOD'] === 'DELETE')  {
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
	        $log = new Login();
	        if ($log->isValidToken($token)) {
            	try {
            	    $carta = new Cartas();
					$retorno = $carta->deleteDeck($cartas);
					output_header(true,'Delete Realizado',$retorno);
					exit;			
    	    	} catch (Exception $e) {
    	    		output_header(false,'Erro: '. $e);
    	    	}  
	        }else{
	            http_response_code(401);
	            output_header(false, 'Token invalido'. $token);
	            exit;	        	
	        }
	    }		
	}	


	public function login(){
	    if ($_SERVER['REQUEST_METHOD'] === 'GET')  {
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

	        if (!isValidToken($token)) {
	            http_response_code(401);
	            output_header(false, 'Token invalido');
	            exit;
	        } 
	    }

		output_header(true,'Consulta Realizada');
	}	
}