//
//  String+RemovingChar.swift
//  
//
//  Created by Eus Goed on 18/11/2022.
//

import Foundation

extension String {
    func removingCharacter(_ char: Character) -> Self {
        self.filter { $0 != char}
    }
}
