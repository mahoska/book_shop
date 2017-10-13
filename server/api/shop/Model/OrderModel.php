<?php

class OrderModel extends Model{



/*
function of pre-ordering a car
     (Car ID, name, surname of the buyer, payment method.
     Payment method enumeration of "credit card", "cash")
*/
public function createOrder($params)
{
    try{
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
    }
}

public function getOrders($id)
{
    try{
        $sth = $this->pdo->prepare('SELECT cars_rest.id as id_car, orders_rest.id as id_order,'
                . '  models_rest.name, cars_rest.year_of_issue, cars_rest.engine_capacity, '
                . 'cars_rest.max_speed,cars_rest.price, cars_rest.img, orders_rest.color, orders_rest.status '
                . 'FROM models_rest JOIN (cars_rest JOIN orders_rest ON cars_rest.id = orders_rest.id_car) ON models_rest.id = cars_rest.id_model '
                . 'WHERE orders_rest.id_user = :id_user AND orders_rest.status = 1');
        $sth->execute(['id_user' => $id]);
        $orders['data'] = $this->getFetchAccoss($sth);
        $orders ['status'] = 200;
        return $orders;
    }catch(PDOException $err){
        file_put_contents('errors.txt', $err->getMessage(), FILE_APPEND); 
        return ['status'=>500, 'data'=>[]];
    }
}

//id_user, id_order
public function updatetOrder($params)
{
     try{
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
    }
}

}
