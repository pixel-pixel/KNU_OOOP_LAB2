import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.0
import "../Material"

BlurToolBar {
    id: _main

    property bool isArchive: false
    signal archiveClick()

    Image {
        id: _noterdamIcon
        source: "../NOTERdam_icon.png"

        width: _search.height
        height: _search.height
        anchors.verticalCenter: _main.verticalCenter
        anchors.left: _main.left
        anchors.leftMargin: (_main.height - width) / 2
    }

    Label {
        id: _nameLabel

        anchors.verticalCenter: _main.verticalCenter
        anchors.left: _noterdamIcon.right

        text: "NOTERdam"
        font.family: _helveticaLoader.name
        font.pixelSize: _main.height / 8 * 3
        font.weight: Font.Medium

        color: Material.color(Material.Grey, Material.Shade600)
    }

    Search {
        id: _search

        width: _toolBar.width / 2
        anchors.centerIn: parent
    }

    CircleIconButton {
        id: _folderButton

        size: _main.height / 8 * 5
        anchors.verticalCenter: _main.verticalCenter
        anchors.right: _sortButton.left

        source: _main.isArchive ? "pics/note.svg" : "pics/folder.svg"
        //iconColor: Material.color(Material.Grey, Material.Shade700)

        onClicked: {
            _main.archiveClick()
        }
    }

    CircleIconButton {
        id: _sortButton

        size: _main.height / 8 * 5
        anchors.verticalCenter: _main.verticalCenter
        anchors.right: _settingsButton.left

        source: "pics/sort.svg"
        //iconColor: Material.color(Material.Grey, Material.Shade700)
    }

    CircleIconButton {
        id: _settingsButton

        size: _main.height / 8 * 5
        anchors.verticalCenter: _search.verticalCenter
        anchors.right: _main.right
        anchors.rightMargin: (_main.height - size) / 2

        source: "pics/settings.svg"
        //iconColor: Material.color(Material.Grey, Material.Shade700)
    }
}



//Rectangle {
//    id: _main

//    property variant blurSource;

//    width: parent.width
//    height: dp(64)
//    z: 1

//    border.color: Material.color(Material.Grey, Material.Shade300)

//    LiveBlur {
//        id: _blur

//        width: _main.width
//        height: _main.height

//        source: blurSource
//        color: Qt.rgba(_main.color.r, _main.color.g, _main.color.b, 0.5)
//    }

//    Image {
//        id: _noterdamIcon
//        source: "../NOTERdam_icon.png"

//        width: _search.height
//        height: _search.height
//        anchors.verticalCenter: _main.verticalCenter
//        anchors.left: _main.left
//        anchors.leftMargin: (_main.height - width) / 2
//    }

//    Label {
//        id: _nameLabel

//        anchors.verticalCenter: _main.verticalCenter
//        anchors.left: _noterdamIcon.right

//        text: "NOTERdam"
//        font.family: _helveticaLoader.name
//        font.pixelSize: _main.height / 8 * 3
//        font.weight: Font.Medium

//        color: Material.color(Material.Grey, Material.Shade700)
//    }

//    Search {
//        id: _search

//        width: _toolBar.width / 2
//        anchors.centerIn: parent
//    }

//    CircleIconButton {
//        id: _folderButton

//        size: _main.height / 8 * 5
//        anchors.verticalCenter: _main.verticalCenter
//        anchors.right: _sortButton.left

//        source: "pics/folder.svg"
//        iconColor: Material.color(Material.Grey, Material.Shade700)
//    }

//    CircleIconButton {
//        id: _sortButton

//        size: _main.height / 8 * 5
//        anchors.verticalCenter: _main.verticalCenter
//        anchors.right: _settingsButton.left

//        source: "pics/sort.svg"
//        iconColor: Material.color(Material.Grey, Material.Shade700)
//    }

//    CircleIconButton {
//        id: _settingsButton

//        size: _main.height / 8 * 5
//        anchors.verticalCenter: _search.verticalCenter
//        anchors.right: _main.right
//        anchors.rightMargin: (_main.height - size) / 2

//        source: "pics/settings.svg"
//        iconColor: Material.color(Material.Grey, Material.Shade700)
//    }
//}



//    Rectangle {
//        id: _main

//        width: parent.width
//        height: dp(64)

//        border.color: Material.color(Material.Grey, Material.Shade400)

//        z: 1


//    }





