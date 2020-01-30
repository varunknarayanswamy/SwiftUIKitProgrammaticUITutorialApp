//
//  TabBarScreen2.swift
//  ProgrammaticUITutorial
//
//  Created by Varun Narayanswamy on 1/26/20.
//  Copyright © 2020 Varun Narayanswamy. All rights reserved.
//

import UIKit

class TabBarScreen2: UIViewController {
    
    var tableview = UITableView()
    var celldata: [cellHolder] = []
    
    struct cells{
        static let cellInfo = "CellInfo"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        celldata = fetchdata()
        view.backgroundColor = .yellow
        title = "Tableview tutorial"
        configTableview()

        // Do any additional setup after loading the view.
    }
    
    func configTableview() {
        view.addSubview(tableview)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.rowHeight = 70
        tableview.register(customCell.self, forCellReuseIdentifier: "CellInfo")
        addTableviewConstraints()
    }
    
    func addTableviewConstraints() //look at pin extension in tableview tutorial video (sean allen)
    {
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        tableview.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

}

extension TabBarScreen2: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return celldata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cells.cellInfo) as! customCell
        let newCell = celldata[indexPath.row]
        cell.set(cellHold: newCell)
        return cell
    }
}

extension TabBarScreen2{
    func fetchdata() -> [cellHolder] {
        let cellHold1 = cellHolder(title: "Cell1", subheader: "subheader1")
        let cellHold2 = cellHolder(title: "Cell2", subheader: "subheader2")
        let cellHold3 = cellHolder(title: "Cell3", subheader: "subheader3")
        let cellHold4 = cellHolder(title: "Cell4", subheader: "subheader4")
        let cellHold5 = cellHolder(title: "Cell5", subheader: "subheader5")
        let cellHold6 = cellHolder(title: "Cell6", subheader: "subheader6")
        let cellHold7 = cellHolder(title: "Cell7", subheader: "subheader7")
        let cellHold8 = cellHolder(title: "Cell8", subheader: "subheader8")
        let cellHold9 = cellHolder(title: "Cell9", subheader: "subheader9")
        let cellHold10 = cellHolder(title: "Cell10", subheader: "subheader10")
        return [cellHold1, cellHold2, cellHold3, cellHold4, cellHold5, cellHold6, cellHold7, cellHold8, cellHold9, cellHold10]
    }
}
