<?php

namespace App\Entidy;

use \App\Db\Database;

use \PDO;

class Movimentacao   
{

    public $id;
    public $data;
    public $valor;
    public $troco;
    public $descricao;
    public $tipo;
    public $status;
    public $usuarios_id;
    public $catdespesas_id;
    public $forma_pagamento_id;
    public $caixa_id ;

    public function cadastar()
    {


        $obdataBase = new Database('movimentacoes');

        $this->id = $obdataBase->insert([

            'valor'                 => $this->valor,
            'data'                  => $this->data,
            'troco'                 => $this->troco,
            'forma_pagamento_id'    => $this->forma_pagamento_id,
            'tipo'                  => $this->tipo,
            'status'                => $this->status,
            'descricao'             => $this->descricao,
            'usuarios_id'           => $this->usuarios_id,
            'catdespesas_id'        => $this->catdespesas_id,
            'caixa_id '             => $this->caixa_id 

        ]);

        return true;
    }


    public function atualizar()
    {
        return (new Database('movimentacoes'))->update('id = ' . $this->id, [

            'valor'                 => $this->valor,
            'data'                  => $this->data,
            'troco'                 => $this->troco,
            'forma_pagamento_id'    => $this->forma_pagamento_id,
            'tipo'                  => $this->tipo,
            'status'                => $this->status,
            'descricao'             => $this->descricao,
            'usuarios_id'           => $this->usuarios_id,
            'catdespesas_id'        => $this->catdespesas_id,
            'caixa_id '             => $this->caixa_id
        ]);
    }

    public static function getList($fields = null, $table = null, $where = null, $order = null, $limit = null)
    {

        return (new Database('movimentacoes'))->select($fields, $table, $where, $order, $limit)
            ->fetchAll(PDO::FETCH_CLASS, self::class);
    }

    public static function getListOne($fields = null, $table = null, $where = null, $order = null, $limit = null)
    {

        return (new Database('movimentacoes'))->select($fields, $table, $where, $order, $limit)
        ->fetchObject(self::class);
    }



    public static function getQtd($fields = null, $table = null, $where = null, $order = null, $limit = null)
    {

        return (new Database('movimentacoes'))->select('COUNT(*) as qtd', 'movimentacoes', null, null)
            ->fetchObject()
            ->qtd;
    }


    public static function getID($fields, $table, $where, $order, $limit)
    {
        return (new Database('movimentacoes'))->select($fields, $table, 'id = ' . $where, $order, $limit)
            ->fetchObject(self::class);
    }


    public function excluir()
    {
        return (new Database('movimentacoes'))->delete('id = ' . $this->id);
    }


    public static function getUsuarioPorEmail($email)
    {

        return (new Database('movimentacoes'))->select('email = "' . $email . '"')->fetchObject(self::class);
    }
}
