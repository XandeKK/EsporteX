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
        interactive: false

        model: ListModel {
            ListElement {icon: "qrc:/assets/home.png"; name: "Home"}
            ListElement {icon: "qrc:/assets/profile.png"; name: "Profile"}
            ListElement {icon: "qrc:/assets/letter.png"; name: "Chat"}
        }

        delegate: ItemDelegate {
            text: name
            width: listViewHeader.width
            icon.source: model.icon
            highlighted: {
                if(tabBar.currentIndex == 0 && name === "Home"){
                    return true
                }else if(tabBar.currentIndex == 1 && name === "Profile"){
                    return true
                }else if(tabBar.currentIndex == 2 && name === "Chat"){
                    return true
                }else {
                    return false
                }
            }
            onClicked: {
                switch (name) {
                case "Home":
                    tabBar.currentIndex = 0
                    break
                case "Profile":
                    tabBar.currentIndex = 1
                    break
                case "Chat":
                    tabBar.currentIndex = 2
                    break
                }
                close()
            }
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
        interactive: false

        model: ListModel {
            ListElement {icon: "qrc:/assets/settings.png"; name: "Settings"}
            ListElement {icon: "qrc:/assets/about.png"; name: "About"}
            ListElement {icon: "qrc:/assets/logout.png"; name: "Logout"}
        }

        delegate: ItemDelegate {
            text: name
            width: listViewFooter.width
            icon.source: model.icon

            onClicked: {
                switch (name){
                case "Settings":
                    close()
                    stack.push("qrc:/Window/Settings.qml")
                    break
                case "Logout":
                    close()
                    stack.pop(null)
                    stack.push("qrc:/Window/Login.qml")
                    break
                }
            }
        }
    }
}
