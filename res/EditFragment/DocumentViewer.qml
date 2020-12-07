import QtQuick 2.9
import QtQml 2.2
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.0
import "../Documents"

Flickable {
    id: _documentViewer

    property int papperWidth: Screen.desktopAvailableWidth / 2
    property int papperMargins: Screen.desktopAvailableWidth / 40
    property int papperPaddings: Screen.desktopAvailableWidth / 60
    property color papperColor
    property string papperText
    property int topPadding: 0
    property int zoom: 100

    function setNoteText(t){
        _papper.setText(t)
    }
    function getNoteText(){
        return _papper.getText()
    }
    function setNoteColor(c){
        _papper.color = c
    }
    function getNoteColor(){
        return _papper.color
    }

    //property string text: _papper.text
    //property int noteIndex: _screenLoader.noteIndex

    contentWidth: _papper.width + papperMargins * zoom / 100
    contentHeight: _papper.height + papperMargins * zoom / 100 + topPadding

    ScrollBar.vertical: ScrollBar {}
    ScrollBar.horizontal: ScrollBar {}

    Papper {
        id: _papper

        width: papperWidth * zoom / 100
        paddings: papperPaddings * zoom / 100

        x: (_documentViewer.width - width) / 2 >= 0 ? (_documentViewer.width - width) / 2 : _documentViewer.papperMargins * zoom / 200
        y: (_documentViewer.height - height) / 2 >= _documentViewer.topPadding ? (_documentViewer.height - height) / 2 : _documentViewer.papperMargins  * zoom / 200 + _documentViewer.topPadding

        //text: _fileReader.getText()
        color: _documentViewer.papperColor
        textOnLoad: _documentViewer.papperText

        focus: true
        //iconMode: false

        shadowRadius: width / 50
    }

    Shortcut {
        context: Qt.ApplicationShortcut
        sequence: "Ctrl++"

        onActivated: {
            switch(zoom) {
            case 25:
                zoom = 33
                break
            case 33:
                zoom = 50
                break
            case 50:
                zoom = 67
                break
            case 67:
                zoom = 75
                break
            case 75:
                zoom = 80
                break
            case 80:
                zoom = 90
                break
            case 90:
                zoom = 100
                break
            case 100:
                zoom = 110
                break
            case 110:
                zoom = 125
                break
            case 125:
                zoom = 150
                break
            case 150:
                zoom = 175
                break
            case 175:
                zoom = 200
                break
            case 200:
                zoom = 250
                break
            case 250:
                zoom = 300
                break
            case 300:
                zoom = 400
                break
            case 400:
                zoom = 500
                break
            }
        }
    }

    Shortcut {
        context: Qt.ApplicationShortcut
        sequence: "Ctrl+-"

        onActivated: {
            switch(zoom) {
            case 33:
                zoom = 25
                break
            case 50:
                zoom = 33
                break
            case 67:
                zoom = 50
                break
            case 75:
                zoom = 67
                break
            case 80:
                zoom = 75
                break
            case 90:
                zoom = 80
                break
            case 100:
                zoom = 90
                break
            case 110:
                zoom = 100
                break
            case 125:
                zoom = 110
                break
            case 150:
                zoom = 125
                break
            case 175:
                zoom = 150
                break
            case 200:
                zoom = 175
                break
            case 250:
                zoom = 200
                break
            case 300:
                zoom = 250
                break
            case 400:
                zoom = 300
                break
            case 500:
                zoom = 400
                break
            }
        }
    }

    Shortcut {
        context: Qt.ApplicationShortcut
        sequence: "Ctrl+0"

        onActivated: {
            zoom = 100
        }
    }
}
