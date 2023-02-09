//
//  ViewController.swift
//  Countries
//
//  Created by İbrahim Bayram on 9.02.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    var list = [Country]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        self.segmentedControl.selectedSegmentIndex = 0
        changeRegion(url: requestURLs().urlForAll!)
        
    }
    
    func changeRegion(url : URL) {
        Webservice().getData(url: url) { output in
            guard let result = output else {return}
            self.list = result
        }
    }
    
    @IBAction func segmentedControlClicked(_ sender: UISegmentedControl) {
        if segmentedControl.selectedSegmentIndex == 0 {
            changeRegion(url: requestURLs().urlForAll!)
        }else if segmentedControl.selectedSegmentIndex == 1 {
            changeRegion(url: requestURLs().asiaURL!)
        }else if segmentedControl.selectedSegmentIndex == 2 {
            changeRegion(url: requestURLs().europeURL!)
        }else if segmentedControl.selectedSegmentIndex == 3 {
            changeRegion(url: requestURLs().africaURL!)
        }else if segmentedControl.selectedSegmentIndex == 4 {
            changeRegion(url: requestURLs().americaURL!)
        }
        
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = list[indexPath.row].name
        return cell
    }
   
    
    
}

