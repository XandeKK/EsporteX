import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

Page {
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
        id: frameSocial
        anchors.centerIn: parent
        width: {
            if(parent.width > (root.height * 80 / 100)){
                root.height * 80 / 100
            }else {
                parent.width
            }
        }
        height: width

        source: "qrc:/assets/FrameSocial.png"
        mipmap: true

        Label {
            id: labelOAuth
            anchors.top: parent.top
            anchors.topMargin: parent.height * 14 / 100
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 35 / 100
            rotation: -5

            Material.foreground: "black"
            font.bold: true
            font.pixelSize: fontSizeLarge
            text: "Enter with:"
        }


        ListView {
            id: listViewOAuth
            width: parent.width * 65 / 100
            height: parent.height * 51.8 / 100
            anchors.top: parent.top
            anchors.topMargin: parent.height * 18 / 100
            anchors.left: parent.left
            anchors.leftMargin: parent.height * 16 / 100
            rotation: -6.2

            interactive: false
            clip: true

            model: ListModel {
                ListElement {icon: "qrc:/assets/google.png"; name: "Google"}
                ListElement {icon: "qrc:/assets/facebook.png"; name: "Facebook"}
                ListElement {icon: "qrc:/assets/twitter.png"; name: "Twitter"}
            }

            delegate: ItemDelegate {
                width: listViewOAuth.width

                icon.width: (listViewOAuth.height - listViewOAuth.anchors.topMargin) / listViewOAuth.count
                icon.height: (listViewOAuth.height - listViewOAuth.anchors.topMargin) / listViewOAuth.count
                icon.source: model.icon
                icon.color: "transparent"

                font.pixelSize: fontSizeNormal
                text: model.name
            }
        }

        Label {
            anchors.bottom: labelGuest.top
            anchors.bottomMargin: parent.height * 1 / 100
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 49 / 100
            rotation: -5

            Material.foreground: "black"
            font.pixelSize: fontSizeLarge
            font.bold: true
            text: "Or"
        }

        Label {
            id: labelGuest
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height * 18 / 100
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 40 / 100
            rotation: -5

            Material.foreground: mouseAreaGuest.pressed ? Material.DeepPurple : "black"
            font.bold: true
            font.pixelSize: fontSizeLarge
            text: "Enter as a guest"

            MouseArea {
                id: mouseAreaGuest
                anchors.fill: parent
                onClicked: stack.replace("qrc:/Window/Home.qml")
            }
        }

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
}
