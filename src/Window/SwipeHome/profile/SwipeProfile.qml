import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "./SwipeFollow/"

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
                dialog.close()
            }

            onRejected: dialog.close()
        }
    }

    header: ToolBar {
        Material.foreground: "white"
        RowLayout {
            anchors.fill: parent

            ToolButton {
                id: toolButtonBack
                icon.source: "qrc:/assets/backArrow.png"
                onClicked: stack.pop()
            }

            Label {
                text: "Settings Info"
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
                font.bold: true
                font.pixelSize: fontSizeToolBar
            }

            ToolButton {
            }
        }
    }

    TabBar {
        id: tabBarProfile
        width: parent.width
        z: 1
        spacing: 0
        currentIndex: swipeProfile.currentIndex

        TabButton {
            text: "Follow"
            font.pixelSize: fontSizeNormal
            font.bold: true
        }

        TabButton {
            text: "Followers"
            font.pixelSize: fontSizeNormal
            font.bold: true
        }
    }

    SwipeView {
        id: swipeProfile
        currentIndex: tabBarProfile.currentIndex
        anchors.top: tabBarProfile.bottom
        anchors.bottom: parent.bottom
        width: parent.width
        clip: true

        Loader {
            sourceComponent: Follow {}
        }

        Loader {
            sourceComponent: Followers {}
        }
    }

}
