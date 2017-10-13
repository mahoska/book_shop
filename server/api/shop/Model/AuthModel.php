<?php

class AuthModel extends Model{

    //registration - work
    public function createUser($params)
    {
       try{
        $sth = $this->pdo->prepare('INSERT INTO users_rest( name, sname, login, password, status, time_life) '
                . 'VALUES ( :name, :sname, :login, :password, :status, :time_life)');
        $sth->execute($params);
        if($this->pdo->lastInsertId()>0)
             return ['status'=>200, 'data'=>$params['status']];//return id - for cookie
         else 
             return ['status'=>500, 'data'=>['user is not created']];
        }catch(PDOException $err){
            file_put_contents('errors.txt', $err->getMessage(), FILE_APPEND); 
            return ['status'=>500, 'data'=>['bad request']];
        } 
    } 
    
    //login - work
    public function setLogin($params)
    {
        try{
            $sth = $this->pdo->prepare("UPDATE `users_rest` "
                    . "SET `status` = :status, time_life = :time_life "
                    . " WHERE login = :login AND password =:password");
            $sth->execute($params);
            $count =  $sth->rowCount();
            if($count>0)
                return ['status'=>200, 'data'=>$params['status']];
             else 
                 return ['status'=>500, 'data'=>['user is not login']];
        }catch(PDOException $err){
            file_put_contents('errors.txt', $err->getMessage(), FILE_APPEND); 
            return ['status'=>500, 'data'=>['bad request']];
        }
    }
    
    //logout -????
    public function deleteLogin($id=false)
    {
        return ['status'=>200, 'data'=>1];
       /* try{
            
            $sth = $this->pdo->prepare("UPDATE `users_rest` SET `status` = 0  WHERE id = :id ");
            $sth->execute(['id'=>$id]);
            $count =  $sth->rowCount();
            if($count>0)
                return ['status'=>200, 'data'=>1];
             else 
                 return ['status'=>500, 'data'=>[]];
        }catch(PDOException $err){
            file_put_contents('errors.txt', $err->getMessage(), FILE_APPEND); 
            return ['status'=>500, 'data'=>[]];
        }*/
    }
    
    public function countUser(){
        $sth = $this->pdo->query("SELECT COUNT(*) FROM users_rest"); 
        $res = $sth->fetch(\PDO::FETCH_NUM);
        return $res[0];
    }
    
    public function isLoginExists($login){
         try{
            $sth = $this->pdo->prepare('SELECT  COUNT(*) FROM   users_rest WHERE login=:login');
            $sth->execute(['login' => $login]);    
            $res = $sth->fetch(\PDO::FETCH_NUM);
            if($res[0]>0) return false;
            return true;
        }catch(PDOException $err){
            file_put_contents('errors.txt', $err->getMessage(), FILE_APPEND); 
            return ['status'=>500, 'data'=>['bad request']];
        } 
    }
    
      public function isUser($params){
         try{
            $sth = $this->pdo->prepare('SELECT  COUNT(*) FROM   users_rest WHERE login=:login AND password=:password');
            $sth->execute($params);    
            $res = $sth->fetch(\PDO::FETCH_NUM);
            if($res[0]>0) return false;
            return true;
        }catch(PDOException $err){
            file_put_contents('errors.txt', $err->getMessage(), FILE_APPEND); 
            return ['status'=>500, 'data'=>['bad request']];
        } 
      }
      
        public function isLogin($params){
             $sth = $this->pdo->prepare('SELECT  time_life, id  FROM   users_rest WHERE status=:status AND login=:login');
             $sth->execute($params);    
             return  $sth->fetch(\PDO::FETCH_ASSOC);
             //return $res[0];
        }
    }
    




