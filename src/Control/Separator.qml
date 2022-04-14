import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

Rectangle {
    anchors.bottom: parent.bottom
    width: parent.width
    height: 1
    color: Material.theme === Material.Dark ? "#33ffffff" : "#33000000"
}
