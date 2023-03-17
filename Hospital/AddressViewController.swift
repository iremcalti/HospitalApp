//
//  AddressViewController.swift
//  Hospital
//
//  Created by İrem Çaltı on 2.09.2022.
//

import UIKit
import XLPagerTabStrip
import MapKit

class AddressViewController: UIViewController, IndicatorInfoProvider {
    
    var hospital: Model?
    var itemInfo: IndicatorInfo = "Address"
    
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var faxLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
          
        return itemInfo
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

       setupTexts()
    }
    
    func setupTexts() {
        addressLabel.text = hospital?.address
        phoneLabel.text = "Phone:" + " " + hospital!.phone
        faxLabel.text = "Fax:" + " " + hospital!.fax
        latitudeLabel.text = "Latitude:" + " " + "\(hospital?.latitude ?? 0)"
        longitudeLabel.text = "Longitude:" + " " + "\(hospital?.longitude ?? 0)"
    }
   @IBAction func callButtonClicked(_ sender: Any) {
        
        guard let number = URL(string: "tel://" + "4444276") else { return }
        UIApplication.shared.open(number)
        
//        if let url = URL(string: "tel://\(phoneLabel.text!)"),
//        UIApplication.shared.canOpenURL(url) {
//        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    
    @IBAction func showMeWhere(_ sender: Any) {

        let latitude: CLLocationDegrees = hospital!.latitude
        let longitude: CLLocationDegrees = hospital!.longitude
        let regionDistance:CLLocationDistance = 10000
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = hospital?.name
        mapItem.openInMaps(launchOptions: options)
       
      //  37.04282748423148, 27.42217026593494
        }
    }

