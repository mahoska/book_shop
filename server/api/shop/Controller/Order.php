<?php

class Order extends Controller
{
    //work + client
    public function getOrder($params)
    {   
        if(($id_user  = (int) $params[0]) > 0){
           
            $model = new OrderModel();
            return  $model->getOrders($id_user);
        }else{
            return ['status'=>400, 'data'=>['there is not enough data']];
        }
    }
    
    //work
    public function postOrder($params){
        //???проверка на авторизацию
        //id_car, color, id_user, payment_method
        if(count($params) != 4){
            return ['status'=>400, 'data'=>['there is not enough data']];
        }
        $model = new OrderModel();
        return $model->createOrder($params); 
    }
    
    //work  //
    public function putOrder($params){
        //???можно сделать доп проверку - юзера ли это заказ -- 
        //if(count($params) != 2 )
            //return ['status'=>400, 'data'=>['there is not enough data']];
        $fparams = ['id_order' => $params->id_order, 'id_user'=>$params->id_user];
        
         $model = new OrderModel();
        return $model->updatetOrder($fparams); 
    }
}

