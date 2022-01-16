<?php

namespace App\Entidy;

use \App\Db\Database;

use \PDO;

class Caixa
{


    public $id;
    public $data;
    public $valor;
    public $forma_pagamento_id;
    public $usuario;

    public function cadastar()
    {


        $obdataBase = new Database('caixa');

        $this->id = $obdataBase->insert([

            'valor'                       => $this->valor,
            'usuarios_id'                 => $this->usuarios_id,
            'forma_pagamento_id'          => $this->forma_pagamento_id

        ]);

        return true;
    }



    public function atualizar()
    {
        return (new Database('caixa'))->update('id = ' . $this->id, [

            'valor'                       => $this->valor,
            'usuarios_id'                 => $this->usuarios_id,
            'forma_pagamento_id'          => $this->forma_pagamento_id
        ]);
    }


    public static function getList($fields = null, $table = null, $where = null, $order = null, $limit = null)
    {

        return (new Database('caixa'))->select($fields, $table, $where, $order, $limit)
            ->fetchAll(PDO::FETCH_CLASS, self::class);
    }



    public static function getQtd($fields = null, $table = null, $where = null, $order = null, $limit = null)
    {

        return (new Database('caixa'))->select('COUNT(*) as qtd', 'caixa', null, null)
            ->fetchObject()
            ->qtd;
    }


    public static function getID($fields, $table, $where, $order, $limit)
    {
        return (new Database('caixa'))->select($fields, $table, 'id = ' . $where, $order, $limit)
            ->fetchObject(self::class);
    }

  

    public function excluir()
    {
        return (new Database('caixa'))->delete('id = ' . $this->id);
    }


    public static function getUsuarioPorEmail($email)
    {

        return (new Database('caixa'))->select('email = "' . $email . '"')->fetchObject(self::class);
    }
}
