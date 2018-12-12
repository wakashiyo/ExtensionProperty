//
//  ExtensionProperty.swift
//  ExtensionProperty
//
//  Created by 吉川昂広 on 2018/12/12.
//  Copyright © 2018 takahiro yoshikawa. All rights reserved.
//

import Foundation
import UIKit

enum ViewPosition {
    case upLeft
    case upRight
    case downLeft
    case downRight
}

protocol ViewPostionImpl {
    
    var position: ViewPosition { get set }
    
}

struct ExtenstionProperty<Base> {
    
    let base1: Base
    let base2: Base
    let base3: Base
    let base4: Base
    
    init(_ base1: Base, _ base2: Base, _ base3: Base, _ base4: Base) {
        self.base1 = base1
        self.base2 = base2
        self.base3 = base3
        self.base4 = base4
    }
}

protocol ExtensionPropertyCompatible {
    
    associatedtype CompatibleType
    
    var ep: ExtenstionProperty<CompatibleType> { get set }
}

extension ExtensionPropertyCompatible {
    
    var ep: ExtenstionProperty<Self> {
        get {
            return ExtenstionProperty(self, self, self, self)
        }
        set {
            
        }
    }
}

//extension NSObject : ExtensionPropertyCompatible {}

extension UIView: ExtensionPropertyCompatible {}

