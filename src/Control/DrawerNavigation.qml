import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
//import QtQuick.Layouts 1.15

Drawer {
    width: 0.66 * root.width
    height: root.height

    Item {
        id: headerDrawer
        width: parent.width
        height: parent.height * 25 / 100

        Image {
            id: logo
            source: "qrc:/assets/Logo.png"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            width: parent.width * 90 / 100
            height: parent.height * 50 / 100
            fillMode: Image.PreserveAspectFit
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
        }

        delegate: ItemDelegate {
            text: name
            width: listViewHeader.width
            icon.source: model.icon
            font.pixelSize: fontSizeNormal
            highlighted: {
                if(tabBar.currentIndex == 0 && name === "Home"){
                    return true
                }else if(tabBar.currentIndex == 1 && name === "Profile"){
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
            ListElement {icon: "qrc:/assets/logout.png"; name: "Logout"}
        }

        delegate: ItemDelegate {
            text: name
            width: listViewFooter.width
            icon.source: model.icon
            font.pixelSize: fontSizeNormal

            onClicked: {
                switch (name){
                case "Settings":
                    close()
                    stack.push("qrc:/Window/Settings.qml")
                    break
                case "Logout":
                    dialog.open()
                    break
                }
            }
        }
    }
}
