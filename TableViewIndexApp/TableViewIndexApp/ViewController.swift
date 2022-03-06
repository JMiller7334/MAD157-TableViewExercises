//
//  ViewController.swift
//  TableViewIndexApp
//
//  Created by student on 3/6/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet var petTable: UITableView!
    
    let petArray = [["Mammal", "Cat", "Dog", "Hamster"], ["Bird", "Parrot", "Parakeet", "Canary", "Finch"], ["Fish", "Goldfish", "Tropical Fish", "Seahorse", "Eel"], ["Reptile", "Snake", "Turtle", "Lizard"]]
    let indexArray = ["M", "B", "F", "R"] //edit>Emoji to add symbols instead of letters - here I'll stick with letters
    let cellID = "cellID"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petArray[section].count - 1 // important this is - 1 if it's not errror those at func below(out of index range)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if (cell == nil){
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: cellID)
        }
        cell?.textLabel?.text = petArray[indexPath.section][indexPath.row + 1]
        return cell!
    }
    //MARK: additional config for tableview
    func numberOfSections(in tableView: UITableView) -> Int {
        return petArray.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return petArray[section][0] // the header is always the first index in the array
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return indexArray // get the indexes
    }
    
    
    //MARK: select function
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = petArray[indexPath.section][indexPath.row + 1]
        let alert = UIAlertController(title: "Selected", message: "\(selectedItem)", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: {action -> Void in})
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        petTable.delegate = self
        petTable.dataSource = self
        
        // table styling
        petTable.sectionIndexColor = UIColor.white
        petTable.sectionIndexBackgroundColor = UIColor.black
        petTable.sectionIndexTrackingBackgroundColor = UIColor.darkGray
        // Do any additional setup after loading the view.
    }


}

