protocol PersonObserver: class {
    func ageDidUpdate(age: Int)
}

struct Person {
    var age: Int {
        didSet {
            personObserver.ageDidUpdate(age)
        }
    }

    var personObserver: PersonObserver
}

class PersonObserverImpl: PersonObserver {
    func ageDidUpdate(age: Int) {
        print("Updated age to \(age)")
    }
}

let personObserver = PersonObserverImpl()
var p = Person(age: 30, personObserver: personObserver)
p.age = 31
