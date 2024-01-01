// https://refactoring.guru/design-patterns/iterator
// Below is a basic implementation of the Iterator pattern.
// It is slightly simplified to demonstrate the basic idea.

protocol Iterator { 

    associatedtype Collection
    associatedtype CollectionItem

    var collection: Collection { get }
    var index: Int { get }

    func getNext() -> CollectionItem?
}

protocol IterableCollection { 

    associatedtype Iterator
    associatedtype CollectionItem

    var items: Array<CollectionItem> { get }
    func createIterator() -> Iterator
}

final class FacebookIterator: Iterator { 

    typealias Collection = FacebookCollection
    typealias CollectionItem = FacebookCollection.CollectionItem

    var collection: Collection
    var index: Int = 0

    init(collection: Collection) { 
        self.collection = collection
    }

    func getNext() -> CollectionItem? {
        defer { index += 1 }
        return index < collection.items.count ? collection.items[index] : nil
    }
}

final class Profile { 

    let name: String
    let age: Int

    init(name: String, age: Int) { 
        self.name = name 
        self.age = age
    }
}

final class FacebookCollection: IterableCollection { 

    typealias Iterator = FacebookIterator
    typealias Profiles = Array<Profile>
    
    var items: Profiles = .init()

    func append(_ profiles: Profile...) { 
        items.append(contentsOf: profiles)
    }

    func createIterator() -> Iterator {
        .init(collection: self)
    }
}


let firstProfile: Profile = .init(name: "Alex", age: 25)
let secondProfile: Profile = .init(name: "Vikki", age: 21)

let facebookProfilesCollection: FacebookCollection = .init()
facebookProfilesCollection.append(firstProfile, secondProfile)

let facebookIterator: FacebookIterator = facebookProfilesCollection.createIterator()

print(facebookIterator.getNext()?.name) // Alex 
print(facebookIterator.getNext()?.name) // Vikki
