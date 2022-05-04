function isValidTime(timeString)
{
    if(/^([0-1]?[0-9]|2[0-4]):([0-5][0-9])(:[0-5][0-9])?$/.test(timeString)){
        return true
    }else{
        return false
    }
}

function isValidDate(dateString) {
    if(!/^\d{1,2}\/\d{1,2}\/\d{4}$/.test(dateString)){
        return false;
    }

    var parts = dateString.split("/");
    var day = parseInt(parts[0], 10);
    var month = parseInt(parts[1], 10);
    var year = parseInt(parts[2], 10);

    if(year < 1000 || year > 3000 || month === 0 || month > 12){
        return false;
    }

    var monthLength = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];

    if(year % 400 == 0 || (year % 100 != 0 && year % 4 == 0)){
        monthLength[1] = 29;
    }

    if(day > 0 && day <= monthLength[month - 1]){
        return true;
    }else{
        return false;
    }

}

function getSports(){
    let dataJson = _database.getSports()

    dataJson = JSON.parse(dataJson)

    let arrayCSports = []

    for(let i=0; i<dataJson.length; i++){
        arrayCSports.push(dataJson[i]["sport"])
    }

    return arrayCSports
}

