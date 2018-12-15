//
//  Extensions.swift
//  Playground
//
//  Created by 吉川昂広 on 2018/12/15.
//  Copyright © 2018 takahiro yoshikawa. All rights reserved.
//

import Foundation
import UIKit


struct ExtensionProperty<Base> {
    
    let base: Base
    
    init(_ base: Base) {
        self.base = base
    }
}

protocol ExtensionPropertyCompatible {

    associatedtype CompatibleType

    var ex: ExtensionProperty<CompatibleType> { get set }
}

extension ExtensionPropertyCompatible {

    var ex: ExtensionProperty<Self> {
        get {
            return ExtensionProperty(self)
        }
        set {

        }
    }
}

extension NSObject : ExtensionPropertyCompatible {}


extension ExtensionProperty where Base: UITextField {
    
    var value: String {
        return base.text ?? ""
    }
}

//let textField = UITextField()
//print(textField.ex.value)


