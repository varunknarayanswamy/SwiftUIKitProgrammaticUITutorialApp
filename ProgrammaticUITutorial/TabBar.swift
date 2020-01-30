//
//  TabBar.swift
//  ProgrammaticUITutorial
//
//  Created by Varun Narayanswamy on 1/26/20.
//  Copyright © 2020 Varun Narayanswamy. All rights reserved.
//

import UIKit

class TabBar: UITabBarController {
    
    private let tab1 = FirstScreen()
    private let tab2 = TabBarScreen2()
    private let tab3 = TabBarScreen3()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [createCont(title: "first", vc: tab1, image: "buttonIcon"), createCont(title: "second", vc: tab2, image: "tableIcon"),createCont(title: "third", vc: tab3, image: "bookIcon")]
        // Do any additional setup after loading the view.
    }
    
    private func createCont(title: String, vc: UIViewController, image: String) -> UINavigationController{
        let recentVC = UINavigationController(rootViewController: vc)
        recentVC.tabBarItem.title = title
        recentVC.tabBarItem.image = UIImage(named: image)
        return recentVC
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
