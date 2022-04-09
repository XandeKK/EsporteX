import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

Page {

    Label {
        id: labelLogin
        text: "Login"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: parent.height * 5 / 100
        font.pixelSize: fontSizeLarge
    }

    ListView {
        id: listViewOAuth
        anchors.top: labelLogin.bottom
        anchors.topMargin: parent.height * 5 / 100
        width: parent.width * 80 / 100
        height: contentHeight
        anchors.horizontalCenter: parent.horizontalCenter
        interactive: false

        model: ListModel {
            ListElement {icon: "qrc:/assets/google.png"; name: "Google"}
            ListElement {icon: "qrc:/assets/facebook.png"; name: "Facebook"}
            ListElement {icon: "qrc:/assets/twitter.png"; name: "Twitter"}
        }

        delegate: ItemDelegate {
            width: listViewOAuth.width
            icon.source: model.icon
            icon.color: "transparent"
            icon.width: 50
            icon.height: 50
            text: model.name
            font.pixelSize: fontSizeNormal
        }
    }

    Label {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height * 5 / 100
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Enter as a guest"
        font.pixelSize: fontSizeNormal

        MouseArea {
            id: mouseAreaGuest
            anchors.fill: parent
            onClicked: stack.replace("qrc:/Window/Home.qml")
        }
    }
}
