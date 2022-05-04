function getSports() {
    let dataJson = _database.getSports()

    dataJson = JSON.parse(dataJson)

    for(let i=0; i<dataJson.length; i++){
        listModelSports.append({
                                   "sport_id": dataJson[i]["id"],
                                   "sport": dataJson[i]["sport"],
                                   "image": dataJson[i]["image"]}
                               )
    }
}
