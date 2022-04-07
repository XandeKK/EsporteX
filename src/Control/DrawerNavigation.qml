import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
//import QtQuick.Layouts 1.15

Drawer {
    width: 0.66 * root.width
    height: root.height

    Item {
        id: headerDrawer
        width: root.width
        height: root.height * 25 / 100

        Label {
            text: "Content goes here!"
            anchors.centerIn: parent
        }
    }

    ListView {
        id: listViewHeader
        anchors.top: headerDrawer.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: contentHeight

        model: ListModel {
            ListElement {icon: "qrc:/assets/profile.png"; name: "Profile"}
        }

        delegate: ItemDelegate {
            text: name
            width: listViewHeader.width
            icon.source: model.icon
        }
    }

    Rectangle {
        id: separator
        anchors.top: listViewHeader.bottom
        width: parent.width
        height: 1
        color: "#c7c7c7"
    }

    ListView {
        id: listViewFooter
        anchors.top: separator.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: contentHeight

        model: ListModel {
            ListElement {icon: "qrc:/assets/settings.png"; name: "Settings"}
            ListElement {icon: "qrc:/assets/about.png"; name: "About"}
            ListElement {icon: "qrc:/assets/logout.png"; name: "Logout"}
        }

        delegate: ItemDelegate {
            text: name
            width: listViewFooter.width
            icon.source: model.icon
        }
    }
}
