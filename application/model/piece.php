<?php

class Piece extends Db_object
{
    public $id;
    public $nom;
    public $id_client;
 

    protected static $db_table = "piece"; 
    protected static $db_table_fields = array("id", "nom", "id_client");


    /**
     * @param object $db A PDO database connection
     */
    function __construct()
    {
        
    }

}