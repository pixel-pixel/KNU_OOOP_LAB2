import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.0
import "../Material"

//import "../DocumentButton"
import "../Documents"
import "../EditFragment"

Flickable {
    id: _documentButtonDesk

    property int spacing: dp(20)
    property int topPadding: 0
    property int bottomPadding: 0
    property bool isArchive: false

    signal noteChoose(int _index)
    function nt(i){
        noteChoose(i)
    }

    contentHeight: topPadding + _directoryLabel.height + _butonsGrid.height + spacing + bottomPadding
    contentWidth: _butonsGrid.width

    clip: true

    flickableDirection: Flickable.VerticalFlick
    ScrollBar.vertical: ScrollBar {}

    Label {
        id: _directoryLabel

        y: _documentButtonDesk.topPadding + _documentButtonDesk.spacing / 2
        x: _butonsGrid.x
        //anchors.left: _butonsGrid.left

        text: _documentButtonDesk.isArchive ? "Архів" : "Усі нотатки"
        font.family: _helveticaLoader.name
        font.pixelSize: dp(50)
        font.weight: Font.Bold

        color: Material.color(Material.Grey, Material.Shade700)
    }

    Grid {
        id: _butonsGrid

        property int elementWidth: dp(200)
        property int elementHeight: dp(200)

        function elmentX(i){
            return (i % columns) * (elementWidth + spacing)
        }
        function elementY(i){
            return ((i - (i % columns)) / columns) * (elementWidth + spacing)
        }

        columns: 4
        spacing: _documentButtonDesk.spacing

        x: (_documentButtonDesk.width - width) / 2
        y: _documentButtonDesk.topPadding + _directoryLabel.height + _documentButtonDesk.spacing

        Repeater {
            model: _documentButtonDesk.isArchive ? _fileReader.getArchiveSize() : _fileReader.getSize()

            Loader {
                id: _component

                source: if(_documentButtonDesk.isArchive){
                            return "../EditFragment/ArchivePapperIcon.qml"
                        } else {
                            switch(index) {
                            case 0: return "../EditFragment/NewPapperIcon.qml"
                            default: return "../EditFragment/PapperIcon.qml"
                            }
                        }


                Connections {
                    target: _component.item
                    onClicked: {
                        _documentButtonDesk.noteChoose(index)
                    }
                }

                Connections {
                    target: _component.item
                    onRightClicked: {
                        if(_selectedPapperIcon.target) _selectedPapperIcon.target.visible = true

                        _selectedPapperIcon.target = target
                        target.visible = false

                        _selectedPapperIcon.visible = true

                        _selectedPapperIcon.activate(
                                    _butonsGrid.x + _butonsGrid.elmentX(index),
                                    _butonsGrid.y + _butonsGrid.elementY(index),
                                    _component.item.getText(),
                                    _component.item.color,
                                    index)

//                        if( _selectedIcon.target) _selectedIcon.target.visible = true

//                        _selectedIcon.target = target
//                        target.visible = false

//                        _selectedIcon.visible = true
//                        _selectedIcon.indexInGrid = index
//                        //TODO
//                        _selectedIcon.setText(_selectedIcon.textOnLoad)

//                        _selectedIcon.x = _butonsGrid.x + _butonsGrid.elmentX(index)
//                        _selectedIcon.y = _butonsGrid.y + _butonsGrid.elementY(index) - (_functionalMenu.height + _functionalMenu.anchors.topMargin)

//                        _butonsGrid
                        //_butonsGrid.childAt(index % _butonsGrid.columns, (index - (index % _butonsGrid.columns)) / _butonsGrid.columns).y += 100

                    }
                }
            }
        }
    }

    SelectedPaperIcon {
        id: _selectedPapperIcon

        visible: false

        buttons: _documentButtonDesk.isArchive
                    ?
                     [["Розархівати", "pics/unarchive.svg", function(){}],
                      ["Видалити", "pics/delete.svg", function(){}, true]]
                    :
                     [["Змінити", "pics/edit.svg", function(){}],
                      ["Архівати", "pics/archive.svg", function(){}],
                      ["Видалити", "pics/delete.svg", function(){}, true]]

        onOptionalClick: {
            var ndx = _selectedPapperIcon.indexInGrid

            if(_documentButtonDesk.isArchive){
                switch(_command){
                case 0:
                    _fileReader.unarchive(ndx)
                    _butonsGrid.children[ndx].visible = false
                    _selectedPapperIcon.visible = false
                    break
                case 1:
                    _fileReader.removeFromArchive(ndx)
                    _butonsGrid.children[ndx].visible = false
                    _selectedPapperIcon.visible = false
                    break
                }
            } else {
                switch(_command){
                case 0:
                    _documentButtonDesk.noteChoose(_selectedPapperIcon.indexInGrid)
                    break
                case 1:
                    _fileReader.archive(ndx)
                    _butonsGrid.children[ndx].visible = false
                    _selectedPapperIcon.visible = false
                    break
                default:
                    _fileReader.removeFromAll(ndx)
                    _butonsGrid.children[ndx].visible = false
                    _selectedPapperIcon.visible = false
                }
            }
        }

//        onOpen: {
//            _documentButtonDesk.noteChoose(_index)
//        }

//        onArchive: {
//            _fileReader.archive(_index)
//            _butonsGrid.children[_index].visible = false
//            _selectedPapperIcon.visible = false
//        }

//        onRemove: {
//            _fileReader.removeFromAll(_index)
//            _butonsGrid.children[_index].visible = false
//            _selectedPapperIcon.visible = false
//        }
    }

//    PapperIcon {
//        id: _selectedIcon

//        visible: false
//    }

//    FunctionalMenu {
//        id: _functionalMenu

//        anchors.horizontalCenter: _selectedIcon.horizontalCenter
//        anchors.top: _selectedIcon.bottom
//        anchors.topMargin: dp(20)

//        visible: _selectedIcon.visible

//        buttons: [
//            ["Змінити", "pics/add.svg", function(){}],
//            ["Архівати", "pics/add.svg", function(){}],
//            ["Видалити", "pics/add.svg", function(){}, true]
//        ]

//        //visible: false
//    }
}

