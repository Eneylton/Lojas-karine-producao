<?php

namespace App\Entidy;

use \App\Db\Database;

use \PDO;

class Catdespesa
{


    public $id;
    public $nome;

    public function cadastar()
    {


        $obdataBase = new Database('catdespesas');

        $this->id = $obdataBase->insert([

            'nome'              => $this->nome

        ]);

        return true;
    }

    
    public function atualizar()
    {
        return (new Database('catdespesas'))->update('id = ' . $this->id, [

            'nome'              => $this->nome
        ]);
    }


    public static function getList($fields = null, $table = null, $where = null, $order = null, $limit = null)
    {

        return (new Database('catdespesas'))->select($fields, $table, $where, $order, $limit)
            ->fetchAll(PDO::FETCH_CLASS, self::class);
    }



    public static function getQtd($fields = null, $table = null, $where = null, $order = null, $limit = null)
    {

        return (new Database('catdespesas'))->select('COUNT(*) as qtd', 'catdespesas', null, null)
            ->fetchObject()
            ->qtd;
    }


    public static function getID($fields, $table, $where, $order, $limit)
    {
        return (new Database('catdespesas'))->select($fields, $table, 'id = ' . $where, $order, $limit)
            ->fetchObject(self::class);
    }


    public function excluir()
    {
        return (new Database('catdespesas'))->delete('id = ' . $this->id);
    }


    public static function getUsuarioPorEmail($email)
    {

        return (new Database('catdespesas'))->select('email = "' . $email . '"')->fetchObject(self::class);
    }
}
