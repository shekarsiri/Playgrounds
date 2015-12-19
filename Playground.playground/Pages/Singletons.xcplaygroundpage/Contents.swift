class Singleton {
    static let sharedInstance = Singleton()
}

class CustomSingleton {
    static let sharedInstance: CustomSingleton = {
        let instance = CustomSingleton()
        // setup code

        return instance
    }()
}
