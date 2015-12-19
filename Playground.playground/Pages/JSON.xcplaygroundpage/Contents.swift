import Foundation

enum JSONParseError: ErrorType {
    case Date
}

let trainsJSONURL = [#FileReference(fileReferenceLiteral: "trains.json")#]
if let data = NSData(contentsOfURL: trainsJSONURL) {
    do {
        let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(rawValue: 0))
        if let locationName = json["locationName"] as? String,
            filterLocationName = json["filterLocationName"] as? String,
            generatedAt = json["generatedAt"] as? String,
            trainServices = json["trainServices"] as? [[String: AnyObject]] {
                let dateFormatter = NSDateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SZZZZ" // 2015-10-28T16:48:24.2633051+00:00
                guard let generatedDate = dateFormatter.dateFromString(generatedAt) else {
                    throw JSONParseError.Date
                }

                let generatedDateFormatter = NSDateFormatter()
                generatedDateFormatter.timeStyle = .MediumStyle
                generatedDateFormatter.dateStyle = .ShortStyle
                let generatedDateString = generatedDateFormatter.stringFromDate(generatedDate)

                print("\(locationName) departures calling at \(filterLocationName) (\(generatedDateString))")
                for trainService in trainServices {
                    if let std = trainService["std"] as? String,
                        etd = trainService["etd"] as? String,
                        destination = trainService["destination"] as? [[String: AnyObject]],
                        destinationLocationName = destination[0]["locationName"] as? String {
                            print("\(std) (\(etd)) to \(destinationLocationName)")
                    }
                }
        }
    } catch {
        print("JSON parse error: \((error as NSError).localizedDescription)")
    }
}
