#include "grille.h"
#include <cstdlib>
#include <QString>
#include <QList>
#include <fstream> // flux vers les fichiers pour lecture et écriture.

Grille::Grille(QObject *parent) : QObject(parent)
{
    Grille::Init();
//création du tableau.
tab.clear();
for (int i=0;i<16;i++){
    tab.push_back(QString::number(fGrille[i%4][i-4*(i%4)]));
}

//Création de la liste de couleurs
colors.clear();
colors<<"#dcd8c9"<<"#d7d0b4"<<"#ea6f37"<<"#ea6f37"<<"#ea6f37"<<"#e94a2c"<<"#ebcb31"<<"#ebcb31"<<"#e9c81e"<<"#e9c81e"<<"#fdc66c"<<"#d260bf";

//mise à 0 des valeurs :
//emit grlChanged();
//emit colorsChanged();
//emit bstChanged();
//emit scrChanged();
//emit csgnChanged();
//inutiles dans le constructeur.
}

void Grille::Init(){
    //initialisation de la police, couleurs, nombres de coups et score aux valeurs initiales :
    font="Tahoma";
    nbcoup=0;
    nbcoupbest=0;
    //initialisation des scores:
    score=0;
    best=0;
    consigne=0;//"Join the numbers and get to the 2048 tile !"
    //initialisation de la matrice à 0
    for (int i=0;i<4;i++){
        for(int j=0; j<4;j++){
            fGrille[i][j]=0;
        }
    }
    //appeler 2 fois ajouttuile pour ajouter 2 tuiles qui seront le point de départ du jeu.
    Grille::ajouttuile();
    Grille::ajouttuile();
    //On sauvegarde la grille initiale :
    Grille::save();
}

//les méthodes haut, bas, gauche et droite correspondent aux déplacements des tuiles avec les flèches :
//les commentaires ont été ajoutés uniquement pour la méthode haut, mais ils sont identiques pour les suivantes.

void Grille::haut(){
    //Le booléen test permet d'indiquer, si on doit rajouter une tuile à l'ppui du'ne des 4 flèches
    //si test est true, alors il faut rajouter une tuile en appelant ajouttuile
    //sinon, il ne faut pas ajouter de tuile.

    //test passe à true lorsque un déplacement a été fait, ou une fusion de deux tuiles a été faite :
    //la deuxième condition dans chaque if permet de garder test=false lorsque les cases sont vides,
    //c'est-à-dire (=0), mais que la condition 1 est bien respectée.
    bool test=false;

    //cette première boucle décale les chiffres s'il y a des cases vides (=0)
    for (int j=0;j<4;j++){
        if (fGrille[2][j]==0 && fGrille[3][j]!=0)
        {fGrille[2][j]=fGrille[3][j];
         fGrille[3][j]= 0;
        test=true;
        }
        if (fGrille[1][j]==0 && (fGrille[2][j]!=0 || fGrille[3][j]!=0))
        {fGrille[1][j]=fGrille[2][j];
         fGrille[2][j]=fGrille[3][j];
         fGrille[3][j]=0;
        test=true;
        }
        if (fGrille[0][j]==0 && (fGrille[1][j]!=0 || fGrille[2][j]!=0 || fGrille[3][j]!=0))
        {fGrille[0][j]=fGrille[1][j];
         fGrille[1][j]=fGrille[2][j];
         fGrille[2][j]=fGrille[3][j];
         fGrille[3][j]=0;
        test=true;
        }
    };
    //Cette deuxième boucle fusionne les cases qui peuvent l'être
    //si des cases ont fusionné, test=true.
    for (int i=0;i<4;i++){
        if (fGrille[1][i]==fGrille[0][i] && fGrille[1][i]!=0)//teste si les deux chiffres les plus en haut sont égaux
        {fGrille[0][i]+=fGrille[1][i];
            score+=2*fGrille[1][i];
            if (fGrille[3][i]==fGrille[2][i])// teste si les deux autres chiffres sont égaux
            {fGrille[1][i]=fGrille[3][i]+fGrille[2][i];
                score+=2*fGrille[2][i];
            fGrille[3][i]=0;
            fGrille[2][i]=0;}
            else {fGrille[1][i]=fGrille[2][i];// teste si les deux chiffres du centre sont égaux
                fGrille[2][i]=fGrille[3][i];
                fGrille[3][i]=0;
            }
        test=true;
        }
        else {
            if(fGrille[2][i]==fGrille[1][i] && fGrille[2][i]!=0)//teste si les deux chiffres en bas sont égaux
            {fGrille[1][i]=fGrille[1][i]+fGrille[2][i];
                score+=2*fGrille[2][i];
                fGrille[2][i]=fGrille[3][i];
                fGrille[3][i]=0;
                test=true;
            }
            else if(fGrille[3][i]==fGrille[2][i] && fGrille[3][i]!=0)
            {fGrille[2][i]+=fGrille[3][i];
                score+=2*fGrille[3][i];
            fGrille[3][i]=0;
            test=true;
            }
        }}
    //une fois qu'on a fait les déplacements, on ajoute une tuile.
    //ATTENTION si aucun déplacement n'est fait malgré l'appui sur une touche, il ne faut pas ajouter de nouvelle tuile.
    if (test==true) //un déplacement est fait :
    {
        nbcoup++;
        Grille::ajouttuile(); //on ajoute une tuile
        Grille::save();
    }
    Grille::win();
    Grille::Best();
    Grille::lose();
    emit nbcoupChanged();
    emit grlChanged();//signal de changement de grille
    emit scrChanged();
}

void Grille::bas(){
    bool test=false;
    for (int j=0;j<4;j++){
        if (fGrille[1][j]==0 && fGrille[0][j]!=0)
        {fGrille[1][j]=fGrille[0][j];
         fGrille[0][j]= 0;
        test=true;}
        if (fGrille[2][j]==0 && (fGrille[0][j]!=0 || fGrille[1][j]!=0))
        {fGrille[2][j]=fGrille[1][j];
         fGrille[1][j]=fGrille[0][j];
         fGrille[0][j]=0;
        test=true;}
        if (fGrille[3][j]==0 && (fGrille[0][j]!=0 || fGrille[1][j]!=0 || fGrille[2][j]!=0))
        {fGrille[3][j]=fGrille[2][j];
         fGrille[2][j]=fGrille[1][j];
         fGrille[1][j]=fGrille[0][j];
         fGrille[0][j]=0;
        test=true;}
    };
    for (int i=0;i<4;i++){
        if (fGrille[2][i]==fGrille[3][i] && fGrille[3][i]!=0)
        {fGrille[3][i]+=fGrille[2][i];
            score+=2*fGrille[2][i];
            if (fGrille[0][i]==fGrille[1][i])
            {fGrille[2][i]=fGrille[0][i]+fGrille[1][i];
                score+=2*fGrille[1][i];
            fGrille[0][i]=0;
            fGrille[1][i]=0;}
            else {fGrille[2][i]=fGrille[1][i];
                fGrille[1][i]=fGrille[0][i];
                fGrille[0][i]=0;
            }
        test=true;}
        else {
            if(fGrille[1][i]==fGrille[2][i] && fGrille[1][i]!=0)
            {fGrille[2][i]=fGrille[2][i]+fGrille[1][i];
                score+=2*fGrille[1][i];
                fGrille[1][i]=fGrille[0][i];
                fGrille[0][i]=0;
                test=true;
            }
            else if(fGrille[0][i]==fGrille[1][i] && fGrille[0][i]!=0)
            {fGrille[1][i]+=fGrille[0][i];
                score+=2*fGrille[0][i];
            fGrille[0][i]=0;
            test=true;}
        }}
    //une fois qu'on a fait les déplacements, on ajoute une tuile.
    //ATTENTION / si aucun déplacement n'est fait malgré l'appui sur une touche, il ne faut pas ajouter de nouvelle tuile.
    if (test==true)
    {
        nbcoup++;
        Grille::ajouttuile();
        Grille::save();
    }
    Grille::win();
    Grille::Best();
    Grille::lose();
    emit nbcoupChanged();
    emit grlChanged();
    emit scrChanged();
}

void Grille::gauche(){
    bool test=false;
    for (int j=0;j<4;j++){
        if (fGrille[j][2]==0 && fGrille[j][3]!=0)
        {fGrille[j][2]=fGrille[j][3];
         fGrille[j][3]= 0;
        test=true;}
        if (fGrille[j][1]==0 && (fGrille[j][2]!=0 || fGrille[j][3]!=0))
        {fGrille[j][1]=fGrille[j][2];
         fGrille[j][2]=fGrille[j][3];
         fGrille[j][3]=0;
        test=true;}
        if (fGrille[j][0]==0 && (fGrille[j][1]!=0 || fGrille[j][2]!=0 || fGrille[j][3]!=0))
        {fGrille[j][0]=fGrille[j][1];
         fGrille[j][1]=fGrille[j][2];
         fGrille[j][2]=fGrille[j][3];
         fGrille[j][3]=0;
        test=true;}
    };
    for (int i=0;i<4;i++){
        if (fGrille[i][1]==fGrille[i][0] && fGrille[i][1]!=0)
        {fGrille[i][0]+=fGrille[i][1];
            score+=2*fGrille[i][1];
            if (fGrille[i][3]==fGrille[i][2])
            {fGrille[i][1]=fGrille[i][3]+fGrille[i][2];
                score+=2*fGrille[i][2];
            fGrille[i][3]=0;
            fGrille[i][2]=0;}
            else {fGrille[i][1]=fGrille[i][2];
                fGrille[i][2]=fGrille[i][3];
                fGrille[i][3]=0;
            }
        test=true;}
        else {
            if(fGrille[i][2]==fGrille[i][1] && fGrille[i][2]!=0)
            {fGrille[i][1]=fGrille[i][1]+fGrille[i][2];
                score+=2*fGrille[i][2];
                fGrille[i][2]=fGrille[i][3];
                fGrille[i][3]=0;
                test=true;
            }
            else if(fGrille[i][3]==fGrille[i][2] && fGrille[i][3]!=0)
            {fGrille[i][2]+=fGrille[i][3];
                score+=2*fGrille[i][3];
            fGrille[i][3]=0;
            test=true;}
        }}
    //une fois qu'on a fait les déplacements, on ajoute une tuile.
    //ATTENTION / si aucun déplacement n'est fait malgré l'appui sur une touche, il ne faut pas ajouter de nouvelle tuile.
    if (test==true)
    {
        nbcoup++;
        Grille::ajouttuile();
        Grille::save();
    }
    Grille::win();
    Grille::Best();
    Grille::lose();
    emit nbcoupChanged();
    emit grlChanged();
    emit scrChanged();
}

void Grille::droite(){
    bool test=false;
    for (int j=0;j<4;j++){
        if (fGrille[j][1]==0 && fGrille[j][0]!=0)
        {fGrille[j][1]=fGrille[j][0];
         fGrille[j][0]= 0;
        test=true;}
        if (fGrille[j][2]==0 && (fGrille[j][0]!=0 || fGrille[j][1]!=0))
        {fGrille[j][2]=fGrille[j][1];
         fGrille[j][1]=fGrille[j][0];
         fGrille[j][0]=0;
        test=true;}
        if (fGrille[j][3]==0 && (fGrille[j][0]!=0 || fGrille[j][1]!=0 || fGrille[j][2]!=0))
        {fGrille[j][3]=fGrille[j][2];
         fGrille[j][2]=fGrille[j][1];
         fGrille[j][1]=fGrille[j][0];
         fGrille[j][0]=0;
        test=true;}
    };

    for (int i=0;i<4;i++){
        if (fGrille[i][2]==fGrille[i][3] && fGrille[i][3]!=0)
        {fGrille[i][3]+=fGrille[i][2];
            score+=2*fGrille[i][2];
            if (fGrille[i][0]==fGrille[i][1])
            {fGrille[i][2]=fGrille[i][0]+fGrille[i][1];
                score+=2*fGrille[i][1];
            fGrille[i][0]=0;
            fGrille[i][1]=0;}

            else {fGrille[i][2]=fGrille[i][1];
                  fGrille[i][1]=fGrille[i][0];
                  fGrille[i][0]=0;
            }
        test=true;}
        else {
            if(fGrille[i][1]==fGrille[i][2] && fGrille[i][2]!=0)
            {fGrille[i][2]=fGrille[i][2]+fGrille[i][1];
                score+=2*fGrille[i][1];
                fGrille[i][1]=fGrille[i][0];
                fGrille[i][0]=0;
                test=true;
            }
            else if(fGrille[i][0]==fGrille[i][1] && fGrille[i][1]!=0)
            {fGrille[i][1]+=fGrille[i][0];
                score+=2*fGrille[i][0];
            fGrille[i][0]=0;
            test=true;}
        }}
    //une fois qu'on a fait les déplacements, on ajoute une tuile.
    //ATTENTION / si aucun déplacement n'est fait malgré l'appui sur une touche, il ne faut pas ajouter de nouvelle tuile.
    if (test==true)
    {
        nbcoup++;
        Grille::ajouttuile();
        Grille::save();
    }
    Grille::win();
    Grille::Best();
    Grille::lose();
    emit nbcoupChanged();
    emit grlChanged();
    emit scrChanged();

}

void Grille::Best(){
    if (score>best)
        best=score;
    if (nbcoup>nbcoupbest)
        nbcoupbest=nbcoup;
    emit bstChanged();
    emit nbcoupbestChanged();
}

void Grille::ajouttuile(){
    //cette méthode permet l'ajout d'une tuile.

    //D'abord on récupère les coordonnées (abscisse et ordonnée) des cases vides dans les vecteurs veci et vecj.
    //Allocation dynamique.
    int *veci;
    int *vecj;
    veci=new int[15];
    vecj=new int[15];
    //On fixe un entier n=0 que l'on incrémente à chaque fois que l'on trouve une case vide dans le tableau.
    int n=0;

    //d'abord on recherche les 0 dans la matrice des tuiles
    for (int i=0;i<4;i++)
    {
        for (int j=0;j<4;j++)
        {
            if (fGrille[i][j]==0)
                //si on trouve un 0 on stocke ses indices
                //on mémorise avec n le nombre de 0 trouvés
            {
                veci[n]=i;
                vecj[n]=j;
                n++;
            }
        }
    }
    //a partir d'ici on a trouvé tous les 0 et stocker leurs indices.

    //Si n=0, le jeu doit s'arrêter :

    //on sélectionne un couplet d'indice au hasard parmi les n couplets listés :
    int k=rand()%n;

    //on sélectionne au hasard un 2 ou un 4 à placer dans la nouvelle tuile :
    //Si la tuile max attteinte est <16 on ne peut pas mettre 4 comme nouvelle tuile.
    int value=(rand()%2+1)*2;
    //On remplit la case.
    fGrille[veci[k]][vecj[k]]=value;

    //suppression des listes allouées dynamiquement :
    delete [] veci;
    delete [] vecj;
}


void Grille::win(){
    //On regarde si le joueur a atteint 2048 et donc gagné :
    for (int i=0;i<4;i++){
        for(int j=0; j<4;j++){
            if (fGrille[i][j]==2048) //Alors le joueur a gagné
            {//Il faut montrer au joueur qu'il a gagné :
                consigne=1;//"You win ! Try to go further or click NEW "
                emit csgnChanged();
            }
        }
    }
}

void Grille::lose(){
    bool lose=true;
    for (int i=0;i<4;i++){
        for(int j=0; j<4;j++){
            //Si on trouve un 0 alors on a pas perdu :
            if (fGrille[i][j]==0)
                lose=false;

            //Si on trouve 2 chiffres adjacents égaux alors on a pas perdu :
            else if (i!=0 && j!=0 && i!=3 && j!=3)
            {
                if (fGrille[i-1][j]==fGrille[i][j] || fGrille[i+1][j]==fGrille[i][j] || fGrille[i][j-1]==fGrille[i][j] || fGrille[i][j+1]==fGrille[i][j])
                    lose=false;
            }
        }
    }
    if (fGrille[0][0]==fGrille[1][0] || fGrille[1][0]==fGrille[2][0] || fGrille[2][0]==fGrille[3][0] || fGrille[0][3]==fGrille[1][3] || fGrille[1][3]==fGrille[2][3] || fGrille[2][3]==fGrille[3][3])
        lose=false;
    else if (fGrille[0][0]==fGrille[0][1] || fGrille[0][1]==fGrille[0][2] || fGrille[0][2]==fGrille[0][3] || fGrille[3][0]==fGrille[3][1] || fGrille[3][1]==fGrille[3][2] || fGrille[3][2]==fGrille[3][3])
        lose=false;

    if (lose==true)//Alors le joueur a perdu :
    {
        consigne=2;

    }
    else
        consigne=0;
    emit csgnChanged();
}

void Grille::newgame(){
    remove("save.txt");
    int tmp=best;
    //réinitialisation des attributs avec la méthode Init().
    //L'allocation des attributs n'est pas dynamique : on peut le faire.
    Grille::Init();
    best=tmp;
    nbcoup=0;
    consigne=0;
    //chargement des modifications vers l'interface graphique :
    emit csgnChanged();
    emit grlChanged();
    emit scrChanged();
    emit bstChanged();
    emit nbcoupChanged();
}

void Grille::undo(){
    ifstream flux("save.txt");
    if (flux){
        ofstream flux2("save(1).txt",ios::app);
        //Déclaration de la variable tampon pour lecture dans le fichier :
        int tmp;
        //Lecture des n-2 derniers coups
        if (nbcoup>0){
        for (int k=0;k<nbcoup-1;k++)
            {
            //Score
            flux>>tmp;
            flux2<<tmp<<endl;
            //Bestscore
            flux>>tmp;
            flux2<<tmp<<endl;
            //Consigne
            flux>>tmp;
            flux2<<tmp<<endl;
            //Nbcoup
            flux>>tmp;
            flux2<<tmp<<endl;
            //Nbcoupbest
            flux>>tmp;
            flux2<<tmp<<endl;
            //matrice :
            for (int i=0;i<4;i++)
                {
                for (int j=0;j<4;j++)
                    {
                    flux>>tmp;
                    flux2<<tmp<<' ';
                    }
                flux2<<endl;
                }
            }
            //Récupération des données n-1 coup joué :
            flux>>tmp;
            score=tmp;
            flux2<<score<<endl;
            flux>>tmp;
            best=tmp;
            flux2<<best<<endl;
            flux>>tmp;
            consigne=tmp;
            flux2<<consigne<<endl;
            flux>>tmp;
            nbcoup--;
            flux2<<nbcoup<<endl;
            flux>>tmp;
            flux2<<nbcoupbest<<endl;
            //matrice :
            for (int l=0;l<4;l++)
            {
                for (int f=0;f<4;f++)
                {
                    flux>>tmp;
                    fGrille[l][f]=tmp;
                    flux2<<tmp<<' ';
                }
                flux2<<endl;
            }
   //Fermeture fichiers et renommer flux2 :
    flux.close();
    remove("save.txt");
    flux2.close();
    }
    rename("save(1).txt","save.txt");}
    //modifications données de jeu :
    Grille::win();
    Grille::Best();
    Grille::lose();
    emit grlChanged();
    emit scrChanged();
    emit nbcoupChanged();
}


void Grille::save()
{//Sauvegarde de chaque coup à la fin du fichier "save.txt" :
    ofstream flux("save.txt",ios::app);
    flux<<score<<endl;
    flux<<best<<endl;
    flux<<consigne<<endl;
    flux<<nbcoup<<endl;
    flux<<nbcoupbest<<endl;
    for (int i=0;i<4;i++){
        for (int j=0;j<4;j++)
        {
            flux<<fGrille[i][j];
            flux<<' ';
        }
        flux<<endl;
    }
    flux.close();
}

void Grille::load()
{
    int fin=0;
    int tmp;
    string ligne;
    remove("save.txt");
    ifstream flux("load.txt");
    if (flux)
    {  //On compte le nombre de ligne
        while (getline(flux,ligne))
        {fin++;}
        //on se replace au début du fichier
        flux.close();
        ifstream flux("load.txt");
        //On lit les lignes inutiles :
        for (int i=0;i<fin-18;i++)
        {
            getline(flux,ligne);
        }
        //On charge les lignes utiles :
        //Score :
        flux>>tmp;
        score=tmp;
        //Bestscore
        flux>>tmp;
        best=tmp;
        //Consigne
        flux>>tmp;
        consigne=tmp;
        //Nbcoup
        flux>>tmp;
        nbcoup=tmp;
        //Nbcoupbest
        flux>>tmp;
        nbcoupbest=tmp;
        //matrice :
        for (int i=0;i<4;i++)
            {
            for (int j=0;j<4;j++)
                {
                flux>>tmp;
                fGrille[i][j]=tmp;
                }
        }
        flux.close();
        rename("load.txt","save.txt");
        Grille::win();
        Grille::Best();
        Grille::lose();
        emit grlChanged();
        emit scrChanged();
        emit nbcoupChanged();
    }
}

void Grille::quit(){
    rename("save.txt","load.txt");
    exit(0);
}


    //Méthodes de modification de la police des tesselles :
void Grille::setfont0(){
    font="Tahoma";
    emit fontChanged();}
void Grille::setfont1(){
    font="Arial";
    emit fontChanged();}
void Grille::setfont2(){
    font="Verdana";
    emit fontChanged();}
void Grille::setfont3(){
    font="Times New Roman";
    emit fontChanged();}
void Grille::setfont4(){
    font="Courier";
    emit fontChanged();}


    //Méthodes de modification de la couleur des tesselles :
//A chaque fois que l'utilisatuer change les couleurs, on change la liste QString des couleurs :
void Grille::classicColors()
{
    colors.clear();
    colors<<"#dcd8c9"<<"#d7d0b4"<<"#ea6f37"<<"#ea6f37"<<"#ea6f37"<<"#e94a2c"<<"#ebcb31"<<"#ebcb31"<<"#e9c81e"<<"#e9c81e"<<"#fdc66c"<<"#d260bf";
    emit colorsChanged();
}
void Grille::customColors()
{
    colors.clear();
    colors<<"#D8F8FA"<<"#D6F8FA"<<"#C6F6F8"<<"#AFF2F5"<<"#95EDF1"<<"#7FEAEF"<<"#5EE3EA"<<"#47DFE7"<<"#1DD8E1"<<"#1AC2CA"<<"#17ACB3"<<"#1499A0";
    emit colorsChanged();
}
void Grille::primaryColors()
{
    colors.clear();
    colors<<"#FD4F4F"<<"#FF0D0D"<<"#C80000"<<"#C41E00"<<"#EAE500"<<"#FFFA04"<<"#FFFB26"<<"#FFFC48"<<"#6FBCFE"<<"#2B9DFF"<<"#007BE6"<<"#3D1EFF"<<"#2000E6"<<"#1900B7";
    emit colorsChanged();
}
void Grille::bwColors()
{
    colors.clear();
    colors<<"#FFFFFF"<<"#F5F2F0"<<"#E9E2DE"<<"#D8CBC4"<<"#C7B5AB"<<"#B4A49C"<<"#A49086"<<"#827168"<<"#655B56"<<"#524B47"<<"#413D3B"<<"#2C2A29"<<"#1A1919"<<"#060606";
    emit colorsChanged();
}
void Grille::rainbowColors()
{
    colors.clear();
    colors<<"#D40000"<<"#D45800"<<"#D84800"<<"#D4BA00"<<"#B7D400"<<"#75D400"<<"#33D400"<<"#00D47C"<<"#00BED4"<<"#003AD4"<<"#5F00D4"<<"#D400BA"<<"#B7618A"<<"#4E2525";
    emit colorsChanged();
}

QList<QString> Grille::readGrille(){
    for (int i=0;i<16;i++){
        tab[i]=QString::number(fGrille[i%4][i-4*(i%4)]);}//relie la matrice et la grille
    return(tab);
}

int Grille::readScore(){
    //permet d'afficher le score.
    return(score);
}

int Grille::readBest(){
    //permet d'afficher le meilleur score.
    return(best);
}

int Grille::readCons(){
    //permet de renvoyer la consigne à afficher.
    return(consigne);
}

QString Grille::readFont(){
    //permet de renvoyer la police d'affichage des tesselles.
    return(font);
}

QList<QString> Grille::readColors(){
    return(colors);
}

int Grille::readNbcoup()
{
    return(nbcoup);
}

int Grille::readNbcoupbest()
{
    return(nbcoupbest);
}
