//
//  BotViewController.swift
//  ChatImplementation
//
//  Created by Hamed Hosseini on 2/11/21.
//

import UIKit
import FanapPodChatSDK

class BotViewController: UIViewController {
    
	 final let threadId = 325183
	 final let botName = "TEST_IOS_3_BOT"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	@IBAction func btnCreateBotTaped(_ sender: UIButton) {
		Chat.sharedInstance.createBot(.init(botName: botName)) { resposne , error in
            print(resposne ?? "")
		}
	}
	
	@IBAction func btnCreateBotOldTaped(_ sender: UIButton) {
		let req = CreateBotRequest(botName: botName , typeCode: nil, uniqueId: nil)
		Chat.sharedInstance.createBot(inputModel: req) { uniqueId in
			print(uniqueId)
		} completion: { response in
			print(response)
		}
	}
	
	@IBAction func btnCreateBotCommandTaped(_ sender: UIButton) {
		let commands = ["/command1","/command1"]
		Chat.sharedInstance.addBotCommand(.init(botName : botName ,commandList:commands)) { resposne , error in
            print(resposne ?? "")
		}
	}
	
	@IBAction func btnCreateBotCommandOldTaped(_ sender: UIButton) {
		let commands = ["/command1","/command1"]
		let req = AddBotCommandRequest(botName: botName, commandList: commands, typeCode: nil, uniqueId: nil)
		Chat.sharedInstance.addBotCommand(inputModel: req) { uniqueId in
			print(uniqueId)
		} completion: { response in
			print(response)
		}
	}
	
	@IBAction func btnAddBotToThreadTaped(_ sender: UIButton) {
		Chat.sharedInstance.addParticipant( .init(userName: botName, threadId: threadId)) { resposne , error in
            print(resposne ?? "")
		}
	}
	
	@IBAction func btnStartBotTaped(_ sender: UIButton) {
		Chat.sharedInstance.startBot(.init(botName: botName, threadId: threadId)) { botName , error in
            print(botName ?? "")
		}
	}
	
	@IBAction func btnStartBotOldTaped(_ sender: UIButton) {
		let req = StartStopBotRequest(botName: botName,
									  threadId: threadId,
									  typeCode: nil,
									  uniqueId: nil)
		Chat.sharedInstance.startBot(inputModel: req) { uniqueId in
			print(uniqueId)
		} completion: { response in
			print(response)
		}
	}
	
	@IBAction func btnStopBotTaped(_ sender: UIButton) {
        Chat.sharedInstance.stopBot(.init(botName: botName, threadId: threadId)) { botName , error in
            print(botName ?? "")
		}
	}
	
	@IBAction func btnStopBotOldTaped(_ sender: UIButton) {
		let req = StartStopBotRequest(botName: botName,
									  threadId: threadId,
									  typeCode: nil,
									  uniqueId: nil)
		Chat.sharedInstance.stopBot(inputModel: req) { uniqueId in
			print(uniqueId)
		} completion: { response in
			print(response)
		}
	}
	
}
