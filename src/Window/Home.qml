import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "../Control"
import "./SwipeHome"

Page {
    header: ToolBar {
        Material.primary: Material.DeepPurple
        RowLayout {
            anchors.fill: parent

            ToolButton {
                id: toolButtonDrawer
                icon.source: "qrc:/assets/threeLinesBlack.png"
                onClicked: drawer.open()
            }

            Label {
                text: {
                    switch (swipe.currentIndex){
                    case 0:
                        return "Sport"
                    case 1:
                        return "Profile"
                    case 2:
                        return "Chat"
                    }
                }

                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
                font.bold: true
                font.pointSize: 12
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
