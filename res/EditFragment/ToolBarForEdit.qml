import QtQuick 2.4
import QtQuick.Layouts 1.2
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0

import "../Material"

BlurToolBar {
    id: _main

    signal chooseColor(color _color)
    signal save()

    CircleIconButton {
        id: _backButton

        anchors.verticalCenter: _main.verticalCenter
        anchors.left: _main.left
        anchors.leftMargin: (_main.height - height) / 2
        //anchors.rightMargin: (_main.height - height) / 2

        source: "pics/arrow_back.svg"

        onClicked: {
            _screenLoadeer.source = "../HomeFragment/HomeFragment.qml"
        }
    }

    Label {
        id: _nameLabel

        anchors.verticalCenter: _main.verticalCenter
        anchors.left: _backButton.right
        anchors.leftMargin: (_main.height - height) / 4

        text: "нова нотатка"
        font.family: _helveticaLoader.name
        font.pixelSize: _main.height / 8 * 3
        font.weight: Font.Medium

        color: Material.color(Material.Grey, Material.Shade600)
    }

    RowLayout {
        id: _rowLayout

        x: Math.ceil((_main.width - width) / 2)
        y: Math.ceil((_main.height - height) / 2)

        spacing: 2

        SquareIconButton {
            id: _paletteButton

            source: "pics/palette.svg"

            onClicked: {
                _paletteAnimation.toY = Math.ceil(-_rowLayout.height - _rowLayout.spacing * 2)
                _paletteAnimation.toOpacity = 0.0
                _paletteAnimation.pauseDuration = 0
                _paletteAnimation.running = true
            }

            SequentialAnimation {
                id: _paletteAnimation

                property int time: 200
                property real toY: 0.0
                property real toOpacity: 0.0
                property int pauseDuration: 0

                NumberAnimation {
                    duration: _paletteAnimation.pauseDuration
                }

                ParallelAnimation {
                    NumberAnimation {
                        target: _rowLayout
                        property: "y"
                        duration: _paletteAnimation.time
                        easing.type: Easing.InOutQuad

                        to: _paletteAnimation.toY
                    }

                    NumberAnimation {
                        target: _rowLayout
                        property: "opacity"
                        duration: _paletteAnimation.time
                        easing.type: Easing.InOutQuad

                        to: _paletteAnimation.toOpacity
                    }
                }
            }
        }

        VerticalLine {
            height: _paletteButton.height
            lineHeight: dp(24)
        }

        SquareIconButton {
            id: _boldButton

            source: "pics/bold.svg"
        }

        SquareIconButton {
            id: _italicButton

            source: "pics/italic.svg"
        }

        SquareIconButton {
            id: _underlinedButton

            source: "pics/underlined.svg"
        }

        VerticalLine {
            height: _paletteButton.height
            lineHeight: dp(24)
        }

        SquareIconButton {
            id: _alignLeftButton

            source: "pics/align_left.svg"
        }

        SquareIconButton {
            id: _alignCenterButton

            source: "pics/align_center.svg"
        }

        SquareIconButton {
            id: _alignRightButton

            source: "pics/align_right.svg"
        }

        VerticalLine {
            height: _paletteButton.height
            lineHeight: dp(24)
        }

        SquareIconButton {
            id: _listButton

            source: "pics/list.svg"
        }

        SquareIconButton {
            id: _listNumberedButton

            source: "pics/list_numbered.svg"
        }
    }

    ColorChooser {
        id: _colorChooser

        anchors.horizontalCenter: _rowLayout.horizontalCenter
        anchors.top: _rowLayout.bottom
        anchors.topMargin: (_main.height - _rowLayout.height) / 2

        opacity: 1.0 - _rowLayout.opacity

        onChoose: {
            _main.chooseColor(_color)
            _paletteAnimation.toY = Math.ceil((_main.height - _rowLayout.height) / 2)
            _paletteAnimation.toOpacity = 1.0
            _paletteAnimation.pauseDuration = 200
            _paletteAnimation.running = true
        }
    }

    CircleIconButton {
        id: _undoButton

        anchors.verticalCenter: _main.verticalCenter
        anchors.right: _saveButton.left

        source: "pics/undo.svg"
    }

    CircleIconButton {
        id: _saveButton

        anchors.verticalCenter: _main.verticalCenter
        anchors.right: _redoButton.left

        source: "pics/save.svg"

        onClicked: {
            _main.save()
        }
    }

    CircleIconButton {
        id: _redoButton

        anchors.verticalCenter: _main.verticalCenter
        anchors.right: _main.right
        anchors.rightMargin: (_main.height - height) / 2

        source: "pics/redo.svg"
    }
}
