//
//  IntentHandler.swift
//  Intent1
//
//  Created by Mac_Admin on 03/10/16.
//

import Intents

class IntentHandler: INExtension, INRequestRideIntentHandling
{
    override func handler(for intent: INIntent) -> Any
    {
        return self
    }
    
    func handle(requestRide intent: INRequestRideIntent, completion: @escaping (INRequestRideIntentResponse) -> Void)
    {
        if let _ = intent.rideOptionName
        {
            let userActivity = NSUserActivity()
        
            let response = INRequestRideIntentResponse(code: .inProgress, userActivity: userActivity)
            completion(response)
        }
    }
    
    func resolveRideOptionName(forRequestRide intent: INRequestRideIntent, with completion: @escaping (INSpeakableStringResolutionResult) -> Void)
    {
        let services = Roadside.getAllServices()
        var serviceFound = false
        var result : INSpeakableStringResolutionResult
        
        if let rideOptionName = intent.rideOptionName
        {
            for service in services
            {
                if rideOptionName.spokenPhrase == service
                {
                    serviceFound = true
                    break
                }
            }
            
            if serviceFound
            {
                result = INSpeakableStringResolutionResult.success(with: rideOptionName)
            }
            else
            {
                result = INSpeakableStringResolutionResult.disambiguation(with: [rideOptionName])
            }
        }
        else
        {
            result = INSpeakableStringResolutionResult.needsValue()
        }
        
        completion(result)
    }
}

