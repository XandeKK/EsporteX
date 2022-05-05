function getListOfPeople() {
    listModelPeople.clear()
    let dataJson = _database.getListParticipant(infoGame["id"])

    dataJson = JSON.parse(dataJson)

    for(let i=0; i<dataJson.length; i++){
        listModelPeople.append({
                                      "name": dataJson[i]["name"],
                                      "user_id": dataJson[i]["user_id"]
                                  })
    }
}
