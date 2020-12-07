import QtQuick 2.2
import QtQuick.Window 2.2

Item {
    property int dpi: Screen.pixelDensity * 25.4

    function dp(x){
        if(dpi < 120)
            return x

        return x * (dpi / 160)
    }
}
