import QtQuick 2.0
import QtGraphicalEffects 1.0
import QtQuick.Controls.Material 2.0

Rectangle {
    id: _main

    property string source: ""
    property int size: 40
    property string iconColor: Material.color(Material.Grey, Material.Shade600)
    signal clicked()

    width: size
    height: size
    radius: size / 2

    color: Qt.rgba(0, 0, 0, 0)

    Image {
        id: _icon

        sourceSize.width: _main.size / 5 * 3
        sourceSize.height: _main.size / 5 * 3
        anchors.centerIn: _main

        source: _main.source

        antialiasing: true
        visible: false
    }

    ColorOverlay{
        id: _colorChanger

        color: _main.iconColor

        anchors.fill: _icon
        source: _icon
        antialiasing: true
    }

    MouseArea {
        id: _mouseArea

        property bool isHover: false

        anchors.fill: _main

        hoverEnabled: true

        onHoveredChanged: {
            if(isHover) {
                _main.color = Qt.rgba(0, 0, 0, 0)
                isHover = false
            } else {
                _main.color = Qt.rgba(0, 0, 0, 0.1)
                isHover = true
            }
        }

        onPressed: {
            _main.color = Qt.rgba(0, 0, 0, 0.2)
        }

        onReleased: {
            _main.color = Qt.rgba(0, 0, 0, 0.1)
        }

        onClicked: {
            _main.clicked()
        }
    }
}
