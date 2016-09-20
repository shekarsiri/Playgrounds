protocol PersonObserver {
    func ageDidUpdate(age: Int)
}

struct Person {
    var age: Int {
        didSet {
            personObserver.ageDidUpdate(age: age)
        }
    }

    var personObserver: PersonObserver
}

struct PersonObserverImpl: PersonObserver {
    func ageDidUpdate(age: Int) {
        print("Updated age to \(age)")
    }
}

let personObserver = PersonObserverImpl()
var p = Person(age: 30, personObserver: personObserver)
p.age = 31
