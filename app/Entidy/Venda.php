<?php

namespace App\Entidy;

use \App\Db\Database;

use \PDO;

class Venda
{

    public $id;
    public $data;
    public $codigo;
    public $usuarios_id;
    public $clientes_id;
    public $forma_pagamento_id;
    public $recebido;
    public $troco;
    public $tipo_id;
    public $mov_cat_id;

    public function cadastar()
    {


        $obdataBase = new Database('vendas');

        $this->id = $obdataBase->insert([

            'codigo'                    => $this->codigo,
            'data'                      => $this->data,
            'usuarios_id'               => $this->usuarios_id,
            'clientes_id'               => $this->clientes_id,
            'forma_pagamento_id'        => $this->forma_pagamento_id,
            'recebido'                  => $this->recebido,
            'troco'                     => $this->troco,
            'mov_cat_id'                => $this->mov_cat_id,
            'tipo_id'                   => $this->tipo_id

        ]);

        return true;
    }


    public function atualizar()
    {
        return (new Database('vendas'))->update('id = ' . $this->id, [
            
            'codigo'                    => $this->codigo,
            'data'                      => $this->data,
            'usuarios_id'               => $this->usuarios_id,
            'clientes_id'               => $this->clientes_id,
            'forma_pagamento_id'        => $this->forma_pagamento_id,
            'recebido'                  => $this->recebido,
            'troco'                     => $this->troco,
            'mov_cat_id'                => $this->mov_cat_id,
            'tipo_id'                   => $this->tipo_id
        ]);
    }

    public static function getList($fields = null, $table = null, $where = null, $order = null, $limit = null)
    {

        return (new Database('vendas'))->select($fields, $table, $where, $order, $limit)
            ->fetchAll(PDO::FETCH_CLASS, self::class);
    }



    public static function getQtd($fields = null, $table = null, $where = null, $order = null, $limit = null)
    {

        return (new Database('vendas'))->select('COUNT(*) as qtd', 'vendas', null, null)
            ->fetchObject()
            ->qtd;
    }


    public static function getID($fields, $table, $where, $order, $limit)
    {
        return (new Database('vendas'))->select($fields, $table, 'id = ' . $where, $order, $limit)
            ->fetchObject(self::class);
    }

  

    public function excluir()
    {
        return (new Database('vendas'))->delete('id = ' . $this->id);
    }


    public static function getUsuarioPorEmail($email)
    {

        return (new Database('vendas'))->select('email = "' . $email . '"')->fetchObject(self::class);
    }
}
