import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "../Control/"

Page {
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
                dialog.close()
                stack.replace("qrc:/Window/Home.qml")
            }

            onRejected: dialog.close()
        }
    }

    Item {
        id: itemHeader
        height: parent.height * 5 / 100
    }

    Flickable {
        id: flickable
        anchors.top: itemHeader.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        contentHeight: (columnRoot.height + buttonConfirm.height) + (columnRoot.height * 50 / 100)

        Column {
            id: columnRoot
            width: parent.width * 90 / 100
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 20

            Row {
                id: rowName
                width: parent.width
                spacing: parent.width * 3 / 100

                Label {
                    width: parent.width * 20 / 100
                    height: parent.height
                    verticalAlignment: "AlignVCenter"

                    font.pixelSize: fontSizeNormal
                    text: "Name:"
                }

                TextField {
                    id: fieldName
                    width: parent.width * 82 / 100

                    font.pixelSize: fontSizeNormal
                    placeholderText: "Name"

                    Keys.onReturnPressed: {
                        fieldName.focus = false
                        fieldUserName.focus = true
                    }
                }

            }

            Row {
                id: rowUserName
                width: parent.width
                spacing: parent.width * 3 / 100

                Label {
                    width: parent.width * 20 / 100
                    height: parent.height
                    verticalAlignment: "AlignVCenter"

                    font.pixelSize: fontSizeNormal
                    text: "UserName:"
                }

                TextField {
                    id: fieldUserName
                    width: parent.width * 82 / 100
                    font.pixelSize: fontSizeNormal

                    placeholderText: "UserName"

                    Keys.onReturnPressed: {
                        fieldUserName.focus = false
                        fieldTwitter.focus = true
                    }
                }
            }

            Row {
                id: rowState
                width: parent.width
                spacing: parent.width * 3 / 100

                Label {
                    width: parent.width * 20 / 100
                    height: parent.height
                    verticalAlignment: "AlignVCenter"

                    font.pixelSize: fontSizeNormal
                    text: "State:"
                }

                ComboBox {
                    width: parent.width * 82 / 100
                    model: [ "Sergipe", "São Paulo" ]

                    editable: true

                    font.pixelSize: fontSizeNormal
                }

            }

            Row {
                id: rowCity
                width: parent.width
                spacing: parent.width * 3 / 100

                Label {
                    width: parent.width * 20 / 100
                    height: parent.height
                    verticalAlignment: "AlignVCenter"

                    font.pixelSize: fontSizeNormal
                    text: "City:"
                }

                ComboBox {
                    width: parent.width * 82 / 100
                    model: [ "Lagarto", "Simão dias", "Aracaju" ]

                    editable: true

                    font.pixelSize: fontSizeNormal
                }

            }

            Row {
                id: rowTwitter
                width: parent.width
                spacing: parent.width * 3 / 100

                Label {
                    width: parent.width * 20 / 100
                    height: parent.height
                    verticalAlignment: "AlignVCenter"

                    font.pixelSize: fontSizeNormal
                    text: "Twitter:"
                }

                TextField {
                    id: fieldTwitter
                    width: parent.width * 82 / 100

                    font.pixelSize: fontSizeNormal
                    placeholderText: "Twitter"

                    Keys.onReturnPressed: {
                        fieldTwitter.focus = false
                        fieldInstagram.focus = true
                    }
                }

            }

            Row {
                id: rowInstagram
                width: parent.width
                spacing: parent.width * 3 / 100

                Label {
                    width: parent.width * 20 / 100
                    height: parent.height
                    verticalAlignment: "AlignVCenter"

                    font.pixelSize: fontSizeNormal
                    text: "Instagram:"
                }

                TextField {
                    id: fieldInstagram
                    width: parent.width * 82 / 100

                    font.pixelSize: fontSizeNormal
                    placeholderText: "Instagram"

                    Keys.onReturnPressed: {
                        fieldInstagram.focus = false
                        fieldDescription.focus = true
                    }
                }

            }


            Column {
                id: columnDescription
                width: parent.width
                spacing: 5

                Label {
                    width: parent.width
                    verticalAlignment: "AlignVCenter"

                    font.pixelSize: fontSizeNormal
                    text: "Description:"
                }

                TextArea {
                    id: fieldDescription
                    width: parent.width
                    clip: true
                    wrapMode: "WordWrap"

                    font.pixelSize: fontSizeNormal
                    placeholderText: "Put here description about you"

                    Keys.onReturnPressed: {
                        fieldDescription.focus = false
                    }
                    onFocusChanged: {
                        if(focus){
                            flickable.contentY = columnRoot.height * 50 / 100
                        }
                    }
                }
            }
        }
    }

    RoundButton {
        id: buttonConfirm
        width: parent.width * 20 / 100
        anchors.right: parent.right
        anchors.rightMargin: parent.width * 2.5 / 100
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.width * 2.5 / 100

        Material.foreground: "black"
        Material.elevation: 1
        highlighted: true
        font.bold: true
        font.pixelSize: fontSizeNormal
        text: "Ok"

        onClicked: dialog.open()
    }
}
