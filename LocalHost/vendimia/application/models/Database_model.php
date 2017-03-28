<?php defined('BASEPATH') OR exit('No direct script access allowed');
class Database_model extends CI_MODEL{
    public function __construct() {
        parent::__construct();
        $this->load->database();
    }
    public function index()
	{
		redirect('404');
	}
    /*Functions For Insert Database*/
    function AddSale($data){
        $query = $this->db->query("call int_catventasAgregar('".$data['id_venta']."','".$data['id_cliente']."','".$data['total']."','".$data['plazos']."')");
        $res = $query->result_array();
        $query->next_result();
        $query->free_result();


        for($i=0; $i<count($data['totalArticulos']);$i++){
                $query = $this->db->query("call int_catarticulosAgregar('".$data['articulos'][$i]."','','','','".$data['cantidadArticulos'][$i]."','1')");
                $res = $query->result_array();
                $query->next_result();
                $query->free_result();
        }
        
        for($i=0; $i<count($data['articulos']);$i++){
                $query = $this->db->query("call int_catventas_DetalleAgregar('".$data['id_venta']."','".$data['articulos'][$i]."','".$data['totalArticulos'][$i]."')");
                $res = $query->result_array();
                $query->next_result();
                $query->free_result();
        }
        
        return $res;
    }
    function AddClient($data){
        $id_cliente = (isset($data['id_cliente']))?$data['id_cliente']:'';
        $query = $this->db->query("call int_catclientesAgregar('".$id_cliente."','".$data['apepaterno']."','".$data['apematerno']."','".$data['nombre']."','".$data['rfc']."')");
        return $query->result();
    }
    function AddArticle($data){
        $id_articulo = (isset($data['id_articulo']))?$data['id_articulo']:'';
        $query = $this->db->query("call int_catarticulosAgregar('".$id_articulo."','".$data['descripcion']."','".$data['modelo']."','".$data['precio']."','".$data['existencia']."','0')");
        return $query->result();
    }
    function AddConfig($data){
        $query = $this->db->query("call acc_configuracionAgregar('".$data['tasa']."','".$data['enganche']."','".$data['plazo']."')");
        return $query->result();
    }
    /*Functions For Consult Database*/
    function SearchSales(){
        $query = $this->db->query("call int_catventasConsultar()");
        return $query->result();
    }
    function SearchClients(){
        $query = $this->db->query("call int_catclientesConsultar()");
        return $query->result();
    }
    function SearchArticles(){
        $query = $this->db->query("call int_catarticulosConsultar()");
        return $query->result();
    }
    function SearchConfig(){
        $query = $this->db->query("call acc_configuracionConsultar()");
        return $query->result();
    }
    function SearchLastIdArticle(){
        $query = $this->db->query("call int_catarticulosConsultarLastId()");
        return $query->result();
    }
    function SearchLastIdClient(){
        $query = $this->db->query("call int_catclientesConsultarLastId()");
        return $query->result();
    }
    function SearchLastIdSale(){
        $query = $this->db->query("call int_catventasConsultarLastId()");
        return $query->result();
    }
}
?>