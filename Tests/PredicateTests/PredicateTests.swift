import XCTest
import Predicate

@objcMembers
class Apple: NSObject {

    let type = "Fuji"

}

final class PredicateTests: XCTestCase {
    
    func testEmpty() {
        let test = NSPredicate.with(type: Any.self)
        XCTAssertEqual(test.stringResult, "")
    }

    func testPropertyMatchesInt() {
        let test = NSPredicate.with(type: Any.self)
            .property("count").matches(5)
        XCTAssertEqual(test.stringResult, "count MATCHES 5")
    }

    func testPropertyMatchesString() {
        let test = NSPredicate.with(type: Any.self)
            .property("name").matches("John Doe")
        XCTAssertEqual(test.predicateResult, NSPredicate(format: "name MATCHES %@", argumentArray: ["John Doe"]))
    }

    func testPropertyKeyPath() {
        let test = NSPredicate.with(type: Apple.self)[\.type].matches("Fuji")
        XCTAssertEqual(test.predicateResult, NSPredicate(format: "type MATCHES %@", argumentArray: ["Fuji"]))
    }

    func testPropertyOrProperty() {
        let test = NSPredicate.with(type: Apple.self)[\.type].matches("Fuji")
            .or[\.type].matches("Gala")
        XCTAssertEqual(test.predicateResult, NSPredicate(format: "type MATCHES %@ OR type MATCHES %@", argumentArray: ["Fuji", "Gala"]))
    }

    static var allTests = [
        ("testEmpty", testEmpty),
        ("testPropertyMatchesInt", testPropertyMatchesInt),
        ("testPropertyMatchesString", testPropertyMatchesString),
        ("testPropertyKeyPath", testPropertyKeyPath),
        ("testPropertyOrProperty", testPropertyOrProperty),
    ]

}
