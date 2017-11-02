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
    
    var zooAnimals: [ZooAnimal] = ZooAnimal.zooAnimals
    
    override func viewDidLoad() {
        super.viewDidLoad()
        zooAnimalTableView.delegate = self
        zooAnimalTableView.dataSource = self
        zooAnimalTableView.rowHeight = UITableViewAutomaticDimension
        zooAnimalTableView.estimatedRowHeight = 300
    }
    
    //Data Source Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return zooAnimals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Zoo Animal Cell", for: indexPath)
        let rowToSetUp = indexPath.row
        let currentZooAnimal = zooAnimals[rowToSetUp]
        
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
                let cellIndexPath = zooAnimalTableView.indexPath(for: zooAnimalCell)
                //rows and indices are zero-index, so we can use the rows as the datasource index - row of the current sender = same location in the array
                let selectedZooAnimalCell = zooAnimals[cellIndexPath!.row]
                destinationVC.zooAnimal = selectedZooAnimalCell
            }
        }
    }
    
}

