//
//  NSAlert+Convenience.swift
//  cuImage
//
//  Created by HuLizhen on 18/01/2017.
//  Copyright © 2017 HuLizhen. All rights reserved.
//

import Cocoa

extension NSAlert {
    static func alert(for window: NSWindow? = nil, alertStyle: NSAlertStyle = .warning,
                      messageText: String, informativeText: String = "",
                      buttonTitles: [String]? = nil, completion: ((NSModalResponse) -> Void)? = nil) {
        let alert = NSAlert()
        
        alert.messageText = messageText
        alert.informativeText = informativeText
        alert.alertStyle = alertStyle
        
        // If no button titles are provided, a default "OK" button will be added.
        if let titles = buttonTitles {
            for title in titles {
                alert.addButton(withTitle: title)
            }
        }
        
        NSApp.activate(ignoringOtherApps: true)
        if let window = window {    // Call 'beginSheetModal(for:completionHandler:)'.
            alert.beginSheetModal(for: window, completionHandler: completion)
        } else {                    // Call 'runModal()'.
            let response = alert.runModal()
            if let completion = completion {
                completion(response)
            }
        }
    }
}
