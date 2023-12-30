//
//  Logging.swift
//
//  Created by James Sedlacek on 12/29/23.
//

import Foundation
@_exported import OSLog

@attached(member, names: named(logger))
public macro Logging() = #externalMacro(module: "LoggingMacros", type: "LoggingMacro")
