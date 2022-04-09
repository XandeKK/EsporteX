import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15

Page {
    header: ToolBar {
        RowLayout {
            anchors.fill: parent

            ToolButton {
                id: toolButtonBack
                icon.source: "qrc:/assets/backArrow.png"
                onClicked: stack.pop()
            }

            Label {
                text: "Create Game"
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
                font.bold: true
                font.pointSize: 12
            }

            ToolButton {
            }
        }
    }

    Item {
        id: itemHeader
        height: parent.height * 5 / 100
    }

    Flickable {
        anchors.top: itemHeader.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        contentHeight: columnRoot.height + button.height + 10

        Column {
            id: columnRoot
            width: parent.width * 90 / 100
            anchors.horizontalCenter: parent.horizontalCenter
//            anchors.fill: parent
//            anchors.leftMargin: parent.width * 5 / 100
//            anchors.rightMargin: parent.width * 5 / 100
//            anchors.topMargin: parent.height * 5 / 100
            spacing: 20

            Row {
                width: parent.width
                spacing: parent.width * 3 / 100
                Label {
                    width: parent.width * 10 / 100
                    height: parent.height
                    text: "Sport:"
                    verticalAlignment: "AlignVCenter"
                }

                ComboBox {
                    width: parent.width * 87 / 100
                    model: [ "VolleyBall", "Soccer", "BasketBall", "Tennis"]
                }

            }

            Row {
                width: parent.width
                spacing: parent.width * 3 / 100
                Label {
                    width: parent.width * 10 / 100
                    height: parent.height
                    text: "State:"
                    verticalAlignment: "AlignVCenter"
                }

                TextField {
                    width: parent.width * 87 / 100
                    placeholderText: "State"
                }

            }

            Row {
                width: parent.width
                spacing: parent.width * 3 / 100
                Label {
                    width: parent.width * 10 / 100
                    height: parent.height
                    text: "City:"
                    verticalAlignment: "AlignVCenter"
                }

                TextField {
                    width: parent.width * 87 / 100
                    placeholderText: "City"
                }

            }

            Row {
                width: parent.width
                spacing: parent.width * 3 / 100
                Label {
                    width: parent.width * 10 / 100
                    height: parent.height
                    text: "Address:"
                    verticalAlignment: "AlignVCenter"
                }

                TextField {
                    width: parent.width * 87 / 100
                    placeholderText: "Address"
                }

            }

            Row {
                width: parent.width
                spacing: parent.width * 3 / 100
                Label {
                    width: parent.width * 10 / 100
                    height: parent.height
                    text: "Start:"
                    verticalAlignment: "AlignVCenter"
                }

                TextField {
                    id: teste
                    width: parent.width * 45 / 100
                    placeholderText: "Start Game Ex.: 10:00"
                }

            }

            Row {
                width: parent.width
                spacing: parent.width * 3 / 100
                Label {
                    width: parent.width * 10 / 100
                    height: parent.height
                    text: "End:"
                    verticalAlignment: "AlignVCenter"
                }

                TextField {
                    width: parent.width * 45 / 100
                    placeholderText: "End Game Ex.: 13:00"
                }

            }

            Row {
                width: parent.width
                spacing: parent.width * 3 / 100
                Label {
                    width: parent.width * 10 / 100
                    height: parent.height
                    text: "Date:"
                    verticalAlignment: "AlignVCenter"
                }

                TextField {
                    width: parent.width * 45 / 100
                    placeholderText: "Date Ex.: 10/10/2010"
                }
            }
            Column {
                width: parent.width
                spacing: 5

                Label {
                    width: parent.width
                    text: "Description:"
                    verticalAlignment: "AlignVCenter"
                }

                TextArea {
                    width: parent.width
                    clip: true
                    wrapMode: "WordWrap"
                    placeholderText: "Put here description of game"
                }
            }
        }
    }

    RoundButton {
        id: button
        anchors.right: parent.right
        anchors.rightMargin: parent.width * 2.5 / 100
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.width * 2.5 / 100
        width: parent.width * 15 / 100

        text: "Ok"
        Material.elevation: 1
        highlighted: true
        font.bold: true

    }
}
