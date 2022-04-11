import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15

Page {
    header: ToolBar {
        Material.foreground: "white"
        RowLayout {
            anchors.fill: parent

            ToolButton {
                id: toolButtonBack
                icon.source: "qrc:/assets/backArrow.png"
                onClicked: stack.pop()
            }

            Label {
                text: "Info Game"
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
                    font.pixelSize: fontSizeNormal
                    MenuItem { icon.source: "qrc:/assets/settings.png"; text: "Edit" }
                    MenuItem { icon.source: "qrc:/assets/edit.png"; text: "Remove" }
                }
            }
        }
    }

    Item {
        id: itemHeader
        height: parent.height * 5 / 100
    }

    Flickable {
        anchors.top: itemHeader.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        contentHeight: columnRoot.height + button.height + 10

        Column {
            id: columnRoot
            width: parent.width * 95 / 100
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 20

            Pane {
                width: parent.width
                Material.elevation: 1

                Column {
                    width: parent.width
                    spacing: 5

                    Label {
                        width: parent.width
                        text: "Sport"
                        font.bold: true
                        font.pixelSize: fontSizeNormal
                        Rectangle {
                            anchors.bottom: parent.bottom
                            width: parent.width
                            height: 1
                            color: Material.theme === Material.Dark ? "#33ffffff" : "#33000000"
                        }
                    }

                    Item {
                        width: parent.width
                        height: textSport.contentHeight
                        Label {
                            id: textSport
                            anchors.fill: parent
                            anchors.leftMargin: parent.width * 2.5 / 100
                            text: "VolleyBall"
                            font.pixelSize: fontSizeNormal
                        }
                    }
                }
            }

            Pane {
                width: parent.width
                Material.elevation: 1

                Column {
                    width: parent.width
                    spacing: 5

                    Label {
                        width: parent.width
                        text: "Organizer"
                        font.bold: true
                        font.pixelSize: fontSizeNormal
                        Rectangle {
                            anchors.bottom: parent.bottom
                            width: parent.width
                            height: 1
                            color: Material.theme === Material.Dark ? "#33ffffff" : "#33000000"
                        }
                    }

                    Item {
                        width: parent.width
                        height: textOrganizer.contentHeight
                        Label {
                            id: textOrganizer
                            anchors.fill: parent
                            anchors.leftMargin: parent.width * 2.5 / 100
                            text: "Alexandre"
                            font.pixelSize: fontSizeNormal
                        }
                        ItemDelegate {
                            anchors.fill: parent
                            onClicked: stack.push("qrc:/Window/InfoProfile.qml")
                        }
                    }
                }
            }

            Pane {
                width: parent.width
                Material.elevation: 1

                Column {
                    width: parent.width
                    spacing: 5

                    Label {
                        width: parent.width
                        text: "Address"
                        font.bold: true
                        font.pixelSize: fontSizeNormal
                        Rectangle {
                            anchors.bottom: parent.bottom
                            width: parent.width
                            height: 1
                            color: Material.theme === Material.Dark ? "#33ffffff" : "#33000000"
                        }
                    }

                    Item {
                        width: parent.width
                        height: textAddress.contentHeight
                        Label {
                            id: textAddress
                            anchors.fill: parent
                            anchors.leftMargin: parent.width * 2.5 / 100
                            text: "Rua Pedro Antônio de Souza, Lagarto, Sergipe"
                            font.pixelSize: fontSizeNormal
                        }
                        ItemDelegate {
                            anchors.fill: parent
                            onClicked: console.log("OOOS")
                        }
                    }
                }
            }

            Pane {
                width: parent.width
                Material.elevation: 1

                Column {
                    width: parent.width
                    spacing: 5

                    Label {
                        width: parent.width
                        text: "Time"
                        font.bold: true
                        font.pixelSize: fontSizeNormal
                        Rectangle {
                            anchors.bottom: parent.bottom
                            width: parent.width
                            height: 1
                            color: Material.theme === Material.Dark ? "#33ffffff" : "#33000000"
                        }
                    }

                    Item {
                        width: parent.width
                        height: textTime.contentHeight
                        Label {
                            id: textTime
                            anchors.fill: parent
                            anchors.leftMargin: parent.width * 2.5 / 100
                            text: "Started: 10:00 and finish: 14:00"
                            font.pixelSize: fontSizeNormal
                        }
                    }
                }
            }

            Pane {
                width: parent.width
                Material.elevation: 1

                Column {
                    width: parent.width
                    spacing: 5

                    Label {
                        width: parent.width
                        text: "Date"
                        font.bold: true
                        font.pixelSize: fontSizeNormal
                        Rectangle {
                            anchors.bottom: parent.bottom
                            width: parent.width
                            height: 1
                            color: Material.theme === Material.Dark ? "#33ffffff" : "#33000000"
                        }
                    }

                    Item {
                        width: parent.width
                        height: textDate.contentHeight
                        Label {
                            id: textDate
                            anchors.fill: parent
                            anchors.leftMargin: parent.width * 2.5 / 100
                            text: "10/10/2010"
                            font.pixelSize: fontSizeNormal
                        }
                    }
                }
            }

            Pane {
                width: parent.width
                Material.elevation: 1

                Column {
                    width: parent.width
                    spacing: 5

                    Label {
                        width: parent.width
                        text: "Address"
                        font.bold: true
                        font.pixelSize: fontSizeNormal
                        Rectangle {
                            anchors.bottom: parent.bottom
                            width: parent.width
                            height: 1
                            color: Material.theme === Material.Dark ? "#33ffffff" : "#33000000"
                        }
                    }

                    Item {
                        width: parent.width
                        height: textDescription.contentHeight
                        Label {
                            id: textDescription
                            anchors.fill: parent
                            anchors.leftMargin: parent.width * 2.5 / 100
                            clip: true
                            wrapMode: Text.WordWrap
                            text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ac ultrices nunc. Cras aliquam turpis ut luctus fringilla. Aliquam vel vulputate eros. Morbi luctus, nulla a aliquam viverra, arcu neque accumsan quam, quis consequat risus orci nec magna. Vestibulum fringilla, elit vitae elementum auctor, lacus ex cursus elit, venenatis laoreet ipsum eros vel urna. Proin mattis suscipit rhoncus. Nunc eget tempus ipsum. Nulla viverra eu eros ut commodo. Donec non pharetra arcu, at venenatis eros. Nunc volutpat purus et elit lacinia, in ultricies arcu auctor. Vestibulum purus elit, ultrices a ante et, feugiat pharetra nunc. Sed tincidunt blandit lorem, eget porttitor nisl congue a. Maecenas et lacus nec lacus semper accumsan eu id tortor. Integer aliquam eros eu urna elementum tempor. Donec mattis, nisi ac laoreet auctor, mi ipsum ultricies ipsum, non dictum lacus libero vitae purus."
                            font.pixelSize: fontSizeNormal
                        }
                    }
                }
            }
        }
    }

    RoundButton {
        id: button
        anchors.right: parent.right
        anchors.rightMargin: parent.width * 2.5 / 100
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.width * 2.5 / 100
        width: parent.width * 25 / 100

        text: "Participar"
        Material.foreground: "black"
        Material.elevation: 1
        highlighted: true
        font.bold: true
        font.pixelSize: fontSizeNormal
    }

}
