//
//  DetailView.swift
//  ArkusTest
//
//  Created by Mauricio Zarate on 24/05/22.
//  
//

import Foundation
import UIKit
import GoogleMaps
import CoreLocation

class DetailView: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate{

    // MARK: Properties
    var presenter: DetailPresenterProtocol?
    private let locationManager = CLLocationManager()
    var latt = 00.00
    var long = 00.00
    
    let mapConstainer: GMSMapView = {
        let mapConstainer = GMSMapView()
        mapConstainer.contentMode = .scaleAspectFill
        mapConstainer.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        mapConstainer.clipsToBounds = true
        return mapConstainer
     }()
    
    let titlelbl:UILabel = {
    let titlelbl = UILabel()
        titlelbl.font = UIFont.boldSystemFont(ofSize: 20)
        titlelbl.textColor = UIColor(named: "blueOne")
        titlelbl.translatesAutoresizingMaskIntoConstraints = false
        return titlelbl
    }()
    
    let infoAddlbl1:UILabel = {
    let infoAddlbl = UILabel()
        infoAddlbl.font = UIFont.boldSystemFont(ofSize: 14)
        infoAddlbl.textColor = UIColor(named: "titleColor")
        infoAddlbl.translatesAutoresizingMaskIntoConstraints = false
        return infoAddlbl
    }()
    
    let infoAddlbl2:UILabel = {
    let infoAddlbl = UILabel()
        infoAddlbl.font = UIFont.boldSystemFont(ofSize: 14)
        infoAddlbl.textColor = UIColor(named: "titleColor")
        infoAddlbl.translatesAutoresizingMaskIntoConstraints = false
        return infoAddlbl
    }()
    
    let distancelbl:UILabel = {
    let infoAddlbl = UILabel()
        infoAddlbl.font = UIFont.boldSystemFont(ofSize: 12)
        infoAddlbl.textColor = UIColor(named: "titleColor")
        infoAddlbl.translatesAutoresizingMaskIntoConstraints = false
        return infoAddlbl
    }()
    
    let petImg:UIImageView = {
    let img = UIImageView()
    img.contentMode = .scaleAspectFit
    img.translatesAutoresizingMaskIntoConstraints = false
    img.layer.cornerRadius = 10
    img.clipsToBounds = true
    return img
    }()
    
    let petlbl:UILabel = {
    let label = UILabel()
    label.font = UIFont.boldSystemFont(ofSize: 12)
    label.textColor = UIColor(named: "titleColor")
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
    }()
    
    let tableD: UITableView = {
    let tableD = UITableView()
       return tableD
    }()
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configNavBarDetail()
        presenter?.viewDidLoad()
        mapConstainer.delegate = self
        constraints()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()


        if CLLocationManager.locationServicesEnabled() {
          switch (CLLocationManager.authorizationStatus()) {
            case .notDetermined, .restricted, .denied:
              print("No access")
            case .authorizedAlways, .authorizedWhenInUse:
              print("Access")
              showCurrentLocation()
          }
        } else {
          print("Location services are not enabled")
        }
    }
    func showCurrentLocation() {
        mapConstainer.settings.myLocationButton = true
        let locationObj = locationManager.location!
        let coord = locationObj.coordinate
        let lattitude =  coord.latitude
        let longitude = coord.longitude
        print(" lat in  updating \(lattitude) ")
        print(" long in  updating \(longitude)")

//        let center = CLLocationCoordinate2D(latitude: locationObj.coordinate.latitude, longitude: locationObj.coordinate.longitude)
        
        let center = CLLocationCoordinate2D(latitude: latt, longitude: long)
        
        let marker = GMSMarker()
        marker.position = center
        marker.title = titlelbl.text
        marker.icon = UIImage(named: "pinSelected")
        marker.map = mapConstainer
        let camera: GMSCameraPosition = GMSCameraPosition.camera(withLatitude: latt, longitude: long, zoom: Float(16.0))
        self.mapConstainer.animate(to: camera)
    }
    
    
    func constraints(){

        
        view.addSubview(mapConstainer)

        view.addSubview(titlelbl)
        view.addSubview(infoAddlbl1)
        view.addSubview(infoAddlbl2)
        view.addSubview(distancelbl)
        view.addSubview(petImg)
        view.addSubview(petlbl)
        
        
        
        mapConstainer.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        mapConstainer.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        mapConstainer.heightAnchor.constraint(equalToConstant: 160).isActive = true
        
        titlelbl.topAnchor.constraint(equalTo: mapConstainer.bottomAnchor, constant: 5).isActive = true
        titlelbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        titlelbl.widthAnchor.constraint(equalToConstant: 200).isActive = true
        titlelbl.heightAnchor.constraint(equalToConstant: 40).isActive = true
        //titlelbl.text = "Rockwell's Bar & Grill"
        
        infoAddlbl1.topAnchor.constraint(equalTo: titlelbl.bottomAnchor, constant: 20).isActive = true
        infoAddlbl1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        infoAddlbl1.widthAnchor.constraint(equalToConstant: 150).isActive = true
        infoAddlbl1.heightAnchor.constraint(equalToConstant: 30).isActive = true
        //infoAddlbl1.text = "Rockwell's Bar & Grill"
        
        infoAddlbl2.topAnchor.constraint(equalTo: titlelbl.bottomAnchor, constant: 36).isActive = true
        infoAddlbl2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        infoAddlbl2.widthAnchor.constraint(equalToConstant: 150).isActive = true
        infoAddlbl2.heightAnchor.constraint(equalToConstant: 30).isActive = true
        //infoAddlbl2.text = "Rockwell's Bar & Grill"
        
        distancelbl.topAnchor.constraint(equalTo: mapConstainer.bottomAnchor, constant: 18).isActive = true
        distancelbl.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        distancelbl.widthAnchor.constraint(equalToConstant: 40).isActive = true
        distancelbl.heightAnchor.constraint(equalToConstant: 20).isActive = true
        distancelbl.text = "2.3 mi"
        
        petImg.topAnchor.constraint(equalTo: distancelbl.topAnchor, constant: 20).isActive = true
        petImg.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35).isActive = true
        petImg.widthAnchor.constraint(equalToConstant: 20).isActive = true
        petImg.heightAnchor.constraint(equalToConstant: 20).isActive = true
        petImg.image = UIImage(named: "dogFriendlyActive")
        
        
        petlbl.text = "Pet Friendly"
        petlbl.topAnchor.constraint(equalTo: petImg.topAnchor, constant: 25).isActive = true
        petlbl.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80).isActive = true
        petlbl.widthAnchor.constraint(equalToConstant: 90).isActive = true
        petlbl.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
    }
    
    func configNavBarDetail() {
            title = "DETAIL"
        navigationController?.navigationBar.tintColor = .darkGray
            view.backgroundColor = .white
    }
}

extension DetailView: DetailViewProtocol {
    // TODO: implement view output methods
    func showDataInLabel(data: ArkaElement) {
        titlelbl.text = data.placeName
        infoAddlbl1.text = data.addressLine1
        infoAddlbl2.text = data.addressLine2
        
        latt = data.latitude
        long = data.longitude
        
        if data.isPetFriendly {
            petlbl.textColor = .systemGreen
        }else{
            petlbl.textColor = .lightGray
        }
    }
}


