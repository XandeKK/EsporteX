import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15

Page {
    id: notification
    header: ToolBar {
        RowLayout {
            anchors.fill: parent

            ToolButton {
                id: toolButtonBack
                icon.source: "qrc:/assets/backArrow.png"
                onClicked: stack.pop()
            }

            Label {
                text: "Notification"
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
                font.bold: true
                font.pointSize: 12
            }

            ToolButton {
                id: toolButtonKebabMenu
                icon.source: "qrc:/assets/threeDotsBlack.png"
            }
        }
    }

    ListView {
        id: listViewNotification
        anchors.fill: parent
        spacing: 20

        model: 10

        header: Item {
            height: 30
        }

        delegate: Pane {
            Material.elevation: 6
            width: listViewNotification.width * 90 / 100
            height: listViewNotification.height * 15 / 100
            anchors.horizontalCenter: parent.horizontalCenter
            Item {
                anchors.fill: parent

                Image {
                    id: imagePerson
                    source: "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
                    anchors.verticalCenter: parent.verticalCenter
                    fillMode: Image.PreserveAspectCrop
                    width: parent.height
                    height: width
                }

                Label {
                    id: namePerson
                    anchors.left: imagePerson.right
                    anchors.leftMargin: parent.width * 5 / 100
                    width: parent.width * 55 / 100
                    clip: true
                    text: "Alexandre"
                }

                Label {
                    id: textNotification
                    text: qsTr("Opa RAPAZIAD, vai ter jogo de volei no forrodromo na quinta feira Opa RAPAZIAD, vai ter jogo de volei no forrodromo na quinta feira Opa RAPAZIAD, vai ter jogo de volei no forrodromo na quinta feiraOpa RAPAZIAD, vai ter jogo de volei no forrodromo na quinta feira")
                    anchors.left: imagePerson.right
                    anchors.leftMargin: parent.width * 5 / 100
                    anchors.top: namePerson.bottom
                    anchors.topMargin: parent.height * 10 / 100
                    anchors.right: kebabMenu.left
                    anchors.rightMargin: parent.width * 5 / 100
                    width: parent.width * 60 / 100
                    height: parent.height - namePerson.height
                    clip: true
                    wrapMode: Text.WordWrap
                }

                Label {
                    id: dateNotification
                    anchors.right: kebabMenu.left
                    text: "10 mar"
                }

                RoundButton {
                    id: kebabMenu
                    anchors.right: parent.right
                    icon.source: "qrc:/assets/threeDotsBlack.png"
                    anchors.verticalCenter: parent.verticalCenter
                    Material.elevation: 0
                }
            }
        }
    }
}
