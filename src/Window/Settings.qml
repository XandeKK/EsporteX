import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "../Control/"

Page {
    header: ToolBarBack {
        labelToolBar: "Settings"
    }

    Flickable {
        anchors.fill: parent
        contentHeight: columnRoot.height + 10
        boundsMovement: Flickable.StopAtBounds

        Column {
            id: columnRoot
            width: parent.width

            Rectangle {
                width: parent.width
                height: 70
                color: "#22000000"

                Label {
                    text: qsTr("General")
                    anchors.fill: parent
                    anchors.leftMargin: parent.width * 5 / 100
                    verticalAlignment: "AlignVCenter"
                    font.bold: true
                    font.pixelSize: fontSizeNormal
                }

                Separator {}
            }

            Rectangle {
                width: parent.width
                height: 60
                color: "#11000000"

                Label {
                    height: parent.height
                    anchors.left: parent.left
                    anchors.leftMargin: parent.width * 8 / 100
                    anchors.right: switchThemes.left
                    verticalAlignment: "AlignVCenter"

                    font.pixelSize: fontSizeNormal
                    text: qsTr("Dark Mode")
                }

                Switch {
                    id: switchThemes
                    height: parent.height
                    anchors.right: parent.right

                    checked: isDark
                    onCheckedChanged: {
                        isDark = checked
                        rowLayoutToolBar.Material.foreground = "white"
                    }
                }

                Separator {}
            }
        }
    }
}
