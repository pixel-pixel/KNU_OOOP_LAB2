import QtQuick 2.2
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1
import "../Material"

Rectangle {
    id: _main

    property int paddings: width / 20
    property bool shadow: false
    property int shadowRadius: 0
    property string textOnLoad
    property bool textEditEnabled: true


    signal textChanged(string _text)

    function setText(t){
        _textEdit.text = t
    }
    function getText(){
        return _textEdit.text
    }

    width: dp(200)
    height: _textEdit.contentHeight > width ? _textEdit.contentHeight : width

    radius: width / 20

    layer.enabled: true
    layer.effect: DropShadow {
        transparentBorder: true
        color: Material.color(Material.Grey, Material.Shade400)
        samples: 50
        radius: _main.shadowRadius
    }

    TextEdit{
        id: _textEdit

        anchors.fill: parent
        anchors.centerIn: _main

        text: text == "" ? _main.textOnLoad : text
        //textFormat: TextEdit.RichText
        textMargin: _main.paddings

        font.pointSize: _main.width / 25.0
        font.family: _helveticaLoader.name

        color: "white"

        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        enabled: _main.textEditEnabled

        onTextChanged: {
            _main.textChanged(_textEdit.text)
        }
    }

//    OptionalMenu {
//        buttons: [
//            ["Змінити", "pics/add.svg", function(){}],
//            ["Архівати", "pics/add.svg", function(){}],
//            ["Видалити", "pics/add.svg", function(){}, true]
//        ]
//    }

//    MouseArea {
//        id: _mouseArea

//        property bool isHover: false

//        anchors.fill: _main
//        enabled: _main.iconMode

//        hoverEnabled: true

//        onClicked: {
//            _main.clicked();
//        }

//        onHoveredChanged: {
//            var color = _main.color

//            if(isHover) {
//                _main.shadowRadius = 0
//                //_main.y += 100
//               // _main.color = Qt.rgba(color.r - 0.03, color.g - 0.03, color.b - 0.03, color.a)
//                isHover = false
//            } else {
//                _main.shadowRadius = _main.width / 6
//                //_main.y -= 100
//                //_main.color = Qt.rgba(color.r + 0.03, color.g + 0.03, color.b + 0.03, color.a)
//                isHover = true
//            }
//        }

//        onPressed: {
//            _main.shadowRadius = _main.width / 9
//        }
//    }
}
