import QtQuick 2.0
import QtQuick.Layouts 1.2
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.0

Rectangle {
    id: _functionalMenu

    property int zoom: 100
    property color borderColor: Material.color(Material.Grey, Material.Shade400)
    property color selectedColor: Material.color(Material.Red, Material.Shade900)
    property int spacing: 1
    property var buttons: [
        ["Змінити", "pics/add.svg"],
        ["Архівати", "pics/add.svg"],
        ["Видалити", "pics/add.svg"]
    ]

    signal clicked(int _command)

    width: _columnLayout.width
    height: _columnLayout.height

    //radius: dp(16)
    clip: true

    color: borderColor

    layer.enabled: true
    layer.effect: OpacityMask {
        maskSource: Item {
            width: _functionalMenu.width
            height: _functionalMenu.height

            Rectangle {
                anchors.centerIn: parent
                width: _functionalMenu.width
                height: _functionalMenu.height
                radius: dp(10)
            }
        }
    }



//    layer.effect: OpacityMask {
//                maskSource: Item {
//                    width: rect.width
//                    height: rect.height
//                    Rectangle {
//                        anchors.centerIn: parent
//                        width: rect.adapt ? rect.width : Math.min(rect.width, rect.height)
//                        height: rect.adapt ? rect.height : width
//                        radius: 30
//                    }
//                }
//            }


    ColumnLayout {
        id: _columnLayout

        spacing: _functionalMenu.spacing

        Repeater {
            id: _repeater

            model: _functionalMenu.buttons.length

            TextIconButton {
                width: dp(200) / 100 * _functionalMenu.zoom
                height: dp(48) / 100 * _functionalMenu.zoom

                text: _functionalMenu.buttons[index][0]
                source: _functionalMenu.buttons[index][1]
                //onClicked: _functionalMenu.buttons[index][2] ? _functionalMenu.buttons[index][2] : {}
                textIconColor: _functionalMenu.buttons[index][3] ?
                                   _functionalMenu.selectedColor : textIconColor

                onClicked: {
                    _functionalMenu.clicked(index)
                }

                //radius: _functionalMenu.radius
            }
        }
    }
}
