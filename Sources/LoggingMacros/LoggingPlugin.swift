//
//  LoggingPlugin.swift
//
//  Created by James Sedlacek on 12/29/23.
//

import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

@main
struct LoggingPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [LoggingMacro.self]
}
