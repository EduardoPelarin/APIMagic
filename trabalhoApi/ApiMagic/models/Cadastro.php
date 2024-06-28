<?php
class Cadastro extends model{

	public function gerarToken() {
    	return bin2hex(random_bytes(16));
	}		

    public function cadastros($usuario, $senha){

         try {	
         	 $gerToken = $this->gerarToken();
             $sql =  $this->db->prepare("INSERT INTO usuarios(usuario, senha, token)  VALUES(:usuario, :senha, :token)");
             $sql->bindParam(":usuario", $usuario);
             $sql->bindParam(":senha", $senha);
             $sql->bindParam(":token", $gerToken);
             $sql->execute();

			return $gerToken;

         } catch (PDOException $e) {
             return "Erro ao conectar com o banco de dados: " . $e->getMessage();
         }        
    } 

}