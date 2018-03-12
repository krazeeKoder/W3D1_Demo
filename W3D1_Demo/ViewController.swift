//
//  ViewController.swift
//  W3D1_Demo
//
//  Created by Anthony Tulai on 2018-03-12.
//  Copyright © 2018 Anthony Tulai. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var personDatabase: [Person]?
    var animalDatabase: [Person]?
    var databaseDictionary: [String: [Person]?]?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let person1 = Person(name: "Dan", image: #imageLiteral(resourceName: "person1"))
        let person2 = Person(name: "Mike", image: #imageLiteral(resourceName: "person2"))
        let person3 = Person(name: "Steve", image: #imageLiteral(resourceName: "person3"))
        
        let animal1 = Person(name: "Whiskers", image: #imageLiteral(resourceName: "cat"))
        let animal2 = Person(name: "Fido", image: #imageLiteral(resourceName: "dog"))
        let animal3 = Person(name: "Alpaca", image: #imageLiteral(resourceName: "alpaca"))
        
        self.animalDatabase = [animal1, animal2, animal3]
        
        self.personDatabase = [person1, person2, person3]
        
        self.databaseDictionary = ["persons" : self.personDatabase, "animals" : self.animalDatabase ]
        
//        self.personDatabase?.append(person1)
//        self.personDatabase?.append(person2)
//        self.personDatabase?.append(<#T##newElement: Person##Person#>)
        
        self.nameTableView.delegate = self
        self.nameTableView.dataSource = self
        self.nameTableView.separatorStyle = . singleLine
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let databaseDictionary = self.databaseDictionary else {
            return 0
        }
        return databaseDictionary.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let personDatabase = self.personDatabase, let animalDatabase = self.animalDatabase else {
            return 0
        }

        
        switch section {
        case 0:
            return personDatabase.count
        case 1:
            return animalDatabase.count
        default:
            return 0
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "testCell", for: indexPath)
        
//        guard let database = self.personDatabase else {
//            return cell
//        }

        var key = ""
        switch indexPath.section {
        case 0:
            key = "persons"
        case 1:
            key = "animals"
        default:
            return cell
        }
        
        guard let databaseDictionary = self.databaseDictionary else {
            return cell
        }
        
        guard let database = databaseDictionary[key] as? [Person] else {
            return cell
        }
            let person = database[indexPath.row]
                cell.textLabel?.text = person.name
                cell.imageView?.image = person.image
        
        return cell
    }
    
    @IBOutlet weak var nameTableView: UITableView!
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }


}

