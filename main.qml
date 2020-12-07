import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import "res/HomeFragment"
import NOTERdam 1.0

Window {
    id: _window

    readonly property int dpi: Screen.pixelDensity * 25.4

    visible: true
    width: dp(1200)
    height: dp(800)
    title: qsTr("NOTERdam")

    function dp(x){
        if(dpi < 160)
            return x

        return x * (dpi / 160)
    }

    Loader {
        id: _screenLoadeer

        property int noteIndex: 0

        anchors.fill: parent

        focus: true
        sourceComponent: HomeFragment {}
    }

    FontLoader {
        id: _helveticaLoader
        source: "res/Fonts/HelveticaRegular.ttf"
    }

    FileReader {
        id: _fileReader

        property var colors: [
            Material.color(Material.Red, Material.Shade300),
            Material.color(Material.Pink, Material.Shade300),
            Material.color(Material.DeepPurple, Material.Shade300),
            Material.color(Material.Blue, Material.Shade300),
            Material.color(Material.Cyan, Material.Shade300),
            Material.color(Material.Teal, Material.Shade300),
            Material.color(Material.Green, Material.Shade300),
            Material.color(Material.Lime, Material.Shade300),
            Material.color(Material.Orange, Material.Shade300),
            Material.color(Material.DeepOrange, Material.Shade300)
        ]
        function getRandomInt(min, max) {
            min = Math.ceil(min);
            max = Math.floor(max);
            return Math.floor(Math.random() * (max - min + 1)) + min;
        }
    }
}
