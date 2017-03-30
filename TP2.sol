 pragma solidity ^0.4.0;
contract Fidelitas {
    
    struct Carte {  // On crée un objet carte de fidélité
        uint8 idCarte;
        uint8 points;
    }
    
    Carte[] liste; // liste des cartes de fidelités
    
    uint8 numeroCarte = 0; //affectation d'un numéro de carte, qui sera incrémenté de 1 à chaque nouvelle carte   
    
    function creationCarte(){
        uint8 init = 0;
        if(caissier==msg.sender) //seulement s'il s'agit du caisier qui effectue la création
        {
            liste.push(Carte({idCarte:numeroCarte,points:init}));
            numeroCarte++;
        }
    }
    
 
    struct Client {                   // on crée une classe client
        
        uint8 numCarte;
        address delegate;
    }
    
    address caissier;   //Le caissier est celui qui execute le contrat

    Client[] registre; // liste des clients

    function Fidelitas (uint8 _numProposals) {  // definit la longueur de la liste de propositions constructeur
        caissier = msg.sender; // prend l'adresse de celui qui excecute
        liste = liste;
        registre = registre;
        
    }
   
    function ajoutClient(uint8 numeroDeLaCarte, address adresseDuClient){
           if(caissier==msg.sender)
        {
            registre.push(Client({numCarte:numeroDeLaCarte,delegate:adresseDuClient}));
            numeroCarte++;
        }
    }
    
    function ajoutPoints(uint8 num, uint8 nbPoints){
        uint i = 0;
        while(i<=liste.length)
        {
            if(liste[i].idCarte==num)
            {
                liste[i].points = liste[i].points + nbPoints;
            }
            i++;
        }
    }
}