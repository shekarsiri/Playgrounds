import XCPlayground
import CoreLocation

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

let geocoder = CLGeocoder()
let location = CLLocation(latitude: 51.5151472, longitude: -0.0718766)

geocoder.reverseGeocodeLocation(location) { (places, error) -> Void in
    let placemark = places![0]
    print(placemark.name)
    print(placemark.locality)
    print(placemark.administrativeArea)

    XCPlaygroundPage.currentPage.finishExecution()
}
