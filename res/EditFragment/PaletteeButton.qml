import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.0

import "../Material"

SquareIconButton {
    id: _main

    source: "pics/palette.svg"

    onClicked: {
        _main.enabled = false
        _animation.running = true
    }

    DropShadow {
        id: _shadow

        source: _main
        anchors.fill: _main
        samples: 32
        radius: 16
        color: Material.color(Material.Grey, Material.Shade400)
    }

    ParallelAnimation {
        id: _animation

        property int newSize: dp(200)
        property int time: 250


        NumberAnimation {
            target: _main
            property: "size"
            duration: _animation.time
            easing.type: Easing.InOutQuad

            to: _animation.newSize
        }


        NumberAnimation {
            target: _main
            property: "x"
            duration: _animation.time
            easing.type: Easing.InOutQuad

            to: x - _animation.newSize / 2 + _main.size / 2
        }

        ColorAnimation {
            target: _main
            property: "color"

            from: _main.color
            to: "white"
            duration: _animation.time / 2
            easing.type: Easing.InOutQuad
        }

        ColorAnimation {
            target: _main
            property: "iconColor"

            from: _main.iconColor
            to: "white"
            duration: _animation.time / 2
            easing.type: Easing.InOutQuad
        }


    }

}
