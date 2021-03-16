//
//  Ext+Array.swift
//  LuxuryQatar
//
//  Created by C100-105 on 10/08/19.
//  Copyright © 2019 Narola. All rights reserved.
//

import Foundation
import UIKit

extension Array where Element: Hashable {
    
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()
        
        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }
    
    mutating func removeDuplicates() {
        self = self.removingDuplicates()
    }
}
