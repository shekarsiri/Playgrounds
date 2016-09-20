import Foundation

class ObjectToObserve: NSObject {
    dynamic var myDate = NSDate()

    func updateDate() {
        myDate = NSDate()
    }
}

class Observer: NSObject {
    private var observationContext = 0
    var objectToObserve: ObjectToObserve

    init(objectToObserve: ObjectToObserve) {
        self.objectToObserve = objectToObserve
        super.init()
        self.objectToObserve.addObserver(self, forKeyPath: "myDate", options: .new, context: &observationContext)
    }

    deinit {
        objectToObserve.removeObserver(self, forKeyPath: "myDate", context: &observationContext)
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if context == &observationContext {
            if let newValue = change?[NSKeyValueChangeKey.newKey] {
                print("Date changed: \(newValue)")
            }
        } else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
}

var objectToObserve = ObjectToObserve()
Observer(objectToObserve: objectToObserve)
objectToObserve.updateDate()
objectToObserve.updateDate()
objectToObserve.updateDate()
