import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

Page {
    GridView {
        id: grid
        anchors.fill: parent
        anchors.leftMargin: parent.width * 4.5 / 100
        cellWidth: parent.width * 31 / 100
        cellHeight: cellWidth

        header: Item {
            height: grid.height * 10 / 100
        }

        footer: Item {
            height: grid.height * 10 / 100
        }

        model: ListModel {
            ListElement {image: "http://10.0.0.22/assets/volleyball.png"; sport: "Volleyball"}
            ListElement {image: "http://10.0.0.22/assets/soccer.png"; sport: "Soccer"}
            ListElement {image: "http://10.0.0.22/assets/volleyball.png"; sport: "Volleyball"}
            ListElement {image: "http://10.0.0.22/assets/soccer.png"; sport: "Soccer"}
            ListElement {image: "http://10.0.0.22/assets/volleyball.png"; sport: "Volleyball"}
            ListElement {image: "http://10.0.0.22/assets/soccer.png"; sport: "Soccer"}

        }

        delegate: ItemDelegate {
            width: parent.width * 30 / 100
            height: width
            ItemDelegate {
                z: 1
                anchors.fill: parent
                onClicked: stack.push("qrc:/Window/SwipeSport.qml")
            }
            Pane {
                anchors.fill: parent
                Material.elevation: 3

                Image {
                    id: sportImage
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: parent.height * 15 / 100
                    height: parent.height * 50 / 100
                    width: height
                    source: image
                    mipmap: true
                }

                Label {
                    id: labelSport
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: sportImage.bottom
                    anchors.topMargin: parent.height * 10 / 100
                    text: sport
                    font.bold: true
                    font.pixelSize: fontSizeNormal
                }
            }
        }
    }

    RoundButton {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: anchors.rightMargin
        anchors.right: parent.right
        anchors.rightMargin: parent.width * 2.5 / 100
        width: 70
        height: 70

        highlighted: true

        icon.source: "qrc:/assets/add.png"
        icon.color: "black"
        Material.elevation: 1

        onClicked: stack.push("qrc:/Window/CreateGame.qml")
    }
}
