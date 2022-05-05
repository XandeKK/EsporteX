import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "../js/CreateGame.js" as FuncCreateGame
import "../js/CreateAccount.js" as FuncAddress
import "../../Control/"
import "../../"

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
                dialog.close()
                _database.putGame(PropertyVar.game_id,
                                  comboBoxSport.currentIndex + 1,
                                  comboBoxState.currentIndex + 1,
                                  comboBoxCity.currentIndex + 1,
                                  fieldAddress.text,
                                  fieldDate.text,
                                  fieldDescription.text,
                                  fieldStart.text,
                                  fieldEnd.text
                                  )
                stack.pop(null)
                stack.push("qrc:/Window/InfoGame.qml")
            }

            onRejected: dialog.close()
        }
    }

    header: ToolBarBack {
        labelToolBar: "Edit Game"
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
                id: rowSports
                width: parent.width
                spacing: parent.width * 3 / 100

                Label {
                    width: parent.width * 15 / 100
                    height: parent.height
                    verticalAlignment: "AlignVCenter"

                    font.pixelSize: fontSizeNormal
                    text: "Sport:"
                }

                ComboBox {
                    id: comboBoxSport
                    width: parent.width * 82 / 100
                    model: FuncCreateGame.getSports()
                    currentIndex: infoGame["sport"]["id"] - 1

                    font.pixelSize: fontSizeNormal
                }

            }

            Row {
                id: rowState
                width: parent.width
                spacing: parent.width * 3 / 100

                Label {
                    width: parent.width * 15 / 100
                    height: parent.height
                    verticalAlignment: "AlignVCenter"

                    font.pixelSize: fontSizeNormal
                    text: "State:"
                }

                ComboBox {
                    id: comboBoxState
                    width: parent.width * 82 / 100
                    model: FuncAddress.getStates() // Colocar no atual
                    currentIndex: infoGame["state"]["id"] - 1

                    font.pixelSize: fontSizeNormal
                }

            }

            Row {
                id: rowCity
                width: parent.width
                spacing: parent.width * 3 / 100

                Label {
                    width: parent.width * 15 / 100
                    height: parent.height
                    verticalAlignment: "AlignVCenter"

                    font.pixelSize: fontSizeNormal
                    text: "City:"
                }

                ComboBox {
                    id: comboBoxCity
                    width: parent.width * 82 / 100
                    model: FuncAddress.getCities(comboBoxState.currentIndex + 1) // Colocar no atual
                    currentIndex: infoGame["city"]["id"] - 1

                    font.pixelSize: fontSizeNormal
                }
            }

            Row {
                id: rowAddress
                width: parent.width
                spacing: parent.width * 3 / 100

                Label {
                    width: parent.width * 15 / 100
                    height: parent.height
                    verticalAlignment: "AlignVCenter"

                    font.pixelSize: fontSizeNormal
                    text: "Address:"
                }

                TextField {
                    id: fieldAddress
                    width: parent.width * 82 / 100
                    text: infoGame["address"]

                    font.pixelSize: fontSizeNormal
                    placeholderText: "Address"

                    Keys.onReturnPressed: {
                        fieldAddress.focus = false
                        fieldStart.focus = true
                    }
                }

            }

            Row {
                id: rowStartTime
                width: parent.width
                spacing: parent.width * 3 / 100

                Label {
                    width: parent.width * 15 / 100
                    height: parent.height
                    verticalAlignment: "AlignVCenter"

                    font.pixelSize: fontSizeNormal
                    text: "Start:"
                }

                TextField {
                    id: fieldStart
                    width: parent.width * 45 / 100
                    text: infoGame["start"].substr(11, 5)

                    font.pixelSize: fontSizeNormal
                    placeholderText: "Start Game Ex.: 10:00"

                    inputMethodHints: Qt.ImhDigitsOnly
                    onEditingFinished: console.log(FuncCreateGame.isValidTime(text))

                    Keys.onReturnPressed: {
                        fieldStart.focus = false
                        fieldEnd.focus = true
                    }

                    onFocusChanged: {
                        inputMask = "00:00"
                        cursorPosition = 0
                    }
                }
            }

            Row {
                id: rowEndTime
                width: parent.width
                spacing: parent.width * 3 / 100

                Label {
                    width: parent.width * 15 / 100
                    height: parent.height
                    verticalAlignment: "AlignVCenter"

                    font.pixelSize: fontSizeNormal
                    text: "End:"
                }

                TextField {
                    id: fieldEnd
                    width: parent.width * 45 / 100

                    font.pixelSize: fontSizeNormal
                    placeholderText: "End Game Ex.: 13:00"
                    text: infoGame["end"].substr(11, 5)

                    inputMethodHints: Qt.ImhDigitsOnly
                    onEditingFinished: console.log(FuncCreateGame.isValidTime(text))

                    Keys.onReturnPressed: {
                        fieldEnd.focus = false
                        fieldDate.focus = true
                    }

                    onFocusChanged: {
                        inputMask = "00:00"
                        cursorPosition = 0
                    }
                }
            }

            Row {
                id: rowDate
                width: parent.width
                spacing: parent.width * 3 / 100

                Label {
                    width: parent.width * 15 / 100
                    height: parent.height
                    verticalAlignment: "AlignVCenter"

                    font.pixelSize: fontSizeNormal
                    text: "Date:"
                }

                TextField {
                    id: fieldDate
                    width: parent.width * 45 / 100

                    font.pixelSize: fontSizeNormal
                    placeholderText: "Date Ex.: 10/10/2010"
                    text: {
                        let date = infoGame["date"].split("-")
                        return date[2] + "/" + date[1] + "/" + date[0]
                    }

                    inputMethodHints: Qt.ImhDigitsOnly
                    onEditingFinished: console.log(FuncCreateGame.isValidDate(text))

                    Keys.onReturnPressed: {
                        fieldDate.focus = false
                        fieldDescription.focus = true
                    }

                    onFocusChanged: {
                        inputMask = "00/00/0000"
                        cursorPosition = 0
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
                    placeholderText: "Put here description of game"
                    text: infoGame["description"]

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
