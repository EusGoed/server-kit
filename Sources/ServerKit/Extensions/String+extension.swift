//
// Copyright © 2023 Eus Goed.
// All Rights Reserved.

import Foundation
public extension String {
    // MARK: Regex
    func matches(regex: String) -> Bool {
        let regexPredicate = NSPredicate { (evaluatedObject, _) in
            guard let string = evaluatedObject as? String else { return false }
            return string.range(of: regex, options: .regularExpression) != nil
        }
        return regexPredicate.evaluate(with: self)
    }
    
    // MARK: Decoding
    func base64Decoded() -> String? {
        guard let data = Data(base64Encoded: self) else { return nil }
        return String(data: data, encoding: .utf8)
    }
    
    // MARK: Removing character
    func removingCharacter(_ char: Character) -> Self {
        self.filter { $0 != char}
    }
}
