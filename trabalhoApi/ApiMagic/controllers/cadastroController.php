<?php
class cadastroController extends controller{ 

	private $dados;

	public function __construct(){
		parent::__construct();
		$this->dados = array();
	}
    public function cadastro(){

         try {        	

            $dados = json_decode(file_get_contents('php://input'), true);

			 if(isset($dados['usuario']) && !empty($dados['usuario'])){
			 	$usuario = $dados['usuario'];
			 }else{
			 	output_header(false,'Usuário não enviado');
			 } 

			 if(isset($dados['senha']) && !empty($dados['senha'])){
			 	$senha = $dados['senha'];
			 }else{
			 	output_header(false,'Senha não enviada');
			 }		         	
         	  
         	 $cadastra = new Cadastro();
         	 $retorno = $cadastra->cadastros($usuario, $senha);

			 output_header(true, 'OK', $retorno);

         } catch (PDOException $e) {
             output_header(false, "Erro ao conectar com o banco de dados: " . $e->getMessage());
         }        
    } 

}
