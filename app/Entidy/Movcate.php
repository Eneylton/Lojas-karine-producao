<?php

namespace App\Entidy;

use \App\Db\Database;

use \PDO;

class Movcate
{


    public $id;
    public $nome;

    public function cadastar()
    {


        $obdataBase = new Database('mov_cat');

        $this->id = $obdataBase->insert([

            'nome'              => $this->nome

        ]);

        return true;
    }


    public static function getList($fields = null, $table = null, $where = null, $order = null, $limit = null)
    {

        return (new Database('mov_cat'))->select($fields, $table, $where, $order, $limit)
            ->fetchAll(PDO::FETCH_CLASS, self::class);
    }



    public static function getQtd($fields = null, $table = null, $where = null, $order = null, $limit = null)
    {

        return (new Database('mov_cat'))->select('COUNT(*) as qtd', 'mov_cat', null, null)
            ->fetchObject()
            ->qtd;
    }


    public static function getID($fields, $table, $where, $order, $limit)
    {
        return (new Database('mov_cat'))->select($fields, $table, 'id = ' . $where, $order, $limit)
            ->fetchObject(self::class);
    }

    public function atualizar()
    {
        return (new Database('mov_cat'))->update('id = ' . $this->id, [

            'nome'              => $this->nome
        ]);
    }

    public function excluir()
    {
        return (new Database('mov_cat'))->delete('id = ' . $this->id);
    }


    public static function getUsuarioPorEmail($email)
    {

        return (new Database('mov_cat'))->select('email = "' . $email . '"')->fetchObject(self::class);
    }
}
