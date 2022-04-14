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
        source: "qrc:/assets/paper.png"
        anchors.fill: parent
    }

    Image {
        id: frameSocial
        source: "qrc:/assets/FrameSocial.png"
        anchors.centerIn: parent
        width: {
            if(parent.width > (root.height * 80 / 100)){
                root.height * 80 / 100
            }else {
                parent.width
            }
        }

        height: width
        mipmap: true

        Label {
            id: labelOAuth
            anchors.top: parent.top
            anchors.topMargin: parent.height * 14 / 100
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 35 / 100
            text: "Enter with:"
            font.bold: true
            font.pixelSize: fontSizeLarge
            Material.foreground: "black"
            rotation: -5
        }


        ListView {
            id: listViewOAuth
            anchors.top: parent.top
            anchors.topMargin: parent.height * 18 / 100
            anchors.left: parent.left
            anchors.leftMargin: parent.height * 16 / 100
            width: parent.width * 65 / 100
            height: parent.height * 51.8 / 100
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
                icon.source: model.icon
                icon.color: "transparent"
                icon.width: (listViewOAuth.height - listViewOAuth.anchors.topMargin) / listViewOAuth.count
                icon.height: (listViewOAuth.height - listViewOAuth.anchors.topMargin) / listViewOAuth.count
                text: model.name
                font.pixelSize: fontSizeNormal
            }
        }

        Label {
            anchors.bottom: labelGuest.top
            anchors.bottomMargin: parent.height * 1 / 100
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 49 / 100
            text: "Or"
            font.bold: true
            font.pixelSize: fontSizeLarge
            Material.foreground: "black"
            rotation: -5
        }

        Label {
            id: labelGuest
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height * 18 / 100
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 40 / 100
            text: "Enter as a guest"
            font.bold: true
            font.pixelSize: fontSizeLarge
            Material.foreground: mouseAreaGuest.pressed ? Material.DeepPurple : "black"
            rotation: -5

            MouseArea {
                id: mouseAreaGuest
                anchors.fill: parent
                onClicked: stack.replace("qrc:/Window/Home.qml")
            }
        }

    }

    Image {
        id: loginImage
        source: "qrc:/assets/Login.png"
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.height * 25 / 100
        height: parent.height * 8 / 100
        anchors.top: parent.top
        anchors.topMargin: parent.height * 5 / 100
        //        mipmap: true
    }
}
