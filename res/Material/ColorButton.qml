import QtQuick 2.4
import QtQuick.Controls.Material 2.1

Rectangle {
    id: _main

    property int size: dp(40)
    signal clicked()

    width: size
    height: size

    color: "white"
    radius: size / 2
    border.width: dp(2)
    border.color: "white"

    MouseArea {
        id: _mouseArea

        anchors.fill: _main

        onClicked: {
            _main.clicked()
            //border.color = Material.color(Material.Blue, Material.Shade600)
        }
    }
}
