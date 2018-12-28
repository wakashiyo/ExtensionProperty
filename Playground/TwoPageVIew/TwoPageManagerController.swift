//
//  TwoPageManagerController.swift
//  Playground
//
//  Created by 吉川昂広 on 2018/12/24.
//  Copyright © 2018 takahiro yoshikawa. All rights reserved.
//

import UIKit

class TwoPageManagerController: UIViewController, HeaderSlideDelegate {
    
    //現在、どちらのpageなのかを示すアンダーライン
    //HeadSliderViewControllerのボタンの下に描画されている
    //移動の処理は全てscrollViewDidScroll（UIScrollViewDelegateのメソッド）で実装されている
    @IBOutlet weak var underlineView: UIView!
    
    var pageViewController: UIPageViewController!
    
    //タップによるpageの切り替えなのか
    //スクロールによるpageの切り替えなのか
    //タップの場合：true
    //スクロールの場合：false
    var duringTap = false
    
    //現在のpageの状態
    var status = HeaderStatus.left

    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = self.children.map({
            if let viewController = $0 as? HeadSliderViewController {
                viewController.delegate = self
            } else if let pageViewController = $0 as? UIPageViewController {
                self.pageViewController = pageViewController
                self.pageViewController.setViewControllers([getLeftPageDataSource()], direction: .forward, animated: true, completion: nil)
                self.pageViewController.dataSource = self
                self.pageViewController.view.subviews
                    .filter{ $0.isKind(of: UIScrollView.self) }
                    .forEach{ ($0 as! UIScrollView).delegate = self }
            }
        })
    }
    
    //HeaderSlideDelegateのメソッド
    //HeadSliderViewControllerのボタンが押された際に呼び出される
    func slideUnderLine(_ status: HeaderStatus) {
        //例えば、、、
        //左のページが表示されているときに、左のページに切り替える用のボタンを押しても何も起こらないようにする
        guard self.status != status else { return }
        //タップアクションによるpage切り替えなので、trueにする
        duringTap = true
        //切り替えられた後のpageの状態を残す
        self.status = status
        //pageの切り替え
        switch status {
        case .right: underlineToRightFromLeft()
        case .left: underlineToLeftFromRight()
        }
        //タップアクションが終わったら、falseに戻す
        defer { duringTap = false }
    }

    //右にセットされているViewに切り替える
    func underlineToRightFromLeft() {
        pageViewController.setViewControllers([getRightPageDataSource()], direction: .forward, animated: true, completion: nil)
    }
    
    //左にセットされているViewに切り替える
    func underlineToLeftFromRight() {
        pageViewController.setViewControllers([getLeftPageDataSource()], direction: .reverse, animated: true, completion: nil)
    }
    
    func getLeftPageDataSource() -> UIViewController {
        return A_ViewController()
    }
    
    func getRightPageDataSource() -> UIViewController {
        return B_ViewController()
    }
}

extension TwoPageManagerController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if viewController.isKind(of: B_ViewController.self) {
            return getLeftPageDataSource()
        } else {
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if viewController.isKind(of: A_ViewController.self) {
            return getRightPageDataSource()
        } else {
            return nil
        }
    }
}

extension TwoPageManagerController: UIScrollViewDelegate {
    
    /*
     条件分岐がネストになっているので、もっとスッキリさせたい。。。
     */
    
    //pageの切り替えに伴い、underlineの移動を行う
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //ボタンによる移動なのか、スクロールによる移動なのか
        //duringTap = true => ボタンによる移動
        //duringTap = false => スクロールによる移動
        switch duringTap {
        case true:
            //statusより右のViewか左のViewのどちらに切り替えるかを判断
            switch self.status {
                //.left => 左のViewに戻す
            case .left:
                UIView.animate(withDuration: 0.3, animations: {
                    self.underlineView.transform = CGAffineTransform.identity
                })
                //.right => 右のViewに切り替える
            case .right:
                UIView.animate(withDuration: 0.3, animations: {
                    self.underlineView.transform = CGAffineTransform(translationX: self.view.frame.width / 2, y: 0)
                })
            }
        case false:
            //スクロール量からうunderlineの移動量を算出
            let amountOfMovement = (UIScreen.main.bounds.width - scrollView.contentOffset.x) / 2
            //0の場合は、リセットされてしまうため、underlineの移動は行わない
            guard amountOfMovement != 0 else { return }
            //amountOfMovement < 0 の場合 => 左から右のViewへの切り替え
            if amountOfMovement < 0 {
                underlineView.transform = CGAffineTransform(translationX: -amountOfMovement, y: 0)
            //amoutnOfMovement > 0 の場合 => 右から左のViewに戻る処理
            } else {
                underlineView.transform = CGAffineTransform(translationX: (UIScreen.main.bounds.width / 2) - amountOfMovement, y: 0)
            }
        }
    }
}
