//
//  Logger.swift
//
//
//  Created by Eus Goed on 22/12/2021.
//

import Foundation
import Vapor

public extension Logger {
    static let shared = Logger(label: "")
}

public func logError(_ text: Any,_ function: String = #function) {
    Logger.shared.error("[\(function.functionName())] \(text)")
}

public func logInfo(_ text: Any,_ function: String = #function ) {
    Logger.shared.info("[\(function.functionName())] \(text)")
}

public func logNotice(_ text: Any,_ function: String = #function ) {
    Logger.shared.notice("[\(function.functionName())] \(text)")
}

public func logJob(_ text: Any) {
    Logger.shared.notice("[JOBS] \(text)")
}

private extension String {
    func functionName() -> Self {
        guard let lastIndex = self.lastIndex(of: "(") else { return self }
        return String(self.prefix(upTo: lastIndex))
    }
}
