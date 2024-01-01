import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest
import Logging
import LoggingMacros

final class LoggingTests: XCTestCase {

    func testLazyLoggingMacroExpansion() throws {
#if canImport(LoggingMacros)
        assertMacroExpansion("""
@LazyLogging
class TestingObject {
}
""",
                             expandedSource: """
class TestingObject {

    lazy private var logger: Logger = {
        return Logger(subsystem: Bundle.main.bundleIdentifier ?? "Default Subsystem",
                      category: String(describing: Self.self))
    }()
}
""",
                             macros: ["LazyLogging": LazyLoggingMacro.self])
#else
        throw XCTSkip("macros are only supported when running tests for the host platform")
#endif
    }

    func testLoggingMacroExpansion() throws {
#if canImport(LoggingMacros)
        assertMacroExpansion("""
@Logging
struct TestingView: View {

    var body: some View {
        Text("Hello, world!")
    }
}
""",
                             expandedSource: """
struct TestingView: View {

    var body: some View {
        Text("Hello, world!")
    }

    private let logger: Logger = Logger(subsystem: Bundle.main.bundleIdentifier ?? "Default Subsystem",
                                        category: String(describing: Self.self))
}
""",
                             macros: ["Logging": LoggingMacro.self])
#else
        throw XCTSkip("macros are only supported when running tests for the host platform")
#endif
    }

    func testObservableLoggingMacroExpansion() throws {
#if canImport(LoggingMacros)
        assertMacroExpansion("""
@Observable
@ObservableLogging
final class TestingObject {
}
""",
                             expandedSource: """
@Observable
final class TestingObject {

    @ObservationIgnored
    lazy private var logger: Logger = {
        return Logger(subsystem: Bundle.main.bundleIdentifier ?? "Default Subsystem",
                      category: String(describing: Self.self))
    }()
}
""",
                             macros: ["ObservableLogging": ObservableLoggingMacro.self])
#else
        throw XCTSkip("macros are only supported when running tests for the host platform")
#endif
    }
}
