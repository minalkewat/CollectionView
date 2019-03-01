//
//  DetailViewController.swift
//  CollectionViewDemo
//
//  Created by Meenal Kewat on 3/1/19.
//  Copyright © 2019 Happykrafts Innovations. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    
    var nam = String()
    var imag = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = nam
        img.image = imag
    }
}
