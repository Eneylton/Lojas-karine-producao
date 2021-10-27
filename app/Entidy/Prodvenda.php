<?php

namespace App\Entidy;

use \App\Db\Database;

use \PDO;

class Prodvenda
{


 
    public $qtd ;
    public $valor ;
    public $codigo ;
    public $produtos_id ;
    public $clientes_id;
    public $forma_pagamento_id;
 
    

    public function cadastar()
    {


        $obdataBase = new Database('produto_venda');

        $this->id = $obdataBase->insert([

        
            'qtd '                   => $this->qtd ,
            'valor '                 => $this->valor ,
            'codigo '                => $this->codigo ,
            'produtos_id '           => $this->produtos_id ,
            'clientes_id'            => $this->clientes_id,
            'forma_pagamento_id'     => $this->forma_pagamento_id
          

        ]);

        return true;
    }

    public function atualizar()
    {
        return (new Database('produto_venda'))->update('id = ' . $this->id, [

          
            'qtd '                   => $this->qtd ,
            'valor '                 => $this->valor ,
            'codigo '                => $this->codigo ,
            'produtos_id '           => $this->produtos_id ,
            'clientes_id'            => $this->clientes_id,
            'forma_pagamento_id'     => $this->forma_pagamento_id
          
        ]);
    }


    public static function getList($fields = null, $table = null, $where = null, $order = null, $limit = null)
    {

        return (new Database('produto_venda'))->select($fields, $table, $where, $order, $limit)
            ->fetchAll(PDO::FETCH_CLASS, self::class);
    }



    public static function getQtd($fields = null, $table = null, $where = null, $order = null, $limit = null)
    {

        return (new Database('produto_venda'))->select('COUNT(*) as qtd', 'produto_venda', null, null)
            ->fetchObject()
            ->qtd;
    }


    public static function getID($fields, $table, $where, $order, $limit)
    {
        return (new Database('produto_venda'))->select($fields, $table, 'id = ' . $where, $order, $limit)
            ->fetchObject(self::class);
    }

   

    public function excluir()
    {
        return (new Database('produto_venda'))->delete('id = ' . $this->id);
    }


    public static function getUsuarioPorEmail($email)
    {

        return (new Database('produto_venda'))->select('email = "' . $email . '"')->fetchObject(self::class);
    }
}
