<?php 

class Ganre  extends Controller
{
    //work + client
    public function getGanre($params = false)
    {
        $model = new GanreModel();
        return  $model->getGanres();
    }


    public function postGanre($params  = false){}

        public function putGanre($params  = false){}

        public function deleteGanre($params  = false){}

}
