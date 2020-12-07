import QtQuick 2.0
import QtQuick.Controls 2.2
import "../Documents"

Rectangle {
    id: _main

    property ListModel model: DocumentModel{}
    property int padding: dp(5)

    width: 150
    height: parent.height

    ListView {
        id: _pappersList

        width: _main.width
        height: _main.height

        model: _main.model
        delegate: Rectangle {
            width: _pappersList.width
            height: _papper.height + _page.height + _main.padding * 2

            color: "blue"

            Papper {
                id: _papper

                width: parent.width - _main.padding * 2
                x: _main.padding
                y: 10

                shadow: false
            }

            Label {
                id: _page

                width: parent.width - 20
                x: 10
                y: 10

                text: "1"
            }
        }
    }

//    Component {
//        id: _miniature

//        property int width: dp(200)


//    }
}
