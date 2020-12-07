import QtQuick 2.2
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0
import "../EditFragment"

Rectangle {
    id: _main

    readonly property int default_width: 200
    readonly property int default_height: 200
    property variant papperColor: Material.color(Material.Indigo, Material.Shade200)

    width: dp(default_width)
    height: dp(default_height)

    color: "white"
    radius: dp(5)

//    Rectangle {
//        id: _border

//        anchors.fill: _main

//        z: 1
//        color: Qt.rgba(1, 1, 1, 0)

////        border.color: Material.color(Material.Grey)
////        border.width: dp(2)
//        radius: _main.radius
//    }

    Rectangle {
        id: _doc_icon

        width: _main.width
        height: width
        anchors.top: _main.top

        color: _main.papperColor

        radius: 10

        Image {
            id: _add_icon
            source: icon

            sourceSize.width: dp(100)
            sourceSize.height: dp(100)
            anchors.centerIn: _doc_icon

            antialiasing: true
            visible: false
        }
        ColorOverlay{
            id: _colorChanger

            color: "white"

            anchors.fill: _add_icon
            source: _add_icon
            antialiasing: true
        }
    }

//    Label {
//        id: _doc_name

//        width: _main.width
//        height: _main.height - _doc_icon.height
//        anchors.bottom: _main.bottom

//        text: name
//        font.family: _helveticaLoader.name
//    }

    MouseArea {
        id: _mouseArea

        property bool isHover: false

        anchors.fill: _main

        hoverEnabled: true
        onClicked: {
            _screenLoadeer.source = "../EditFragment/EditFragment.qml"
        }
        onHoveredChanged: {
//            if(isHover){
//                _border.border.color = Material.color(Material.Grey)
//                isHover = false
//            } else {
//                _border.border.color = Material.color(Material.Blue, Material.Shade600)
//                isHover = true
//            }
        }
    }
}
