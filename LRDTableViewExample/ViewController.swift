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
        
        // add action to the LRDTableView Actionbutton
        self.tableView.actionButton.addTarget(self, action: #selector(self.fillTableView), for: UIControl.Event.touchUpInside)
        
        // you should set this to true only if you're sure that the list isn't gonna be empty in first place
        self.tableView.shouldListenToFirstReload = true
        
        // distance from top label to LRDTableViews top default is 10
        self.tableView.topDistance = 50.0
        
        // distance between elements in LRDTableViews the default is 100
        self.tableView.spacing = 50.0
        
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

