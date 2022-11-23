import XCTest
@testable import ZxcvbnCWrapper


final class ZxcvbnCTests: XCTestCase {
    
    func testExample1() throws {
        let result = ZxcvbnCWrapper.shared.evaluate(password: "zxcvbn")
        debugPrint("testExample1", result)
    }
    
    func testExample2() throws {
        let result = ZxcvbnCWrapper.shared.evaluate(password: "Tr0ub4dour&3")
        debugPrint("testExample2",  result)
    }
    
    func testExample3() throws {
        let result = ZxcvbnCWrapper.shared.evaluate(password: "passwordassword")
        debugPrint("testExample3", result)
        XCTAssertLessThan(abs(result.entropy - 13.6), 0.1)
    }
}


