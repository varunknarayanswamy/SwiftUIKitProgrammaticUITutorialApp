//
//  FirstScreen.swift
//  ProgrammaticUITutorial
//
//  Created by Varun Narayanswamy on 1/26/20.
//  Copyright © 2020 Varun Narayanswamy. All rights reserved.
//

import UIKit

class FirstScreen: UIViewController {
    
    let nextButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        title = "Tutorial Application"
        setupNextButton()
        // Do any additional setup after loading the view.
    }
    
    func setupNextButton() {
        nextButton.backgroundColor = .white
        nextButton.setTitleColor(.red, for: .normal)
        nextButton.setTitle("NEXT", for: .normal)
        
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        view.addSubview(nextButton)
        setNextButtonConstraints()
    }
    
    @objc func nextButtonTapped()
    {
        let nextScreen = SecondScreen()
        nextScreen.title = "new screen"
        navigationController?.pushViewController(nextScreen, animated: true)
    }
    
    func setNextButtonConstraints(){
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
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
