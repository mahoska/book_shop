<?php

class Auth extends Controller
{
    
    public function getAuth($params)
    {
       // return ['status'=>200,'data'=>$param];
         if(count($params) != 2){
             return ['status'=>400, 'data'=>['there is not enough data']];
        }
         $model = new AuthModel();
         $data = $model->isLogin(['login'=>$params[1],'status'=>$params[0]]);
         $time_life = $data['time_life'];
         $time_now =  time();
        //return['time'=>$time_now, 'life'=>$time_life];

        if($time_life > $time_now){
            return ['status'=>200, 'data'=>$data['id']];
        }
        return ['status'=>400, 'data'=>['hesh is not valid']];
    }
    
    public function postAuth($params)
    {
        if(count($params) != 4){
           //return ['status'=>200, 'data'=>['there is not enough data']]; 
            return ['status'=>400, 'data'=>['there is not enough data']];
        }
          
        $model = new AuthModel();
        $isUser = $model->isLoginExists($params['login']);
        if(!$isUser)
            return ['status'=>400, 'data'=>['login already exists']];
        
        $params['status'] = $this->setHash();
        $params['time_life'] =  time()+LIFE_ACTIVE_LOGIN;//1507554709
        $pass = md5($params['password']);
        $str= 'passsolt';
        $str = md5($str);
        $pass_db = md5($params['password'].$str);
        $params['password'] = $pass_db;

        return $model->createUser($params);
    }
    
    //active+life
     public function putAuth($params)
    {
       // return ['status'=>200, 'data'=>$params];
         //return ['status'=>200, 'data'=>$params['login']];
           // if(count($params) != 2){
              //  return ['status'=>400, 'data'=>['there is not enough data']];
           // }


            $pass = md5($params->password);
            $str= 'passsolt';
            $str = md5($str);
            $pass_db = md5($params->password.$str);
            $fparams['password'] = $pass_db;

            $model = new AuthModel();
            $isUser = $model->isUser(['login'=>$params->login,'password'=>$params->password]);
            if(!$isUser)
                return ['status'=>400, 'data'=>['user not exists']];

            $fparams['login']= $params->login;
            $fparams['status'] = $this->setHash(); 
            $fparams['time_life'] =  time()+LIFE_ACTIVE_LOGIN;
            return $model->setLogin($fparams);
    }
    

    private function setHash(){
        $model = new AuthModel();
        $countUsers = $model->countUser();
        //generate rand string
        $randStr = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
        $rand = '';
        for($i=0; $i<5; $i++) {
            $key = rand(0, strlen($randStr)-1);
            $rand .= $randStr[$key];
        }
        
        return md5($rand.$countUsers);
    }


}
