import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "../../../Control/"

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
            }

            onRejected: dialog.close()
        }
    }

    header: ToolBarBack {
        labelToolBar: "Settings Info"
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
        contentHeight: (columnRoot.height + button.height) + (columnRoot.height * 50 / 100)

        Column {
            id: columnRoot
            width: parent.width * 90 / 100
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 20

            Row {
                width: parent.width
                spacing: parent.width * 3 / 100
                Label {
                    width: parent.width * 15 / 100
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
                        fieldState.focus = true
                    }
                }
            }

            Row {
                width: parent.width
                spacing: parent.width * 3 / 100

                Label {
                    width: parent.width * 15 / 100
                    height: parent.height
                    verticalAlignment: "AlignVCenter"

                    font.pixelSize: fontSizeNormal
                    text: "State:"
                }

                TextField {
                    id: fieldState
                    width: parent.width * 82 / 100

                    font.pixelSize: fontSizeNormal
                    placeholderText: "State"

                    Keys.onReturnPressed: {
                        fieldState.focus = false
                        fieldCity.focus = true
                    }
                }
            }

            Row {
                width: parent.width
                spacing: parent.width * 3 / 100

                Label {
                    width: parent.width * 15 / 100
                    height: parent.height
                    verticalAlignment: "AlignVCenter"

                    font.pixelSize: fontSizeNormal
                    text: "City:"
                }

                TextField {
                    id: fieldCity
                    width: parent.width * 82 / 100

                    font.pixelSize: fontSizeNormal
                    placeholderText: "City"

                    Keys.onReturnPressed: {
                        fieldCity.focus = false
                        fieldAddress.focus = true
                    }
                }
            }

            Column {
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
                    placeholderText: "Put here description of game"

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
        id: button
        width: parent.width * 20 / 100
        anchors.right: parent.right
        anchors.rightMargin: parent.width * 2.5 / 100
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.width * 2.5 / 100
        Material.elevation: 1

        Material.foreground: "black"
        highlighted: true
        font.bold: true
        font.pixelSize: fontSizeNormal
        text: "Ok"

        onClicked: dialog.open()
    }
}
