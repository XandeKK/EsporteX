import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15

Page {
    ListView {
        id: listViewFollowers
        anchors.fill: parent
        anchors.leftMargin: parent.width * 5 / 100
        anchors.rightMargin: parent.width * 5 / 100
        model: 20
        clip: true
        spacing: 10

        delegate: ItemDelegate {
            id: delegateFollowers
            width: listViewFollowers.width
            height: 60 * dip

            Rectangle {
                anchors.bottom: parent.top
                width: parent.width
                height: 1
                color: Material.theme === Material.Dark ? "#33ffffff" : "#33000000"
            }

            Rectangle {
                anchors.bottom: parent.bottom
                width: parent.width
                height: 1
                color: Material.theme === Material.Dark ? "#33ffffff" : "#33000000"
            }

            RowLayout {
                id: rowLayoutFollowers
                width: parent.width
                height: parent.height
                Image {
                    source: "http://10.0.0.22/assets/profile.jpg"
                    Layout.preferredWidth: parent.height * 75 / 100
                    Layout.preferredHeight: parent.height * 75 / 100
                    fillMode: Image.PreserveAspectCrop
                    mipmap: true
                    Layout.alignment: Qt.AlignHCenter
                }

                Label {
                    text: "Zeca Urubu"
                    font.bold: true
                    font.pixelSize: fontSizeNormal
                }

                Item {
                    Layout.fillWidth: true
                }

                Button {
                    text: "Follow"
                    flat: true
                    font.capitalization: "MixedCase"
                }
            }
        }
    }
}
