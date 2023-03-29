#ifndef GRILLE_H
#define GRILLE_H

#include <QObject>
#include <QList>
#include <vector>
using namespace std ;


class Grille : public QObject
{
    Q_OBJECT
public:
    //constructeur
    explicit Grille(QObject *parent = nullptr);
    void Init();

    //traitement des mouvements :
    Q_INVOKABLE void haut();//pour la flèche du haut
    Q_INVOKABLE void bas();//pour la flèche du bas
    Q_INVOKABLE void gauche();//pour la flèche de gauche
    Q_INVOKABLE void droite();//pour la flèche de droite

    //ajout d'une tesselle aléatoire à chaque tour (2 ou 4)
    Q_INVOKABLE void ajouttuile();

    //dialogue c++/QML :
    //grille des tesselles.
    Q_PROPERTY(QList<QString> grlQML READ readGrille NOTIFY grlChanged)
    //score
    Q_PROPERTY(int scrQML READ readScore NOTIFY scrChanged)
    //meilleur score
    Q_PROPERTY(int bstQML READ readBest NOTIFY bstChanged)
    //Consigne : atteindre 2048 ou continuer
    Q_PROPERTY(int csgnQML READ readCons NOTIFY csgnChanged)
    //Police des tesselles :
    Q_PROPERTY(QString fontQML READ readFont NOTIFY fontChanged)
    //Changement de couleurs :
    Q_PROPERTY(QList<QString> colorsQML READ readColors NOTIFY colorsChanged)
    //Nombre de coups :
    Q_PROPERTY(int nbcoupQML READ readNbcoup NOTIFY nbcoupChanged)
    Q_PROPERTY(int nbcoupbestQML READ readNbcoupbest NOTIFY nbcoupbestChanged)

    //Méthode de gestion Victoire/défaite :
    void win();
    void lose();


    //Méthode dédiée au Best Score
    void Best();//pour la gestion du meilleur score (recherche de maximum)

    //Méthode de nouvelle partie/remise à zéro : NEW
    Q_INVOKABLE void newgame();

    //Méthode de retour arrière : UNDO
    Q_INVOKABLE void undo();

    //Méthode de sauvegarde de chaque coup :
    Q_INVOKABLE void save();

    //Méthode de chargement de la dernière partie sauvegardée :
    Q_INVOKABLE void load();

    //Méthode de fermeture du jeu/application :
    Q_INVOKABLE void quit();


    //Méthodes de modification de la police des tesselles :
    Q_INVOKABLE void setfont0();
    Q_INVOKABLE void setfont1();
    Q_INVOKABLE void setfont2();
    Q_INVOKABLE void setfont3();
    Q_INVOKABLE void setfont4();

    //Méthodes de modification des couleurs des tesselles :
    Q_INVOKABLE void classicColors();
    Q_INVOKABLE void customColors();
    Q_INVOKABLE void primaryColors();
    Q_INVOKABLE void bwColors();
    Q_INVOKABLE void rainbowColors();

    QList<QString> readGrille();
    int readScore();
    int readBest();
    int readCons();
    QString readFont();
    QList<QString> readColors();
    int readNbcoup();
    int readNbcoupbest();

signals:
//Changement de la matrice
void grlChanged();
//Changement de la valeur du score
void scrChanged();
//Changement de la valeur du meilleur score
void bstChanged();
//Changement de la consigne
void csgnChanged();
//Changement de la police
void fontChanged();
//Changement de couleurs
void colorsChanged();
//Changement nombre de coups :
void nbcoupChanged();
void nbcoupbestChanged();

private:
    int fGrille[4][4] ;//matrice des nombres présents dans la grille
    QList<QString> tab ;
    int score;
    int best;
    int consigne;
    int nbcoup;
    int nbcoupbest;

    //Attribut pour modifier la police :
    QString font;

    //Attribut pour modifier les couleurs :
    QList<QString> colors ;
};

#endif // GRILLE_H
