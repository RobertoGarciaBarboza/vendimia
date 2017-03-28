<?php defined('BASEPATH') OR exit('No direct script access allowed');
class Database_controller extends CI_Controller {
	public function __construct(){
        parent::__construct();
        $this->load->model("database_model");
    }
	public function index()
	{
		redirect('404');
	}
	/*Function For Insert To->Models*/
	public function InsertSale(){
		$model = $this->input->post('model');
		$query  = $this->database_model->AddSale($model);
		json($query);
	}
	public function InsertClient(){
		$model = $this->input->post('model');
		$query  = $this->database_model->AddClient($model);
		json($query);
	}
	public function InsertArticle(){
		$model = $this->input->post('model');
		$query  = $this->database_model->AddArticle($model);
		json($query);
	}
	public function InsertConfig(){
		$model = $this->input->post('model');
		$query  = $this->database_model->AddConfig($model);
		json($query);
	}
	/*Functions for Search To->Models*/
	public function GetSales(){
		$data  = $this->database_model->SearchSales();
		json($data);
	}
	public function GetClients(){
		$data  = $this->database_model->SearchClients();
		json($data);
	}
	public function GetArticles(){
		$data  = $this->database_model->SearchArticles();
		json($data);
	}
	public function GetConfig(){
		$data  = $this->database_model->SearchConfig();
		json($data);
	}
	public function GetLastIdArticles(){
		$data  = $this->database_model->SearchLastIdArticle();
		json($data);
	}
	public function GetLastIdClient(){
		$data  = $this->database_model->SearchLastIdClient();
		json($data);
	}
	public function GetLastIdSale(){
		$data  = $this->database_model->SearchLastIdSale();
		json($data);
	}
	/*Fuction for Search Last Id*/
}
