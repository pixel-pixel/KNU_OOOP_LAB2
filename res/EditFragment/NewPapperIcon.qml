import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1

Rectangle {
    id: _main

    property bool shadow: true
    property color papperColor: Qt.rgba(1, 1, 1, 1)
    property int shadowRadius: 0
    signal clicked();

    width: dp(200)
    height: width

    color: _fileReader.colors[Math.floor(Math.random() * 10)]
    //color: _main.papperColor === Qt.rgba(1, 1, 1, 1) ? _fileReader.getNoteColor(_screenLoadeer.noteIndex) : _main.papperColor
    //color: Material.color(Material.Blue, Material.Shade300)
    radius: width / 20

    layer.enabled: true
    layer.effect: DropShadow {
        transparentBorder: true
        color: Material.color(Material.Grey, Material.Shade400)
        samples: 50
        radius: _main.shadowRadius
    }

    SequentialAnimation on color{
        id: _animation
        property int tempDuration: 1000
        property var tempEasing: Easing.InOutQuad

        running: true
        loops: Animation.Infinite

        ColorAnimation {
            to: _fileReader.colors[0]
            duration: _animation.tempDuration
            easing.type: _animation.tempEasing
        }
        ColorAnimation {
            to: _fileReader.colors[1]
            duration: _animation.tempDuration
            easing.type: _animation.tempEasing
        }
        ColorAnimation {
            to: _fileReader.colors[2]
            duration: _animation.tempDuration
            easing.type: _animation.tempEasing
        }
        ColorAnimation {
            to: _fileReader.colors[3]
            duration: _animation.tempDuration
            easing.type: _animation.tempEasing
        }
        ColorAnimation {
            to: _fileReader.colors[4]
            duration: _animation.tempDuration
            easing.type: _animation.tempEasing
        }
        ColorAnimation {
            to: _fileReader.colors[5]
            duration: _animation.tempDuration
            easing.type: _animation.tempEasing
        }
        ColorAnimation {
            to: _fileReader.colors[6]
            duration: _animation.tempDuration
            easing.type: _animation.tempEasing
        }
        ColorAnimation {
            to: _fileReader.colors[7]
            duration: _animation.tempDuration
            easing.type: _animation.tempEasing
        }
        ColorAnimation {
            to: _fileReader.colors[8]
            duration: _animation.tempDuration
            easing.type: _animation.tempEasing
        }
        ColorAnimation {
            to: _fileReader.colors[9]
            duration: _animation.tempDuration
            easing.type: _animation.tempEasing
        }
    }

    Image {
        id: _icon

        sourceSize.width: _main.width / 100 * 36
        sourceSize.height: _main.width / 100 * 36
        anchors.centerIn: _main

        source: "../Material/pics/add.svg"

        antialiasing: true
        visible: false
    }
    ColorOverlay{
        id: _colorChanger

        color: "white"

        anchors.fill: _icon
        source: _icon
        antialiasing: true
    }

    MouseArea {
        id: _mouseArea

        property bool isHover: false

        anchors.fill: _main
        enabled: true

        hoverEnabled: true

        onClicked: {
            _main.clicked();
        }

        onHoveredChanged: {
            var color = _main.color

            if(isHover) {
                _main.shadowRadius = 0
                //_main.color = Qt.rgba(color.r - 0.03, color.g - 0.03, color.b - 0.03, color.a)
                isHover = false
            } else {
                _main.shadowRadius = _main.width / 6
                //_main.color = Qt.rgba(color.r + 0.03, color.g + 0.03, color.b + 0.03, color.a)
                isHover = true
            }
        }

        onPressed: {
            _main.shadowRadius = _main.width / 9
        }
    }

}
