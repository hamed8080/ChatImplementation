//
//  MapViewController.swift
//  ChatImplementation
//
//  Created by Hamed Hosseini on 1/26/21.
//

import UIKit
import FanapPodChatSDK

class MapViewController: UIViewController {
	
	@IBOutlet weak var imgStaticMapImage: UIImageView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}

    @IBAction func btnReverseTaped( _ button :UIButton){
		Chat.sharedInstance.request(.MapReverse(req:.init(lat: 35.660399, lng: 51.487375) )) { resposne in
			if let mapReverse = resposne.result {
				print(mapReverse)
			}
		}
    }
    
    @IBAction func btnReverseOldTaped( _ button :UIButton){
        
        Chat.sharedInstance.mapReverse(inputModel: .init(lat: 35.660399, lng: 51.487375)) { uniqueIdReslt in
            print(uniqueIdReslt)
        } completion: { result in
            print(result)
        }

    }
	
    @IBAction func btnSearchNearTaped( _ button :UIButton){
		Chat.sharedInstance.request(.MapSearch(req: .init(lat: 35.660428, lng: 51.487299, term: "پاسارگاد"))) { response in
			if let mapSearchResponse = response.result as? MapSearchResponse{
				print(mapSearchResponse)
			}
		}
    }
    
    @IBAction func btnSearchNearOldTaped( _ button :UIButton){
		Chat.sharedInstance.mapSearch(inputModel: .init(lat: 35.660428, lng: 51.487299, term: "پاسارگاد")) { unqueId in
			print(unqueId)
		} completion: { result in
			print(result)
		}
    }
    
	@IBAction func btnRoutingTaped( _ button :UIButton){
		let origin = Cordinate(lat:35.660399 , lng:51.487375)
		let destination = Cordinate(lat: 35.662984, lng: 51.468588)
		Chat.sharedInstance.request(.MapRouting(req: .init(alternative: true, origin: origin, destination: destination))) { response in
			if let mapRoutingResponse = response.result as? NewMapRoutingResponse{
				print(mapRoutingResponse)
			}
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
    
	
	@IBAction func btnMapStaticImageTaped( _ button :UIButton){
		let req = NewMapStaticImageRequest(centerLat: 35.660417,centerLng: 51.487187)
		Chat.sharedInstance.request(.MapStaticImage(req:req)) { response in
			if let data = response.result as? Data , let image = UIImage(data: data) {
				self.imgStaticMapImage.image = image
			}
		}
	}
	
	@IBAction func btnMapStaticImageOldTaped( _ button :UIButton){
		let req = MapStaticImageRequest(centerLat: 35.660417,
										centerLng:  51.487187,
										height: 400,
										type: "standard-day",
										width: 600,
										zoom: 8)
		Chat.sharedInstance.mapStaticImage(inputModel: req) { uniqueId in
			print(uniqueId)
		} progress: { progress in
			print(progress)
		} completion: { result in
			if let data = result as? Data , let image = UIImage(data: data){
				self.imgStaticMapImage.image = image
			}
		}

	}
}

