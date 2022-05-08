import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "../"

Page {

    Dialog {
        id: dialog
        anchors.centerIn: parent
        modal: true

        font.pixelSize: fontSizeNormal
        title: "Logging in as a guest\n will lose some features.\n Are you sure you're\n going in?"
//        width: parent.width * 70 / 100

        DialogButtonBox {
            width: parent.width
            alignment: Qt.AlignRight
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
                PropertyVar.isGuest = true
                _database.enterAsGuest()
                stack.push("qrc:/Window/Home.qml")
            }

            onRejected: dialog.close()
        }
    }

    Popup {
            id: popup
            anchors.centerIn: parent
            modal: true
            focus: true
            closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

            Label {
                text: "Verify if email/password is wrong"
            }
        }

    Rectangle {
        anchors.fill: parent
        color: "#ace044"
    }

    Image {
        id: paper
        anchors.fill: parent

        source: "qrc:/assets/paper.png"
    }

    Image {
        id: loginImage
        width: parent.height * 25 / 100
        height: parent.height * 8 / 100
        anchors.top: parent.top
        anchors.topMargin: parent.height * 5 / 100
        anchors.horizontalCenter: parent.horizontalCenter

        source: "qrc:/assets/Login.png"
    }

    Column {
        id: columnRoot
        width: parent.width * 90 / 100
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        spacing: 20

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
            }

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
                }
                passwordCharacter: "*"

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

        RoundButton {
            width: parent.width

            Material.foreground: "black"
            Material.elevation: 1
            highlighted: true
            font.bold: true
            font.pixelSize: fontSizeNormal
            text: "Login"

            onClicked: {
                _database.dropAndCreateTables()
                if (_database.getLogin(fieldEmail.text, fieldPassword.text)){
                    stack.replace("qrc:/Window/Home.qml")
                }else{
                    popup.open()
                }
            }
        }
    }

    Label {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height * 10 / 100
        anchors.horizontalCenter: parent.horizontalCenter
        text: "It has no account. Register by clicking here."
        MouseArea{
            anchors.fill: parent
            onClicked: stack.push("qrc:/Window/CreateAccount.qml")
        }
    }

    Label {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height * 2.5 / 100
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Enter as Guest."
        MouseArea{
            anchors.fill: parent
            onClicked: {
                dialog.open()
            }
        }
    }
}
