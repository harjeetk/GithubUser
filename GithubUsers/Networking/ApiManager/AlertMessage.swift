//
//  AlertMessage.swift
//  HauteCurator
//
//  Created by Pavle Pesic on 1/19/19.
//  Copyright © 2019 Pavle Pesic. All rights reserved.
//

import Foundation

class AlertMessage: Error {
    
    public var title = ""
    public var body = ""
    
    // MARK: - Intialization
    
    public init(title: String, body: String) {
        self.title = title
        self.body = body
    }
    
}
