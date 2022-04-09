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
                text: "Sport List"
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
                font.bold: true
                font.pixelSize: fontSizeToolBar
            }

            ToolButton {
                id: toolButtonKebabMenu
                icon.source: "qrc:/assets/threeDotsBlack.png"
                onClicked: contextMenu.open()
                Menu {
                    id: contextMenu
                    x: -(width * 80 / 100)
                    y: 10
                    MenuItem { icon.source: "qrc:/assets/settings.png"; text: "Settings" }
                }
            }
        }
    }

    ListView {
        id: listViewNotification
        anchors.fill: parent
        spacing: 20

        model: 10

        header: Item {
            height: 30
        }

        footer: Item {
            height: 30 + button.height
        }

        delegate: Pane {
            Material.elevation: 6
            width: listViewNotification.width * 90 / 100
            anchors.horizontalCenter: parent.horizontalCenter

            ItemDelegate {
                anchors.fill: parent
                onClicked: stack.push("qrc:/Window/InfoGame.qml")

                Column {
                    id: columnLeft
                    anchors.left: parent.left
                    width: parent.width * 60 / 100
                    height: parent.height
                    spacing: 10

                    Row {
                        width: parent.width
                        height: parent.height * 26 / 100
                        spacing: 5

                        Image {
                            id: imageProfile
                            source: Material.theme == Material.Dark ? "qrc:/assets/profileDark.png" : "qrc:/assets/profile.png"
                            width: height
                            height: parent.height
                            antialiasing: true
                            mipmap: true
                        }
                        Label {
                            id: nameProfile
                            width: parent.width - imageProfile.width
                            height: parent.height
                            text: qsTr("Alexandre")
                            verticalAlignment: Text.AlignVCenter
                            font.pixelSize: fontSizeNormal
                        }
                    }

                    Row {
                        width: parent.width
                        height: parent.height * 26 / 100
                        spacing: 5

                        Image {
                            id: imageMap
                            source: Material.theme == Material.Dark ? "qrc:/assets/markDark.png" : "qrc:/assets/mark.png"
                            width: height
                            height: parent.height
                            antialiasing: true
                            mipmap: true
                        }

                        Label {
                            id: nameMap
                            text: qsTr("Rua Pedro Antônio dos Santos Rua Pedro Antônio dos Santos Rua Pedro Antônio dos Santos")
                            width: parent.width - imageProfile.width
                            height: parent.height
                            verticalAlignment: Text.AlignVCenter
                            clip: true
                            elide: Text.ElideRight
                            font.pixelSize: fontSizeNormal
                        }
                    }
                }
                Column {
                    anchors.left: columnLeft.right
                    anchors.leftMargin: parent.width * 2.5 / 100
                    anchors.right: parent.right
                    height: parent.height
                    spacing: 10

                    Row {
                        width: parent.width
                        height: parent.height * 26 / 100
                        spacing: 5

                        Image {
                            id: imageCalendar
                            source: Material.theme == Material.Dark ? "qrc:/assets/calendarDark.png" : "qrc:/assets/calendar.png"
                            width: height
                            height: parent.height
                            antialiasing: true
                            mipmap: true
                        }

                        Label {
                            id: nameCalendar
                            text: qsTr("10/04/2022")
                            width: parent.width - imageProfile.width
                            height: parent.height
                            verticalAlignment: Text.AlignVCenter
                            clip: true
                            font.pixelSize: fontSizeNormal
                        }
                    }

                    Row {
                        width: parent.width
                        height: parent.height * 26 / 100
                        spacing: 5

                        Image {
                            id: imageTime
                            source: Material.theme == Material.Dark ? "qrc:/assets/timeDark.png" : "qrc:/assets/time.svg"
                            width: height
                            height: parent.height
                            antialiasing: true
                            mipmap: true
                        }

                        Label {
                            id: nameTime
                            text: qsTr("10:00 - 12:00")
                            width: parent.width - imageProfile.width
                            height: parent.height
                            verticalAlignment: Text.AlignVCenter
                            clip: true
                            font.pixelSize: fontSizeNormal
                        }
                    }
                }
            }
        }
    }

    RoundButton {
        id: button
        anchors.bottom: parent.bottom
        anchors.bottomMargin: anchors.rightMargin
        anchors.right: parent.right
        anchors.rightMargin: parent.width * 5 / 100
        width: 70
        height: 70
        font.pixelSize: fontSizeNormal

        highlighted: true

        icon.source: "qrc:/assets/add.png"
        icon.color: "white"

        onClicked: stack.push("qrc:/Window/CreateGame.qml")
    }
}
