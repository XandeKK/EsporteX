import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    property bool isDark: false
    readonly property real dip: Qt.platform.os === "android" ? Screen.pixelDensity / (160 / 25.4) :
                                                               Screen.pixelDensity / (96 / 25.4)
    readonly property real fontSizeSmall: 12 * dip
    readonly property real fontSizeNormal: 13 * dip
    readonly property real fontSizeLarge: 14 * dip
    readonly property real fontSizeToolBar: 16 * dip

    id: root
    width: 480
    height: 640
    visible: true
    title: qsTr("EsporteX")

    Material.theme: isDark ? Material.Dark :
                             Material.Light

    StackView {
        id: stack
        anchors.fill: parent
        initialItem: "qrc:/Window/Login.qml"

        pushEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to:1
                duration: 200
            }
        }
        pushExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to:0
                duration: 200
            }
        }
        popEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to:1
                duration: 200
            }
        }
        popExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to:0
                duration: 200
            }
        }
    }
}
