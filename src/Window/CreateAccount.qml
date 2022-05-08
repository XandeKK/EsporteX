import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "../Control/"
import "js/CreateAccount.js" as JS


Page {
    property bool name: false
    property bool email: false
    property bool password: false

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
                _database.dropAndCreateTables()
                dialog.close()
                _database.postUser(
                            fieldName.text,
                            comboBoxState.currentIndex + 1,
                            comboBoxCity.currentIndex + 1,
                            fieldTwitter.text,
                            fieldInstagram.text,
                            fieldDescription.text,
                            comboBoxState.currentText,
                            comboBoxCity.currentText,
                            fieldEmail.text,
                            fieldPassword.text
                            )
                stack.replace("qrc:/Window/Home.qml")
            }

            onRejected: dialog.close()
        }
    }

    header: ToolBarBack {
        labelToolBar: "Sign up"
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
                    width: parent.width * 77 / 100

                    font.pixelSize: fontSizeNormal
                    placeholderText: "Name"

                    onEditingFinished: {
                        if (text.length == 0){
                            name = false
                        }else{
                            name = true
                        }
                    }

                    Keys.onReturnPressed: {
                        fieldName.focus = false
                        fieldEmail.focus = true
                    }
                }

            }

            Label {
                id: labelWarningEmail
                text: "The email is wrong"
                visible: false
            }

            Label {
                id: labelExistEmail
                text: "The email Exist"
                visible: false
            }

            Row {
                id: rowEmail
                width: parent.width
                spacing: parent.width * 3 / 100

                Label {
                    width: parent.width * 20 / 100
                    height: parent.height
                    verticalAlignment: "AlignVCenter"

                    font.pixelSize: fontSizeNormal
                    text: "Email:"
                }

                TextField {
                    id: fieldEmail
                    width: parent.width * 77 / 100
                    font.pixelSize: fontSizeNormal

                    placeholderText: "Email"

                    Keys.onReturnPressed: {
                        fieldEmail.focus = false
                        fieldPassword.focus = true
                    }
                    onEditingFinished: {
                        labelWarningEmail.visible = !JS.isValidEmail(fieldEmail.text)
                        labelExistEmail.visible = _database.existsEmail(fieldEmail.text)
                        if ( !labelWarningEmail.visible && !labelExistEmail.visible ) {
                            email = true
                        }else {
                            email = false
                        }
                    }
                }
            }

            Label {
                id: labelWarningPassword
                text: "Warning!\nThe password not equal"
                visible: false
            }

            Row {
                id: rowPassword
                width: parent.width
                spacing: parent.width * 3 / 100

                Label {
                    width: parent.width * 20 / 100
                    height: parent.height
                    verticalAlignment: "AlignVCenter"

                    font.pixelSize: fontSizeNormal
                    text: "Password:"
                }

                TextField {
                    property bool visiblePassword: false
                    id: fieldPassword
                    width: parent.width * 77 / 100
                    font.pixelSize: fontSizeNormal

                    placeholderText: "Password"
                    echoMode: visiblePassword ? TextInput.Normal : TextInput.Password

                    Keys.onReturnPressed: {
                        fieldPassword.focus = false
                        fieldConfirmPassword.focus = true
                    }

                    passwordCharacter: "*"

                    onEditingFinished: {
                        if(fieldPassword.text == fieldConfirmPassword.text){
                            labelWarningPassword.visible = false
                            password = true
                        }else{
                            labelWarningPassword.visible = true
                            password = false
                        }
                    }

                    Image {
                        anchors.right: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                        height: parent.height * 80 / 100
                        width: height
                        source: fieldPassword.visiblePassword ? "qrc:/assets/eyeopen.png" : "qrc:/assets/eyeclosed.png"
                        MouseArea {
                            anchors.fill: parent
                            onClicked: fieldPassword.visiblePassword = !fieldPassword.visiblePassword
                        }
                    }
                }
            }

            Row {
                id: rowConfirmPassword
                width: parent.width
                spacing: parent.width * 3 / 100

                Label {
                    width: parent.width * 20 / 100
                    height: parent.height
                    verticalAlignment: "AlignVCenter"

                    font.pixelSize: fontSizeNormal
                    text: "C. Password:"
                }

                TextField {
                    id: fieldConfirmPassword
                    width: parent.width * 77 / 100
                    font.pixelSize: fontSizeNormal

                    placeholderText: "Confirm Password"
                    echoMode: fieldPassword.visiblePassword ? TextInput.Normal : TextInput.Password

                    Keys.onReturnPressed: {
                        fieldConfirmPassword.focus = false
                    }
                    passwordCharacter: "*"

                    onEditingFinished: {
                        if(fieldPassword.text == fieldConfirmPassword.text){
                            labelWarningPassword.visible = false
                            password = true
                        }else{
                            labelWarningPassword.visible = true
                            password = false
                        }
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
                    id: comboBoxState
                    width: parent.width * 77 / 100
                    model: JS.getStates()

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
                    id: comboBoxCity
                    width: parent.width * 77 / 100
                    model: JS.getCities(comboBoxState.currentIndex + 1)

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
                    width: parent.width * 77 / 100

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
                    width: parent.width * 77 / 100

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
                    placeholderText: "Put here description about you."

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

        onClicked: {
            if (name && email && password){
                dialog.open()
            }
        }
    }
}
