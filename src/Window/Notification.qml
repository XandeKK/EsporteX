import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15

Page {
    id: notification
    property int indexList

    Dialog {
        id: dialogDeleteOne
        title: "Are you sure?"
        modal: true
        anchors.centerIn: parent
        font.pixelSize: fontSizeNormal

        DialogButtonBox {
            Button {
                text: qsTr("No")
                DialogButtonBox.buttonRole: DialogButtonBox.NoRole
                Material.background: Material.Red
                Material.foreground: "White"
                font.pixelSize: fontSizeNormal
            }
            Button {
                text: qsTr("Yes")
                DialogButtonBox.buttonRole: DialogButtonBox.YesRole
                Material.background: Material.Green
                Material.foreground: "White"
                font.pixelSize: fontSizeNormal
            }

            onAccepted: {
                dialogDeleteOne.close()
                listModel.remove(indexList)
            }

            onRejected: dialogDeleteOne.close()
        }
    }

    Dialog {
        id: dialogDeleteAll
        title: "Are you sure?"
        modal: true
        anchors.centerIn: parent
        font.pixelSize: fontSizeNormal

        DialogButtonBox {
            Button {
                text: qsTr("No")
                DialogButtonBox.buttonRole: DialogButtonBox.NoRole
                Material.background: Material.Red
                Material.foreground: "White"
                font.pixelSize: fontSizeNormal
            }
            Button {
                text: qsTr("Yes")
                DialogButtonBox.buttonRole: DialogButtonBox.YesRole
                Material.background: Material.Green
                Material.foreground: "White"
                font.pixelSize: fontSizeNormal
            }

            onAccepted: {
                dialogDeleteAll.close()
                listModel.clear()
            }

            onRejected: dialogDeleteAll.close()
        }
    }

    header: ToolBar {
        RowLayout {
            anchors.fill: parent

            ToolButton {
                id: toolButtonBack
                icon.source: "qrc:/assets/backArrow.png"
                onClicked: stack.pop()
            }

            Label {
                text: "Notification"
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
                    MenuItem {
                        icon.source: "qrc:/assets/trash.png"
                        text: "Delete All"
                        font.pixelSize: fontSizeNormal
                        onClicked: dialogDeleteAll.open()
                    }
                    MenuItem {
                        icon.source: "qrc:/assets/settings.png"
                        text: "Settings"
                        font.pixelSize: fontSizeNormal
                    }
                }
            }
        }
    }

    ListView {
        id: listViewNotification
        anchors.fill: parent
        spacing: 20

        model: ListModel {
            id: listModel
            ListElement {name: "Alexandre"}
            ListElement {name: "Alex"}
            ListElement {name: "Xande"}
            ListElement {name: "X"}

        }

        header: Item {
            height: 30
        }

        delegate: Pane {
            Material.elevation: 6
            width: listViewNotification.width * 90 / 100
            height: listViewNotification.height * 15 / 100
            anchors.horizontalCenter: parent.horizontalCenter
            Item {
                anchors.fill: parent

                Image {
                    id: imagePerson
                    source: "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
                    anchors.verticalCenter: parent.verticalCenter
                    fillMode: Image.PreserveAspectCrop
                    width: parent.height * 70 / 100
                    height: width
                }

                Label {
                    id: namePerson
                    anchors.left: imagePerson.right
                    anchors.leftMargin: parent.width * 5 / 100
                    width: parent.width * 55 / 100
                    clip: true
                    text: model.name
                    font.pixelSize: fontSizeNormal
                    font.bold: true
                }

                Label {
                    id: textNotification
                    text: qsTr("Opa RAPAZIAD, va as sd a das dai ter jogo de volei no forrodromo na quinta feira Opa RAPAZIAD, vai ter jogo de volei no forrodromo na quinta feira Opa RAPAZIAD, vai ter jogo de volei no forrodromo na quinta feiraOpa RAPAZIAD, vai ter jogo de volei no forrodromo na quinta feira")
                    anchors.left: imagePerson.right
                    anchors.leftMargin: parent.width * 5 / 100
                    anchors.top: namePerson.bottom
                    anchors.topMargin: parent.height * 10 / 100
                    anchors.right: kebabMenu.left
                    anchors.rightMargin: parent.width * 5 / 100
                    anchors.bottom: parent.bottom
                    width: parent.width * 60 / 100
                    elide: "ElideRight"
                    wrapMode: "WordWrap"
                    clip: true
                    font.pixelSize: fontSizeNormal
                    Material.foreground: Material.theme === Material.Dark ? "#88ffffff" : "#88000000"
                }

                Label {
                    id: dateNotification
                    anchors.right: kebabMenu.left
                    text: "10 mar"
                    font.pixelSize: fontSizeNormal
                }

                RoundButton {
                    id: kebabMenu
                    anchors.right: parent.right
                    icon.source: "qrc:/assets/trash.png"
                    anchors.verticalCenter: parent.verticalCenter
                    Material.elevation: 0
                    onClicked: {
                        indexList = index
                        dialogDeleteOne.open()
                    }
                }
            }
        }
    }
}
