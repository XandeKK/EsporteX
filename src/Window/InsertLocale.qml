import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15

Page {
    Label {
        id: labelLocale
        text: "Insert your Locale"
        font.pointSize: 12
        height: parent.height * 10 / 100
        width: parent.width
        verticalAlignment: "AlignVCenter"
        horizontalAlignment: "AlignHCenter"
        anchors.left: parent.left
        z: 1
        font.pixelSize: fontSizeLarge
    }

    Flickable {
        id: flickable
        anchors.top: labelLocale.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        contentHeight: (columnRoot.height + button.height) + (columnRoot.height * 50 / 100)
        clip: true
        interactive: false

        Column {
            id: columnRoot
            width: parent.width * 90 / 100
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 20

            Row {
                width: parent.width
                spacing: parent.width * 3 / 100
                Label {
                    width: parent.width * 15 / 100
                    height: parent.height
                    text: "State:"
                    verticalAlignment: "AlignVCenter"
                    font.pixelSize: fontSizeNormal
                }

                ComboBox {
                    width: parent.width * 82 / 100
                    model: [ "Sergipe", "São Paulo", "Bahia", "Alagoas"]
                    font.pixelSize: fontSizeNormal
                    editable: true
                }

            }

            Row {
                width: parent.width
                spacing: parent.width * 3 / 100
                Label {
                    width: parent.width * 15 / 100
                    height: parent.height
                    text: "City:"
                    verticalAlignment: "AlignVCenter"
                    font.pixelSize: fontSizeNormal
                }

                ComboBox {
                    width: parent.width * 82 / 100
                    model: [ "VolleyBall", "Soccer", "BasketBall", "Tennis"]
                    font.pixelSize: fontSizeNormal
                    editable: true
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
        width: parent.width * 20 / 100

        text: "Ok"
        Material.foreground: "black"
        Material.elevation: 1
        highlighted: true
        font.bold: true
        font.pixelSize: fontSizeNormal
        onClicked: stack.replace("qrc:/Window/Home.qml")
    }
}
