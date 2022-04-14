import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "../Control/"

Page {
    header: ToolBarBack {
        labelToolBar: "Info Profile"
    }

    Image {
        id: imageProfie
        width: 100 * dip
        height: 100 * dip
        anchors.top: parent.top
        anchors.topMargin: parent.height * 5 / 100
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 5 / 100

        fillMode: Image.PreserveAspectCrop
        mipmap: true
        source: "http://10.0.0.22/assets/profile.jpg"
    }

    RowLayout {
        property int total: 3

        anchors.left: imageProfie.right
        anchors.leftMargin: parent.width * 2.5 / 100
        anchors.right: parent.right
        anchors.rightMargin: parent.width * 2.5 / 100
        anchors.verticalCenter: imageProfie.verticalCenter
        spacing: 0

        Button {
            id: buttonFollow
            Layout.alignment: Qt.AlignLeft
            Layout.preferredWidth: parent.width / parent.total
            flat: true

            font.capitalization: "MixedCase"
            font.pixelSize: fontSizeNormal
            text: "42\nFollow"

            onClicked: stack.push("qrc:/Window/SwipeHome/profile/SwipeFollow.qml")
        }

        Button {
            id: buttonFollowers
            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: parent.width / parent.total
            flat: true

            font.pixelSize: fontSizeNormal
            font.capitalization: "MixedCase"
            text: "12\nFollowers"

            onClicked: stack.push("qrc:/Window/SwipeHome/profile/SwipeFollow.qml")
        }

        Button {
            id: buttonParticipation
            Layout.alignment: Qt.AlignRight
            Layout.preferredWidth: parent.width / parent.total
            flat: true

            font.pixelSize: fontSizeNormal
            font.capitalization: "MixedCase"
            text: "30\nParticipation"

            onClicked: stack.push("qrc:/Window/SwipeHome/profile/Participation.qml")
        }
    }

    ColumnLayout {
        id: columnLayout
        anchors.top: imageProfie.bottom
        anchors.topMargin: parent.height * 2.5 / 100
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 5 / 100
        anchors.right: parent.right
        anchors.rightMargin: parent.width * 5 / 100

        Label {
            id: labelName
            font.pixelSize: fontSizeLarge
            font.bold: true
            text: "Paul Ksio"
        }

        Label {
            id: labelUserName
            font.pixelSize: fontSizeNormal
            color: Material.theme === Material.Dark ? "#88ffffff" : "#88000000"
            text: "@paulKsio"
        }

        Row {
            ItemDelegate {
                id: twitterItem
                Material.foreground: Material.theme === Material.Dark ? "#88ffffff" : "#88000000"

                icon.source: "qrc:/assets/twitterProfile.png"

                font.pixelSize: fontSizeNormal
                text: "@paulKKsio"
            }

            ItemDelegate {
                id: instragramItem
                Material.foreground: Material.theme === Material.Dark ? "#88ffffff" : "#88000000"

                icon.source: "qrc:/assets/instagramProfile.png"

                font.pixelSize: fontSizeNormal
                text: "@paulksio"
            }
        }

        Label {
            id: labelDescriptionUser
            Layout.preferredWidth: parent.width
            color: Material.theme === Material.Dark ? "#88ffffff" : "#88000000"

            wrapMode: "WordWrap"
            clip: true

            font.pixelSize: fontSizeNormal
            text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur vitae accumsan nibh. Integer posuere, sem a dapibus convallis, nulla magna fringilla eros, eget euismod magna ligula sit amet felis. In faucibus consequat lectus efficitur laoreet"
        }

        RowLayout {
            ItemDelegate {
                id: itemDelegateAddress
                Layout.preferredWidth: columnLayout.width * 80 / 100
                Material.foreground: Material.theme === Material.Dark ? "#88ffffff" : "#88000000"

                icon.source: "qrc:/assets/mark.png"

                font.pixelSize: fontSizeNormal
                text: "Amityville, New York(NY)"
            }

            Item {
                Layout.fillWidth: true
            }

            RoundButton {
                id: buttonFollowUser
                highlighted: true

                font.bold: true
                text: "Follow"
            }
        }
    }

    Separator {
        anchors.bottom: columnLayout.bottom
    }
}
