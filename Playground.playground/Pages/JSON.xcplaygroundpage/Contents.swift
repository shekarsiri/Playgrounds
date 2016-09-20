import Foundation

enum JSONParseError: Error {
    case Date
}

let trainsJSONURL = #fileLiteral(resourceName: "trains.json")
if let data = NSData(contentsOf: trainsJSONURL) {
    do {
        if let json = try JSONSerialization.jsonObject(with: data as Data, options: []) as? [String: Any],
            let locationName = json["locationName"] as? String,
            let filterLocationName = json["filterLocationName"] as? String,
            let generatedAt = json["generatedAt"] as? String,
            let trainServices = json["trainServices"] as? [[String: Any]] {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SZZZZ" // 2015-10-28T16:48:24.2633051+00:00
            guard let generatedDate = dateFormatter.date(from: generatedAt) else {
                throw JSONParseError.Date
            }

            let generatedDateFormatter = DateFormatter()
            generatedDateFormatter.timeStyle = .medium
            generatedDateFormatter.dateStyle = .short
            let generatedDateString = generatedDateFormatter.string(from: generatedDate)

            print("\(locationName) departures calling at \(filterLocationName) (\(generatedDateString))")
            for trainService in trainServices {
                if let std = trainService["std"] as? String,
                    let etd = trainService["etd"] as? String,
                    let destination = trainService["destination"] as? [[String: Any]],
                    let destinationLocationName = destination[0]["locationName"] as? String {
                    print("\(std) (\(etd)) to \(destinationLocationName)")
                }
            }
        }
    } catch {
        print("JSON parse error: \((error as NSError).localizedDescription)")
    }
}
