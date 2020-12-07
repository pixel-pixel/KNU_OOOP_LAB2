import QtQuick 2.0

PapperIcon {
    textOnLoad: _fileReader.getArchiveNoteText(indexInGrid)
    color: _fileReader.getArchiveNoteColor(indexInGrid)

}
