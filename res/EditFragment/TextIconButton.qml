import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.0

Rectangle {
    id: _textIconButton

    property string text
    property string source
    property color unpresedColor: Material.color(Material.Grey, Material.Shade200)
    property color hoverColor: Material.color(Material.Grey, Material.Shade50)
    property color presedColor: Material.color(Material.Grey, Material.Shade400)
    signal clicked()

    color: unpresedColor

    width: dp(200)
    height: dp(30)

    Label {
        id: _text

        anchors.verticalCenter: _textIconButton.verticalCenter
        anchors.left: _textIconButton.left
        anchors.leftMargin: (_textIconButton.height - height) / 2

        text: _textIconButton.text
        font.family: _helveticaLoader.name
        font.pixelSize: dp(24)
        font.weight: Font.Thin

        color: Material.color(Material.Grey, Material.Shade800)
    }

    Image {
        id: _icon

        sourceSize.width: dp(24)
        sourceSize.height: dp(24)
        anchors.verticalCenter: _textIconButton.verticalCenter
        anchors.right: _text.right
        anchors.rightMargin: (_textIconButton.height - height) / 2

        source: _textIconButton.source
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

        onClicked: {
            _textIconButton.clicked()
        }
    }
}
