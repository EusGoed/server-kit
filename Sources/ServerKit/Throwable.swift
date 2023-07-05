//
//  File.swift
//  
//
//  Created by Eus Goed on 14/03/2023.
//

import Foundation
public struct Throwable<T: Decodable>: Decodable {
    
    public let result: Result<T, Error>

    public init(from decoder: Decoder) throws {
        let catching = { try T(from: decoder) }
        result = Result(catching: catching )
    }
}
