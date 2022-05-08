import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "../../"
import "./js/Sport.js" as Sport

Page {
    ListView {
        id: listViewSportCreateByYou
        anchors.fill: parent
        spacing: 10

        model: ListModel {
            id: listModelGamesUser
            Component.onCompleted: {
                if(!PropertyVar.isGuest){
                    Sport.getGamesUser()
                }
            }
        }

        header: Item {
            height: 30
        }

        footer: Item {
            height: 30 + button.height
        }

        delegate: Pane {
            width: listViewSportCreateByYou.width * 90 / 100
            anchors.horizontalCenter: parent.horizontalCenter
            Material.elevation: 6

            ItemDelegate {
                anchors.fill: parent
                onClicked: {
                    PropertyVar.game_id = game_id
                    stack.push("qrc:/Window/InfoGame.qml")
                }

                Column {
                    id: columnLeft
                    width: parent.width * 60 / 100
                    height: parent.height
                    anchors.left: parent.left
                    spacing: 10

                    Row {
                        width: parent.width
                        height: parent.height * 26 / 100
                        spacing: 5

                        Image {
                            id: imageProfile
                            width: height
                            height: parent.height

                            antialiasing: true
                            mipmap: true
                            source: Material.theme == Material.Dark ? "qrc:/assets/profileDark.png" : "qrc:/assets/profile.png"
                        }
                        Label {
                            id: nameProfile
                            width: parent.width - imageProfile.width
                            height: parent.height
                            verticalAlignment: Text.AlignVCenter

                            font.pixelSize: fontSizeNormal
                            text: name
                        }
                    }

                    Row {
                        width: parent.width
                        height: parent.height * 26 / 100
                        spacing: 5

                        Image {
                            id: imageMap
                            width: height
                            height: parent.height

                            antialiasing: true
                            mipmap: true
                            source: Material.theme == Material.Dark ? "qrc:/assets/markDark.png" : "qrc:/assets/mark.png"
                        }

                        Label {
                            id: nameMap
                            width: parent.width - imageProfile.width
                            height: parent.height
                            verticalAlignment: Text.AlignVCenter

                            clip: true
                            elide: Text.ElideRight
                            font.pixelSize: fontSizeNormal
                            text: qsTr(address)
                        }
                    }
                }
                Column {
                    anchors.left: columnLeft.right
                    anchors.leftMargin: parent.width * 2.5 / 100
                    anchors.right: parent.right
                    height: parent.height
                    spacing: 10

                    Row {
                        width: parent.width
                        height: parent.height * 26 / 100
                        spacing: 5

                        Image {
                            id: imageCalendar
                            width: height
                            height: parent.height

                            antialiasing: true
                            mipmap: true
                            source: Material.theme == Material.Dark ? "qrc:/assets/calendarDark.png" : "qrc:/assets/calendar.png"
                        }

                        Label {
                            id: nameCalendar
                            width: parent.width - imageProfile.width
                            height: parent.height
                            verticalAlignment: Text.AlignVCenter

                            clip: true
                            font.pixelSize: fontSizeNormal
                            text: {
                                let date_tmp = date.split("-")
                                return date_tmp[2] + "/" + date_tmp[1] + "/" + date_tmp[0]
                            }
                        }
                    }

                    Row {
                        width: parent.width
                        height: parent.height * 26 / 100
                        spacing: 5

                        Image {
                            id: imageTime
                            width: height
                            height: parent.height

                            antialiasing: true
                            mipmap: true
                            source: Material.theme == Material.Dark ? "qrc:/assets/timeDark.png" : "qrc:/assets/time.svg"
                        }

                        Label {
                            id: nameTime
                            width: parent.width - imageProfile.width
                            height: parent.height
                            verticalAlignment: Text.AlignVCenter

                            clip: true
                            font.pixelSize: fontSizeNormal
                            text: qsTr(start.substr(11, 5) + " - " + end.substr(11, 5))
                        }
                    }
                }
            }
        }
    }
}
