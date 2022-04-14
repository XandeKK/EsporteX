import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15

Page {
    Dialog {
        id: dialog
        title: "Are you sure?"
        modal: true
        anchors.centerIn: parent
        font.pixelSize: fontSizeNormal

        DialogButtonBox {
            Button {
                text: qsTr("No")
                DialogButtonBox.buttonRole: DialogButtonBox.NoRole
                Material.background: Material.Red
                Material.foreground: "White"
                font.pixelSize: fontSizeNormal
            }
            Button {
                text: qsTr("Yes")
                DialogButtonBox.buttonRole: DialogButtonBox.YesRole
                Material.background: Material.Green
                Material.foreground: "White"
                font.pixelSize: fontSizeNormal
            }

            onAccepted: {
                popup.close()
                dialog.close()
                imageProfie.source = ""
            }

            onRejected: dialog.close()
        }
    }

    Popup {
        id: popup
        anchors.centerIn: parent
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
        modal: true
        focus: true
        width: parent.width * 60 / 100

        ColumnLayout {
            width: parent.width
            Button {
                text: "Edit image"
                flat: true
                Layout.preferredWidth: parent.width
                font.capitalization: "MixedCase"
            }

            Button {
                text: "Remove image"
                flat: true
                Layout.preferredWidth:  parent.width
                font.capitalization: "MixedCase"
                onClicked: dialog.open()
            }
        }
    }

    Image {
        id: imageProfie
        source: "http://10.0.0.22/assets/profile.jpg"
        anchors.top: parent.top
        anchors.topMargin: parent.height * 5 / 100
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 5 / 100
        fillMode: Image.PreserveAspectCrop
        mipmap: true
        width: 100 * dip
        height: 100 * dip

        MouseArea {
            anchors.fill: parent
            onClicked: popup.open()
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

        Button {
            text: "42\nFollow"
            font.pixelSize: fontSizeNormal
            font.capitalization: "MixedCase"
            flat: true
            Layout.alignment: Qt.AlignLeft
            Layout.preferredWidth: parent.width / parent.total
            onClicked: stack.push("qrc:/Window/SwipeHome/profile/SwipeProfile.qml")
        }

        Button {
            text: "12\nFollowers"
            font.pixelSize: fontSizeNormal
            font.capitalization: "MixedCase"
            flat: true
            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: parent.width / parent.total
            onClicked: stack.push("qrc:/Window/SwipeHome/profile/SwipeProfile.qml")
        }

        Button {
            text: "30\nParticipation"
            font.pixelSize: fontSizeNormal
            font.capitalization: "MixedCase"
            flat: true
            Layout.alignment: Qt.AlignRight
            Layout.preferredWidth: parent.width / parent.total
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
            text: "Paul Ksio"
            font.pixelSize: fontSizeLarge
            font.bold: true
        }

        Label {
            text: "@paulKsio"
            font.pixelSize: fontSizeNormal
            color: Material.theme === Material.Dark ? "#88ffffff" : "#88000000"
        }

        Row {
            ItemDelegate {
                id: twitterItem
                icon.source: "qrc:/assets/twitterProfile.png"
                text: "@paulKKsio"
            }

            ItemDelegate {
                id: instragramItem
                icon.source: "qrc:/assets/instagramProfile.png"
                text: "@paulksio"
            }
        }

        Label {
            Layout.preferredWidth: parent.width
            font.pixelSize: fontSizeNormal
            color: Material.theme === Material.Dark ? "#88ffffff" : "#88000000"
            wrapMode: "WordWrap"
            clip: true
            text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur vitae accumsan nibh. Integer posuere, sem a dapibus convallis, nulla magna fringilla eros, eget euismod magna ligula sit amet felis. In faucibus consequat lectus efficitur laoreet"
        }

        RowLayout {
            ItemDelegate {
                Layout.preferredWidth: columnLayout.width * 80 / 100
                icon.source: "qrc:/assets/mark.png"
                text: "Amityville, New York(NY)"
                font.pixelSize: fontSizeNormal
                Material.foreground: Material.theme === Material.Dark ? "#88ffffff" : "#88000000"
            }

            Item {
                Layout.fillWidth: true
            }

            ItemDelegate {
                icon.source: "qrc:/assets/settings.png"
                Material.foreground: Material.theme === Material.Dark ? "#88ffffff" : "#88000000"
                onClicked: stack.push("qrc:/Window/SwipeHome/profile/SettingsProfile.qml")
            }
        }
    }

    Rectangle {
        id: separator
        anchors.top: columnLayout.bottom
        width: parent.width
        height: 1
        color: Material.theme === Material.Dark ? "#33ffffff" : "#33000000"
    }

}
