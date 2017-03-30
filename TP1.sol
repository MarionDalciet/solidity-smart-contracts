pragma solidity ^0.4.0;

// Nom du contrat
contract SafeVote {

    address respo; // responsable du bureau de vote, celui qui execute le contrat. address permet de désigner une adresse Ethereum (20bytes).

    
    struct Voter {    // on crée l'"objet" électeur

        bool voted; // on sait s'il a deja voté ( true) ou pas ( false)
        uint bulletin; // l'id du choix pour lequel il a décidé de voter
        address delegate;  // son adresse ethereum
    }

    
    
    // on créer un objet choix qui contient l'id du choix plus le nombre de voix qu'on va incrémenter au fur et a mesure
    
    struct Choix {     // On crée l'objet choix
     uint idbulletin;
     uint NbVote;

    }
    
    Choix[] liste_choix ; // on crée une liste des propostions possibles et du nombre de voix correspondant
    
    function ajoutChoix( uint choix)    // créer une focntion qui remplit cette liste au fur et a mesure qu'on ajoute des voteurs

    {
        uint i=0;
        if(msg.sender==respo)
        {
            liste_choix.push(Choix({idbulletin:choix,NbVote:0}));
        }
    }
    
    
    Voter[] voters;
    
        function ajoutVotant( uint choix, address adresse)    // créer une focntion qui remplit cette liste au fur et a mesure qu'on ajoute des voteurs

    {
        uint i=0;
        if(msg.sender==respo)
        {
            voters.push(Voter({voted:false,bulletin:choix,delegate:adresse}));
        }
    }
    
   
        function SafeVote()
    {
        respo=msg.sender;
        liste_choix= liste_choix;
        voters=voters;
        
    }
        

    
    function vote() // on parcours la liste des votants et pour chaque votant on implemente l'objet de la liste de choix correspondant a son choix
    {
        
        for (uint i = 0; i < voters.length; i++) // pour chaque électeur de la liste 
        
        {
            
            for (uint j= 0; j < liste_choix.length; j++) // on trouve le bulletin correspondant à son choix 
            {
                if(voters[i].bulletin == liste_choix[j].idbulletin)
                {
                    liste_choix[j].NbVote += 1; // et on rajoute une voix pour ce choix
                }
            }
            
        voters[i].voted = true; // l'électeur a voté. 
            
        }
        
    }
    
    Choix gagnant;
    
        function Resultat()
    {
        uint i=0;
        uint maxdevote=0;
       
        while(i<=liste_choix.length)
        {
            if(liste_choix[i].NbVote>=maxdevote)
            {
                maxdevote=liste_choix[i].NbVote;
            }
          i=i+1;  
        }
        if(liste_choix[i].idbulletin==i)
        {
            gagnant=liste_choix[i];
        }
    }
    
    event finduvote(uint Tempsduvote);
    
}