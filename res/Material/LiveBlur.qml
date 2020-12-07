import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    id: _main

    property variant source;
    property int radius: 50;
    property variant color;

    width: parent.width
    height: parent.height

    clip: true

    FastBlur {
        id: _blur

        width: _main.source.width
        height: _main.source.height

        source: _main.source
        radius: _main.radius

        clip: true

        antialiasing: true
        visible: false
    }

    ColorOverlay {
        id: _colorOverlay

        anchors.fill: _blur

        source: _blur
        color: _main.color
        antialiasing: true
    }
}
