import XCTest
@testable import NCCFileManager_extras

final class NCCFileManager_extrasTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.

        let url = FileManager.default.documentsFolder
        XCTAssertFalse(url.absoluteString.isEmpty, "Couldn't get documentsFolder")

        let subfolder = "jerry"
        let jerryUrl = FileManager.default.urlForDocumentsSubfolder(named: subfolder)

        XCTAssertEqual(String(jerryUrl.absoluteString.suffix(subfolder.count + 1).dropLast()),
                       subfolder,
                       "urlForDocumentsSubFolder did not append subfolder name")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
