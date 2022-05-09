function getStates(){
    PropertyVar.statesArray = []
    let dataJson = _database.getStates()

    dataJson = JSON.parse(dataJson)

    let arrayStates = []

    for(let i=0; i<dataJson.length; i++){
        PropertyVar.statesArray.push(dataJson[i]["id"])
        arrayStates.push(dataJson[i]["state"])
    }

    return arrayStates
}


function getCities(state_id){
    PropertyVar.citiesArray = []
    let dataJson = _database.getCities(state_id)

    dataJson = JSON.parse(dataJson)

    let arrayCities = []

    for(let i=0; i<dataJson.length; i++){
        console.log(i + ": " + dataJson[i]["id"] + " - " + dataJson[i]["city"])
        PropertyVar.citiesArray.push(dataJson[i]["id"])
        arrayCities.push(dataJson[i]["city"])
    }

    return arrayCities
}


function isValidEmail(email){
    if(/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/.test(email)){
        return true
    }else{
        return false
    }
}
