function getGames(sport_id) {
    let dataJson = _database.getGames(sport_id)

    dataJson = JSON.parse(dataJson)

    for(let i=0; i<dataJson.length; i++){
        listModelGames.append({
                                  "game_id": dataJson[i]["id"],
                                  "sport_id": dataJson[i]["sport_id"],
                                  "name": dataJson[i]["name"],
                                  "address": dataJson[i]["address"],
                                  "date": dataJson[i]["date"],
                                  "start": dataJson[i]["start"],
                                  "end": dataJson[i]["end"]
                              })
    }
}

function getGamesUser() {
    let dataJson = _database.getGamesUser()

    dataJson = JSON.parse(dataJson)

    for(let i=0; i<dataJson.length; i++){
        listModelGamesUser.append({
                                      "game_id": dataJson[i]["id"],
                                      "sport_id": dataJson[i]["sport_id"],
                                      "name": dataJson[i]["name"],
                                      "address": dataJson[i]["address"],
                                      "date": dataJson[i]["date"],
                                      "start": dataJson[i]["start"],
                                      "end": dataJson[i]["end"]
                                  })
    }
}

function getGameGuest(sport_id) {
    let dataJson = _database.getGamesGuest(sport_id)

    dataJson = JSON.parse(dataJson)

    for(let i=0; i<dataJson.length; i++){
        listModelGames.append({
                                      "game_id": dataJson[i]["id"],
                                      "sport_id": dataJson[i]["sport_id"],
                                      "name": dataJson[i]["name"],
                                      "address": dataJson[i]["address"],
                                      "date": dataJson[i]["date"],
                                      "start": dataJson[i]["start"],
                                      "end": dataJson[i]["end"]
                                  })
    }
}
