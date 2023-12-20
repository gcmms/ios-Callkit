//
//  CallManager.swift
//  CallBuddy
//
//  Created by Gabriel Chirico Mahtuk de Melo Sanzone on 20/12/23.
//
import CallKit
import Foundation

final class CallManager: NSObject {

    let provider = CXProvider(configuration: .init())
    let callController = CXCallController()

    override init() {
        super.init()
        provider.setDelegate(self, queue: nil)
    }

    public func reportIncomingCall(id: UUID, handle: String) {
        let update = CXCallUpdate()
        update.remoteHandle = .init(type: .generic, value: handle)
        provider.reportNewIncomingCall(with: id, update: update) { error in
            guard let error else { 
                print("Call reported")
                return
            }
            print(String(describing: error))
        }
    }

    public func startCall(id: UUID, handle: String) {
        let action = CXStartCallAction(
            call: id,
            handle: .init(type: .generic, value: handle)
        )
        let transaction = CXTransaction(action: action)
        callController.requestTransaction(with: []) { error in
            guard let error else {
                print("Call start")
                return
            }
            print(String(describing: error))
        }
    }
}

extension CallManager: CXProviderDelegate {
    func providerDidReset(_ provider: CXProvider) {

    }
}
