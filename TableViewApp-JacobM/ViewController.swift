//
//  ViewController.swift
//  TableViewApp-JacobM
//
//  Created by student on 3/6/22.
//
// Note: Creating a table view can be done with less code, visually too.

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource { // TableDelegate & Table Source to idenify this view as needing these: cause it does
    
    @IBOutlet var petTable: UITableView!
    let petArray = ["Cat", "Dog", "Parrot", "Parakeet", "Canary", "Finch", "Tropical Fish", "Gold Fish", "Sea Horse", "Hamster", "Gerbil", "Rabbit",
                    "Rabbit", "Turtle", "Snake", "Crab"] //Data to be contained in the table view
    let cellID = "cellID"
    
    // lower 2 functions are generated stubs for the tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petArray.count // this function needs to return the index count of the array holding the dat for the table view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if (cell == nil){
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: cellID)
        }
        cell?.textLabel?.text = petArray[indexPath.row]
        return cell!
    }
    //MARK: onsSelected TableView Function
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = petArray[indexPath.row]
        //MARK: alert setup
        let alert = UIAlertController(title: "Selected", message: "You selected \(selectedItem).", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: {action -> Void in
            //dismiss
        })
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // config the table sources delegate and source
        petTable.delegate = self
        petTable.dataSource = self
        // Do any additional setup after loading the view.
    }

}
