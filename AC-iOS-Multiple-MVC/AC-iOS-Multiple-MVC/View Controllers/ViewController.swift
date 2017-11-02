//
//  ViewController.swift
//  AC-iOS-Multiple-MVC
//
//  Created by Tom Seymour on 11/2/17.
//  Copyright © 2017 AC-iOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var zooAnimalTableView: UITableView!
    
    var zooAnimals: [[ZooAnimal]] = [[]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        zooAnimalTableView.delegate = self
        zooAnimalTableView.dataSource = self
        zooAnimalTableView.rowHeight = UITableViewAutomaticDimension
        zooAnimalTableView.estimatedRowHeight = 300
        zooAnimals[0] = ZooAnimal.zooAnimals.filter{$0.classification == "Mammal"}
        zooAnimals.append(ZooAnimal.zooAnimals.filter{$0.classification == "Amphibian"})
        zooAnimals.append(ZooAnimal.zooAnimals.filter{$0.classification == "Reptile"})
        zooAnimals.append(ZooAnimal.zooAnimals.filter{$0.classification == "Insect"})
        zooAnimals.append(ZooAnimal.zooAnimals.filter{$0.classification == "Bird"})
    }
    
    //Data Source Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return zooAnimals.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Mammal"
        case 1:
            return "Amphibian"
        case 2:
            return "Reptile"
        case 3:
            return "Insect"
        case 4:
            return "Bird"
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return zooAnimals[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Zoo Animal Cell", for: indexPath)
        let sectionToSetUp = indexPath.section
        let rowToSetUp = indexPath.row
        let currentZooAnimal = zooAnimals[sectionToSetUp][rowToSetUp]
        
        if let zooAnimalCell = cell as? ZooAnimalTableViewCell {
            zooAnimalCell.animalNameLabel.text = currentZooAnimal.name
            zooAnimalCell.classificationOriginLabel.text = "Classification: \(currentZooAnimal.classification)\nOrigin: \(currentZooAnimal.origin)"
            zooAnimalCell.animalImageView.image = UIImage(named: String(currentZooAnimal.imageNumber))
            return zooAnimalCell
        }
        
        return cell
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //identify the sender
        if let zooAnimalCell = sender as? ZooAnimalTableViewCell {
            //specify the segue identifier, then destination VC
            if segue.identifier == "Zoo Animal Detailed Segue", let destinationVC = segue.destination as? ZooAnimalDetailedViewController {
                //find specific indexPath (so you can find the section and row) of the sender cell
                let cellIndexPath = zooAnimalTableView.indexPath(for: zooAnimalCell)!
                //rows and indices are zero-index, so we can use the rows as the datasource index - row of the current sender = same location in the array
                let selectedZooAnimalCell = zooAnimals[cellIndexPath.section][cellIndexPath.row]
                destinationVC.zooAnimal = selectedZooAnimalCell
            }
        }
    }
    
}

