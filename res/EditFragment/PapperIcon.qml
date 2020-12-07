import QtQuick 2.0
import "../Material"

Papper {
    id: _papperIcon

    property int indexInGrid: index
    property bool isClickable: true
    //property var target
    signal clicked()
    signal rightClicked()

    width: dp(200)
    height: width

    textOnLoad: _fileReader.getText(indexInGrid)
    color: _fileReader.getNoteColor(indexInGrid)

    textEditEnabled: false

//    OptionalMenu {
//        id: _optionalMenu

//        y: _papperIcon.y + _papperIcon.height + height - dp(10)

//        buttons: [
//            ["Змінити", "pics/add.svg", function(){}],
//            ["Архівати", "pics/add.svg", function(){}],
//            ["Видалити", "pics/add.svg", function(){}, true]
//        ]

//        visible: false
//    }

    MouseArea {
        id: _mouseArea

        property bool isHover: false

        anchors.fill: _papperIcon
        enabled: _papperIcon.isClickable

        hoverEnabled: true
        acceptedButtons: Qt.LeftButton | Qt.RightButton

        onClicked: {
            if(mouse.button == Qt.RightButton){
                _papperIcon.rightClicked()
            } else {
                _papperIcon.clicked();
            }
        }

        onHoveredChanged: {
            var color = _main.color

            if(isHover) {
                _papperIcon.shadowRadius = 0
                isHover = false
            } else {
                _papperIcon.shadowRadius = _papperIcon.width / 6
                isHover = true
            }
        }

        onPressed: {
            _papperIcon.shadowRadius = _papperIcon.width / 9
        }
    }
}
