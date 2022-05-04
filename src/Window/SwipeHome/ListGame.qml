import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import "js/ListGame.js" as JS
import "../../"

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
            id: listModelSports
            Component.onCompleted: JS.getSports()
        }

        delegate: ItemDelegate {
            width: parent.width * 30 / 100
            height: width

            ItemDelegate {
                anchors.fill: parent
                z: 1

                onClicked: {
                    PropertyVar.sport_id = sport_id
                    PropertyVar.nameSport = sport
                    stack.push("qrc:/Window/SwipeGames.qml")
                }
            }
            Pane {
                anchors.fill: parent
                Material.elevation: 3

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
        width: 70
        height: 70
        anchors.bottom: parent.bottom
        anchors.bottomMargin: anchors.rightMargin
        anchors.right: parent.right
        anchors.rightMargin: parent.width * 2.5 / 100

        highlighted: true

        icon.source: "qrc:/assets/add.png"
        icon.color: "black"
        Material.elevation: 1

        onClicked: stack.push("qrc:/Window/CreateGame.qml")
    }
}
