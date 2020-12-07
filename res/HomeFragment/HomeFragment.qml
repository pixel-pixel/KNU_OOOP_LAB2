import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.0
import "../DocumentButtonDesk"
import "../Material"

Rectangle {
    id: _main

    anchors.fill: parent

    ToolBarForFiles {
        id: _toolBar

        anchors.top: _main.top
        anchors.left: _main.left
        anchors.right: _main.right

        blurSource: _desk

        onArchiveClick: {
            _desk.isArchive = _toolBar.isArchive = !_desk.isArchive
        }
    }

    DocumentButtonDesk {
        id: _desk

        anchors.fill: _main
        topPadding: spacing / 2 + _toolBar.height
        bottomPadding: spacing / 2

        onNoteChoose: {
            _screenLoadeer.noteIndex = _index
            _screenLoadeer.source = "../EditFragment/EditFragment.qml"
        }
    }
}
