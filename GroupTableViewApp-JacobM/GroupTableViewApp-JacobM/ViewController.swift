//
//  ViewController.swift
//  GroupTableViewApp-JacobM
//
//  Created by student on 3/6/22.
//
// TableView UI Element is set to Style:Grouped in properties tab.

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var petTable: UITableView!
    let petArray = [["Mammal", "Cat", "Dog", "Hamster"], ["Fish", "Goldfish", "Sea Horse"], ["Bird", "Parrot", "Canary"],
                    ["Reptile", "Turtle", "Snaked"]]
    let cellID = "cellID"

    // function below are stubs generated.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petArray[section].count - 1 //
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if (cell == nil){
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: cellID)
        }
        cell?.textLabel?.text = petArray[indexPath.section][indexPath.row + 1] //config the cell
        return cell!
    }
    //MARK: additonal functions for grouped table views
    func numberOfSections(in tableView: UITableView) -> Int {
        return petArray.count // return the number of sections for the table view
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return petArray[section][0]// retunr the section/catagory name
    }
    
    //MARK: Selection Function
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = petArray[indexPath.section][indexPath.row + 1]
        let alert = UIAlertController(title: "Your selection", message: "\(selectedItem)", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: {action -> Void in})
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        petTable.delegate = self
        petTable.dataSource = self
        // Do any additional setup after loading the view.
    }


}

