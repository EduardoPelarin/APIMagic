<?php
class notfoundController extends controller{ 

	private $dados;

	public function __construct(){
		parent::__construct();
		$this->dados = array();
	}

	public function index(){
		output_header(false,'erro 404');		
	}

}