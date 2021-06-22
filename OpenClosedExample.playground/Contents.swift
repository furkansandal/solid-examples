import UIKit

//MARK:- Bad Practice

class BadLogger {

    func printData() {
        let cars = [
            BadCar(name: "Batmobile", color: "Black"),
            BadCar(name: "SuperCar", color: "Gold"),
            BadCar(name: "FamilyCar", color: "Grey")
        ]

        cars.forEach { car in
            print(car.printDetails())
        }

        let bicycles = [
            BadBicycle(type: "BMX"),
            BadBicycle(type: "Tandem")
        ]

        bicycles.forEach { bicycles in
            print(bicycles.printDetails())
        }
    }
}

class BadCar {
    let name: String
    let color: String

    init(name: String, color: String) {
        self.name = name
        self.color = color
    }

    func printDetails() -> String {
        return "I'm \(name) and my color is \(color)"
    }
}

class BadBicycle {
    let type: String

    init(type: String) {
        self.type = type
    }

    func printDetails() -> String {
        return "I'm a \(type)"
    }
}


//MARK:- Good Practice


protocol Printable {
    func printDetails() -> String
}

class GoodLogger {

    func printData() {
        let cars: [Printable] = [
            GoodCar(name: "Batmobile", color: "Black"),
            GoodCar(name: "SuperCar", color: "Gold"),
            GoodCar(name: "FamilyCar", color: "Grey"),
            GoodBicycle(type: "BMX"),
            GoodBicycle(type: "Tandem")
        ]

        cars.forEach { car in
            print(car.printDetails())
        }
    }
}

class GoodCar: Printable {
    let name: String
    let color: String

    init(name: String, color: String) {
        self.name = name
        self.color = color
    }

    func printDetails() -> String {
        return "I'm \(name) and my color is \(color)"
    }
}

class GoodBicycle: Printable {
    let type: String

    init(type: String) {
        self.type = type
    }

    func printDetails() -> String {
        return "I'm a \(type)"
    }
}


//MARK:- Explanation


//As you can see in bad practice, every editing is increasing
//the code blocks. If i want to add one more type like
//"Truck", this means, 50 line of code more code will be added
//inside same class. For the good one, if we extend our class
//with a protocol, actually we can merge our classes in one
//type and while we are editing one of them, the other will not
//affect from this editing procedure. Also, we can use these
//class like same types.
