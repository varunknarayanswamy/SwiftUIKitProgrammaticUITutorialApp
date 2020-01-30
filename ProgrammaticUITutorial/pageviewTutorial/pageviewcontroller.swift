//
//  pageviewcontroller.swift
//  ProgrammaticUITutorial
//
//  Created by Varun Narayanswamy on 1/26/20.
//  Copyright © 2020 Varun Narayanswamy. All rights reserved.
//

import UIKit

class pageviewcontrol: UIPageViewController{
    
    var pages = [UIViewController]()
    let pageControl = UIPageControl()
    var initialPage = 0
    var currentIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        print("in viewdidload")
        SetupPages()
        setupPageControl()
        view.addSubview(pageControl)
        PageControlConstraints()
        // Do any additional setup after loading the view.
    }
    
    func SetupPages()
    {
        let page2 = pageView2()
        let page3 = pageView3()
        pages.append(page2)
        pages.append(page3)
        setViewControllers(pages, direction: .forward, animated: true, completion: nil)
    }
    
    func setupPageControl()
    {
        pageControl.frame = CGRect()
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPage = initialPage
    }
    
    func PageControlConstraints()
    {
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -5).isActive = true
        pageControl.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -20).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 20).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }

        // Do any additional setup after loading the view.
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension pageviewcontrol: UIPageViewControllerDataSource, UIPageViewControllerDelegate{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if (currentIndex == 0)
        {
            currentIndex = pages.count - 1
            return pages.last
        }
        else{
            currentIndex = currentIndex - 1
            return pages[currentIndex]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if (currentIndex == pages.count-1)
        {
            currentIndex = 0
            return pages.first
        }
        else
        {
            currentIndex = currentIndex + 1
            return pages[currentIndex]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        pageControl.currentPage = currentIndex
    }
    
    
}



