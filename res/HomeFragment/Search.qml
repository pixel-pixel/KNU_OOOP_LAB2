import QtQuick 2.2
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1
import "../Material"

Rectangle {
    id: _main

    height: dp(48)

    property int iconSpacing: (height - _searchButton.size) / 2
    property string searchText: "Пошук"

    color: Material.color(Material.Grey, Material.Shade200)
    radius: dp(10)

    CircleIconButton {
        id: _searchButton

        size: dp(40)
        x: _main.iconSpacing
        anchors.verticalCenter: _main.verticalCenter

        source: "pics/search.svg"
        iconColor: Material.color(Material.Grey, Material.Shade600)
    }

    TextInput {
        id: _search

        height: font.pixelSize
        anchors.verticalCenter: _main.verticalCenter
        anchors.left: _searchButton.right
        anchors.right: _main.right
        anchors.leftMargin: _main.iconSpacing
        anchors.rightMargin: _main.iconSpacing

        text: _main.searchText
        font.family: _helveticaLoader.name
        font.pixelSize: _searchButton.size / 5 * 2
        font.weight: Font.Normal

        color: Material.color(Material.Grey, Material.Shade600)

        onActiveFocusChanged: {
            if(_search.activeFocus){
                _main.color = "white"
                _main.border.width = dp(2)
                _main.border.color = Material.color(Material.Blue, Material.Shade600)
            } else {
                _main.color = Material.color(Material.Grey, Material.Shade50)
                _main.border.width = dp(0)
            }
        }

    }
}
