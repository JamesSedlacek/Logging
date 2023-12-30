//
//  LoggingMacro.swift
//
//  Created by James Sedlacek on 12/29/23.
//

import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct LoggingMacro: MemberMacro {

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
                DeclSyntax("""
                           private let logger = Logger(subsystem: Bundle.main.bundleIdentifier ?? "Default Subsystem",
                                                       category: String(describing: Self.self))
                           """)
            ]
        }
}
