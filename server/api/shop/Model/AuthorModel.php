<?php

class AuthorModel extends Model
{
public function createAuthor($params)
{
    /*try{
        $sth = $this->pdo->prepare('INSERT INTO orders_rest (id_car, color, id_user, payment_method) '
                . 'VALUES (:id_car, :color, :id_user, :payment_method)');
        $sth->execute($params);
        if($this->pdo->lastInsertId()>0)
             return ['status'=>200, 'data'=>1];
         else 
             return ['status'=>500, 'data'=>[]];
    }catch(PDOException $err){
        file_put_contents('errors.txt', $err->getMessage(), FILE_APPEND); 
        return ['status'=>500, 'data'=>[]];
    }*/
}

public function getAuthors()
{
    try{
        $sth = $this->pdo->query('SELECT id, name, surname FROM author');
        $collection['data'] = $this->getFetchAccoss($sth);
        $collection ['status'] = 200;
        return $collection;
    }catch(PDOException $err){
        file_put_contents('errors.txt', $err->getMessage(), FILE_APPEND); 
        return ['status'=>500, 'data'=>[]];
    }
}

//id_user, id_order
public function updatetAuthor($params)
{
    /* try{
        $sth = $this->pdo->prepare("UPDATE `orders_rest` SET `status` = 0 WHERE id = :id_order AND id_user=:id_user");
        $sth->execute($params);
        $count =  $sth->rowCount();
        if($count>0)
            return ['status'=>200, 'data'=>['order_update']];
         else 
             return ['status'=>500, 'data'=>['error update']];
    }catch(PDOException $err){
        file_put_contents('errors.txt', $err->getMessage(), FILE_APPEND); 
        return ['status'=>500, 'data'=>[]];
    }*/
}

}
