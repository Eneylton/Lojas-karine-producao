<?php

namespace App\Entidy;

use \App\Db\Database;

use \PDO;

class Clientes
{


    public $id;
    public $nome;
    public $telefone;
    public $email;
    public $localidade;
    public $logradouro;
    public $complemento;
    public $numero;
    public $bairro;
    public $cep;
    public $uf;

    public function cadastar()
    {


        $obdataBase = new Database('clientes');

        $this->id = $obdataBase->insert([

        'nome'              => $this->nome,
        'telefone'          => $this->telefone,
        'email'             => $this->email,
        'localidade'        => $this->localidade,
        'logradouro'        => $this->logradouro,
        'numero'            => $this->numero,
        'bairro'            => $this->bairro,
        'cep'               => $this->cep,
        'complemento'       => $this->complemento,
        'uf'                => $this->uf

        ]);

        return true;
    }

    public function atualizar()
    {
        return (new Database('clientes'))->update('id = ' . $this->id, [

        'nome'              => $this->nome,
        'telefone'          => $this->telefone,
        'email'             => $this->email,
        'localidade'        => $this->localidade,
        'logradouro'        => $this->logradouro,
        'numero'            => $this->numero,
        'bairro'            => $this->bairro,
        'cep'               => $this->cep,
        'complemento'       => $this->complemento,
        'uf'                => $this->uf
        ]);
    }


    public static function getList($fields = null, $table = null, $where = null, $order = null, $limit = null)
    {

        return (new Database('clientes'))->select($fields, $table, $where, $order, $limit)
            ->fetchAll(PDO::FETCH_CLASS, self::class);
    }



    public static function getQtd($fields = null, $table = null, $where = null, $order = null, $limit = null)
    {

        return (new Database('clientes'))->select('COUNT(*) as qtd', 'clientes', null, null)
            ->fetchObject()
            ->qtd;
    }


    public static function getID($fields, $table, $where, $order, $limit)
    {
        return (new Database('clientes'))->select($fields, $table, 'id = ' . $where, $order, $limit)
            ->fetchObject(self::class);
    }



    public function excluir()
    {
        return (new Database('clientes'))->delete('id = ' . $this->id);
    }


  
    public static function getEmail($fields = null, $table = null, $where = null, $order = null, $limit = null)
    {

        return (new Database('clientes'))->select($fields, $table, $where, $order, $limit)
        ->fetchObject(self::class);
    }

}
