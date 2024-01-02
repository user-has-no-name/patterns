// https://refactoring.guru/design-patterns/strategy
// Below is a basic implementation of the Strategy pattern.
// It is slightly simplified to demonstrate the basic idea.

protocol Strategy { 

    func execute(a: Int, b: Int) -> Int
}

final class AddStrategy: Strategy { 

    func execute(a: Int, b: Int) -> Int {
        a + b
    }
}

final class MultiplyStrategy: Strategy { 

    func execute(a: Int, b: Int) -> Int {
        a * b
    }
}

final class SubstractStrategy: Strategy { 

    func execute(a: Int, b: Int) -> Int {
        a - b
    }
}

final class Context { 

    private var strategy: Strategy

    init(strategy: Strategy) { 
        self.strategy = strategy
    }

    func updateStrategy(_ newStrategy: Strategy) { 
        self.strategy = newStrategy
    }

    func executeStrategy(a: Int, b: Int) -> Int { 
        strategy.execute(a: a, b: b)
    }
}

let context = Context(strategy: SubstractStrategy())
let result = context.executeStrategy(a: 5, b: 5)

print(result) // 0