//
//  ViewController.swift
//  ChatImplementation
//
//  Created by Hamed Hosseini on 1/26/21.
//

import UIKit
import FanapPodChatSDK

class ViewController: UIViewController{
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
    
    @IBAction func btnClearAllCacheDataTaped(_ button:UIButton){
        CacheFactory.write(cacheType: .DELETE_ALL_CACHE_DATA)
    }
}

