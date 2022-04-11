import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "./SwipeSport"

Page {
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
                text: "Sport List"
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
        id: tabBarSport
        width: parent.width
        z: 1
        spacing: 0
        currentIndex: swipeSport.currentIndex

        TabButton {
            text: "All"
            font.pixelSize: fontSizeNormal
            font.bold: true
        }

        TabButton {
            text: "Created by you"
            font.pixelSize: fontSizeNormal
            font.bold: true
        }
    }

    SwipeView {
        id: swipeSport
        currentIndex: tabBarSport.currentIndex
        anchors.top: tabBarSport.bottom
        anchors.bottom: parent.bottom
        width: parent.width
        interactive: false
        clip: true

        Loader {
            sourceComponent: SportList {}
        }

        Loader {
            sourceComponent: SportCreateByYou {}
        }
    }

    RoundButton {
        id: button
        anchors.bottom: parent.bottom
        anchors.bottomMargin: anchors.rightMargin
        anchors.right: parent.right
        anchors.rightMargin: parent.width * 2.5 / 100
        width: 70
        height: 70
        font.pixelSize: fontSizeNormal
        z: 1

        highlighted: true

        icon.source: "qrc:/assets/add.png"
        icon.color: "black"
        Material.elevation: 1

        onClicked: stack.push("qrc:/Window/CreateGame.qml")
    }
}
