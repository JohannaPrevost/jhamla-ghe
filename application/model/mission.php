<?php

class Mission extends Db_object
{
    public $id;
    public $date_debut;
    public $date_fin;
    public $etat;
    public $motif;
    public $id_technicien;
    public $id_client;


    protected static $db_table = "mission"; 
    protected static $db_table_fields = array("date_debut", "date_fin", "etat", "motif", "id_technicien", "id_client");


    /**
     * @param object $db A PDO database connection
     */
    function __construct()
    {
       
    }
    
    static public function fetch_missions($id_technicien){
        $sql = "SELECT * FROM mission WHERE date_fin = NULL AND id_technicien = {$id_technicien}";
        $results = Mission::find_by_query($sql);
        
    }

    public static function fetch_end_missions($id_technicien){
        $sql = "SELECT * FROM mission WHERE date_fin != NULL AND id_technicien = {$id_technicien}";
        $results = Mission::find_by_query($sql);
    }
    
    public function add_missions($id_technicien,$motif,$nom_client,$prenom_client){
        $sql = "SELECT id FROM Client WHERE nom = $nom_client AND prenom = $prenom_client";
        $id_client = find_by_query($sql);
        
        $sql = "INSERT INTO mission(id,date_debut,date_fin,etat,motif,id_technicien,id_client) VALUES ('',$date_debut,NULL,'en cours',$motif,$id_technicien,$id_client)";
        $database->query($sql);       
    }
    
    public function finished_mission($id_technicien,$date_fin){
        $sql = "INSERT INTO mission(id,date_debut,date_fin,etat,motif,id_technicien,id_client) VALUES ('','',$date_fin,'fini','',$id_technicien,'')";
        $database->query($sql); 
    }
}
