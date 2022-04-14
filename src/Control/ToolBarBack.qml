import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15

ToolBar {
    property string labelToolBar

    id: toolBar
    Material.foreground: "white"

    RowLayout {
        anchors.fill: parent

        ToolButton {
            id: toolButtonBack
            icon.source: "qrc:/assets/backArrow.png"

            onClicked: stack.pop()
        }

        Label {
            Layout.fillWidth: true
            horizontalAlignment: Qt.AlignHCenter
            verticalAlignment: Qt.AlignVCenter

            elide: Label.ElideRight
            font.bold: true
            font.pixelSize: fontSizeToolBar
            text: toolBar.labelToolBar
        }

        ToolButton {
        }
    }
}
