import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15

Page {
    header: ToolBar {
        RowLayout {
            anchors.fill: parent

            ToolButton {
                id: toolButtonDrawer
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

    TabBar {
        id: tabBarNotification
        width: parent.width
        spacing: 0
        TabButton {
            text: qsTr("ALL")
            font.bold: true
        }

        TabButton {
            icon.source: "qrc:/assets/profile.png"
        }

        TabButton {
            icon.source: "qrc:/assets/letter.png"
        }
    }
}
