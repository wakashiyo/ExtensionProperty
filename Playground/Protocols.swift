//
//  Protocols.swift
//  Playground
//
//  Created by 吉川昂広 on 2018/12/16.
//  Copyright © 2018 takahiro yoshikawa. All rights reserved.
//

import Foundation
import UIKit

protocol Animatable: class {
    
    var isPresent: Bool { get set }
    
    init(_ isPresent: Bool)
    
    func presentAnimation(_ transitionContext: UIViewControllerContextTransitioning)
    
    func dismissAnimation(_ transitionContext: UIViewControllerContextTransitioning)
    
}

protocol SliderDelegate: class {
    
    func showSlide()
    
}
