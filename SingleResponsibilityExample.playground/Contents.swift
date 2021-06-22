import UIKit

//MARK:- Bad Practice

class BadHandler {

    func handle() {
        let data = requestDataToAPI()
        let array = parse(data: data)
        saveToDB(array: array)
    }

    private func requestDataToAPI() -> Data {
        // send API request and wait the response
        return Data()
    }

    private func parse(data: Data) -> [String] {
        // parse the data and create the array
        return []
    }

    private func saveToDB(array: [String]) {
        // save the array in a database (CoreData/Realm/...)
    }
}

//MARK:- Good Practice

class GoodHandler {

    let apiHandler: APIHandler
    let parseHandler: ParseHandler
    let dbHandler: DBHandler

    init(apiHandler: APIHandler, parseHandler: ParseHandler, dbHandler: DBHandler) {
        self.apiHandler = apiHandler
        self.parseHandler = parseHandler
        self.dbHandler = dbHandler
    }

    func handle() {
        let data = apiHandler.requestDataToAPI()
        let array = parseHandler.parse(data: data)
        dbHandler.saveToDB(array: array)
    }
}

class APIHandler {

    func requestDataToAPI() -> Data {
        // send API request and wait the response
        return Data()
    }
}

class ParseHandler {

    func parse(data: Data) -> [String] {
        // parse the data and create the array
        return []
    }
}

class DBHandler {

    func saveToDB(array: [String]) {
        // save the array in a database
    }
}


//MARK:- Explanation

//"BadHandler" geting too much responsibility while every
//procedure are inside itself. As you can see, for the good
//practice, we are dividing these responsibility with division
//of classes. Each divided class has own spesific
//responsibility. These usage makes the code clean.Also, each
//class is more reusable while applying this rules.
