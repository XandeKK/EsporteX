import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "../Control/"
import "../"

Page {
    property var infoProfile: {
        let dataJson = _database.getInfoProfile(PropertyVar.people_id)
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
            text: _database.countParticipation(infoProfile["user_id"]) + "\nParticipation"
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

        Row {
            visible: {
                (twitterItem || instagramItem)
            }

            ItemDelegate {
                id: twitterItem

                icon.source: "qrc:/assets/twitterProfile.png"
                visible: {
                    !(infoProfile["twitter"] == "")
                }

                Material.foreground: Material.theme === Material.Dark ? "#88ffffff" : "#88000000"
                font.pixelSize: fontSizeNormal
                text: "@" + infoProfile["twitter"]

                onClicked: _desktopServices.twitter(infoProfile["twitter"])
            }

            ItemDelegate {
                id: instagramItem

                icon.source: "qrc:/assets/instagramProfile.png"
                visible: {
                    !(infoProfile["instagram"] == "")
                }

                Material.foreground: Material.theme === Material.Dark ? "#88ffffff" : "#88000000"
                font.pixelSize: fontSizeNormal
                text: "@" + infoProfile["instagram"]

                onClicked: _desktopServices.instagram(infoProfile["instagram"])
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
                text: infoProfile["city"]["city"] + ", " + infoProfile["state"]["state"]

                onClicked: _desktopServices.googleMap(infoProfile["city"]["city"])
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
