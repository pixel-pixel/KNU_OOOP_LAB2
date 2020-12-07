function () {
    var dip = Qt.createQmlObject('import QtQuick.Window 2.2; Screen{}').pixelDensity * 25.4

    if(dpi < 120)
        return x

    return x * (dpi / 160)
}
