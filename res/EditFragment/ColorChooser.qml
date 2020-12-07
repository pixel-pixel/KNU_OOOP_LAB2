import QtQuick 2.0
import QtQuick.Layouts 1.2
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import "../Material"

RowLayout {
    id: _main

    signal choose(color _color)

    Repeater {
        model: 10

        ColorButton {
            //: _red

            color: _fileReader.colors[index]

            onClicked: {
                _main.choose(color)
            }
        }
    }
}
