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


function isValidEmail(email){
    if(/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/.test(email)){
        return true
    }else{
        return false
    }
}
