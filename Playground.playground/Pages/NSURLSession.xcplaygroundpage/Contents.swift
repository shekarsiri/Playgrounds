import PlaygroundSupport
import Foundation

PlaygroundPage.current.needsIndefiniteExecution = true

let urlSession = URLSession(configuration: URLSessionConfiguration.default)
let url = NSURL(string: "http://peteogrady.com")!
urlSession.dataTask(with: url as URL) { (data, urlResponse, error) -> Void in
    if let urlResponse = urlResponse {
        print(urlResponse)
    }

    if let data = data, let html = String(data: data, encoding: String.Encoding.utf8) {
        print(html)
    }

    if let error = error {
        print("Error: \(error.localizedDescription)")
    }

    PlaygroundPage.current.finishExecution()
}.resume()
