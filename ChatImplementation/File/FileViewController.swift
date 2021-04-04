//
//  FileViewController.swift
//  ChatImplementation
//
//  Created by Hamed Hosseini on 2/20/21.
//

import Foundation
import UIKit
import FanapPodChatSDK
import SwiftyJSON

class FileViewController : UIViewController ,URLSessionDataDelegate{
    
    private let threadId  = 274540
    private let messageId = 1417630
    private var downloadUniqueId:String = ""
    private var uploadUniqueId:String   = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        session = URLSession(configuration: .default, delegate: self, delegateQueue: .main)
    }
	
    @IBAction func btnUploadFileTaped(_ button:UIButton) {
        guard let path = Bundle.main.path(forResource: "test", ofType: "txt"), let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else{return}
        let uploadFile = NewUploadFileRequest(data: data,fileExtension: ".txt" , fileName: "test" , mimeType: "text/plain" , userGroupHash: "RZFAGPKJEOWQIR")
        Chat.sharedInstance.uploadFile(req: uploadFile) { uniqueId in
            print(uniqueId)
            self.uploadUniqueId = uniqueId
        } uploadProgress: { uploadProgress, error in
            print(uploadProgress ?? error ?? "")
        } uploadCompletion: { response, fileMetaData, error in
            print(response ?? error ?? "")
        }
    }
    
    @IBAction func btnUploadFileOldTaped(_ button:UIButton) {
        guard let path = Bundle.main.path(forResource: "test", ofType: "txt"), let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else{return}
        let textRequest = SendTextMessageRequest(content: "check this file message",
                                                 messageType: .POD_SPACE_FILE,
                                                 metadata: nil,
                                                 repliedTo: nil,
                                                 systemMetadata: nil,
                                                 threadId: threadId,
                                                 typeCode: nil,
                                                 uniqueId: nil)
        let uploadrequest = UploadFileRequest(dataToSend: data,
                                              fileExtension: nil,
                                              fileName: "test",
                                              mimeType: nil,
                                              originalName: nil,
                                              userGroupHash: "RZFAGPKJEOWQIR",
                                              typeCode: nil,
                                              uniqueId: nil)
        let req = SendReplyFileMessageRequest(messageInput: textRequest, uploadInput: uploadrequest)
        Chat.sharedInstance.sendFileMessage(inputModel: req) { uploadUniqueId in
            print(uploadUniqueId)
        } uploadProgress: { progress in
            print(progress)
        } messageUniqueId: { uniqueId in
            print(uniqueId)
        } onSent: { response in
            print(response)
        } onDelivered: { response in
            print(response)
        } onSeen: { response in
            print(response)
        }
    }
    
    @IBAction func btnUploadImageTaped(_ button:UIButton) {
        guard let image = UIImage(named: "test.png") else{return}
        let width = Int(image.size.width)
        let height = Int(image.size.height)
        let imageRequest = NewUploadImageRequest(data: image.pngData() ?? Data(),hC: height, wC: width , fileName: "newImae.png", mimeType: "image/png" , userGroupHash: "RZFAGPKJEOWQIR" )
        Chat.sharedInstance.uploadImage(req: imageRequest){ uniqueId in
            print(uniqueId)
        } uploadProgress: { uploadProgress, error in
            print(uploadProgress ?? error ?? "")
        } uploadCompletion: { response, fileMetaData, error in
            print(response ?? error ?? "")
        }
    }
    
    @IBAction func btnUploadImageOldTaped(_ button:UIButton) {
        guard let path = Bundle.main.path(forResource: "test", ofType: "txt"), let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else{return}
        let textRequest = SendTextMessageRequest(content: "check this file message",
                                                 messageType: .POD_SPACE_FILE,
                                                 metadata: nil,
                                                 repliedTo: nil,
                                                 systemMetadata: nil,
                                                 threadId: threadId,
                                                 typeCode: nil,
                                                 uniqueId: nil)
        let uploadrequest = UploadFileRequest(dataToSend: data,
                                              fileExtension: nil,
                                              fileName: "test",
                                              mimeType: nil,
                                              originalName: nil,
                                              userGroupHash: "RZFAGPKJEOWQIR",
                                              typeCode: nil,
                                              uniqueId: nil)
        let req = SendReplyFileMessageRequest(messageInput: textRequest, uploadInput: uploadrequest)
        Chat.sharedInstance.sendFileMessage(inputModel: req) { uploadUniqueId in
            print(uploadUniqueId)
        } uploadProgress: { progress in
            print(progress)
        } messageUniqueId: { uniqueId in
            print(uniqueId)
        } onSent: { response in
            print(response)
        } onDelivered: { response in
            print(response)
        } onSeen: { response in
            print(response)
        }
    }
    
    @IBAction func btnSendFileMessageTaped(_ button:UIButton) {
        guard let path = Bundle.main.path(forResource: "test", ofType: "txt"), let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else{return}
        let message = NewSendTextMessageRequest(threadId: threadId, textMessage: "test file upload message", messageType: .POD_SPACE_FILE)
        let uploadFile = NewUploadFileRequest(data: data,fileExtension: ".txt" , fileName: "test", mimeType: "text/plain" , userGroupHash: "RZFAGPKJEOWQIR")
        Chat.sharedInstance.sendFileMessage(textMessage:message, uploadFile: uploadFile){ uploadFileProgress ,error in
            print(uploadFileProgress ?? error ?? "")
        }onSent: { sentResponse, uniqueId, error in
            print(sentResponse ?? "")
        }onSeen: { seenResponse, uniqueId, error in
            print(seenResponse ?? "")
        }onDeliver: { deliverResponse, uniqueId, error in
            print(deliverResponse ?? "")
        }uploadUniqueIdResult:{ uploadUniqueId in
            print(uploadUniqueId)
        }messageUniqueIdResult:{ messageUniqueId in
           print(messageUniqueId)
        }
    }
    
    @IBAction func btnSendFileMessageOldTaped(_ button:UIButton) {
        guard let path = Bundle.main.path(forResource: "test", ofType: "txt"), let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else{return}
        let textRequest = SendTextMessageRequest(content: "check this file message",
                                                 messageType: .POD_SPACE_FILE,
                                                 metadata: nil,
                                                 repliedTo: nil,
                                                 systemMetadata: nil,
                                                 threadId: threadId,
                                                 typeCode: nil,
                                                 uniqueId: nil)
        let uploadrequest = UploadFileRequest(dataToSend: data,
                                              fileExtension: nil,
                                              fileName: "test",
                                              mimeType: nil,
                                              originalName: nil,
                                              userGroupHash: "RZFAGPKJEOWQIR",
                                              typeCode: nil,
                                              uniqueId: nil)
        let req = SendReplyFileMessageRequest(messageInput: textRequest, uploadInput: uploadrequest)
        Chat.sharedInstance.sendFileMessage(inputModel: req) { uploadUniqueId in
            print(uploadUniqueId)
        } uploadProgress: { progress in
            print(progress)
        } messageUniqueId: { uniqueId in
            print(uniqueId)
        } onSent: { response in
            print(response)
        } onDelivered: { response in
            print(response)
        } onSeen: { response in
            print(response)
        }
    }
    
    @IBAction func btnSendImageMessageTaped(_ button:UIButton) {
        guard let image = UIImage(named: "test.png") else{return}
        let width = Int(image.size.width)
        let height = Int(image.size.height)
        let message = NewSendTextMessageRequest(threadId: threadId, textMessage: "test image upload message", messageType: .POD_SPACE_PICTURE)
        let imageRequest = NewUploadImageRequest(data: image.pngData() ?? Data(),hC: height, wC: width , fileName: "newImae.png", mimeType: "image/png" , userGroupHash: "RZFAGPKJEOWQIR" )
        Chat.sharedInstance.sendFileMessage(textMessage:message, uploadFile: imageRequest){ uploadFileProgress ,error in
            print(uploadFileProgress ?? error ?? "")
        }onSent: { sentResponse, uniqueId, error in
            print(sentResponse ?? "")
        }onSeen: { seenResponse, uniqueId, error in
            print(seenResponse ?? "")
        }onDeliver: { deliverResponse, uniqueId, error in
            print(deliverResponse ?? "")
        }uploadUniqueIdResult:{ uploadUniqueId in
            print(uploadUniqueId)
        }messageUniqueIdResult:{ messageUniqueId in
           print(messageUniqueId)
        }
    }
    
    @IBAction func btnSendImageMessageOldTaped(_ button:UIButton) {
        
    }
    
    @IBAction func btnReplyFileMessageTaped(_ button:UIButton) {
        
        guard let path = Bundle.main.path(forResource: "test", ofType: "txt"), let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else{return}
        let message = NewReplyMessageRequest(threadId: threadId, repliedTo: messageId, textMessage: "Reply File Message Title", messageType: .POD_SPACE_FILE)
        let uploadFile = NewUploadFileRequest(data: data,fileExtension: ".txt" , fileName: "test", mimeType: "text/plain" , userGroupHash: "RZFAGPKJEOWQIR")

        Chat.sharedInstance.replyFileMessage(replyMessage:message, uploadFile: uploadFile){ uploadFileProgress ,error in
            print(uploadFileProgress ?? error ?? "")
        }onSent: { sentResponse, uniqueId, error in
            print(sentResponse ?? "")
        }onSeen: { seenResponse, uniqueId, error in
            print(seenResponse ?? "")
        }onDeliver: { deliverResponse, uniqueId, error in
            print(deliverResponse ?? "")
        }uploadUniqueIdResult:{ uploadUniqueId in
            print(uploadUniqueId)
        }messageUniqueIdResult:{ messageUniqueId in
           print(messageUniqueId)
        }
        
    }
    
    @IBAction func btnReplyFileMessageOldTaped(_ button:UIButton) {
        guard let path = Bundle.main.path(forResource: "test", ofType: "txt"), let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else{return}
        let textRequest = SendTextMessageRequest(content: "Reply File Message Title",
                                                 messageType: .POD_SPACE_FILE,
                                                 metadata: nil,
                                                 repliedTo: nil,
                                                 systemMetadata: nil,
                                                 threadId: threadId,
                                                 typeCode: nil,
                                                 uniqueId: nil)
        let uploadrequest = UploadFileRequest(dataToSend: data,
                                              fileExtension: nil,
                                              fileName: "test",
                                              mimeType: nil,
                                              originalName: nil,
                                              userGroupHash: "RZFAGPKJEOWQIR",
                                              typeCode: nil,
                                              uniqueId: nil)
        let req = SendReplyFileMessageRequest(messageInput: textRequest, uploadInput: uploadrequest)
       
        Chat.sharedInstance.replyFileMessage(inputModel: req) { uploadUniqueId in
            print(uploadUniqueId)
        } uploadProgress: { progress in
            print(progress)
        } messageUniqueId: { uniqueId in
            print(uniqueId)
        } onSent: { response in
            print(response)
        } onDelivered: { response in
            print(response)
        } onSeen: { response in
            print(response)
        }
    }
    
    
    @IBAction func btnGetFileTaped(_ button:UIButton) {
//        download()
        let req = FileRequest(hashCode: "YZCJN8DXEAYB4Y4D", forceToDownloadFromServer: true)
        Chat.sharedInstance.getFile(req: req) { downloadProgress in
            print(downloadProgress )
        } completion: { data, fileModel, error in
            print(data ?? error ?? "")
        } cacheResponse: { data, fileModel, error in
            print(data ?? error ?? "")
        } uniqueIdResult: { uniqueId in
            print(uniqueId)
            self.downloadUniqueId = uniqueId
        }
    }
    
    @IBAction func btnGetFileOldTaped(_ button:UIButton) {
        let req = GetFileRequest(hashCode: "YZCJN8DXEAYB4Y4D", serverResponse: true)
        Chat.sharedInstance.getFile(inputModel: req, getCacheResponse: true) { uniqueId in
            print(uniqueId)
        } progress: { progress in
            print(progress)
        } completion: { data, downloadModel in
            print(downloadModel)
        } cacheResponse: { data, downloadModel in
            print(downloadModel)
        }
    }
    
    @IBAction func btnGetImageTaped(_ button:UIButton) {
        let req = ImageRequest(hashCode: "B4GUL34V5APC8PME", forceToDownloadFromServer: true  , isThumbnail: true , size: 2)
        Chat.sharedInstance.getImage(req: req) { downloadProgress in
            print(downloadProgress )
        } completion: { data, fileModel, error in
            print(data ?? error ?? "")
        } cacheResponse: { data, fileModel, error in
            print(data ?? error ?? "")
        } uniqueIdResult: { uniqueId in
            print(uniqueId)
        }
    }
    
    @IBAction func btnGetImageOldTaped(_ button:UIButton) {
        let req = GetImageRequest(hashCode: "123", quality: 1.0, crop: false, size: nil, serverResponse: true)
        Chat.sharedInstance.getImage(inputModel: req, getCacheResponse: true) { uniqueId in
            print(uniqueId)
        } progress: { progress in
            print(progress)
        } completion: { data, downloadModel in
            print(downloadModel)
        } cacheResponse: { data, downloadModel in
            print(downloadModel)
        }
    }
    
    @IBAction func btnPauseDownloadTaped(_ button:UIButton) {
        Chat.sharedInstance.manageDownload(uniqueId: downloadUniqueId, action: .suspend, isImage: false){ statusString,susccessAction in
            print(statusString)
        }
    }
    
    @IBAction func btnResumeDownloadTaped(_ button:UIButton) {
        Chat.sharedInstance.manageDownload(uniqueId: downloadUniqueId, action: .resume, isImage: false){ statusString,susccessAction in
            print(statusString)
        }
    }
    
    @IBAction func btnCancelDownloadTaped(_ button:UIButton) {
        Chat.sharedInstance.manageDownload(uniqueId: downloadUniqueId, action: .cancel, isImage: false){ statusString,susccessAction in
            print(statusString)
        }
    }
    
    @IBAction func btnPauseUploadTaped(_ button:UIButton) {
        Chat.sharedInstance.manageUpload(uniqueId: uploadUniqueId, action: .suspend, isImage: false){ statusString,susccessAction in
            print(statusString)
        }
    }
    
    @IBAction func btnResumeUploadTaped(_ button:UIButton) {
        Chat.sharedInstance.manageUpload(uniqueId: uploadUniqueId, action: .resume, isImage: false){ statusString,susccessAction in
            print(statusString)
        }
    }
    
    @IBAction func btnCancelUploadTaped(_ button:UIButton) {
        Chat.sharedInstance.manageUpload(uniqueId: uploadUniqueId, action: .cancel, isImage: false){ statusString,susccessAction in
            print(statusString)
        }
    }
    
    
    var buffer: NSMutableData = NSMutableData()
    var session: URLSession?
    var dataTask:URLSessionDataTask?
    private var totalSize:Int64 = 0
    
    func download(){
        guard let url = URL(string: "https://podspace.pod.ir/nzh/drive/downloadFile?hash=YZCJN8DXEAYB4Y4D&_token_=3811246cf94240afa2c9a10a5991cf8f&_token_issuer_=1&crop=false") else {return}
        var request =  URLRequest(url: url)
        request.httpMethod = "GET"

        dataTask = session?.dataTask(with: request)
        dataTask?.resume()
    }
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: @escaping (URLSession.ResponseDisposition) -> Void){
        totalSize = response.expectedContentLength
        completionHandler(.allow)
    }
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        
        buffer.append(data)
        let percentageDownloaded = Double(buffer.count) / Double(totalSize)
    }
}
