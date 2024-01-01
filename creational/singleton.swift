// https://refactoring.guru/design-patterns/singleton
// Below is a basic implementation of the Singleton pattern.
// It is slightly simplified to demonstrate the basic idea.

enum State { 
    case loggedIn
    case loggedOut
}

final class AppState {

    private var state: State = .loggedOut

    static let shared: AppState = .init()

    private init() {}

    func setState(_ state: State) { 
        self.state = state 
    }

    func getState() -> State { 
       state 
    }
}
