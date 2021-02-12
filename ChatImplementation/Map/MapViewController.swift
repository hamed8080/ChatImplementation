//
//  MapViewController.swift
//  ChatImplementation
//
//  Created by Hamed Hosseini on 1/26/21.
//

import UIKit
import FanapPodChatSDK

class MapViewController: UIViewController {
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}

    @IBAction func btnReverseTaped( _ button :UIButton){
        Chat.sharedInstance.mapReverse(.init(lat: 35.660399, lng: 51.487375, uniqueId: "fakeUniqueId")){ result in
            print(result)
        }
    }
    
    @IBAction func btnReverseOldTaped( _ button :UIButton){
        
        Chat.sharedInstance.mapReverse(inputModel: .init(lat: 35.660399, lng: 51.487375, uniqueId: "fakeUniqueId")) { uniqueIdReslt in
            print(uniqueIdReslt)
        } completion: { result in
            print(result)
        }

    }
    
    @IBAction func btnSearchNearTaped( _ button :UIButton){
        
    }
    
    @IBAction func btnSearchNearOldTaped( _ button :UIButton){
        
    }
    
    @IBAction func btnRoutingTaped( _ button :UIButton){
        let origin = Cordinate(lat:35.660399 , lng:51.487375)
        let destination = Cordinate(lat: 35.662984, lng: 51.468588)
        Chat.sharedInstance.mapRouting(.init(alternative: true, origin: origin, destination: destination)){ result in
            print(result)
        }
    }
    
    @IBAction func btnRoutingOldTaped( _ button :UIButton){
        let origin = Cordinate(lat:35.660399 , lng:51.487375)
        let destination = Cordinate(lat: 35.662984, lng: 51.468588)
        let req = MapRoutingRequest(alternative: true, destination: (destination.lat,destination.lng) , origin: (origin.lat,origin.lng))
        Chat.sharedInstance.mapRouting(inputModel: req) { uniqueIdResult in
            print(uniqueIdResult)
        } completion: { result in
            print(result)
        }

    }
    
}

