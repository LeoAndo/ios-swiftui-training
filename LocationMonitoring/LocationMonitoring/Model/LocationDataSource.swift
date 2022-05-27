//
//  LocationDataSource.swift
//  LocationMonitoring
//
//  Created by LeoAndo on 2022/05/27.
//

import CoreLocation
import Combine

final class LocationDataSource: NSObject {

    private let locationManager: CLLocationManager = .init()
    private let authorizationSubject: PassthroughSubject<CLAuthorizationStatus, Never> = .init()
    private let locationSubject: PassthroughSubject<[CLLocation], Never> = .init()

    override init() {
        super.init()
        locationManager.delegate = self
    }

    func authorizationPublisher() -> AnyPublisher<CLAuthorizationStatus, Never> {
        return Just(locationManager.authorizationStatus).merge(with: authorizationSubject).eraseToAnyPublisher()
    }

    func locationPublisher() -> AnyPublisher<[CLLocation], Never> {
        return locationSubject.eraseToAnyPublisher()
    }

    func requestAuthorization() {
        if locationManager.authorizationStatus == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
        }
    }

    func startTracking() {
        locationManager.startUpdatingLocation()
    }

    func stopTracking() {
        locationManager.stopUpdatingLocation()
    }
}

extension LocationDataSource: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationSubject.send(manager.authorizationStatus)
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationSubject.send(locations)
    }
}
