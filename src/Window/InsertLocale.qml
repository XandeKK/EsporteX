import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15

Page {
    Label {
        id: labelLocale
        width: parent.width
        height: parent.height * 10 / 100
        anchors.left: parent.left
        verticalAlignment: "AlignVCenter"
        horizontalAlignment: "AlignHCenter"

        z: 1

        font.pixelSize: fontSizeLarge
        text: "Insert your Locale"
    }

    Flickable {
        id: flickable
        anchors.top: labelLocale.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        contentHeight: (columnRoot.height + button.height) + (columnRoot.height * 50 / 100)

        interactive: false
        clip: true

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
                    verticalAlignment: "AlignVCenter"

                    font.pixelSize: fontSizeNormal
                    text: "State:"
                }

                ComboBox {
                    width: parent.width * 82 / 100
                    editable: true

                    font.pixelSize: fontSizeNormal
                    model: [ "Sergipe", "São Paulo", "Bahia", "Alagoas"]
                }
            }

            Row {
                width: parent.width
                spacing: parent.width * 3 / 100

                Label {
                    width: parent.width * 15 / 100
                    height: parent.height
                    verticalAlignment: "AlignVCenter"

                    font.pixelSize: fontSizeNormal
                    text: "City:"
                }

                ComboBox {
                    width: parent.width * 82 / 100
                    editable: true

                    font.pixelSize: fontSizeNormal
                    model: [ "VolleyBall", "Soccer", "BasketBall", "Tennis"]
                }
            }
        }
    }

    RoundButton {
        id: button
        width: parent.width * 20 / 100
        anchors.right: parent.right
        anchors.rightMargin: parent.width * 2.5 / 100
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.width * 2.5 / 100

        Material.foreground: "black"
        Material.elevation: 1
        highlighted: true

        font.bold: true
        font.pixelSize: fontSizeNormal
        text: "Ok"

        onClicked: stack.replace("qrc:/Window/Home.qml")
    }
}
