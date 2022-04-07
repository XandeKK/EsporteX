import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

Page {
    Item {
        id: itemHeader
        height: parent.height * 35 / 100
        width: parent.width

        Image {
            id: profileImage
            anchors.top: parent.top
            anchors.topMargin: parent.height * 15 / 100
            anchors.horizontalCenter: parent.horizontalCenter
            height: parent.height * 50 / 100
            width: height
            source: "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
            fillMode: Image.PreserveAspectCrop
        }

        Label {
            id: labelName
            anchors.top: profileImage.bottom
            anchors.topMargin: parent.height * 5 / 100
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Agostinho Carrara"
        }

        Label {
            id: labelAddress
            anchors.top: labelName.bottom
            anchors.topMargin: parent.height * 2.5 / 100
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Lagarto, Sergipe"
        }
    }
    Rectangle {
        id: separator
        width: parent.width
        height: 1
        anchors.top: itemHeader.bottom
        color: "#c7c7c7"
    }

    ListView {
        id: listViewProfile
        anchors.top: separator.bottom
        anchors.bottom: parent.bottom
        width: parent.width * 80 / 100
        anchors.horizontalCenter: parent.horizontalCenter
        clip: true

        model: ListModel{
            ListElement {text: "Profile stats"}
            ListElement {text: "Profile settings"}
        }

        delegate: ItemDelegate {
            width: listViewProfile.width
            text: model.text
        }
    }
}
