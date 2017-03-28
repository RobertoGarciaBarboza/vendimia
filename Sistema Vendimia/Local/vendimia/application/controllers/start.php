<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Start extends CI_Controller {
	public function __construct() {
        parent::__construct();
    }
	public function index()
	{
		//$this->load->view('header');
		//$this->load->view('inicio/ventas');
		//$this->load->view('footer');
		$this->load->view('index');
	}
	/*public function clientes(){
		$this->load->view('header');
		$this->load->view('inicio/clientes');
		$this->load->view('footer');
	}
	public function articulos(){
		$this->load->view('header');
		$this->load->view('inicio/articulos');
		$this->load->view('footer');
	}
	public function configuracion(){
		$this->load->view('header');
		$this->load->view('inicio/configuracion');
		$this->load->view('footer');
	}*/
}
