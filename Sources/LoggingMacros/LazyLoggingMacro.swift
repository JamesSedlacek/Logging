//
//  LazyLoggingMacro.swift
//
//  Created by James Sedlacek on 12/29/23.
//

import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct LazyLoggingMacro: MemberMacro {

    public enum MacroError: Error {
        case incorrectType
    }

    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax,
        in context: some MacroExpansionContext) throws -> [DeclSyntax] {
            guard declaration.is(ClassDeclSyntax.self) ||
                  declaration.is(StructDeclSyntax.self) ||
                  declaration.is(ActorDeclSyntax.self) else { throw MacroError.incorrectType }

            return [
                DeclSyntax(
"""
lazy private var logger: Logger = {
    return Logger(subsystem: Bundle.main.bundleIdentifier ?? "Default Subsystem",
                  category: String(describing: Self.self))
}()
""")
            ]
        }
}
