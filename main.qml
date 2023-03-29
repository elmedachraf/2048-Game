import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15


Window {
    id: window
    width: 520
    height: 600
    visible: true
    color: "#ffefd5"
    property alias text23Text: text23.text
    title: qsTr("Jeu de 2048")

    Rectangle {
        id: rectangleGrid
        x: 28
        y: 237
        width: 346
        height: 345
        color: "#9b856c"
        radius: 15
        anchors.horizontalCenterOffset: 1
        anchors.horizontalCenter: parent.horizontalCenter


        Grid {
            id: grid
            x: 0
            y: 10
            width: 330
            height: 330
            anchors.verticalCenter: parent.verticalCenter
            spacing: 10
            anchors.horizontalCenter: parent.horizontalCenter
            rows: 4
            columns: 4

            Rectangle {
                id: rec1_1
                width: 75
                height: 75
                color: "#ffffff"
                radius: 5
                border.width: 0

                Text {
                    focus: true ;
                    id: text1
                    text: ObjetGrl.grlQML[0]
                    states:[
                        State {name: "coul0";when:text1.text==="0"
                            PropertyChanges {target: rec1_1 ; color:ObjetGrl.colorsQML[0]}
                            PropertyChanges {target: text1 ; color:ObjetGrl.colorsQML[0]}},
                        State {name: "coul2";when:text1.text==="2"
                            PropertyChanges {target: rec1_1 ;color:ObjetGrl.colorsQML[1]}},
                        State {name: "coul4";when:text1.text==="4"
                            PropertyChanges {target: rec1_1 ;color:ObjetGrl.colorsQML[2]}},
                        State {name: "coul8";when:text1.text==="8"
                            PropertyChanges {target: rec1_1 ;color:ObjetGrl.colorsQML[3]}},
                        State {name: "coul16";when:text1.text==="16"
                            PropertyChanges {target: rec1_1 ;color:ObjetGrl.colorsQML[4]}},
                        State {name: "coul32";when:text1.text==="32"
                            PropertyChanges {target: rec1_1 ;color:ObjetGrl.colorsQML[5]}},
                        State {name: "coul64";when:text1.text==="64"
                            PropertyChanges {target: rec1_1 ;color:ObjetGrl.colorsQML[6]}},
                        State {name: "coul128";when:text1.text==="128"
                            PropertyChanges {target: rec1_1 ;color:ObjetGrl.colorsQML[7]}},
                        State {name: "coul256";when:text1.text==="256"
                            PropertyChanges {target: rec1_1 ;color:ObjetGrl.colorsQML[8]}},
                        State {name: "coul512";when:text1.text==="512"
                            PropertyChanges {target: rec1_1 ;color:ObjetGrl.colorsQML[9]}},
                        State {name: "coul1024";when:text1.text==="1024"
                            PropertyChanges {target: rec1_1 ;color:ObjetGrl.colorsQML[10]}},
                        State {name: "coul2048";when:text1.text==="2048"
                            PropertyChanges {target: rec1_1 ;color:ObjetGrl.colorsQML[11]}}
                    ]
                    transitions:
                        [Transition {to: "*"
                            ColorAnimation {target: rec1_1 ; duration: 50
                            }

                        }]

                    Keys.onPressed: {
                        switch (event.key) {
                        case Qt.Key_Up:
                            ObjetGrl.haut();
                            break;
                        case Qt.Key_Down:
                            ObjetGrl.bas();
                            break;
                        case Qt.Key_Right:
                            ObjetGrl.droite();
                            break;
                        case Qt.Key_Left:
                            ObjetGrl.gauche();
                            break;

                        }
                    }
                    anchors.fill: parent
                    font.pixelSize: 34
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.NoWrap
                    fontSizeMode: Text.Fit
                    font.family: ObjetGrl.fontQML
                }
            }


            Rectangle {
                id: rec1_2
                width: 75
                height: 75
                color: "#ffffff"
                radius: 5
                border.width: 0

                Text {
                    focus: true ;
                    id: text2
                    text: ObjetGrl.grlQML[1]
                    states:[
                        State {name: "coul0";when:text2.text==="0"
                            PropertyChanges {target: rec1_2 ; color:ObjetGrl.colorsQML[0]}
                            PropertyChanges {target: text2 ; color:ObjetGrl.colorsQML[0]}},
                        State {name: "coul2";when:text2.text==="2"
                            PropertyChanges {target: rec1_2 ;color:ObjetGrl.colorsQML[1]}},
                        State {name: "coul4";when:text2.text==="4"
                            PropertyChanges {target: rec1_2 ;color:ObjetGrl.colorsQML[2]}},
                        State {name: "coul8";when:text2.text==="8"
                            PropertyChanges {target: rec1_2 ;color:ObjetGrl.colorsQML[3]}},
                        State {name: "coul16";when:text2.text==="16"
                            PropertyChanges {target: rec1_2 ;color:ObjetGrl.colorsQML[4]}},
                        State {name: "coul32";when:text2.text==="32"
                            PropertyChanges {target: rec1_2 ;color:ObjetGrl.colorsQML[5]}},
                        State {name: "coul64";when:text2.text==="64"
                            PropertyChanges {target: rec1_2 ;color:ObjetGrl.colorsQML[6]}},
                        State {name: "coul128";when:text2.text==="128"
                            PropertyChanges {target: rec1_2 ;color:ObjetGrl.colorsQML[7]}},
                        State {name: "coul256";when:text2.text==="256"
                            PropertyChanges {target: rec1_2 ;color:ObjetGrl.colorsQML[8]}},
                        State {name: "coul512";when:text2.text==="512"
                            PropertyChanges {target: rec1_2 ;color:ObjetGrl.colorsQML[9]}},
                        State {name: "coul1024";when:text2.text==="1024"
                            PropertyChanges {target: rec1_2 ;color:ObjetGrl.colorsQML[10]}},
                        State {name: "coul2048";when:text2.text==="2048"
                            PropertyChanges {target: rec1_2 ;color:ObjetGrl.colorsQML[11]}}

                    ]
                    transitions:
                        [Transition {to: "*"
                            ColorAnimation {target: rec1_2 ; duration: 50
                            }

                        }]
                    Keys.onPressed: {
                        switch (event.key) {
                        case Qt.Key_Up:
                            ObjetGrl.haut();
                            break;
                        case Qt.Key_Down:
                            ObjetGrl.bas();
                            break;
                        case Qt.Key_Right:
                            ObjetGrl.droite();
                            break;
                        case Qt.Key_Left:
                            ObjetGrl.gauche();
                            break;

                        }
                    }
                    anchors.fill: parent
                    font.pixelSize: 34
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.NoWrap
                    fontSizeMode: Text.Fit
                    font.family: ObjetGrl.fontQML
                }
            }

            Rectangle {
                id: rec1_3
                width: 75
                height: 75
                color: "#ffffff"
                radius: 5
                border.width: 0
                Text {
                    focus: true ;
                    id: text3
                    text: ObjetGrl.grlQML[2]
                    states:[
                        State {name: "coul0";when:text3.text==="0"
                            PropertyChanges {target: rec1_3 ; color:ObjetGrl.colorsQML[0]}
                            PropertyChanges {target: text3 ; color:ObjetGrl.colorsQML[0]}},
                        State {name: "coul2";when:text3.text==="2"
                            PropertyChanges {target: rec1_3 ;color:ObjetGrl.colorsQML[1]}},
                        State {name: "coul4";when:text3.text==="4"
                            PropertyChanges {target: rec1_3 ;color:ObjetGrl.colorsQML[2]}},
                        State {name: "coul8";when:text3.text==="8"
                            PropertyChanges {target: rec1_3 ;color:ObjetGrl.colorsQML[3]}},
                        State {name: "coul16";when:text3.text==="16"
                            PropertyChanges {target: rec1_3 ;color:ObjetGrl.colorsQML[4]}},
                        State {name: "coul32";when:text3.text==="32"
                            PropertyChanges {target: rec1_3 ;color:ObjetGrl.colorsQML[5]}},
                        State {name: "coul64";when:text3.text==="64"
                            PropertyChanges {target: rec1_3 ;color:ObjetGrl.colorsQML[6]}},
                        State {name: "coul128";when:text3.text==="128"
                            PropertyChanges {target: rec1_3 ;color:ObjetGrl.colorsQML[7]}},
                        State {name: "coul256";when:text3.text==="256"
                            PropertyChanges {target: rec1_3 ;color:ObjetGrl.colorsQML[8]}},
                        State {name: "coul512";when:text3.text==="512"
                            PropertyChanges {target: rec1_3 ;color:ObjetGrl.colorsQML[9]}},
                        State {name: "coul1024";when:text3.text==="1024"
                            PropertyChanges {target: rec1_3 ;color:ObjetGrl.colorsQML[10]}},
                        State {name: "coul2048";when:text3.text==="2048"
                            PropertyChanges {target: rec1_3 ;color:ObjetGrl.colorsQML[11]}}
                    ]
                    transitions:
                        [Transition {to: "*"
                            ColorAnimation {target: rec1_3 ; duration: 50
                            }

                        }]
                    Keys.onPressed: {
                        switch (event.key) {
                        case Qt.Key_Up:
                            ObjetGrl.haut();
                            break;
                        case Qt.Key_Down:
                            ObjetGrl.bas();
                            break;
                        case Qt.Key_Right:
                            ObjetGrl.droite();
                            break;
                        case Qt.Key_Left:
                            ObjetGrl.gauche();
                            break;

                        }
                    }
                    anchors.fill: parent
                    font.pixelSize: 34
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.NoWrap
                    fontSizeMode: Text.Fit
                    font.family: ObjetGrl.fontQML           }
            }

            Rectangle {
                id: rec1_4
                width: 75
                height: 75
                color: "#ffffff"
                radius: 5
                border.width: 0
                Text {
                    focus: true ;
                    id: text4
                    text: ObjetGrl.grlQML[3]
                    states:[
                        State {name: "coul0";when:text4.text==="0"
                            PropertyChanges {target: rec1_4 ; color:ObjetGrl.colorsQML[0]}
                            PropertyChanges {target: text4 ; color:ObjetGrl.colorsQML[0]}},
                        State {name: "coul2";when:text4.text==="2"
                            PropertyChanges {target: rec1_4 ;color:ObjetGrl.colorsQML[1]}},
                        State {name: "coul4";when:text4.text==="4"
                            PropertyChanges {target: rec1_4 ;color:ObjetGrl.colorsQML[2]}},
                        State {name: "coul8";when:text4.text==="8"
                            PropertyChanges {target: rec1_4 ;color:ObjetGrl.colorsQML[3]}},
                        State {name: "coul16";when:text4.text==="16"
                            PropertyChanges {target: rec1_4 ;color:ObjetGrl.colorsQML[4]}},
                        State {name: "coul32";when:text4.text==="32"
                            PropertyChanges {target: rec1_4 ;color:ObjetGrl.colorsQML[5]}},
                        State {name: "coul64";when:text4.text==="64"
                            PropertyChanges {target: rec1_4 ;color:ObjetGrl.colorsQML[6]}},
                        State {name: "coul128";when:text4.text==="128"
                            PropertyChanges {target: rec1_4 ;color:ObjetGrl.colorsQML[7]}},
                        State {name: "coul256";when:text4.text==="256"
                            PropertyChanges {target: rec1_4 ;color:ObjetGrl.colorsQML[8]}},
                        State {name: "coul512";when:text4.text==="512"
                            PropertyChanges {target: rec1_4 ;color:ObjetGrl.colorsQML[9]}},
                        State {name: "coul1024";when:text4.text==="1024"
                            PropertyChanges {target: rec1_4 ;color:ObjetGrl.colorsQML[10]}},
                        State {name: "coul2048";when:text4.text==="2048"
                            PropertyChanges {target: rec1_4 ;color:ObjetGrl.colorsQML[11]}}
                    ]
                    transitions:
                        [Transition {to: "*"
                            ColorAnimation {target: rec1_4 ; duration: 50
                            }

                        }]
                    Keys.onPressed: {
                        switch (event.key) {
                        case Qt.Key_Up:
                            ObjetGrl.haut();
                            break;
                        case Qt.Key_Down:
                            ObjetGrl.bas();
                            break;
                        case Qt.Key_Right:
                            ObjetGrl.droite();
                            break;
                        case Qt.Key_Left:
                            ObjetGrl.gauche();
                            break;

                        }
                    }
                    anchors.fill: parent
                    font.pixelSize: 34
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.NoWrap
                    fontSizeMode: Text.Fit
                    font.family: ObjetGrl.fontQML                 }
            }

            Rectangle {
                id: rec2_1
                width: 75
                height: 75
                color: "#ffffff"
                radius: 5
                border.width: 0
                Text {
                    focus: true ;
                    id: text5
                    text: ObjetGrl.grlQML[4]
                    states:[
                        State {name: "coul0";when:text5.text==="0"
                            PropertyChanges {target: rec2_1 ; color:ObjetGrl.colorsQML[0]}
                            PropertyChanges {target: text5 ; color:ObjetGrl.colorsQML[0]}},
                        State {name: "coul2";when:text5.text==="2"
                            PropertyChanges {target: rec2_1 ;color:ObjetGrl.colorsQML[1]}},
                        State {name: "coul4";when:text5.text==="4"
                            PropertyChanges {target: rec2_1 ;color:ObjetGrl.colorsQML[2]}},
                        State {name: "coul8";when:text5.text==="8"
                            PropertyChanges {target: rec2_1 ;color:ObjetGrl.colorsQML[3]}},
                        State {name: "coul16";when:text5.text==="16"
                            PropertyChanges {target: rec2_1 ;color:ObjetGrl.colorsQML[4]}},
                        State {name: "coul32";when:text5.text==="32"
                            PropertyChanges {target: rec2_1 ;color:ObjetGrl.colorsQML[5]}},
                        State {name: "coul64";when:text5.text==="64"
                            PropertyChanges {target: rec2_1 ;color:ObjetGrl.colorsQML[6]}},
                        State {name: "coul128";when:text5.text==="128"
                            PropertyChanges {target: rec2_1 ;color:ObjetGrl.colorsQML[7]}},
                        State {name: "coul256";when:text5.text==="256"
                            PropertyChanges {target: rec2_1 ;color:ObjetGrl.colorsQML[8]}},
                        State {name: "coul512";when:text5.text==="512"
                            PropertyChanges {target: rec2_1 ;color:ObjetGrl.colorsQML[9]}},
                        State {name: "coul1024";when:text5.text==="1024"
                            PropertyChanges {target: rec2_1 ;color:ObjetGrl.colorsQML[10]}},
                        State {name: "coul2048";when:text5.text==="2048"
                            PropertyChanges {target: rec2_1 ;color:ObjetGrl.colorsQML[11]}}
                    ]
                    transitions:
                        [Transition {to: "*"
                            ColorAnimation {target: rec2_1 ; duration: 50
                            }

                        }]
                    Keys.onPressed: {
                        switch (event.key) {
                        case Qt.Key_Up:
                            ObjetGrl.haut();
                            break;
                        case Qt.Key_Down:
                            ObjetGrl.bas();
                            break;
                        case Qt.Key_Right:
                            ObjetGrl.droite();
                            break;
                        case Qt.Key_Left:
                            ObjetGrl.gauche();
                            break;

                        }
                    }
                    anchors.fill: parent
                    font.pixelSize: 34
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.NoWrap
                    fontSizeMode: Text.Fit
                    font.family: ObjetGrl.fontQML                }
            }

            Rectangle {
                id: rec2_2
                width: 75
                height: 75
                color: "#ffffff"
                radius: 5
                border.width: 0
                Text {
                    focus: true ;
                    id: text6
                    text: ObjetGrl.grlQML[5]
                    states:[
                        State {name: "coul0";when:text6.text==="0"
                            PropertyChanges {target: rec2_2 ; color:ObjetGrl.colorsQML[0]}
                            PropertyChanges {target: text6 ; color:ObjetGrl.colorsQML[0]}},
                        State {name: "coul2";when:text6.text==="2"
                            PropertyChanges {target: rec2_2 ;color:ObjetGrl.colorsQML[1]}},
                        State {name: "coul4";when:text6.text==="4"
                            PropertyChanges {target: rec2_2 ;color:ObjetGrl.colorsQML[2]}},
                        State {name: "coul8";when:text6.text==="8"
                            PropertyChanges {target: rec2_2 ;color:ObjetGrl.colorsQML[3]}},
                        State {name: "coul16";when:text6.text==="16"
                            PropertyChanges {target: rec2_2 ;color:ObjetGrl.colorsQML[4]}},
                        State {name: "coul32";when:text6.text==="32"
                            PropertyChanges {target: rec2_2 ;color:ObjetGrl.colorsQML[5]}},
                        State {name: "coul64";when:text6.text==="64"
                            PropertyChanges {target: rec2_2 ;color:ObjetGrl.colorsQML[6]}},
                        State {name: "coul128";when:text6.text==="128"
                            PropertyChanges {target: rec2_2 ;color:ObjetGrl.colorsQML[7]}},
                        State {name: "coul256";when:text6.text==="256"
                            PropertyChanges {target: rec2_2 ;color:ObjetGrl.colorsQML[8]}},
                        State {name: "coul512";when:text6.text==="512"
                            PropertyChanges {target: rec2_2 ;color:ObjetGrl.colorsQML[9]}},
                        State {name: "coul1024";when:text6.text==="1024"
                            PropertyChanges {target: rec2_2 ;color:ObjetGrl.colorsQML[10]}},
                        State {name: "coul2048";when:text6.text==="2048"
                            PropertyChanges {target: rec2_2 ;color:ObjetGrl.colorsQML[11]}}
                    ]
                    transitions:
                        [Transition {to: "*"
                            ColorAnimation {target: rec2_2 ; duration: 50
                            }

                        }]
                    Keys.onPressed: {
                        switch (event.key) {
                        case Qt.Key_Up:
                            ObjetGrl.haut();
                            break;
                        case Qt.Key_Down:
                            ObjetGrl.bas();
                            break;
                        case Qt.Key_Right:
                            ObjetGrl.droite();
                            break;
                        case Qt.Key_Left:
                            ObjetGrl.gauche();
                            break;

                        }
                    }
                    anchors.fill: parent
                    font.pixelSize: 34
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.NoWrap
                    fontSizeMode: Text.Fit
                    font.family: ObjetGrl.fontQML                 }
            }

            Rectangle {
                id: rec2_3
                width: 75
                height: 75
                color: "#ffffff"
                radius: 5
                border.width: 0
                Text {
                    focus: true ;
                    id: text7
                    text: ObjetGrl.grlQML[6]
                    states:[
                        State {name: "coul0";when:text7.text==="0"
                            PropertyChanges {target: rec2_3 ; color:ObjetGrl.colorsQML[0]}
                            PropertyChanges {target: text7 ; color:ObjetGrl.colorsQML[0]}},
                        State {name: "coul2";when:text7.text==="2"
                            PropertyChanges {target: rec2_3 ;color:ObjetGrl.colorsQML[1]}},
                        State {name: "coul4";when:text7.text==="4"
                            PropertyChanges {target: rec2_3 ;color:ObjetGrl.colorsQML[2]}},
                        State {name: "coul8";when:text7.text==="8"
                            PropertyChanges {target: rec2_3 ;color:ObjetGrl.colorsQML[3]}},
                        State {name: "coul16";when:text7.text==="16"
                            PropertyChanges {target: rec2_3 ;color:ObjetGrl.colorsQML[4]}},
                        State {name: "coul32";when:text7.text==="32"
                            PropertyChanges {target: rec2_3 ;color:ObjetGrl.colorsQML[5]}},
                        State {name: "coul64";when:text7.text==="64"
                            PropertyChanges {target: rec2_3 ;color:ObjetGrl.colorsQML[6]}},
                        State {name: "coul128";when:text7.text==="128"
                            PropertyChanges {target: rec2_3 ;color:ObjetGrl.colorsQML[7]}},
                        State {name: "coul256";when:text7.text==="256"
                            PropertyChanges {target: rec2_3 ;color:ObjetGrl.colorsQML[8]}},
                        State {name: "coul512";when:text7.text==="512"
                            PropertyChanges {target: rec2_3 ;color:ObjetGrl.colorsQML[9]}},
                        State {name: "coul1024";when:text7.text==="1024"
                            PropertyChanges {target: rec2_3 ;color:ObjetGrl.colorsQML[10]}},
                        State {name: "coul2048";when:text7.text==="2048"
                            PropertyChanges {target: rec2_3 ;color:ObjetGrl.colorsQML[11]}}
                    ]
                    transitions:
                        [Transition {to: "*"
                            ColorAnimation {target: rec2_3 ; duration: 50
                            }

                        }]
                    Keys.onPressed: {
                        switch (event.key) {
                        case Qt.Key_Up:
                            ObjetGrl.haut();
                            break;
                        case Qt.Key_Down:
                            ObjetGrl.bas();
                            break;
                        case Qt.Key_Right:
                            ObjetGrl.droite();
                            break;
                        case Qt.Key_Left:
                            ObjetGrl.gauche();
                            break;

                        }
                    }
                    anchors.fill: parent
                    font.pixelSize: 34
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.NoWrap
                    fontSizeMode: Text.Fit
                    font.family: ObjetGrl.fontQML                  }
            }

            Rectangle {
                id: rec2_4
                width: 75
                height: 75
                color: "#ffffff"
                radius: 5
                border.width: 0
                Text {
                    focus: true ;
                    id: text8
                    text: ObjetGrl.grlQML[7]
                    states:[
                        State {name: "coul0";when:text8.text==="0"
                            PropertyChanges {target: rec2_4 ; color:ObjetGrl.colorsQML[0]}
                            PropertyChanges {target: text8 ; color:ObjetGrl.colorsQML[0]}},
                        State {name: "coul2";when:text8.text==="2"
                            PropertyChanges {target: rec2_4 ;color:ObjetGrl.colorsQML[1]}},
                        State {name: "coul4";when:text8.text==="4"
                            PropertyChanges {target: rec2_4 ;color:ObjetGrl.colorsQML[2]}},
                        State {name: "coul8";when:text8.text==="8"
                            PropertyChanges {target: rec2_4 ;color:ObjetGrl.colorsQML[3]}},
                        State {name: "coul16";when:text8.text==="16"
                            PropertyChanges {target: rec2_4 ;color:ObjetGrl.colorsQML[4]}},
                        State {name: "coul32";when:text8.text==="32"
                            PropertyChanges {target: rec2_4 ;color:ObjetGrl.colorsQML[5]}},
                        State {name: "coul64";when:text8.text==="64"
                            PropertyChanges {target: rec2_4 ;color:ObjetGrl.colorsQML[6]}},
                        State {name: "coul128";when:text8.text==="128"
                            PropertyChanges {target: rec2_4 ;color:ObjetGrl.colorsQML[7]}},
                        State {name: "coul256";when:text8.text==="256"
                            PropertyChanges {target: rec2_4 ;color:ObjetGrl.colorsQML[8]}},
                        State {name: "coul512";when:text8.text==="512"
                            PropertyChanges {target: rec2_4 ;color:ObjetGrl.colorsQML[9]}},
                        State {name: "coul1024";when:text8.text==="1024"
                            PropertyChanges {target: rec2_4 ;color:ObjetGrl.colorsQML[10]}},
                        State {name: "coul2048";when:text8.text==="2048"
                            PropertyChanges {target: rec2_4 ;color:ObjetGrl.colorsQML[11]}}
                    ]
                    transitions:
                        [Transition {to: "*"
                            ColorAnimation {target: rec2_4 ; duration: 50
                            }

                        }]
                    Keys.onPressed: {
                        switch (event.key) {
                        case Qt.Key_Up:
                            ObjetGrl.haut();
                            break;
                        case Qt.Key_Down:
                            ObjetGrl.bas();
                            break;
                        case Qt.Key_Right:
                            ObjetGrl.droite();
                            break;
                        case Qt.Key_Left:
                            ObjetGrl.gauche();
                            break;

                        }
                    }
                    anchors.fill: parent
                    font.pixelSize: 34
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.NoWrap
                    fontSizeMode: Text.Fit
                    font.family: ObjetGrl.fontQML                  }
            }

            Rectangle {
                id: rec3_1
                width: 75
                height: 75
                color: "#ffffff"
                radius: 5
                border.width: 0
                Text {
                    focus: true ;
                    id: text9
                    text: ObjetGrl.grlQML[8]
                    states:[
                        State {name: "coul0";when:text9.text==="0"
                            PropertyChanges {target: rec3_1 ; color:ObjetGrl.colorsQML[0]}
                            PropertyChanges {target: text9 ; color:ObjetGrl.colorsQML[0]}},
                        State {name: "coul2";when:text9.text==="2"
                            PropertyChanges {target: rec3_1 ;color:ObjetGrl.colorsQML[1]}},
                        State {name: "coul4";when:text9.text==="4"
                            PropertyChanges {target: rec3_1 ;color:ObjetGrl.colorsQML[2]}},
                        State {name: "coul8";when:text9.text==="8"
                            PropertyChanges {target: rec3_1 ;color:ObjetGrl.colorsQML[3]}},
                        State {name: "coul16";when:text9.text==="16"
                            PropertyChanges {target: rec3_1 ;color:ObjetGrl.colorsQML[4]}},
                        State {name: "coul32";when:text9.text==="32"
                            PropertyChanges {target: rec3_1 ;color:ObjetGrl.colorsQML[5]}},
                        State {name: "coul64";when:text9.text==="64"
                            PropertyChanges {target: rec3_1 ;color:ObjetGrl.colorsQML[6]}},
                        State {name: "coul128";when:text9.text==="128"
                            PropertyChanges {target: rec3_1 ;color:ObjetGrl.colorsQML[7]}},
                        State {name: "coul256";when:text9.text==="256"
                            PropertyChanges {target: rec3_1 ;color:ObjetGrl.colorsQML[8]}},
                        State {name: "coul512";when:text9.text==="512"
                            PropertyChanges {target: rec3_1 ;color:ObjetGrl.colorsQML[9]}},
                        State {name: "coul1024";when:text9.text==="1024"
                            PropertyChanges {target: rec3_1 ;color:ObjetGrl.colorsQML[10]}},
                        State {name: "coul2048";when:text9.text==="2048"
                            PropertyChanges {target: rec3_1 ;color:ObjetGrl.colorsQML[11]}}
                    ]
                    transitions:
                        [Transition {to: "*"
                            ColorAnimation {target: rec3_1 ; duration: 50
                            }

                        }]
                    Keys.onPressed: {
                        switch (event.key) {
                        case Qt.Key_Up:
                            ObjetGrl.haut();
                            break;
                        case Qt.Key_Down:
                            ObjetGrl.bas();
                            break;
                        case Qt.Key_Right:
                            ObjetGrl.droite();
                            break;
                        case Qt.Key_Left:
                            ObjetGrl.gauche();
                            break;

                        }
                    }
                    anchors.fill: parent
                    font.pixelSize: 34
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.NoWrap
                    fontSizeMode: Text.Fit
                    font.family: ObjetGrl.fontQML                 }
            }

            Rectangle {
                id: rec3_2
                width: 75
                height: 75
                color: "#ffffff"
                radius: 5
                border.width: 0
                Text {
                    focus: true ;
                    id: text10
                    text: ObjetGrl.grlQML[9]
                    states:[
                        State {name: "coul0";when:text10.text==="0"
                            PropertyChanges {target: rec3_2 ; color:ObjetGrl.colorsQML[0]}
                            PropertyChanges {target: text10 ; color:ObjetGrl.colorsQML[0]}},
                        State {name: "coul2";when:text10.text==="2"
                            PropertyChanges {target: rec3_2 ;color:ObjetGrl.colorsQML[1]}},
                        State {name: "coul4";when:text10.text==="4"
                            PropertyChanges {target: rec3_2 ;color:ObjetGrl.colorsQML[2]}},
                        State {name: "coul8";when:text10.text==="8"
                            PropertyChanges {target: rec3_2 ;color:ObjetGrl.colorsQML[3]}},
                        State {name: "coul16";when:text10.text==="16"
                            PropertyChanges {target: rec3_2 ;color:ObjetGrl.colorsQML[4]}},
                        State {name: "coul32";when:text10.text==="32"
                            PropertyChanges {target: rec3_2 ;color:ObjetGrl.colorsQML[5]}},
                        State {name: "coul64";when:text10.text==="64"
                            PropertyChanges {target: rec3_2 ;color:ObjetGrl.colorsQML[6]}},
                        State {name: "coul128";when:text10.text==="128"
                            PropertyChanges {target: rec3_2 ;color:ObjetGrl.colorsQML[7]}},
                        State {name: "coul256";when:text10.text==="256"
                            PropertyChanges {target: rec3_2 ;color:ObjetGrl.colorsQML[8]}},
                        State {name: "coul512";when:text10.text==="512"
                            PropertyChanges {target: rec3_2 ;color:ObjetGrl.colorsQML[9]}},
                        State {name: "coul1024";when:text10.text==="1024"
                            PropertyChanges {target: rec3_2 ;color:ObjetGrl.colorsQML[10]}},
                        State {name: "coul2048";when:text10.text==="2048"
                            PropertyChanges {target: rec3_2 ;color:ObjetGrl.colorsQML[11]}}
                    ]
                    transitions:
                        [Transition {to: "*"
                            ColorAnimation {target: rec3_2 ; duration: 50
                            }

                        }]
                    Keys.onPressed: {
                        switch (event.key) {
                        case Qt.Key_Up:
                            ObjetGrl.haut();
                            break;
                        case Qt.Key_Down:
                            ObjetGrl.bas();
                            break;
                        case Qt.Key_Right:
                            ObjetGrl.droite();
                            break;
                        case Qt.Key_Left:
                            ObjetGrl.gauche();
                            break;

                        }
                    }
                    anchors.fill: parent
                    font.pixelSize: 34
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.NoWrap
                    fontSizeMode: Text.Fit
                    font.family: ObjetGrl.fontQML                 }
            }

            Rectangle {
                id: rec3_3
                width: 75
                height: 75
                color: "#ffffff"
                radius: 5
                border.width: 0
                Text {
                    focus: true ;
                    id: text11
                    text: ObjetGrl.grlQML[10]
                    states:[
                        State {name: "coul0";when:text11.text==="0"
                            PropertyChanges {target: rec3_3 ; color:ObjetGrl.colorsQML[0]}
                            PropertyChanges {target: text11 ; color:ObjetGrl.colorsQML[0]}},
                        State {name: "coul2";when:text11.text==="2"
                            PropertyChanges {target: rec3_3 ;color:ObjetGrl.colorsQML[1]}},
                        State {name: "coul4";when:text11.text==="4"
                            PropertyChanges {target: rec3_3 ;color:ObjetGrl.colorsQML[2]}},
                        State {name: "coul8";when:text11.text==="8"
                            PropertyChanges {target: rec3_3 ;color:ObjetGrl.colorsQML[3]}},
                        State {name: "coul11";when:text11.text==="16"
                            PropertyChanges {target: rec3_3 ;color:ObjetGrl.colorsQML[4]}},
                        State {name: "coul32";when:text11.text==="32"
                            PropertyChanges {target: rec3_3 ;color:ObjetGrl.colorsQML[5]}},
                        State {name: "coul64";when:text11.text==="64"
                            PropertyChanges {target: rec3_3 ;color:ObjetGrl.colorsQML[6]}},
                        State {name: "coul128";when:text11.text==="128"
                            PropertyChanges {target: rec3_3 ;color:ObjetGrl.colorsQML[7]}},
                        State {name: "coul256";when:text11.text==="256"
                            PropertyChanges {target: rec3_3 ;color:ObjetGrl.colorsQML[8]}},
                        State {name: "coul512";when:text11.text==="512"
                            PropertyChanges {target: rec3_3 ;color:ObjetGrl.colorsQML[9]}},
                        State {name: "coul1024";when:text11.text==="1024"
                            PropertyChanges {target: rec3_3 ;color:ObjetGrl.colorsQML[10]}},
                        State {name: "coul2048";when:text11.text==="2048"
                            PropertyChanges {target: rec3_3 ;color:ObjetGrl.colorsQML[11]}}
                    ]
                    transitions:
                        [Transition {to: "*"
                            ColorAnimation {target: rec3_3 ; duration: 50
                            }

                        }]
                    Keys.onPressed: {
                        switch (event.key) {
                        case Qt.Key_Up:
                            ObjetGrl.haut();
                            break;
                        case Qt.Key_Down:
                            ObjetGrl.bas();
                            break;
                        case Qt.Key_Right:
                            ObjetGrl.droite();
                            break;
                        case Qt.Key_Left:
                            ObjetGrl.gauche();
                            break;

                        }
                    }
                    anchors.fill: parent
                    font.pixelSize: 34
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.NoWrap
                    fontSizeMode: Text.Fit
                    font.family: ObjetGrl.fontQML                  }
            }

            Rectangle {
                id: rec3_4
                width: 75
                height: 75
                color: "#ffffff"
                radius: 5
                border.width: 0
                Text {
                    focus: true ;
                    id: text12
                    text: ObjetGrl.grlQML[11]
                    states:[
                        State {name: "coul0";when:text12.text==="0"
                            PropertyChanges {target: rec3_4 ; color:ObjetGrl.colorsQML[0]}
                            PropertyChanges {target: text12 ; color:ObjetGrl.colorsQML[0]}},
                        State {name: "coul2";when:text12.text==="2"
                            PropertyChanges {target: rec3_4 ;color:ObjetGrl.colorsQML[1]}},
                        State {name: "coul4";when:text12.text==="4"
                            PropertyChanges {target: rec3_4 ;color:ObjetGrl.colorsQML[2]}},
                        State {name: "coul8";when:text12.text==="8"
                            PropertyChanges {target: rec3_4 ;color:ObjetGrl.colorsQML[3]}},
                        State {name: "coul16";when:text12.text==="16"
                            PropertyChanges {target: rec3_4 ;color:ObjetGrl.colorsQML[4]}},
                        State {name: "coul32";when:text12.text==="32"
                            PropertyChanges {target: rec3_4 ;color:ObjetGrl.colorsQML[5]}},
                        State {name: "coul64";when:text12.text==="64"
                            PropertyChanges {target: rec3_4 ;color:ObjetGrl.colorsQML[6]}},
                        State {name: "coul128";when:text12.text==="128"
                            PropertyChanges {target: rec3_4 ;color:ObjetGrl.colorsQML[7]}},
                        State {name: "coul256";when:text12.text==="256"
                            PropertyChanges {target: rec3_4 ;color:ObjetGrl.colorsQML[8]}},
                        State {name: "coul512";when:text12.text==="512"
                            PropertyChanges {target: rec3_4 ;color:ObjetGrl.colorsQML[9]}},
                        State {name: "coul1024";when:text12.text==="1024"
                            PropertyChanges {target: rec3_4 ;color:ObjetGrl.colorsQML[10]}},
                        State {name: "coul2048";when:text12.text==="2048"
                            PropertyChanges {target: rec3_4 ;color:ObjetGrl.colorsQML[11]}}
                    ]
                    transitions:
                        [Transition {to: "*"
                            ColorAnimation {target: rec3_4 ; duration: 50
                            }

                        }]
                    Keys.onPressed: {
                        switch (event.key) {
                        case Qt.Key_Up:
                            ObjetGrl.haut();
                            break;
                        case Qt.Key_Down:
                            ObjetGrl.bas();
                            break;
                        case Qt.Key_Right:
                            ObjetGrl.droite();
                            break;
                        case Qt.Key_Left:
                            ObjetGrl.gauche();
                            break;

                        }
                    }
                    anchors.fill: parent
                    font.pixelSize: 34
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.NoWrap
                    fontSizeMode: Text.Fit
                    font.family: ObjetGrl.fontQML                 }
            }

            Rectangle {
                id: rec4_1
                width: 75
                height: 75
                color: "#ffffff"
                radius: 5
                border.width: 0
                Text {
                    focus: true ;
                    id: text13
                    text: ObjetGrl.grlQML[12]
                    states:[
                        State {name: "coul0";when:text13.text==="0"
                            PropertyChanges {target: rec4_1 ; color:ObjetGrl.colorsQML[0]}
                            PropertyChanges {target: text13 ; color:ObjetGrl.colorsQML[0]}},
                        State {name: "coul2";when:text13.text==="2"
                            PropertyChanges {target: rec4_1 ;color:ObjetGrl.colorsQML[1]}},
                        State {name: "coul4";when:text13.text==="4"
                            PropertyChanges {target: rec4_1 ;color:ObjetGrl.colorsQML[2]}},
                        State {name: "coul8";when:text13.text==="8"
                            PropertyChanges {target: rec4_1 ;color:ObjetGrl.colorsQML[3]}},
                        State {name: "coul16";when:text13.text==="16"
                            PropertyChanges {target: rec4_1 ;color:ObjetGrl.colorsQML[4]}},
                        State {name: "coul32";when:text13.text==="32"
                            PropertyChanges {target: rec4_1 ;color:ObjetGrl.colorsQML[5]}},
                        State {name: "coul64";when:text13.text==="64"
                            PropertyChanges {target: rec4_1 ;color:ObjetGrl.colorsQML[6]}},
                        State {name: "coul128";when:text13.text==="128"
                            PropertyChanges {target: rec4_1 ;color:ObjetGrl.colorsQML[7]}},
                        State {name: "coul256";when:text13.text==="256"
                            PropertyChanges {target: rec4_1 ;color:ObjetGrl.colorsQML[8]}},
                        State {name: "coul512";when:text13.text==="512"
                            PropertyChanges {target: rec4_1 ;color:ObjetGrl.colorsQML[9]}},
                        State {name: "coul1024";when:text13.text==="1024"
                            PropertyChanges {target: rec4_1 ;color:ObjetGrl.colorsQML[10]}},
                        State {name: "coul2048";when:text13.text==="2048"
                            PropertyChanges {target: rec4_1 ;color:ObjetGrl.colorsQML[11]}}
                    ]
                    transitions:
                        [Transition {to: "*"
                            ColorAnimation {target: rec4_1 ; duration: 50
                            }

                        }]
                    Keys.onPressed: {
                        switch (event.key) {
                        case Qt.Key_Up:
                            ObjetGrl.haut();
                            break;
                        case Qt.Key_Down:
                            ObjetGrl.bas();
                            break;
                        case Qt.Key_Right:
                            ObjetGrl.droite();
                            break;
                        case Qt.Key_Left:
                            ObjetGrl.gauche();
                            break;

                        }
                    }
                    anchors.fill: parent
                    font.pixelSize: 34
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.NoWrap
                    fontSizeMode: Text.Fit
                    font.family: ObjetGrl.fontQML                }
            }

            Rectangle {
                id: rec4_2
                width: 75
                height: 75
                color: "#ffffff"
                radius: 5
                border.width: 0
                Text {
                    focus: true ;
                    id: text14
                    text: ObjetGrl.grlQML[13]
                    states:[
                        State {name: "coul0";when:text14.text==="0"
                            PropertyChanges {target: rec4_2 ; color:ObjetGrl.colorsQML[0]}
                            PropertyChanges {target: text14 ; color:ObjetGrl.colorsQML[0]}},
                        State {name: "coul2";when:text14.text==="2"
                            PropertyChanges {target: rec4_2 ;color:ObjetGrl.colorsQML[1]}},
                        State {name: "coul4";when:text14.text==="4"
                            PropertyChanges {target: rec4_2 ;color:ObjetGrl.colorsQML[2]}},
                        State {name: "coul8";when:text14.text==="8"
                            PropertyChanges {target: rec4_2 ;color:ObjetGrl.colorsQML[3]}},
                        State {name: "coul16";when:text14.text==="16"
                            PropertyChanges {target: rec4_2 ;color:ObjetGrl.colorsQML[4]}},
                        State {name: "coul32";when:text14.text==="32"
                            PropertyChanges {target: rec4_2 ;color:ObjetGrl.colorsQML[5]}},
                        State {name: "coul64";when:text14.text==="64"
                            PropertyChanges {target: rec4_2 ;color:ObjetGrl.colorsQML[6]}},
                        State {name: "coul128";when:text14.text==="128"
                            PropertyChanges {target: rec4_2 ;color:ObjetGrl.colorsQML[7]}},
                        State {name: "coul256";when:text14.text==="256"
                            PropertyChanges {target: rec4_2 ;color:ObjetGrl.colorsQML[8]}},
                        State {name: "coul512";when:text14.text==="512"
                            PropertyChanges {target: rec4_2 ;color:ObjetGrl.colorsQML[9]}},
                        State {name: "coul1024";when:text14.text==="1024"
                            PropertyChanges {target: rec4_2 ;color:ObjetGrl.colorsQML[10]}},
                        State {name: "coul2048";when:text14.text==="2048"
                            PropertyChanges {target: rec4_2 ;color:ObjetGrl.colorsQML[11]}}
                    ]
                    transitions:
                        [Transition {to: "*"
                            ColorAnimation {target: rec4_2 ; duration: 50
                            }

                        }]
                    Keys.onPressed: {
                        switch (event.key) {
                        case Qt.Key_Up:
                            ObjetGrl.haut();
                            break;
                        case Qt.Key_Down:
                            ObjetGrl.bas();
                            break;
                        case Qt.Key_Right:
                            ObjetGrl.droite();
                            break;
                        case Qt.Key_Left:
                            ObjetGrl.gauche();
                            break;
                        }
                    }
                    anchors.fill: parent
                    font.pixelSize: 34
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.NoWrap
                    fontSizeMode: Text.Fit
                    font.family: ObjetGrl.fontQML                }
            }

            Rectangle {
                id: rec4_3
                width: 75
                height: 75
                color: "#ffffff"
                radius: 5
                border.width: 0
                Text {
                    focus: true ;
                    id: text15
                    text: ObjetGrl.grlQML[14]
                    states:[
                        State {name: "coul0";when:text15.text==="0"
                            PropertyChanges {target: rec4_3 ; color:ObjetGrl.colorsQML[0]}
                            PropertyChanges {target: text15 ; color:ObjetGrl.colorsQML[0]}},
                        State {name: "coul2";when:text15.text==="2"
                            PropertyChanges {target: rec4_3 ;color:ObjetGrl.colorsQML[1]}},
                        State {name: "coul4";when:text15.text==="4"
                            PropertyChanges {target: rec4_3 ;color:ObjetGrl.colorsQML[2]}},
                        State {name: "coul8";when:text15.text==="8"
                            PropertyChanges {target: rec4_3 ;color:ObjetGrl.colorsQML[3]}},
                        State {name: "coul16";when:text15.text==="16"
                            PropertyChanges {target: rec4_3 ;color:ObjetGrl.colorsQML[4]}},
                        State {name: "coul32";when:text15.text==="32"
                            PropertyChanges {target: rec4_3 ;color:ObjetGrl.colorsQML[5]}},
                        State {name: "coul64";when:text15.text==="64"
                            PropertyChanges {target: rec4_3 ;color:ObjetGrl.colorsQML[6]}},
                        State {name: "coul128";when:text15.text==="128"
                            PropertyChanges {target: rec4_3 ;color:ObjetGrl.colorsQML[7]}},
                        State {name: "coul256";when:text15.text==="256"
                            PropertyChanges {target: rec4_3 ;color:ObjetGrl.colorsQML[8]}},
                        State {name: "coul512";when:text15.text==="512"
                            PropertyChanges {target: rec4_3 ;color:ObjetGrl.colorsQML[9]}},
                        State {name: "coul1024";when:text15.text==="1024"
                            PropertyChanges {target: rec4_3 ;color:ObjetGrl.colorsQML[10]}},
                        State {name: "coul2048";when:text15.text==="2048"
                            PropertyChanges {target: rec4_3 ;color:ObjetGrl.colorsQML[11]}}
                    ]
                    transitions:
                        [Transition {to: "*"
                            ColorAnimation {target: rec4_3 ; duration: 50
                            }

                        }]
                    Keys.onPressed: {
                        switch (event.key) {
                        case Qt.Key_Up:
                            ObjetGrl.haut();
                            break;
                        case Qt.Key_Down:
                            ObjetGrl.bas();
                            break;
                        case Qt.Key_Right:
                            ObjetGrl.droite();
                            break;
                        case Qt.Key_Left:
                            ObjetGrl.gauche();
                            break;
                        }
                    }
                    anchors.fill: parent
                    font.pixelSize: 34
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.NoWrap
                    fontSizeMode: Text.Fit
                    font.family: ObjetGrl.fontQML                }
            }

            Rectangle {
                id: rec4_4
                width: 75
                height: 75
                color: "#ffffff"
                radius: 5
                border.width: 0
                Text {
                    focus: true ;
                    id: text16
                    text: ObjetGrl.grlQML[15]
                    states:[
                        State {name: "coul0";when:text16.text==="0"
                            PropertyChanges {target: rec4_4 ; color:ObjetGrl.colorsQML[0]}
                            PropertyChanges {target: text16 ; color:ObjetGrl.colorsQML[0]}},
                        State {name: "coul2";when:text16.text==="2"
                            PropertyChanges {target: rec4_4 ;color:ObjetGrl.colorsQML[1]}},
                        State {name: "coul4";when:text16.text==="4"
                            PropertyChanges {target: rec4_4 ;color:ObjetGrl.colorsQML[2]}},
                        State {name: "coul8";when:text16.text==="8"
                            PropertyChanges {target: rec4_4 ;color:ObjetGrl.colorsQML[3]}},
                        State {name: "coul16";when:text16.text==="16"
                            PropertyChanges {target: rec4_4 ;color:ObjetGrl.colorsQML[4]}},
                        State {name: "coul32";when:text16.text==="32"
                            PropertyChanges {target: rec4_4 ;color:ObjetGrl.colorsQML[5]}},
                        State {name: "coul64";when:text16.text==="64"
                            PropertyChanges {target: rec4_4 ;color:ObjetGrl.colorsQML[6]}},
                        State {name: "coul128";when:text16.text==="128"
                            PropertyChanges {target: rec4_4 ;color:ObjetGrl.colorsQML[7]}},
                        State {name: "coul256";when:text16.text==="256"
                            PropertyChanges {target: rec4_4 ;color:ObjetGrl.colorsQML[8]}},
                        State {name: "coul512";when:text16.text==="512"
                            PropertyChanges {target: rec4_4 ;color:ObjetGrl.colorsQML[9]}},
                        State {name: "coul1024";when:text16.text==="1024"
                            PropertyChanges {target: rec4_4 ;color:ObjetGrl.colorsQML[10]}},
                        State {name: "coul2048";when:text16.text==="2048"
                            PropertyChanges {target: rec4_4 ;color:ObjetGrl.colorsQML[11]}}
                    ]
                    transitions:
                        [Transition {to: "*"
                            ColorAnimation {target: rec4_4 ; duration: 50
                            }

                        }]
                    Keys.onPressed: {
                        switch (event.key) {
                        case Qt.Key_Up:
                            ObjetGrl.haut();
                            break;
                        case Qt.Key_Down:
                            ObjetGrl.bas();
                            break;
                        case Qt.Key_Right:
                            ObjetGrl.droite();
                            break;
                        case Qt.Key_Left:
                            ObjetGrl.gauche();
                            break;
                        }
                    }

                    anchors.fill: parent
                    font.pixelSize: 34
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.NoWrap
                    fontSizeMode: Text.Fit
                    font.family: ObjetGrl.fontQML                }
            }
        }
    }

    Text {
        id: text20
        x: 36
        y: 198
        width: 320
        height: 33
        states:[
            State {name: "consigne0";when:ObjetGrl.csgnQML===0
                PropertyChanges {target: text20 ; text:"Join the numbers and get to the 2048 tile !"
                }},
            State {name: "consigne1";when:ObjetGrl.csgnQML===1
                PropertyChanges {target: text20 ; text:"You win ! Try to go further or click NEW "
                }},
            State {name: "consigne2";when:ObjetGrl.csgnQML===2
                PropertyChanges {target: text20 ; text:"YOU LOSE ! Click on NEW to try again ! "
                }}
        ]
        font.pixelSize: 16
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        focus: true
        anchors.horizontalCenterOffset: 0
        font.bold: true
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Rectangle {
        id: rectangle2048
        x: 12
        y: 14
        width: 126
        height: 177
        color: "#fdc66c"
        radius: 25

        Text {
            id: text17
            x: 89
            y: 93
            width: 200
            height: 200
            text: qsTr("2048")
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 44
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.verticalCenterOffset: 0
            anchors.horizontalCenterOffset: 0
            font.bold: true
            font.family: "Tahoma"
            minimumPixelSize: 12
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Rectangle {
        id: rectangleScore
        x: 159
        y: 14
        width: 102
        height: 80
        color: "#473a28"
        radius: 25
        enabled: false
        transformOrigin: Item.Center

        Text {
            id: text18
            x: 18
            y: 2
            width: 100
            height: 41
            color: "#ffffff"
            text: qsTr("Score")
            font.pixelSize: 28
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenterOffset: 1
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            id: text21
            x: 8
            y: 38
            width: 110
            height: 42
            color: "#ffffff"
            text: ObjetGrl.scrQML
            font.pixelSize: 28
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            font.bold: true
            activeFocusOnTab: false
            focus: true
        }
    }

    Rectangle {
        id: rectangleNew
        x: 159
        y: 100
        width: 102
        height: 44
        color: "#da6936"
        radius: 25
        transformOrigin: Item.Center

        Text {
            id: text23
            x: 56
            y: 22
            text: qsTr("NEW")
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 28
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.italic: false
            font.family: "Tahoma"
            font.bold: true;
            anchors.horizontalCenter: parent.horizontalCenter
        }

        MouseArea {
            id: mouseArea1
            width: 101
            height: 45
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: ObjetGrl.newgame();
            hoverEnabled: true

            onEntered: {
                rectangleNew.color="#8a766d"
            }
            onExited: {
                rectangleNew.color = "#da6936"
            }
        }
    }

    Rectangle {
        id: rectangleQuit
        x: 159
        y: 150
        width: 102
        height: 44
        color: "#da6936"
        radius: 25
        transformOrigin: Item.Bottom
        Text {
            id: text28
            x: 56
            y: 22
            text: qsTr("QUIT")
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 28
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.italic: false
            font.bold: true
            font.family: "Tahoma"
        }

        MouseArea {
            id: mouseArea5
            width: 103
            height: 43
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            hoverEnabled: true
            onClicked: ObjetGrl.quit();

            onEntered: {
                rectangleQuit.color="#8a766d"
            }
            onExited: {
                rectangleQuit.color = "#da6936"
            }
        }
    }

    Rectangle {
        id: rectangleBest
        x: 279
        y: 14
        width: 102
        height: 80
        color: "#473a28"
        radius: 25
        enabled: false

        Text {
            id: text19
            x: 18
            y: 2
            width: 100
            height: 41
            color: "#ffffff"
            text: qsTr("Best")
            font.pixelSize: 28
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            font.bold: true
        }

        Text {
            id: text22
            x: 8
            y: 38
            width: 110
            height: 42
            color: "#ffffff"
            text:ObjetGrl.bstQML
            font.pixelSize: 28
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            font.bold: true
            focus: true
            activeFocusOnTab: false
        }
    }

    Rectangle {
        id: rectangleUndo
        x: 279
        y: 100
        width: 102
        height: 44
        color: "#da6936"
        radius: 25

        Text {
            id: text24
            x: 56
            y: 22
            text: qsTr("UNDO")
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 28
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.bold: true
            font.family: "Tahoma"
        }

        MouseArea {
            id: mouseArea
            width: 101
            height: 45
            visible: true
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: ObjetGrl.undo();
            hoverEnabled: true
            onEntered: {
                rectangleUndo.color="#8a766d"
            }
            onExited: {
                rectangleUndo.color = "#da6936"
            }
        }
    }

    Rectangle {
        id: rectangleLoad
        x: 279
        y: 150
        width: 102
        height: 44
        color: "#da6936"
        radius: 25
        Text {
            id: text29
            x: 56
            y: 22
            text: qsTr("LOAD")
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 28
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.italic: false
            font.bold: true
            font.family: "Tahoma"
        }

        MouseArea {
            id: mouseArea6
            width: 101
            height: 43
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            hoverEnabled: true
            onClicked: ObjetGrl.load();
            onEntered: {
                rectangleLoad.color="#8a766d"
            }
            onExited: {
                rectangleLoad.color = "#da6936"
            }
        }
    }

    Rectangle {
        id: rectangleFont
        x: 7
        y: 233
        width: 75
        height: 348
        visible: true
        color: "#ffefd5"
        radius: 5
        border.width: 0

        Grid {
            id: grid1
            width: 62
            height: 345
            visible: true
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 3
            rows: 5

            Rectangle {
                id: rectangleTahoma
                width: 62
                height: 67
                visible: true
                color: "#fdc66c"
                radius: 10
                border.width: 0

                Text {
                    id: text30
                    width: 60
                    height: 65
                    visible: true
                    text: qsTr("64")
                    font.pixelSize: 32
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    focus: true
                    font.family: "Tahoma"
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                MouseArea {
                    id: mouseArea7
                    width: 62
                    height: 67
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    hoverEnabled: true
                    onClicked: {rectangleTahoma.color="#da6936"
                        ObjetGrl.setfont0()}
                    onEntered: {
                        rectangleTahoma.color="#8a766d"
                    }
                    onExited: {
                        rectangleTahoma.color = "#fdc66c"
                    }
                }
            }

            Rectangle {
                id: rectangleArial
                width: 62
                height: 67
                visible: true
                color: "#fdc66c"
                radius: 10
                border.width: 0
                Text {
                    id: text31
                    width: 60
                    height: 65
                    visible: true
                    text: qsTr("64")
                    font.pixelSize: 32
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.family: "Arial"
                }
                MouseArea {
                    id: mouseArea8
                    width: 62
                    height: 67
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    hoverEnabled: true
                    onClicked: {ObjetGrl.setfont1()
                        rectangleArial.color="#da6936"}
                    onEntered: {
                        rectangleArial.color="#8a766d"
                    }
                    onExited: {
                        rectangleArial.color = "#fdc66c"
                    }
                }
            }

            Rectangle {
                id: rectangleVerdana
                width: 62
                height: 67
                visible: true
                color: "#fdc66c"
                radius: 10
                border.width: 0
                Text {
                    id: text32
                    width: 60
                    height: 65
                    visible: true
                    text: qsTr("64")
                    font.pixelSize: 32
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    focus: true
                    antialiasing: true
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.family: "Verdana"
                }
                MouseArea {
                    id: mouseArea9
                    width: 62
                    height: 67
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    hoverEnabled: true
                    onClicked: {ObjetGrl.setfont2()
                        rectangleVerdana.color="#da6936"}
                    onEntered: {
                        rectangleVerdana.color="#8a766d"
                    }
                    onExited: {
                        rectangleVerdana.color = "#fdc66c"
                    }
                }
            }

            Rectangle {
                id: rectangleTNR
                width: 62
                height: 67
                visible: true
                color: "#fdc66c"
                radius: 10
                border.width: 0
                Text {
                    id: text33
                    width: 60
                    height: 65
                    visible: true
                    text: qsTr("64")
                    font.pixelSize: 32
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    focus: true
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.family: "Times New Roman"
                }
                MouseArea {
                    id: mouseArea10
                    width: 62
                    height: 67
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    hoverEnabled: true
                    onClicked: {ObjetGrl.setfont3()
                        rectangleTNR.color="#da6936"}
                    onEntered: {
                        rectangleTNR.color="#8a766d"
                    }
                    onExited: {
                        rectangleTNR.color = "#fdc66c"
                    }
                }
            }

            Rectangle {
                id: rectangleCourier
                width: 62
                height: 67
                visible: true
                color: "#fdc66c"
                radius: 10
                border.width: 0
                Text {
                    id: text34
                    width: 60
                    height: 65
                    visible: true
                    text: qsTr("64")
                    font.pixelSize: 32
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    focus: true
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.family: "Courier"
                }
                MouseArea {
                    id: mouseArea11
                    width: 62
                    height: 67
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter

                    onClicked: {ObjetGrl.setfont4()
                    rectangleCourier.color="#da6936"}
                    hoverEnabled: true
                    onEntered: {
                        rectangleCourier.color="#8a766d"
                    }
                    onExited: {
                        rectangleCourier.color = "#fdc66c"
                    }
                }
            }
        }
    }

    Rectangle {
        id: rectangleColors
        x: 440
        y: 233
        width: 75
        height: 348
        visible: true
        color: "#ffefd5"
        radius: 5
        border.width: 0

        Grid {
            id: grid2
            width: 62
            height: 345
            visible: true
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 3

            Rectangle {
                id: rectangleClassic
                width: 62
                height: 67
                visible: true
                radius: 10
                border.width: 0
                border.color:"#000000"
                gradient: Gradient {
                    GradientStop {
                        position: 0
                        color: "#fdc66c"
                    }

                    GradientStop {
                        position: 0.99195
                        color: "#fdc66c"
                    }

                    GradientStop {
                        position: 0.48089
                        color: "#da6936"
                    }



                    GradientStop {
                        position: 0.98994
                        color: "#473a28"
                    }
                }
                MouseArea {
                    id: mouseArea12
                    width: 62
                    height: 67
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    hoverEnabled: true
                    onClicked: {ObjetGrl.classicColors()}
                    onPressed:{rectangleClassic.border.color="#ffffff"}
                    onReleased: {rectangleClassic.border.color="#000000"}
                    onEntered: {
                        rectangleClassic.border.width=5
                    }
                    onExited: {
                        rectangleClassic.border.width=0
                    }
                }
            }

            Rectangle {
                id: rectangleCustom
                width: 62
                height: 67
                visible: true
                radius: 10
                border.width: 0
                border.color:"#000000"
                gradient: Gradient {
                    GradientStop {
                        position: 0
                        color: "#D8F8FA"
                    }

                    GradientStop {
                        position: 1
                        color: "#17ACB3"
                    }
                }
                MouseArea {
                    id: mouseArea13
                    width: 62
                    height: 67
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    hoverEnabled: true
                    onClicked: {ObjetGrl.customColors()}
                    onPressed:{rectangleCustom.border.color="#ffffff"}
                    onReleased: {rectangleCustom.border.color="#000000"}
                    onEntered: {
                        rectangleCustom.border.width=5
                    }
                    onExited: {
                        rectangleCustom.border.width=0
                    }
                }
            }

            Rectangle {
                id: rectanglePrimary
                width: 62
                height: 67
                visible: true
                radius: 10
                border.width: 0
                border.color:"#000000"
                gradient: Gradient {
                    GradientStop {
                        position: 0.11066
                        color: "#d40101"
                    }

                    GradientStop {
                        position: 0.49497
                        color: "#f1c801"
                    }

                    GradientStop {
                        position: 0.91348
                        color: "#012ecb"
                    }
                }
                MouseArea {
                    id: mouseArea14
                    width: 62
                    height: 67
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    hoverEnabled: true
                    onClicked: {ObjetGrl.primaryColors()}
                    onPressed:{rectanglePrimary.border.color="#ffffff"}
                    onReleased: {rectanglePrimary.border.color="#000000"}
                    onEntered: {
                        rectanglePrimary.border.width=5
                    }
                    onExited: {
                        rectanglePrimary.border.width=0
                    }
                }
            }

            Rectangle {
                id: rectangleBW
                width: 62
                height: 67
                visible: true
                color: "#000000"
                radius: 10
                border.color:"#000000"
                border.width: 0
                gradient: Gradient {
                    GradientStop {
                        position: 0
                        color: "#000000"
                    }

                    GradientStop {
                        position: 1
                        color: "#ffffff"
                    }
                }
                MouseArea {
                    id: mouseArea15
                    width: 62
                    height: 67
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    hoverEnabled: true
                    onClicked: {ObjetGrl.bwColors()}
                    onPressed:{rectangleBW.border.color="#ffffff"}
                    onReleased: {rectangleBW.border.color="#000000"}
                    onEntered: {
                        rectangleBW.border.width=5
                    }
                    onExited: {
                        rectangleBW.border.width=0
                    }
                }
            }

            Rectangle {
                id: rectangleRainbow
                width: 62
                height: 67
                visible: true
                radius: 10
                border.width: 0
                border.color:"#000000"
                gradient: Gradient {
                    GradientStop {
                        position: 0
                        color: "#af0808"
                    }

                    GradientStop {
                        position: 0.33628
                        color: "#d0e210"
                    }

                    GradientStop {
                        position: 0.64183
                        color: "#3fda51"
                    }

                    GradientStop {
                        position: 1
                        color: "#4801a1"
                    }
                }
                MouseArea {
                    id: mouseArea16
                    width: 62
                    height: 67
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    hoverEnabled: true
                    onClicked: {ObjetGrl.rainbowColors()}
                    onPressed:{rectangleRainbow.border.color="#ffffff"}
                    onReleased: {rectangleRainbow.border.color="#000000"}
                    onEntered: {
                        rectangleRainbow.border.width=5
                    }
                    onExited: {
                        rectangleRainbow.border.width=0
                    }
                }

            }
            rows: 5
        }
    }

    Rectangle {
        id: rectangleNbCoups
        x: 400
        y: 14
        width: 101
        height: 172
        color: "#473a28"
        radius: 25
        Text {
            id: text25
            x: 18
            y: 8
            width: 100
            height: 40
            color: "#ffffff"
            text: qsTr("Coups")
            font.pixelSize: 28
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            font.bold: true
        }

        Text {
            id: text26
            x: 8
            y: 38
            width: 110
            height: 42
            color: "#ffffff"
            text: ObjetGrl.nbcoupQML
            font.pixelSize: 28
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            focus: true
            activeFocusOnTab: false
            font.bold: true
        }

        Text {
            id: text27
            x: 10
            y: 86
            width: 100
            height: 40
            color: "#ffffff"
            text: qsTr("Max")
            font.pixelSize: 28
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            font.bold: true
        }

        Text {
            id: text35
            x: 15
            y: 122
            width: 110
            height: 42
            color: "#ffffff"
            text: ObjetGrl.nbcoupbestQML
            font.pixelSize: 28
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            focus: true
            activeFocusOnTab: false
            font.bold: true
        }
        enabled: false
    }

}


