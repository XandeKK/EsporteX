import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    width: 480
    height: 640
    visible: true
    title: qsTr("EsporteX")
    id: root

    StackView {
        id: stack
        anchors.fill: parent
        initialItem: "qrc:/Window/PreferredSport.qml"
    }
}
