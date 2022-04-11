import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "../Control"
import "./SwipeHome"

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
                drawer.close()
                dialog.close()
                stack.pop(null)
                stack.push("qrc:/Window/Login.qml")
            }

            onRejected: dialog.close()
        }
    }

    header: ToolBar {
        Material.foreground: "white"
        RowLayout {
            anchors.fill: parent
            Material.foreground: Material.White

            ToolButton {
                id: toolButtonDrawer
                icon.source: "qrc:/assets/threeLinesBlack.png"
                onClicked: drawer.open()
            }

            Label {
                text: {
                    switch (swipe.currentIndex){
                    case 0:
                        "Sport"
                        break
                    case 1:
                        "Profile"
                        break
                    case 2:
                        "Chat"
                        break
                    }
                }

                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
                font.bold: true
                font.pixelSize: fontSizeToolBar
            }

            ToolButton {
                id: toolButtonNotification
                icon.source: "qrc:/assets/Bell.png"
                onClicked: stack.push("qrc:/Window/Notification.qml")
            }
        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipe.currentIndex
        TabButton {
            icon.source: "qrc:/assets/home.png"
        }

        TabButton {
            icon.source: "qrc:/assets/profile.png"
        }

        TabButton {
            icon.source: "qrc:/assets/letter.png"
        }
    }

    DrawerNavigation {id: drawer}

    SwipeView {
        id: swipe
        currentIndex: tabBar.currentIndex
        anchors.fill: parent
        interactive: false

        Loader {
            sourceComponent: ListGame {}
        }

        Loader {
            sourceComponent: Profile {}
        }

        Loader {
            sourceComponent: Chat {}
        }
    }
}
