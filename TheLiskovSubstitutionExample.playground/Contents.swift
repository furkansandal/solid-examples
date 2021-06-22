import UIKit

//MARK:- Bad Practice

class BadRectangle {

    var width: Float = 0
    var length: Float = 0

    var area: Float {
        return width * length
    }
}

class BadSquare: BadRectangle {

    override var width: Float {
        didSet {
            self.length = width
        }
    }
}


func printArea(of rectangle: BadRectangle) {
    rectangle.length = 5
    rectangle.width = 2
    print(rectangle.area)
}


let badRectangle = BadRectangle()
printArea(of: badRectangle) // 10

// -------------------------------

let badSquare = BadSquare()
printArea(of: badSquare) // 4


//MARK:- Good Practice

protocol Polygon {
    var area: Float { get }
}

class GoodRectangle: Polygon {

    private let width: Float
    private let length: Float

    init(width: Float, length: Float) {
        self.width = width
        self.length = length
    }

    var area: Float {
        return width * length
    }
}

class GoodSquare: Polygon {

    private let side: Float

    init(side: Float) {
        self.side = side
    }

    var area: Float {
        return pow(side, 2)
    }
}

func printArea(of polygon: Polygon) {
    print(polygon.area)
}

let rectangle = GoodRectangle(width: 2, length: 5)
printArea(of: rectangle)

let square = GoodSquare(side: 2)
printArea(of: square)


//MARK:- Explanation


//The Liskov Substitution Principle in practical software development
//The principle defines that objects of a superclass shall be replaceable
//with objects of its subclasses without breaking the application.
//That requires the objects of your subclasses to behave in the same way as
//the objects of your superclass.
//
//An overridden method of a subclass needs to accept the same input parameter values as
//the method of the superclass. That means you can implement less restrictive validation
//rules, but you are not allowed to enforce stricter ones in your subclass. Otherwise, any
//code that calls this method on an object of the superclass might cause an exception, if
//it gets called with an object of the subclass.
