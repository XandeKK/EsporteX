import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15

Page {
    header: ToolBar {
        RowLayout {
            id: rowLayoutToolBar
            anchors.fill: parent
            Material.foreground: "white"

            ToolButton {
                id: toolButtonBack
                icon.source: "qrc:/assets/backArrow.png"
                onClicked: {
                    stack.pop(null)
                    stack.replace("qrc:/Window/Home.qml", StackView.PopTransition)
                }
            }

            Label {
                text: "Settings"
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
                font.bold: true
                font.pixelSize: fontSizeToolBar
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
                    font.pixelSize: fontSizeNormal
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
                    text: qsTr("Dark Mode")
                    anchors.left: parent.left
                    anchors.leftMargin: parent.width * 8 / 100
                    anchors.right: switchThemes.left
                    height: parent.height
                    verticalAlignment: "AlignVCenter"
                    font.pixelSize: fontSizeNormal
                }

                Switch {
                    id: switchThemes
                    anchors.right: parent.right
                    height: parent.height
                    checked: isDark
                    onCheckedChanged: {
                        isDark = checked
                        rowLayoutToolBar.Material.foreground = "white"
                    }
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
                    font.pixelSize: fontSizeNormal
                }

                ComboBox {
                    id: combomBoxMaterialAccent
                    anchors.right: parent.right
                    anchors.rightMargin: parent.width * 2.5 / 100
                    height: parent.height * 80 / 100
                    anchors.verticalCenter: parent.verticalCenter
                    model: [
                        "Red",
                        "Pink",
                        "Purple",
                        "DeepPurple",
                        "Indigo",
                        "Blue",
                        "LightBlue",
                        "Cyan",
                        "Teal",
                        "Green",
                        "LightGreen",
                        "Lime",
                        "Yellow",
                        "Amber",
                        "Orange",
                        "DeepOrange",
                        "Brown",
                        "Grey",
                        "BlueGrey"
                    ]
                    currentIndex: materialAccentColor
                    onCurrentIndexChanged: materialAccentColor = currentIndex
                    font.pixelSize: fontSizeNormal
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
