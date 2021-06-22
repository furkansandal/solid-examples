import Cocoa

//MARK: - Bad Practice

class BadHandler {

    let fm = BadFilesystemManager()

    func handle(string: String) {
        fm.save(string: string)
    }
}

class BadFilesystemManager {

    func save(string: String) {
        
    }
}

//MARK: - Good Practice

class GoodHandler {

    let storage: GoodStorage

    init(storage: GoodStorage) {
        self.storage = storage
    }

    func handle(string: String) {
        storage.save(string: string)
    }
}

protocol GoodStorage {

   func save(string: String)
}

class GoodFilesystemManager: GoodStorage {

    func save(string: String) {
        // Open a file in read-mode
        // Save the string in this file
        // Close the file
    }
}

class GoodDatabaseManager: GoodStorage {

    func save(string: String) {
        // Connect to the database
        // Execute the query to save the string in a table
        // Close the connection
    }
}

//MARK: - Explanation

//This principle is the right one to follow if you believe in reusable components.
//Dependency Inversion Principle is very similar to Open-Closed Principle:
//the approach to use, to have a clean architecture, is decoupling the dependencies.
//You can achieve it thanks to abstract layers.
