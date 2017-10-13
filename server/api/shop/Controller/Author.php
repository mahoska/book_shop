<?php

class Author extends Controller
{
    public function getAuthor($params)
    {   
        $model = new AuthorModel();
        return  $model->getAuthors();
    }
    
    
    public function postAuthor($params)
    {
        //$model = new AuthorModel();
        //return $model->createAuthor($params) ;
    }
    

    public function putAuthor($params){
        //$model = new AuthorModel();
        //return $model->updatetAuthor($fparams); 
    }
}

