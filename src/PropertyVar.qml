pragma Singleton
import QtQuick 2.15
QtObject {
    property int sport_id
    property string nameSport
    property int game_id
    property int people_id
    property bool changeUser: false
    property bool isGuest: false
    property var statesArray: []
    property var citiesArray: []
    property var sportsArray: []
}
