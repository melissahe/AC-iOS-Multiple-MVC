//
//  ZooAnimalDetailedViewController.swift
//  AC-iOS-Multiple-MVC
//
//  Created by C4Q on 11/2/17.
//  Copyright © 2017 AC-iOS. All rights reserved.
//

import UIKit

class ZooAnimalDetailedViewController: UIViewController {

    @IBOutlet weak var zooAnimalImageView: UIImageView!
    @IBOutlet weak var zooAnimalNameLabel: UILabel!
    @IBOutlet weak var zooAnimalOriginLabel: UILabel!
    @IBOutlet weak var zooAnimalClassificationLabel: UILabel!
    @IBOutlet weak var zooAnimalDescriptionTextView: UITextView!
    
    var zooAnimal: ZooAnimal!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        zooAnimalImageView.image = UIImage(named: String(zooAnimal.imageNumber))
        zooAnimalNameLabel.text = zooAnimal.name
        zooAnimalOriginLabel.text = zooAnimal.origin
        zooAnimalClassificationLabel.text = zooAnimal.classification
        zooAnimalDescriptionTextView.text = zooAnimal.info
    }
    
}
