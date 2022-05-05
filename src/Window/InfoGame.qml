import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "../Control/"
import "../"

Page {
    property var infoGame: {
        let dataJson = _database.getInfoGame(PropertyVar.game_id)
        return JSON.parse(dataJson)[0]
    }

    Dialog {
        id: dialog
        anchors.centerIn: parent
        modal: true

        font.pixelSize: fontSizeNormal
        title: "Are you sure?"

        DialogButtonBox {
            Button {
                DialogButtonBox.buttonRole: DialogButtonBox.NoRole
                Material.background: Material.Red
                Material.foreground: "White"

                font.pixelSize: fontSizeNormal
                text: qsTr("No")
            }
            Button {
                DialogButtonBox.buttonRole: DialogButtonBox.YesRole
                Material.background: Material.Green
                Material.foreground: "White"

                font.pixelSize: fontSizeNormal
                text: qsTr("Yes")
            }

            onAccepted: {
                _database.deleteGame(infoGame["id"])
                dialog.close()
                stack.pop(null)
            }

            onRejected: dialog.close()
        }
    }

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
                Layout.fillWidth: true
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter

                elide: Label.ElideRight
                font.bold: true
                font.pixelSize: fontSizeToolBar
                text: "Info Game"
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

                    MenuItem {
                        icon.source: "qrc:/assets/edit.png"
                        text: "Edit"
                        onClicked: stack.push("qrc:/Window/Game/EditGame.qml")
                    }

                    MenuItem {
                        icon.source: "qrc:/assets/trash.png"
                        text: "Remove"
                        onClicked: dialog.open()
                    }
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
        contentHeight: columnRoot.height + buttonParticipate.height + 10

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

                        font.bold: true
                        font.pixelSize: fontSizeNormal
                        text: "Sport"

                        Separator {}
                    }

                    Item {
                        width: parent.width
                        height: textSport.contentHeight

                        Label {
                            id: textSport
                            anchors.fill: parent
                            anchors.leftMargin: parent.width * 2.5 / 100

                            font.pixelSize: fontSizeNormal
                            text: infoGame["sport"]["sport"]
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

                        font.bold: true
                        font.pixelSize: fontSizeNormal
                        text: "Organizer"

                        Separator {}
                    }

                    Item {
                        width: parent.width
                        height: textOrganizer.contentHeight

                        Label {
                            id: textOrganizer
                            anchors.fill: parent
                            anchors.leftMargin: parent.width * 2.5 / 100

                            font.pixelSize: fontSizeNormal
                            text: infoGame["name"]
                        }

                        ItemDelegate {
                            anchors.fill: parent
                            onClicked: {
                                PropertyVar.organizer_id = infoGame["user_id"]
                                stack.push("qrc:/Window/InfoProfile.qml")
                            }
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

                        font.bold: true
                        font.pixelSize: fontSizeNormal
                        text: "Address"

                        Separator {}
                    }

                    Item {
                        width: parent.width
                        height: textAddress.contentHeight

                        Label {
                            id: textAddress
                            anchors.fill: parent
                            anchors.leftMargin: parent.width * 2.5 / 100
                            elide: "ElideRight"

                            font.pixelSize: fontSizeNormal
                            text: infoGame["address"] + ", " + infoGame["city"]["city"] + ", " + infoGame["state"]["state"]
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

                        font.bold: true
                        font.pixelSize: fontSizeNormal
                        text: "Time"

                        Separator {}
                    }

                    Item {
                        width: parent.width
                        height: textTime.contentHeight
                        Label {
                            id: textTime
                            anchors.fill: parent
                            anchors.leftMargin: parent.width * 2.5 / 100

                            font.pixelSize: fontSizeNormal
                            text: infoGame["start"].substr(11, 5) + " - " + infoGame["end"].substr(11, 5)
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

                        font.bold: true
                        font.pixelSize: fontSizeNormal
                        text: "Date"

                        Separator {}
                    }

                    Item {
                        width: parent.width
                        height: textDate.contentHeight

                        Label {
                            id: textDate
                            anchors.fill: parent
                            anchors.leftMargin: parent.width * 2.5 / 100
                            font.pixelSize: fontSizeNormal
                            text: {
                                let date = infoGame["date"].split("-")
                                return date[2] + "/" + date[1] + "/" + date[0]
                            }
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

                        font.bold: true
                        font.pixelSize: fontSizeNormal
                        text: "Description"

                        Separator {}
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
                            font.pixelSize: fontSizeNormal
                            text: infoGame["description"]
                        }
                    }
                }
            }
        }
    }

    RoundButton {
        id: buttonParticipate
        anchors.right: parent.right
        anchors.rightMargin: parent.width * 2.5 / 100
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.width * 2.5 / 100
        width: parent.width * 25 / 100

        text: "Participate"
        Material.foreground: "black"
        Material.elevation: 1
        highlighted: true
        font.bold: true
        font.pixelSize: fontSizeNormal
    }

}
