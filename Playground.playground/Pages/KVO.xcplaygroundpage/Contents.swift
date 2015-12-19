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
        self.objectToObserve.addObserver(self, forKeyPath: "myDate", options: .New, context: &observationContext)
    }

    deinit {
        objectToObserve.removeObserver(self, forKeyPath: "myDate", context: &observationContext)
    }

    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if context == &observationContext {
            if let newValue = change?[NSKeyValueChangeNewKey] {
                print("Date changed: \(newValue)")
            }
        } else {
            super.observeValueForKeyPath(keyPath, ofObject: object, change: change, context: context)
        }
    }
}

var objectToObserve = ObjectToObserve()
Observer(objectToObserve: objectToObserve)
objectToObserve.updateDate()
objectToObserve.updateDate()
objectToObserve.updateDate()
