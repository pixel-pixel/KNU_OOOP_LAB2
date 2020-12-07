import QtQuick 2.4
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import "../Documents"

Rectangle {
    id: _main

    anchors.fill: parent



    ToolBarForEdit {
        id: _toolBar

        anchors.top: _main.top
        anchors.left: _main.left
        anchors.right: _main.right

        blurSource: _documentViewer

        onChooseColor: {
            _papperColorAnimation.to = _color
            _papperColorAnimation.running = true

           // _documentViewer.setNoteColor(_color)
        }

        onSave: {
            _fileReader.save(_screenLoadeer.noteIndex, _documentViewer.getNoteText(), _documentViewer.getNoteColor())
            if(_screenLoadeer.noteIndex === 0)
                _screenLoadeer.noteIndex++
        }

        PropertyAnimation {
            id: _papperColorAnimation

            target: _documentViewer
            property: "papperColor"

            duration: 200
            easing.type: Easing.InOutQuad
        }
    }

    DocumentViewer {
        id: _documentViewer

        anchors.fill: _main
        topPadding: _toolBar.height

        papperColor: _screenLoadeer.noteIndex === 0 ?
                         _fileReader.colors[Math.floor(Math.random() * 10)] :
                         _fileReader.getNoteColor(_screenLoadeer.noteIndex)
        papperText: _screenLoadeer.noteIndex === 0 ?
                        "" : _fileReader.getText(_screenLoadeer.noteIndex)
    }
}
