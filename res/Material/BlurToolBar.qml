import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.0
import "../Material"

Rectangle {
    id: _main

    property variant blurSource;

    width: parent.width
    height: dp(64)

    clip: true
    z: 1

    border.color: Material.color(Material.Grey, Material.Shade300)

    LiveBlur {
        id: _blur

        width: _main.width
        height: _main.height

        source: blurSource
        color: Qt.rgba(_main.color.r, _main.color.g, _main.color.b, 0.5)
    }
}
