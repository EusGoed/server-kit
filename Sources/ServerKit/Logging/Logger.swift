//
//  Logger.swift
//
//
//  Created by Eus Goed on 22/12/2021.
//

import Foundation
import Vapor

extension Logger {
    static let shared = Logger(label: "")
}

func logError(_ text: Any,_ function: String = #function) {
    Logger.shared.error("[\(function.functionName())] \(text)")
}

func logInfo(_ text: Any,_ function: String = #function ) {
    Logger.shared.info("[\(function.functionName())] \(text)")
}

func logNotice(_ text: Any,_ function: String = #function ) {
    Logger.shared.notice("[\(function.functionName())] \(text)")
}

func logJob(_ text: Any) {
    Logger.shared.notice("[JOBS] \(text)")
}

private extension String {
    func functionName() -> Self {
        guard let lastIndex = self.lastIndex(of: "(") else { return self }
        return String(self.prefix(upTo: lastIndex))
    }
}
extension String {
    func errorMessage(_ function: String = #function) -> Self {
        "❌ [\(function.functionName())] \(self)"
    }
    
    func infoMessage(_ function: String = #function) -> Self {
        "ℹ️ [\(function.functionName())] \(self)"
    }
}
