import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.5



ApplicationWindow {
    id: clicker_menu
    minimumHeight: 800
    minimumWidth: 600
    maximumHeight: 800
    maximumWidth: 600
    color: '#7FFFD4'
    visible: true
    title: qsTr("Clicker")

    Timer
    {
        id: time
        interval: 1000
        running: true
        repeat: true
        onTriggered:
        {
            game_window.points=game_window.points+game_window.points_per_second
            number_of_points.text=qsTr("Points: "+game_window.points)
        }

    }

    Text
    {
        id: clicker_game_text
        font.family: "Comic Sans MS";
        text: "Clicker\ngame!"
        //color: "#ff00ff"

            ColorAnimation on color {
                id: anim
                from: "#ff00ff"
                to: "#ffff00"
                duration: 3000
                running: true
                loops: Animation.Infinite

            }

        font.pixelSize: 100;
        x: 150
        elide: Text.ElideRight
    }

        Button{
            id:start_button
            x:200
            y:300
            height:100
            width:200
            flat: true
            contentItem: Text {
                    font.family: "Comic Sans MS";
                    text: "Start"
                    color: start_button.down ? "#ff00ff":(start_button.hovered ? "#ffff00" : "#ff00ff")
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: 60;
                    elide: Text.ElideRight
               }
            background: Rectangle {
                          opacity: enabled ? 1 : 0.3
                          color: start_button.down ? "#ffff00":(start_button.hovered ? "#ff00ff" : "#ffff00")
                          border.color: start_button.down ? "#ffff00" : "#ff00ff"
                          border.width: 1
                          radius: 20
            }
            onClicked:
            {

                game_window.visible=true;
                clicker_menu.visible=false;

               }
        }

        Button{
            id:quit_button
            x:200
            y:600
            height:100
            width:200
            flat: true
            contentItem: Text {
                    font.family: "Comic Sans MS";
                    text: "Quit"
                    color: quit_button.down ? "#ff00ff":(quit_button.hovered ? "#ffff00" : "#ff00ff")
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: 60;
                    elide: Text.ElideRight
        }
            background: Rectangle {
                          opacity: enabled ? 1 : 0.3
                          color: quit_button.down ? "#ffff00":(quit_button.hovered ? "#ff00ff" : "#ffff00")
                          border.color: quit_button.down ? "#ffff00" : "#ff00ff"
                          border.width: 1
                          radius: 20
            }
             onClicked: close()
    }

 Window {
     id:game_window

     property int points: 0
     property int points_per_click: 1
     property int points_per_second: 0
     property int cost_upgrade_1: 100
     property int cost_upgrade_2: 200

     x:800
     y:300
     minimumHeight: 800
     minimumWidth: 1200
     maximumHeight: 800
     maximumWidth: 1200
     color: '#7FFFD4'
     visible: false
     title: qsTr("Clicker")

     Button
     {
         id:exit_button
         x:950
         y:650
         height:100
         width:200
         flat: true
         contentItem: Text {
                 font.family: "Comic Sans MS";
                 text: "Exit"
                 color: exit_button.down ? "#ff00ff":(exit_button.hovered ? "#ffff00" : "#ff00ff")
                 horizontalAlignment: Text.AlignHCenter
                 verticalAlignment: Text.AlignVCenter
                 font.pixelSize: 60;
                 elide: Text.ElideRight
     }
         background: Rectangle {
                       opacity: enabled ? 1 : 0.3
                       color: exit_button.down ? "#ffff00":(exit_button.hovered ? "#ff00ff" : "#ffff00")
                       border.color: exit_button.down ? "#ffff00" : "#ff00ff"
                       border.width: 1
                       radius: 20
         }
          onClicked:
          {
              game_window.close();
              clicker_menu.visible=true;
              fileio.write("dupa.txt", "Ask Ubuntu");
     }
     }

     Button
     {
         id:reset_button
         x:700
         y:650
         height:100
         width:200
         flat: true
         contentItem: Text {
                 font.family: "Comic Sans MS";
                 text: "Reset"
                 color: reset_button.down ? "#ff00ff":(reset_button.hovered ? "#ffff00" : "#ff00ff")
                 horizontalAlignment: Text.AlignHCenter
                 verticalAlignment: Text.AlignVCenter
                 font.pixelSize: 60;
                 elide: Text.ElideRight
     }
         background: Rectangle {
                       opacity: enabled ? 1 : 0.3
                       color: reset_button.down ? "#ffff00":(reset_button.hovered ? "#ff00ff" : "#ffff00")
                       border.color: reset_button.down ? "#ffff00" : "#ff00ff"
                       border.width: 1
                       radius: 20
         }
          onClicked:
          {
              game_window.points=0
              number_of_points.text=qsTr("Points: "+game_window.points)
              game_window.points_per_click=1
              number_of_points_per_click.text = qsTr("Points per click: "+game_window.points_per_click)
              game_window.points_per_second=0
              number_of_points_per_second.text = qsTr("Points per second: "+game_window.points_per_second)
              game_window.cost_upgrade_1=100
              cost_upgrade_1.text=qsTr("Cost: "+game_window.cost_upgrade_1)
              game_window.cost_upgrade_2=200
              cost_upgrade_2.text=qsTr("Cost: "+game_window.cost_upgrade_2)
     }
     }

     Button
     {
         id:upgrade_1_button
         x:950
         y:250
         height:100
         width:200
         flat: true
         contentItem: Text {
                 font.family: "Comic Sans MS";
                 text: "+1 per click"
                 color: upgrade_1_button.down ? "#ff00ff":(upgrade_1_button.hovered ? "#ffff00" : "#ff00ff")
                 horizontalAlignment: Text.AlignHCenter
                 verticalAlignment: Text.AlignVCenter
                 font.pixelSize: 30;
                 elide: Text.ElideRight
     }
         background: Rectangle {
                       opacity: enabled ? 1 : 0.3
                       color: upgrade_1_button.down ? "#ffff00":(upgrade_1_button.hovered ? "#ff00ff" : "#ffff00")
                       border.color: upgrade_1_button.down ? "#ffff00" : "#ff00ff"
                       border.width: 1
                       radius: 20
         }
          onClicked:
          {
              if(game_window.points>=game_window.cost_upgrade_1)
              {
                  game_window.points=game_window.points-game_window.cost_upgrade_1
                 number_of_points.text=qsTr("Points: "+game_window.points)

                  game_window.cost_upgrade_1 = game_window.cost_upgrade_1 * 1.5
                  cost_upgrade_1.text=qsTr("Cost: "+game_window.cost_upgrade_1)

                  game_window.points_per_click=game_window.points_per_click+1
                  number_of_points_per_click.text = qsTr("Points per click: "+game_window.points_per_click)
              }

     }
     }

     Button
     {
         id:upgrade_2_button
         x:950
         y:420
         height:100
         width:200
         flat: true
         contentItem: Text {
                 font.family: "Comic Sans MS";
                 text: "+1 per second"
                 color: upgrade_2_button.down ? "#ff00ff":(upgrade_2_button.hovered ? "#ffff00" : "#ff00ff")
                 horizontalAlignment: Text.AlignHCenter
                 verticalAlignment: Text.AlignVCenter
                 font.pixelSize: 30;
                 elide: Text.ElideRight
     }
         background: Rectangle {
                       opacity: enabled ? 1 : 0.3
                       color: upgrade_2_button.down ? "#ffff00":(upgrade_2_button.hovered ? "#ff00ff" : "#ffff00")
                       border.color: upgrade_2_button.down ? "#ffff00" : "#ff00ff"
                       border.width: 1
                       radius: 20
         }
          onClicked:
          {
              if(game_window.points>=game_window.cost_upgrade_2)
              {
                  game_window.points=game_window.points-game_window.cost_upgrade_2
                 number_of_points.text=qsTr("Points: "+game_window.points)

                  game_window.cost_upgrade_2 = game_window.cost_upgrade_2 * 1.5
                  cost_upgrade_2.text=qsTr("Cost: "+game_window.cost_upgrade_2)

                  game_window.points_per_second=game_window.points_per_second+1
                  number_of_points_per_second.text = qsTr("Points per second: "+game_window.points_per_second)
              }
            }

     }

     Text {
         id: cost_upgrade_1
         x: 950
         y: 200
         text: qsTr("Cost: "+game_window.cost_upgrade_1)
         font.family: "Comic Sans MS";
         color: "#ff00ff"
         horizontalAlignment: Text.AlignHCenter
         verticalAlignment: Text.AlignVCenter
         font.pixelSize: 30;
         elide: Text.ElideRight
     }

     Text {
         id: cost_upgrade_2
         x: 950
         y: 370
         text: qsTr("Cost: "+game_window.cost_upgrade_2)
         font.family: "Comic Sans MS";
         color: "#ff00ff"
         horizontalAlignment: Text.AlignHCenter
         verticalAlignment: Text.AlignVCenter
         font.pixelSize: 30;
         elide: Text.ElideRight
     }

     Text {
         id: number_of_points
         x: 0
         y: 0
         text: qsTr("Points: "+game_window.points)
         font.family: "Comic Sans MS";
         color: "#ff00ff"
         horizontalAlignment: Text.AlignHCenter
         verticalAlignment: Text.AlignVCenter
         font.pixelSize: 26;
         elide: Text.ElideRight
     }

     Text {
         id: number_of_points_per_second
         x: 0
         y: 200
         text: qsTr("Points per second: "+game_window.points_per_second)
         font.family: "Comic Sans MS";
         color: "#ff00ff"
         horizontalAlignment: Text.AlignHCenter
         verticalAlignment: Text.AlignVCenter
         font.pixelSize: 24;
         elide: Text.ElideRight
     }

     Text {
         id: number_of_points_per_click
         x: 0
         y: 250
         text: qsTr("Points per click: " + game_window.points_per_click)
         font.family: "Comic Sans MS";
         color: "#ff00ff"
         horizontalAlignment: Text.AlignHCenter
         verticalAlignment: Text.AlignVCenter
         font.pixelSize: 24;
         elide: Text.ElideRight
     }
Button
{
    id:click
    x:300
    y:200
    height:360
    width:540
     Rectangle
     {
         id: click_area
         //x:300
         //y:200
         height:360
         width:540
         opacity: enabled ? 1 : 0.3
         color: click.down ? "#ff00ff":(click.hovered ? "#ffff00" : "#ffff00")
         border.color: "#ff00ff"
         border.width: 1
         radius: 20
         Text {
             id: tap_here
             x: 200
             y: 160
             text: qsTr("Tap here")
             font.family: "Comic Sans MS";
             color: click.down ? "#ffff00":(click.hovered ? "#ff00ff" : "#ff00ff")
             horizontalAlignment: Text.AlignHCenter
             verticalAlignment: Text.AlignVCenter
             font.pixelSize: 24;
             elide: Text.ElideRight
         }
     }
     onClicked:
     {
         game_window.points = game_window.points + game_window.points_per_click
         number_of_points.text=qsTr("Points: "+game_window.points)
     }

}

 }
}


