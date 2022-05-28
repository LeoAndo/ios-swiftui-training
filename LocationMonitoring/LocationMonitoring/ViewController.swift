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
    private var authorizationStatus: CLAuthorizationStatus = .notDetermined
    private var location: CLLocation = .init()
    private var latitude: CLLocationDegrees { location.coordinate.latitude }
    private var longitude: CLLocationDegrees { location.coordinate.longitude }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Do any additional setup after loading the view.")
        activate()
    }
    @IBAction func onClickRequestPermissionButton(_ sender: Any) {
        model.requestAuthorization()
    }
    @IBAction func onClickStartLocationButton(_ sender: Any) {
        model.startTracking()
    }
    @IBAction func onClickStopLocationButton(_ sender: Any) {
        model.stopTracking()
    }
    
    private func activate() {
       model.authorizationPublisher()
            .subscribe(on: DispatchQueue.global())
            .receive(on: RunLoop.main) // receiveValueのコードブロックの処理をUIスレッドに変更
            .sink(receiveCompletion: {
            print ("authorizationPublisher completion: \($0)")
        }, receiveValue: { status in
            self.authorizationStatus = status
            self.authorizationStatusLabel.text = status.description
        })
        
        model.locationPublisher().compactMap { $0.last }
            .subscribe(on: DispatchQueue.global())
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: {
            print ("locationPublisher completion: \($0)")
        }, receiveValue: { location in
            self.location = location
            self.latitudeLabel.text = String(self.latitude)
            self.longitudeLabel.text = String(self.longitude)
        })
    }
}

