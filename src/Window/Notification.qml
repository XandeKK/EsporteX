import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15

Page {
    property int indexList
    id: notification

    Popup {
        id: popup
        anchors.centerIn: parent
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
        Material.foreground: "black"

        RowLayout {
            id: rowLayout
            Label {
                text: qsTr("Get notification?")
                Material.foreground: Material.theme === Material.Dark ? "#88ffffff" : "#88000000"
                font.pixelSize: fontSizeNormal

                MouseArea {
                    anchors.fill: parent
                    onClicked: switchNotification.checked = !switchNotification.checked
                }
            }

            Switch {
                id: switchNotification
                checked: false
            }
        }
    }

    Dialog {
        id: dialogDeleteOne
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
                dialogDeleteOne.close()
                listModel.remove(indexList)
            }

            onRejected: dialogDeleteOne.close()
        }
    }

    Dialog {
        id: dialogDeleteAll
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
                dialogDeleteAll.close()
                listModel.clear()
            }

            onRejected: dialogDeleteAll.close()
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
                text: "Notification"
                Layout.fillWidth: true
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter

                elide: Label.ElideRight
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

                        font.pixelSize: fontSizeNormal
                        text: "Delete All"

                        onClicked: dialogDeleteAll.open()
                    }
                    MenuItem {
                        icon.source: "qrc:/assets/settings.png"

                        font.pixelSize: fontSizeNormal
                        text: "Settings"

                        onClicked: popup.open()
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
            width: listViewNotification.width * 90 / 100
            height: listViewNotification.height * 15 / 100
            anchors.horizontalCenter: parent.horizontalCenter
            Material.elevation: 6

            Item {
                anchors.fill: parent

                Image {
                    id: imagePerson
                    width: parent.height * 70 / 100
                    height: width
                    anchors.verticalCenter: parent.verticalCenter

                    fillMode: Image.PreserveAspectCrop
                    source: "http://10.0.0.22/assets/profile.jpg"
                }

                Label {
                    id: namePerson
                    width: parent.width * 55 / 100
                    anchors.left: imagePerson.right
                    anchors.leftMargin: parent.width * 5 / 100

                    clip: true
                    font.pixelSize: fontSizeNormal
                    font.bold: true
                    text: model.name
                }

                Label {
                    id: textNotification
                    width: parent.width * 60 / 100
                    anchors.left: imagePerson.right
                    anchors.leftMargin: parent.width * 5 / 100
                    anchors.top: namePerson.bottom
                    anchors.topMargin: parent.height * 10 / 100
                    anchors.right: kebabMenu.left
                    anchors.rightMargin: parent.width * 5 / 100
                    anchors.bottom: parent.bottom

                    Material.foreground: Material.theme === Material.Dark ? "#88ffffff" : "#88000000"
                    elide: "ElideRight"
                    wrapMode: "WordWrap"
                    clip: true
                    font.pixelSize: fontSizeNormal
                    text: qsTr("Opa RAPAZIAD, va as sd a das dai ter jogo de volei no forrodromo na quinta feira Opa RAPAZIAD, vai ter jogo de volei no forrodromo na quinta feira Opa RAPAZIAD, vai ter jogo de volei no forrodromo na quinta feiraOpa RAPAZIAD, vai ter jogo de volei no forrodromo na quinta feira")
                }

                Label {
                    id: dateNotification
                    anchors.right: kebabMenu.left

                    font.pixelSize: fontSizeNormal
                    text: "10 mar"
                }

                RoundButton {
                    id: kebabMenu
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    Material.elevation: 0

                    icon.source: "qrc:/assets/trash.png"

                    onClicked: {
                        indexList = index
                        dialogDeleteOne.open()
                    }
                }
            }
        }
    }
}
