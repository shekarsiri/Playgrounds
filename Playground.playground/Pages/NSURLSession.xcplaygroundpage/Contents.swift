import XCPlayground
import Foundation

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

let urlSession = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
let url = NSURL(string: "http://peteogrady.com")!
urlSession.dataTaskWithURL(url) { (data, urlResponse, error) -> Void in
    if let urlResponse = urlResponse {
        print(urlResponse)
    }

    if let data = data, html = String(data: data, encoding: NSUTF8StringEncoding) {
        print(html)
    }

    if let error = error {
        print("Error: \(error.localizedDescription)")
    }

    XCPlaygroundPage.currentPage.finishExecution()
}.resume()