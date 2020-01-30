//
//  TabBarScreen3.swift
//  ProgrammaticUITutorial
//
//  Created by Varun Narayanswamy on 1/26/20.
//  Copyright © 2020 Varun Narayanswamy. All rights reserved.
//

import UIKit

class TabBarScreen3: UIViewController {
    
    var pages = [UIViewController]()
    let pageControl = UIPageControl()
    var initialPage = 0
    var currentIndex = 0
    var pageviewControl = UIPageViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("no setup")
        SetupPageViewController()
        print("setup complete")
        setupPageControl()
       // pageviewConstraints()
        // Do any additional setup after loading the view.
    }
    
    /*func pageviewConstraints()
    {
        addView.translatesAutoresizingMaskIntoConstraints = false
        addView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        addView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        addView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        addView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }*/
    
    func SetupPageViewController()
    {
        pageviewControl = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageviewControl.delegate = self
        let page1 = pageView1()
        let page2 = pageView2()
        let page3 = pageView3()
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        print("haven't added as subview")
        addChild(pageviewControl)
        view.addSubview(pageviewControl.view)
        print("added as subview")
        pageviewControl.setViewControllers([pages[0]], direction: .forward, animated: true, completion: nil)
        pageviewControl.dataSource = self
        pageviewControl.view.frame = self.view.bounds
        pageviewControl.didMove(toParent: self)
        
        // Add the page view controller's gesture recognizers to the view controller's view so that the gestures are started more easily.
        view.gestureRecognizers = pageviewControl.gestureRecognizers
    }
    
    func setupPageControl()
    {
        pageControl.frame = CGRect()
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .gray
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = initialPage
        PageControlConstraints()
    }
    
    func PageControlConstraints()
    {
        view.addSubview(pageControl)
        print("adding subview")
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.bottomAnchor.constraint(equalTo: pageviewControl.view.bottomAnchor, constant: -5).isActive = true
        pageControl.widthAnchor.constraint(equalTo: pageviewControl.view.widthAnchor, constant: -20).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 20).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: pageviewControl.view.centerXAnchor).isActive = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension TabBarScreen3: UIPageViewControllerDataSource, UIPageViewControllerDelegate{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let viewControllerIndex = self.pages.firstIndex(of: viewController) {
            if viewControllerIndex == 0 {
                // wrap to last page in array
                return self.pages.last
            } else {
                // go to previous page in array
                return self.pages[viewControllerIndex - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let viewControllerIndex = self.pages.firstIndex(of: viewController) {
            if viewControllerIndex < self.pages.count - 1 {
                // go to next page in array
                return self.pages[viewControllerIndex + 1]
            } else {
                // wrap to first page in array
                return self.pages.first
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            if let viewControllers = pageViewController.viewControllers {
                if let viewControllerIndex = self.pages.firstIndex(of: viewControllers[0]) {
                        pageControl.currentPage = viewControllerIndex
                    }
                }
        }

    
   func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return pages.count
    }

    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }

    
    
}
