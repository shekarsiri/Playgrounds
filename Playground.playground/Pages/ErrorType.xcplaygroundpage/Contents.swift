import Foundation // When imported, ErrorType becomes an NSError

enum AnotherError: ErrorType {
    case Baz
}

enum CustomError: ErrorType {
    case Foo
    case Bar
}

func throwAnError() throws {
    throw CustomError.Foo
//    throw AnotherError.Baz
}

do {
    try throwAnError()
} catch let error as CustomError {
    print("Matched as CustomError: \(error)")
} catch let error as NSError {
    print("Matched as NSError \(error)")
} catch let error {
    print("Fall through: \(error)")
}
