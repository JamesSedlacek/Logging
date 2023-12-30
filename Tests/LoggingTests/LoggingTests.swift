import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest
import LoggingMacros

final class LoggingTests: XCTestCase {

    func testLoggingMacroExpansion() throws {
#if canImport(LoggingMacros)
        assertMacroExpansion("""
@Logging
class TestingObject {
}
""",
                             expandedSource: """
class TestingObject {

    private let logger = Logger(subsystem: Bundle.main.bundleIdentifier ?? "Default Subsystem",
                                category: String(describing: Self.self))
}
""",
                             macros: ["Logging": LoggingMacro.self])
#else
        throw XCTSkip("macros are only supported when running tests for the host platform")
#endif
    }
}
