import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "./SwipeSport"
import "../Control/"
import "../"

Page {
    header: ToolBarBack {
        labelToolBar: PropertyVar.nameSport
    }

    TabBar {
        id: tabBarSport
        width: parent.width
        z: 1
        spacing: 0
        currentIndex: swipeSport.currentIndex

        TabButton {
            font.pixelSize: fontSizeNormal
            font.bold: true
            text: "All"
        }

        TabButton {
            text: "Created by you"
            font.pixelSize: fontSizeNormal
            font.bold: true
        }
    }

    SwipeView {
        id: swipeSport
        width: parent.width
        anchors.top: tabBarSport.bottom
        anchors.bottom: parent.bottom
        clip: true
        interactive: false
        currentIndex: tabBarSport.currentIndex

        Loader {
            sourceComponent: SportList {}
        }

        Loader {
            sourceComponent: SportCreateByYou {}
        }
    }

    RoundButton {
        id: button
        width: 70
        height: 70
        anchors.bottom: parent.bottom
        anchors.bottomMargin: anchors.rightMargin
        anchors.right: parent.right
        anchors.rightMargin: parent.width * 2.5 / 100
        Material.elevation: 1
        z: 1

        highlighted: true

        icon.source: "qrc:/assets/add.png"
        icon.color: "black"

        font.pixelSize: fontSizeNormal

        onClicked: stack.push("qrc:/Window/CreateGame.qml")
    }
}
