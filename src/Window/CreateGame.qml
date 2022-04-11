import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "./js/CreateGame.js" as FuncCreateGame

Page {
    Dialog {
        id: dialog
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
                dialog.close()
                stack.pop(null)
                stack.push("qrc:/Window/InfoGame.qml")
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
                text: "Create Game"
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
                    text: "Sport:"
                    verticalAlignment: "AlignVCenter"
                    font.pixelSize: fontSizeNormal
                }

                ComboBox {
                    width: parent.width * 82 / 100
                    model: [ "VolleyBall", "Soccer", "BasketBall", "Tennis"]
                    font.pixelSize: fontSizeNormal
                }

            }

            Row {
                width: parent.width
                spacing: parent.width * 3 / 100
                Label {
                    width: parent.width * 15 / 100
                    height: parent.height
                    text: "State:"
                    verticalAlignment: "AlignVCenter"
                    font.pixelSize: fontSizeNormal
                }

                TextField {
                    id: fieldState
                    width: parent.width * 82 / 100
                    placeholderText: "State"
                    font.pixelSize: fontSizeNormal
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
                    text: "City:"
                    verticalAlignment: "AlignVCenter"
                    font.pixelSize: fontSizeNormal
                }

                TextField {
                    id: fieldCity
                    width: parent.width * 82 / 100
                    placeholderText: "City"
                    font.pixelSize: fontSizeNormal
                    Keys.onReturnPressed: {
                        fieldCity.focus = false
                        fieldAddress.focus = true
                    }
                }

            }

            Row {
                width: parent.width
                spacing: parent.width * 3 / 100
                Label {
                    width: parent.width * 15 / 100
                    height: parent.height
                    text: "Address:"
                    verticalAlignment: "AlignVCenter"
                    font.pixelSize: fontSizeNormal
                }

                TextField {
                    id: fieldAddress
                    width: parent.width * 82 / 100
                    placeholderText: "Address"
                    font.pixelSize: fontSizeNormal
                    Keys.onReturnPressed: {
                        fieldAddress.focus = false
                        fieldStart.focus = true
                    }
                }

            }

            Row {
                width: parent.width
                spacing: parent.width * 3 / 100
                Label {
                    width: parent.width * 15 / 100
                    height: parent.height
                    text: "Start:"
                    verticalAlignment: "AlignVCenter"
                    font.pixelSize: fontSizeNormal
                }

                TextField {
                    id: fieldStart
                    width: parent.width * 45 / 100
                    placeholderText: "Start Game Ex.: 10:00"
                    font.pixelSize: fontSizeNormal
                    Keys.onReturnPressed: {
                        fieldStart.focus = false
                        fieldEnd.focus = true
                    }
                    inputMethodHints: Qt.ImhDigitsOnly

                    onFocusChanged: {
                        inputMask = "00:00"
                        cursorPosition = 0
                    }

                    onEditingFinished: console.log(FuncCreateGame.isValidTime(text))
                }

            }

            Row {
                width: parent.width
                spacing: parent.width * 3 / 100
                Label {
                    width: parent.width * 15 / 100
                    height: parent.height
                    text: "End:"
                    verticalAlignment: "AlignVCenter"
                    font.pixelSize: fontSizeNormal
                }

                TextField {
                    id: fieldEnd
                    width: parent.width * 45 / 100
                    placeholderText: "End Game Ex.: 13:00"
                    font.pixelSize: fontSizeNormal
                    Keys.onReturnPressed: {
                        fieldEnd.focus = false
                        fieldDate.focus = true
                    }
                    inputMethodHints: Qt.ImhDigitsOnly

                    onFocusChanged: {
                        inputMask = "00:00"
                        cursorPosition = 0
                    }

                    onEditingFinished: console.log(FuncCreateGame.isValidTime(text))
                }

            }

            Row {
                width: parent.width
                spacing: parent.width * 3 / 100
                Label {
                    width: parent.width * 15 / 100
                    height: parent.height
                    text: "Date:"
                    verticalAlignment: "AlignVCenter"
                    font.pixelSize: fontSizeNormal
                }

                TextField {
                    id: fieldDate
                    width: parent.width * 45 / 100
                    placeholderText: "Date Ex.: 10/10/2010"
                    font.pixelSize: fontSizeNormal
                    Keys.onReturnPressed: {
                        fieldDate.focus = false
                        fieldDescription.focus = true
                    }

                    inputMethodHints: Qt.ImhDigitsOnly

                    onEditingFinished: console.log(FuncCreateGame.isValidDate(text))

                    onFocusChanged: {
                        inputMask = "00/00/0000"
                        cursorPosition = 0
                    }
                }
            }
            Column {
                width: parent.width
                spacing: 5

                Label {
                    width: parent.width
                    text: "Description:"
                    verticalAlignment: "AlignVCenter"
                    font.pixelSize: fontSizeNormal
                }

                TextArea {
                    id: fieldDescription
                    width: parent.width
                    clip: true
                    wrapMode: "WordWrap"
                    placeholderText: "Put here description of game"
                    font.pixelSize: fontSizeNormal
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
        anchors.right: parent.right
        anchors.rightMargin: parent.width * 2.5 / 100
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.width * 2.5 / 100
        width: parent.width * 20 / 100

        text: "Ok"
        Material.foreground: "black"
        Material.elevation: 1
        highlighted: true
        font.bold: true
        font.pixelSize: fontSizeNormal
        onClicked: dialog.open()
    }
}
