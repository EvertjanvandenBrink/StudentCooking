//
//  NonPersistentApiContext.swift
//  StudentCoocking
//
//  Created by Evertjan van den Brink on 25/03/2019.
//  Copyright © 2019 Evertjan van den Brink. All rights reserved.
//

class NonPersistentApiContext: ApiContext {
    
    init(environment: ApiEnvironment) {
        self.environment = environment
    }
    
    var environment: ApiEnvironment
}
