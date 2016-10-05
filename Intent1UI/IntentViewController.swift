//
//  IntentViewController.swift
//  Intent1UI
//
//  Created by Mac_Admin on 03/10/16.
//

import IntentsUI

class IntentViewController: UIViewController, INUIHostedViewControlling
{
    @IBOutlet var roadsideAssistanceLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - INUIHostedViewControlling
    
    func configure(with interaction: INInteraction!, context: INUIHostedViewContext, completion: ((CGSize) -> Void)!)
    {
        if let intent =  interaction.intent as? INRequestRideIntent
        {
            if let rideOptionName = intent.rideOptionName
            {
                roadsideAssistanceLabel.text = rideOptionName.spokenPhrase
            }
        }
        
        if let completion = completion
        {
            completion(self.desiredSize)
        }
    }
    
    var desiredSize: CGSize
    {
        return self.extensionContext!.hostedViewMaximumAllowedSize
    }
}
