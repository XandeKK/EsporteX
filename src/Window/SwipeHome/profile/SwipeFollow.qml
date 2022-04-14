import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "./SwipeFollow/"
import "../../../Control/"

Page {
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
                dialog.close()
            }

            onRejected: dialog.close()
        }
    }

    header: ToolBarBack {
        labelToolBar: "Follow"
    }

    TabBar {
        id: tabBarProfile
        width: parent.width
        z: 1
        spacing: 0
        currentIndex: swipeProfile.currentIndex

        TabButton {
            font.pixelSize: fontSizeNormal
            font.bold: true
            text: "Follow"
        }

        TabButton {
            font.pixelSize: fontSizeNormal
            font.bold: true
            text: "Followers"
        }
    }

    SwipeView {
        id: swipeProfile
        width: parent.width
        currentIndex: tabBarProfile.currentIndex
        anchors.top: tabBarProfile.bottom
        anchors.bottom: parent.bottom
        clip: true

        Loader {
            sourceComponent: Follow {}
        }

        Loader {
            sourceComponent: Followers {}
        }
    }
}
