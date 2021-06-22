import UIKit


//MARK:- Bad Practice

protocol GestureProtocol {
    func didTap()
    func didDoubleTap()
    func didLongPress()
}


class BadSuperButton: GestureProtocol {
    func didTap() {
        // send tap action
    }

    func didDoubleTap() {
        // send double tap action
    }

    func didLongPress() {
        // send long press action
    }
}

//MARK:- Good Practice

protocol TapProtocol {
    func didTap()
}

protocol DoubleTapProtocol {
    func didDoubleTap()
}

protocol LongPressProtocol {
    func didLongPress()
}

class GoodSuperButton: TapProtocol, DoubleTapProtocol, LongPressProtocol {
    func didTap() {
        // send tap action
    }

    func didDoubleTap() {
        // send double tap action
    }

    func didLongPress() {
        // send long press action
    }
}

class PoorButton: TapProtocol {
    func didTap() {
        // send tap action
    }
}


//MARK:- Explanation

//The Interface Segregation Principle is introduces one of the problems of
//object-oriented programming: the fat interface.
//
//An interface is called “fat” when has too many members/methods, which are not
//cohesive and contains more information than we really want. This problem can
//affect both classes and protocols.

