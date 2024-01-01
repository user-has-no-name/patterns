// https://refactoring.guru/design-patterns/builder
// Below is a basic implementation of the Builder pattern.
// It is slightly simplified to demonstrate the basic idea.

final class Burger { 

    var buns: String?
    var patty: String?
    var cheese: String?
}

protocol BurgerBuildable {
    
    var burger: Burger { get }
    func addBuns(_ buns: String)
    func addPatty(_ patty: String)
    func addCheese(_ cheese: String) 

    func build() -> Burger
}

final class BurgerBuilder: BurgerBuildable {
    
    var burger: Burger = .init()

    func addBuns(_ buns: String) {
        burger.buns = buns
    }

    func addPatty(_ patty: String) {
        burger.patty = patty        
    }

    func addCheese(_ cheese: String) {
        burger.cheese = cheese        
    }

    func build() -> Burger {
        burger
    }    
}