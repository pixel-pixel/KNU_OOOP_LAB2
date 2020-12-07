import QtQuick 2.0
import QtQuick.Controls.Material 2.0

Item {
    id: _main

    property variant color: Material.color(Material.Grey, Material.Shade400)
    property int lineWidth: 1
    property int lineHeight: height

    width: 1

    Rectangle {
        id: _line

        width: _main.lineWidth
        height: _main.lineHeight
        anchors.centerIn: _main

        color: _main.color
    }
}
