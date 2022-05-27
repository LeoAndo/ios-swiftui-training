//
//  ViewController.swift
//  LocationMonitoring
//
//  Created by LeoAndo on 2022/05/27.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    @IBOutlet weak var requestPermissionButton: UIButton!
    @IBOutlet weak var startLocationButton: UIButton!
    @IBOutlet weak var stopLocationButton: UIButton!
    @IBOutlet weak var authorizationStatusLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Do any additional setup after loading the view.")
    }
}

