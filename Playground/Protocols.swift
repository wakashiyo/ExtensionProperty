//
//  Protocols.swift
//  Playground
//
//  Created by 吉川昂広 on 2018/12/16.
//  Copyright © 2018 takahiro yoshikawa. All rights reserved.
//

import Foundation
import UIKit

enum Display {
    case show
    case close
}

protocol Animatable: class {
    typealias D = Display
    
    init(_ type: D)
    func presentAnimation(_ transitionContext: UIViewControllerContextTransitioning)
    func dismissAnimation(_ transitionContext: UIViewControllerContextTransitioning)
}

protocol SliderDelegate: class {
    func showSlide()
}

protocol Slidable: class {
    var delegate: SliderDelegate? { get set }
}

enum HeaderStatus {
    case left
    case right
}

protocol HeaderSlideDelegate: class {
    func slideUnderLine(_ status: HeaderStatus)
}

protocol HeaderSlidable: class {
    var delegate: HeaderSlideDelegate? { get set }
    func sendStatus(_ state: HeaderStatus)
}

extension HeaderSlidable {
    func sendStatus(_ status: HeaderStatus) {
        delegate?.slideUnderLine(status)
    }
}

//protocol A {
//    typealias T = Display
//    init(_ type: T)
//}
//
//class B: A {
//    let b: T
//    required init(_ type: B.T) {
//        b = type
//    }
//}
//
//class C {
//    init() {
//        let b = B.init(.show)
//    }
//}
