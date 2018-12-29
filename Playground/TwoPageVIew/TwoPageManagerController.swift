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
    //現在のpageの状態
    var status = HeaderStatus.left
    //underlineの移動方法が、どのアクションによるものなのかのプロパティ
    var pageChangeMethod = MethodOfChangePage.Swipe

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
        //次に切り替えられるPageの状態を保持する
        self.status = status
        //Pageを切り替える
        changePageByTappedButton(status)
    }
    
    //ボタンによるPageの切り替え
    func changePageByTappedButton(_ status: HeaderStatus) {
        switch status {
        case .left:
            self.pageChangeMethod = .TapLeft
            underlineToLeftFromRight()
        case .right:
            self.pageChangeMethod = .TapRight
            underlineToRightFromLeft()
        }
        defer { self.pageChangeMethod = .Swipe }
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
    
    //pageの切り替えに伴い、underlineの移動を行う
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        switch self.pageChangeMethod {
        case .TapLeft:  pagingAnimateToLeftPageFromRightPage()
        case .TapRight: pagingAnimateToRightPageFromLeftPage()
        case .Swipe:    pagingAnimateByScroll(scrollView.contentOffset.x)
        }
    }
    
    //右ページからは左ページにunderlineを移動させる
    func pagingAnimateToLeftPageFromRightPage() {
        UIView.animate(withDuration: 0.3, animations: {
            self.underlineView.transform = CGAffineTransform.identity
        })
    }
    
    //左ページから右ページへとunderlineを移動させる
    func pagingAnimateToRightPageFromLeftPage() {
        UIView.animate(withDuration: 0.3, animations: {
            self.underlineView.transform = CGAffineTransform(translationX: self.view.frame.width / 2, y: 0)
        })
    }
    
    //スクロールによってunderlineを移動させる
    func pagingAnimateByScroll(_ contentOffsetX: CGFloat) {
        //スクロール量からうunderlineの移動量を算出
        let amountOfMovement = (UIScreen.main.bounds.width - contentOffsetX) / 2
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
