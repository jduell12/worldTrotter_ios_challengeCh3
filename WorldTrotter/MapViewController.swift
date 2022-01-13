//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Jessica  Duell on 1/10/22.
//

//need to complete challneges in Ch 5, ch 6
import UIKit
import MapKit

class MapViewController: UIViewController{
    var mapView: MKMapView!
    
    override func loadView() {
        //create map view
        mapView = MKMapView()
        mapView.pointOfInterestFilter = MKPointOfInterestFilter.excludingAll
        view = mapView
        
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(mapTypeChanged(_:)), for: .valueChanged)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        let margins = view.layoutMarginsGuide
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = CGPoint(x: 80, y:100)
        label.textAlignment = .center
        label.text = "Points of Interest"
        view.addSubview(label)

    let pointSwitch = UISwitch(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    view.addSubview(pointSwitch)
    
    pointSwitch.translatesAutoresizingMaskIntoConstraints = false
    let topSwitch = pointSwitch.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor)
    topSwitch.isActive = true
    let leadingSwitch = pointSwitch.leadingAnchor.constraint(equalTo: label.trailingAnchor)
    leadingSwitch.isActive = true
    pointSwitch.addTarget(self, action: #selector(togglePointsOfInterest(_:)), for: .valueChanged)
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MapViewController loaded its view")
    }
    
    @objc func mapTypeChanged(_ segControl: UISegmentedControl){
        switch segControl.selectedSegmentIndex{
            case 0:
                mapView.mapType = .standard
            case 1:
                mapView.mapType = .hybrid
            case 2:
                mapView.mapType = .satellite
            default:
                break
        }
    }
    
    @objc func togglePointsOfInterest(_ toggle:UISwitch){
        if (toggle.isOn){
            mapView.pointOfInterestFilter = MKPointOfInterestFilter.includingAll
        }else{
            mapView.pointOfInterestFilter = MKPointOfInterestFilter.excludingAll
        }
    }
}
