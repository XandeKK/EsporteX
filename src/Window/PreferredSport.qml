import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import "../Control/"

Page {
    Label {
        id: labelPreferredSport
        height: parent.height * 10 / 100
        width: parent.width
        verticalAlignment: "AlignVCenter"
        horizontalAlignment: "AlignHCenter"
        anchors.left: parent.left
        z: 1

        font.pixelSize: fontSizeLarge
        text: "Choose your preferred sport(s):"

        background: Rectangle {
            anchors.fill: parent
            color: "white"
        }
    }

    Separator {
        anchors.bottom: labelPreferredSport.bottom
        z: 1
    }

    GridView {
        id: grid
        anchors.top: labelPreferredSport.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: parent.width * 4.5 / 100

        cellWidth: parent.width * 31 / 100
        cellHeight: cellWidth

        header: Item {
            height: grid.height * 5 / 100
        }

        footer: Item {
            height: grid.height * 10 / 100
        }

        model: ListModel {
            ListElement {image: "https://cdn.pixabay.com/photo/2022/03/18/18/22/volleyball-7077149_1280.png"; sport: "Volleyball"}
            ListElement {image: "https://cdn.pixabay.com/photo/2013/07/13/10/51/football-157930_1280.png"; sport: "Soccer"}
            ListElement {image: "https://cdn.pixabay.com/photo/2022/03/18/18/22/volleyball-7077149_1280.png"; sport: "Volleyball"}
            ListElement {image: "https://cdn.pixabay.com/photo/2013/07/13/10/51/football-157930_1280.png"; sport: "Soccer"}
            ListElement {image: "https://cdn.pixabay.com/photo/2022/03/18/18/22/volleyball-7077149_1280.png"; sport: "Volleyball"}
            ListElement {image: "https://cdn.pixabay.com/photo/2013/07/13/10/51/football-157930_1280.png"; sport: "Soccer"}
        }

        delegate: ItemDelegate {
            property bool isSelected: false

            width: parent.width * 30 / 100
            height: width
            MouseArea {
                id: mouseAreaPane
                anchors.fill: parent
                z: 1

                onClicked: {
                    isSelected = !isSelected
                }
            }
            Pane {
                id: pane
                anchors.fill: parent
                Material.elevation: 3

                Material.background: isSelected ? Material.Grey : Material.White

                Image {
                    id: sportImage
                    width: height
                    height: parent.height * 50 / 100
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: parent.height * 15 / 100

                    source: image
                    mipmap: true
                }

                Label {
                    id: labelSport
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: sportImage.bottom
                    anchors.topMargin: parent.height * 10 / 100

                    font.bold: true
                    font.pixelSize: fontSizeNormal
                    text: sport
                }
            }
        }
    }

    RoundButton {
        width: parent.width * 25 / 100
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height * 2.5 / 100
        anchors.right: parent.right
        anchors.rightMargin: parent.height * 2.5 / 100
        highlighted: true

        Material.foreground: "black"
        font.pixelSize: fontSizeNormal
        text: "Agree"

        onClicked: stack.replace("qrc:/Window/Home.qml")
    }
}
