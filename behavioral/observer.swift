// https://refactoring.guru/design-patterns/observer
// Below is a basic implementation of the Observer pattern.
// It is slightly simplified to demonstrate the basic idea.

protocol Publisher { 

    associatedtype Subscriber
    var name: String { get }
    var subscribers: Array<Subscriber> { get }
    func notifySubscribers(with message: String)
    func subscribe(_ subscriber: Subscriber)
    func unsubscribe(for id: Int)
}

protocol Subscriber {
 
    associatedtype Publisher
    var id: Int { get }
    func update(_ message: String, from context: Publisher)
}

final class YoutubeSubscriber: Subscriber {

    typealias Publisher = YoutubeChannel
    var id: Int

    init(id: Int) { 
        self.id = id
    }

    func update(_ message: String, from context: Publisher) {
        print("\(message) from \(context.name)")
    }
}

final class YoutubeChannel: Publisher {

    typealias Subscriber = YoutubeSubscriber
    var name: String
    var subscribers: Array<Subscriber> = .init()

    init(name: String) {
        self.name = name
    } 

    func notifySubscribers(with message: String) {
       subscribers.forEach { subscriber in
            subscriber.update(message, from: self)
       } 
    }

    func subscribe(_ subscriber: Subscriber) {
        subscribers.append(subscriber)
    }

    func unsubscribe(for id: Int) {
        subscribers.removeAll { $0.id == id }
    }
}