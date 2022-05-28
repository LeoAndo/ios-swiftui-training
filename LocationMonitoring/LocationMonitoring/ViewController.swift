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
    
    private let model: LocationDataSource = LocationDataSource()
    var authorizationStatus: CLAuthorizationStatus = .notDetermined
    var location: CLLocation = .init()
    
    var latitude: CLLocationDegrees {
        location.coordinate.latitude
    }

    var longitude: CLLocationDegrees {
        location.coordinate.longitude
    }

    func requestAuthorization() {
        model.requestAuthorization()
    }

    func activate() {
        // guard !isActive else { return }
//        model.authorizationPublisher().assign(to: $authorizationStatus)
//        model.locationPublisher().compactMap { $0.last }.assign(to: $location)
    }

    func deactivate() {
        // guard isActive else { return }
    }

    func startTracking() {
        model.startTracking()
    }

    func stopTracking() {
        model.stopTracking()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Do any additional setup after loading the view.")
    }
    @IBAction func onClickRequestPermissionButton(_ sender: Any) {
        print("onClickRequestPermissionButton")
        requestAuthorization()
    }
    @IBAction func onClickStartLocationButton(_ sender: Any) {
        print("onClickStartLocationButton")
        startTracking()
    }
    @IBAction func onClickStopLocationButton(_ sender: Any) {
        print("onClickStopLocationButton")
        stopTracking()
    }
}

