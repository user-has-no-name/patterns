protocol Burger { 

    var buns: String { get }
    var patty: String { get }
    var cheese: String { get }
}

protocol Factory { 

    func makeBurger(of type: BurgerType) -> Burger
}

enum BurgerType { 
    case cheeseburger
    case mcRoyal
    case bigMac
}

final class BigMac: Burger {

    var buns: String = "Sesame Seed Bun"
    var patty: String = "Beef Patty"
    var cheese: String = "American Cheese"
}

final class Cheeseburger: Burger {

    var buns: String = "Regular Bun"
    var patty: String = "Beef Patty"
    var cheese: String = "Cheddar Cheese"
}

final class MCRoyal: Burger {

    var buns: String = "Special Bun"
    var patty: String = "Chicken Patty"
    var cheese: String = "Swiss Cheese"
}

final class BurgerFactory: Factory {
    
    func makeBurger(of type: BurgerType) -> Burger {
        switch type { 
            case .cheeseburger: 
                return Cheeseburger()
            case .bigMac: 
                return BigMac()
            case .mcRoyal: 
                return MCRoyal()
        }    
    }
}