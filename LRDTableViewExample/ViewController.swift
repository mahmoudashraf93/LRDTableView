//
//  ViewController.swift
//  LRDTableViewExample
//
//  Created by mahmoud ashraf on 3/26/18.
//  Copyright © 2018 mahmoud ashraf. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var tableView: LRDTableView!
    var itemsArray = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        self.tableView.delegate = self
//        self.tableView.dataSource = self
        
        let fillBarBtn = UIBarButtonItem(title: "Fill", style: .plain, target: self, action: #selector(self.fillTableView))
        self.navigationItem.rightBarButtonItem = fillBarBtn
        
        self.tableView.actionButton.addTarget(self, action: #selector(self.fillTableView), for: UIControlEvents.touchUpInside)
        self.tableView.topDistance = 50.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func fillTableView(){
        if self.itemsArray.count > 0 {
            self.itemsArray.removeAll()
        }
        else {
             self.itemsArray = ["1", "2" , "3" ,"1", "2" , "3" ,"1", "2" , "3" ,"1", "2" , "3" ,"1", "2" , "3" ,"1", "2" , "3" ,"1", "2" , "3" ,"1", "2" , "3" , ]
        }
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = "\(indexPath.row)"
        
        return cell!
    }
}

