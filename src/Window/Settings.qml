import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15

Page {
    header: ToolBar {
        RowLayout {
            anchors.fill: parent

            ToolButton {
                id: toolButtonBack
                icon.source: "qrc:/assets/backArrow.png"
                onClicked: stack.pop()
            }

            Label {
                text: "Settings"
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
                font.bold: true
                font.pointSize: 12
            }

            ToolButton {
            }
        }
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
                }

                Rectangle {
                    width: parent.width
                    height: 1
                    color: "#44000000"
                    anchors.bottom: parent.bottom
                }
            }

            Rectangle {
                width: parent.width
                height: 60
                color: "#11000000"

                Label {
                    text: qsTr("Themes")
                    anchors.left: parent.left
                    anchors.leftMargin: parent.width * 8 / 100
                    anchors.right: switchThemes.left
                    height: parent.height
                    verticalAlignment: "AlignVCenter"
                }

                Switch {
                    id: switchThemes
                    anchors.right: parent.right
                    height: parent.height
                }

                Rectangle {
                    width: parent.width
                    height: 1
                    color: "#44000000"
                    anchors.bottom: parent.bottom
                }
            }

            Rectangle {
                width: parent.width
                height: 60
                color: "#11000000"

                Label {
                    text: qsTr("Material Accent")
                    anchors.left: parent.left
                    anchors.leftMargin: parent.width * 8 / 100
                    anchors.right: combomBoxMaterialAccent.left
                    height: parent.height
                    verticalAlignment: "AlignVCenter"
                }

                ComboBox {
                    id: combomBoxMaterialAccent
                    anchors.right: parent.right
                    anchors.rightMargin: parent.width * 2.5 / 100
                    height: parent.height * 80 / 100
                    anchors.verticalCenter: parent.verticalCenter
                    model: ["Red", "Blue", "Purple", "Green"]
                }

                Rectangle {
                    width: parent.width
                    height: 1
                    color: "#44000000"
                    anchors.bottom: parent.bottom
                }
            }
        }
    }
}
