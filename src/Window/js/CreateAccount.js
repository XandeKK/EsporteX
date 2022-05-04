function getStates(){
    let dataJson = _database.getStates()

    dataJson = JSON.parse(dataJson)

    let arrayStates = []

    for(let i=0; i<dataJson.length; i++){
        arrayStates.push(dataJson[i]["state"])
    }

    return arrayStates
}


function getCities(state_id){
    let dataJson = _database.getCities(state_id)

    dataJson = JSON.parse(dataJson)

    let arrayCities = []

    for(let i=0; i<dataJson.length; i++){
        arrayCities.push(dataJson[i]["city"])
    }

    return arrayCities
}
