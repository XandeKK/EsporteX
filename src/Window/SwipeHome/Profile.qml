import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import QtQuick.Dialogs
import "../../"

Page {
    property var info: {
        JSON.parse(_database.getUser())
    }
    property bool changedUser: PropertyVar.changeUser
    onChangedUserChanged: info = JSON.parse(_database.getUser())
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
                popup.close()
                dialog.close()
                _database.deleteImage()
                PropertyVar.changeUser = !PropertyVar.changeUser
                imageProfie.source = "data:image/png;base64," + info["image"]
            }

            onRejected: dialog.close()
        }
    }

    Image {
        id: imageNormal
        width: sourceSize.width * 70 / 100
        height: sourceSize.height * 70 / 100
        visible: false
    }

    FileDialog {
        id: fileDialog
        title: "Please choose a file"
        nameFilters: ["Image files (*.jpg *.png *.jpeg)"]
        onAccepted: {
            popup.close()
            imageNormal.source = fileDialog.currentFile
            imageProfie.source = imageNormal.source
            imageNormal.grabToImage(function(result) {
                _database.putImage(result.image);
            });
        }
    }

    Popup {
        id: popup
        width: parent.width * 60 / 100
        anchors.centerIn: parent
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
        modal: true
        focus: true

        ColumnLayout {
            width: parent.width
            Button {
                Layout.preferredWidth: parent.width
                flat: true
                font.capitalization: "MixedCase"
                text: "Edit image"
                onClicked: fileDialog.open()
            }

            Button {
                flat: true
                Layout.preferredWidth:  parent.width

                font.capitalization: "MixedCase"
                text: "Remove image"

                onClicked: dialog.open()
            }
        }
    }

    Image {
        id: imageProfie
        width: 100 * dip
        height: 100 * dip
        anchors.top: parent.top
        anchors.topMargin: parent.height * 5 / 100
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 5 / 100

        source: "data:image/png;base64," + info["image"]
        fillMode: Image.PreserveAspectCrop
        mipmap: true

        MouseArea {
            anchors.fill: parent
            onClicked: {
                if(!PropertyVar.isGuest){
                    popup.open()
                }
            }
        }
    }

    RowLayout {
        property int total: 3

        anchors.left: imageProfie.right
        anchors.leftMargin: parent.width * 2.5 / 100
        anchors.right: parent.right
        anchors.rightMargin: parent.width * 2.5 / 100
        anchors.verticalCenter: imageProfie.verticalCenter
        spacing: 0

        visible: !PropertyVar.isGuest

        Button {
            Layout.preferredWidth: parent.width / parent.total
            Layout.alignment: Qt.AlignLeft
            flat: true

            font.pixelSize: fontSizeNormal
            font.capitalization: "MixedCase"
            text: _database.countParticipation(_database.getUserId()) + "\nParticipation"
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
            font.pixelSize: fontSizeLarge
            font.bold: true
            text: info["name"]
        }

        Row {
            visible: {
                (twitterItem || instagramItem)
            }

            ItemDelegate {
                id: twitterItem

                icon.source: "qrc:/assets/twitterProfile.png"
                visible: {
                    !(info["twitter"] == "")
                }

                Material.foreground: Material.theme === Material.Dark ? "#88ffffff" : "#88000000"
                font.pixelSize: fontSizeNormal
                text: "@" + info["twitter"]

                onClicked: _desktopServices.twitter(info["twitter"])
            }

            ItemDelegate {
                id: instagramItem

                icon.source: "qrc:/assets/instagramProfile.png"
                visible: {
                    !(info["instagram"] == "")
                }

                Material.foreground: Material.theme === Material.Dark ? "#88ffffff" : "#88000000"
                font.pixelSize: fontSizeNormal
                text: "@" + info["instagram"]

                onClicked: _desktopServices.instagram(info["instagram"])
            }
        }

        Label {
            Layout.preferredWidth: parent.width

            wrapMode: "WordWrap"
            clip: true
            color: Material.theme === Material.Dark ? "#88ffffff" : "#88000000"
            font.pixelSize: fontSizeNormal
            text: info["description"]
        }

        RowLayout {
            ItemDelegate {
                Layout.preferredWidth: columnLayout.width * 80 / 100

                icon.source: "qrc:/assets/mark.png"

                Material.foreground: Material.theme === Material.Dark ? "#88ffffff" : "#88000000"
                font.pixelSize: fontSizeNormal
                text: info["city"] + ", " + info["state"]

                onClicked: _desktopServices.googleMap(info["city"])
                visible: !PropertyVar.isGuest
            }

            Item {
                Layout.fillWidth: true
            }

            ItemDelegate {
                Material.foreground: Material.theme === Material.Dark ? "#88ffffff" : "#88000000"

                icon.source: "qrc:/assets/settings.png"
                visible: !PropertyVar.isGuest

                onClicked: {
                    stack.push("qrc:/Window/SwipeHome/profile/SettingsProfile.qml")
                }
            }
        }
    }

    Rectangle {
        id: separator
        width: parent.width
        height: 1
        anchors.top: columnLayout.bottom
        color: Material.theme === Material.Dark ? "#33ffffff" : "#33000000"
    }

}
