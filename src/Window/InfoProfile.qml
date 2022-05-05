import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "../Control/"
import "../"

Page {
    property var infoProfile: {
        let dataJson = _database.getInfoProfile(PropertyVar.organizer_id)
        return JSON.parse(dataJson)[0]
    }
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
        source: "data:image/png;base64," + infoProfile["image"]
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
            id: buttonParticipation
            Layout.alignment: Qt.AlignLeft
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
            text: infoProfile["name"]
        }

        Label {
            id: labelUserName
            font.pixelSize: fontSizeNormal
            color: Material.theme === Material.Dark ? "#88ffffff" : "#88000000"
            text: "@" + infoProfile["username"]
        }

        Row {
            ItemDelegate {
                id: twitterItem
                Material.foreground: Material.theme === Material.Dark ? "#88ffffff" : "#88000000"

                icon.source: "qrc:/assets/twitterProfile.png"

                font.pixelSize: fontSizeNormal
                text: "@" + infoProfile["twitter"] // Colocar uma condição se caso estiver vazio é para ficar invisivel
            }

            ItemDelegate {
                id: instragramItem
                Material.foreground: Material.theme === Material.Dark ? "#88ffffff" : "#88000000"

                icon.source: "qrc:/assets/instagramProfile.png"

                font.pixelSize: fontSizeNormal
                text: "@" + infoProfile["instagram"]// Colocar uma condição se caso estiver vazio é para ficar invisivel
            }
        }

        Label {
            id: labelDescriptionUser
            Layout.preferredWidth: parent.width
            color: Material.theme === Material.Dark ? "#88ffffff" : "#88000000"

            wrapMode: "WordWrap"
            clip: true

            font.pixelSize: fontSizeNormal
            text: infoProfile["description"]
        }

        RowLayout {
            ItemDelegate {
                id: itemDelegateAddress
                Layout.preferredWidth: columnLayout.width * 80 / 100
                Material.foreground: Material.theme === Material.Dark ? "#88ffffff" : "#88000000"

                icon.source: "qrc:/assets/mark.png"

                font.pixelSize: fontSizeNormal
                text: infoProfile["instagram"]
            }

            Item {
                Layout.fillWidth: true
            }
        }
    }

    Separator {
        anchors.bottom: columnLayout.bottom
    }
}
