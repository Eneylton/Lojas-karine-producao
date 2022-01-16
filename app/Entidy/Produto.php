<?php

namespace App\Entidy;

use \App\Db\Database;

use \PDO;

class Produto
{


    public $id;
    public $codigo;
    public $data;
    public $barra;
    public $nome;
    public $foto;
    public $usuarios_id;
    public $qtd;
    public $categorias_id;
    public $estoque;
    public $aplicacao;
    public $valor_compra;
    public $valor_venda;

   


    public function cadastar()
    {


        $obdataBase = new Database('produtos');

        $this->id = $obdataBase->insert([

            'codigo'                  => $this->codigo,
            'data'                    => $this->data,
            'barra'                   => $this->barra,
            'nome'                    => $this->nome,
            'foto'                    => $this->foto,
            'usuarios_id'             => $this->usuarios_id,
            'qtd'                     => $this->qtd,
            'categorias_id'           => $this->categorias_id,
            'estoque'                 => $this->estoque,
            'aplicacao'               => $this->aplicacao,
            'valor_compra'            => $this->valor_compra,
            'valor_venda'             => $this->valor_venda
          

        ]);

        return true;
    }

    
    public function atualizar()
    {
        return (new Database('produtos'))->update('id = ' . $this->id, [

            'codigo'                  => $this->codigo,
            'data'                    => $this->data,
            'barra'                   => $this->barra,
            'nome'                    => $this->nome,
            'foto'                    => $this->foto,
            'usuarios_id'             => $this->usuarios_id,
            'qtd'                     => $this->qtd,
            'categorias_id'           => $this->categorias_id,
            'estoque'                 => $this->estoque,
            'aplicacao'               => $this->aplicacao,
            'valor_compra'            => $this->valor_compra,
            'valor_venda'             => $this->valor_venda

        ]);
    }


    public static function getList($fields = null,$table = null,$where = null, $order = null, $limit = null)
    {

        return (new Database('produtos'))->select($fields,$table, $where, $order, $limit)
            ->fetchAll(PDO::FETCH_CLASS, self::class);
    }



    public static function getQtd($fields = null, $table = null, $where = null, $order = null, $limit = null)
    {

        return (new Database('produtos'))->select('COUNT(*) as qtd', 'produtos',null,null)
            ->fetchObject()
            ->qtd;
    }


    public static function getID($fields, $table, $where, $order, $limit)
    {
        return (new Database('produtos'))->select($fields, $table, 'id = ' . $where, $order, $limit)
            ->fetchObject(self::class);
    }


    public static function getBarra($fields, $table, $where, $order, $limit)
    {
        return (new Database('produtos'))->select2($fields, $table, 'barra LIKE "%' . $where, $order, $limit)
            ->fetchObject(self::class);
    }


    public function excluir()
    {
        return (new Database('produtos'))->delete('id = ' . $this->id);
    }

    public static function getUsuarioPorEmail($email)
    {

        return (new Database('produtos'))->select('email = "' . $email . '"')->fetchObject(self::class);
    }
}
