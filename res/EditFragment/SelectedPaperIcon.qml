import QtQuick 2.0
import "../Material"
import QtQuick.Controls.Material 2.0
import QtGraphicalEffects 1

Item {
    id: _selectedPapperIcon

    property var target
    property int spacing: dp(20)
    property int indexInGrid: -1
    property var buttons;

    signal optionalClick(int _command)

    signal open(int _index)
    signal archive(int _index)
    signal remove(int _index)

    function setText(t) {_papperIcon.setText(t)}
    function setColor(c) {_papperIcon.color = c}

    function activate(x, y, t, c, i){
        _selectedPapperIcon.x = x
        _selectedPapperIcon.y = y
        setText(t)
        setColor(c)
        indexInGrid = i

        height = _papperIcon.height
       // _functionalMenu.zoom = 0

        _activateAnimation.running = true
        //_activateAnimation.
    }

    width: _papperIcon.width
    height: _papperIcon.height

    layer.enabled: true
    layer.effect: DropShadow {
        transparentBorder: true
        color: Material.color(Material.Grey, Material.Shade500)
        samples: 50
        radius: dp(32)
    }

    PapperIcon {
        id: _papperIcon

        anchors.top: _selectedPapperIcon.top
        z: 1

        isClickable: false
    }

    FunctionalMenu {
        id: _functionalMenu

        anchors.bottom: _selectedPapperIcon.bottom
        anchors.topMargin: _selectedPapperIcon.spacing

        zoom: 100

        buttons: _selectedPapperIcon.buttons

        onClicked: {

            _selectedPapperIcon.optionalClick(_command)
        }

//            switch (_command){
//            case 0:
//                _selectedPapperIcon.open(_selectedPapperIcon.indexInGrid)
//                break
//            case 1:
//                _selectedPapperIcon.archive(_selectedPapperIcon.indexInGrid)
//                break
//            case 2:
//                _selectedPapperIcon.remove(_selectedPapperIcon.indexInGrid)
//                break
//            }
//        }
    }

    ParallelAnimation {
        id: _activateAnimation

        PropertyAnimation {
            target: _selectedPapperIcon
            property: "height"
            duration: 200
            easing.type: Easing.InOutQuad

            to: _papperIcon.height + _selectedPapperIcon.spacing + _functionalMenu.height
        }

        PropertyAnimation {
            target: _selectedPapperIcon
            property: "y"
            duration: 200
            easing.type: Easing.InOutQuad

            to: _selectedPapperIcon.y - (_selectedPapperIcon.spacing + _functionalMenu.height) / 2
        }

        PropertyAnimation {
            target: _functionalMenu
            property: "zoom"
            duration: 200
            easing.type: Easing.InOutQuad

            to: 100
        }
    }
}
