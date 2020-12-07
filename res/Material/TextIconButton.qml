import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1.0

Rectangle {
    id: _textIconButton

    property string text
    property string source
    property color textIconColor: Material.color(Material.Grey, Material.Shade00)
    property color unpresedColor: Material.color(Material.Grey, Material.Shade100)
    property color hoverColor: Material.color(Material.Grey, Material.Shade300)
    property color presedColor: Material.color(Material.Grey, Material.Shade400)
    signal clicked()

    width: dp(200)
    height: dp(48)

    color: unpresedColor

    Label {
        id: _text

        anchors.verticalCenter: _textIconButton.verticalCenter
        anchors.left: _textIconButton.left
        anchors.leftMargin: (_textIconButton.height - height) / 2

        text: _textIconButton.text
        font.family: _helveticaLoader.name
        font.pixelSize: _textIconButton.height / 3
        font.weight: Font.Normal

        color: _textIconButton.textIconColor
    }

    Image {
        id: _icon

        sourceSize.width: _textIconButton.height / 2
        sourceSize.height: _textIconButton.height / 2
        anchors.verticalCenter: _textIconButton.verticalCenter
        anchors.right: _textIconButton.right
        anchors.rightMargin: (_textIconButton.height - height) / 2

        source: _textIconButton.source

        antialiasing: true
        visible: false
    }

    ColorOverlay{
        id: _colorChanger

        color: _textIconButton.textIconColor

        anchors.fill: _icon
        source: _icon
        antialiasing: true
    }

    MouseArea {
        id: _mouseArea

        property bool isHover: false

        anchors.fill: _textIconButton

        hoverEnabled: true

        onHoveredChanged: {
            if(isHover) {
                _textIconButton.color = _textIconButton.unpresedColor
                isHover = false
            } else {
                _textIconButton.color = _textIconButton.hoverColor
                isHover = true
            }
        }

        onPressed: {
            _textIconButton.color = _textIconButton.presedColor
        }
        onReleased: {
            _textIconButton.color = _textIconButton.hoverColor
        }

        onClicked: {
            _textIconButton.clicked()
        }
    }
}
