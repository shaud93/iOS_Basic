//
//  KeyChainView.swift
//  CoreDataExample
//
//  Created by D'Ante Watson on 11/23/23.
//

import SwiftUI

struct KeyChainView: View {
    @State var savedinfo:String = "N/A"
    var body: some View {
        Text(savedinfo)
        
        Button("SAVE PASSWORD") {
            savePasswordIntoKeyChain(value: "Bankai", key: "password")
        }
        
        Button("get password") {
            getPasswordFromKeyChain(key: "password")
        }
        
    }
    
    func savePasswordIntoKeyChain(value:String, key:String) {
        // turn the password(value) into raw Data
        let rawData = value.data(using: .utf8)
        
        let query:[String:Any] = [
            //the string will be a password type
            kSecClass as String:kSecClassGenericPassword,
            
            //sets the key
            kSecAttrAccount as String:key,
            
            //sets the data
            kSecValueData as String:rawData as Any
        ]
        
        // save password into keychain
        SecItemAdd(query as CFDictionary, nil)
        print("Data saved into keyChain")
    }
    
    func getPasswordFromKeyChain(key:String){
        let query:[String:Any] = [
            //the string will be a password type
            kSecClass as String:kSecClassGenericPassword,
            
            //sets the key
            kSecAttrAccount as String:key,
            
            //returns password if password exist
            kSecReturnData as String: kCFBooleanTrue!,
            
            //only return one match
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var dataTypeRef:AnyObject?
        
        //gets password from keychain
        let status:OSStatus = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
        
        //if password exist assign password to view text
        if (status == noErr) {
            if let data = dataTypeRef as? Data, let result = String(data: data, encoding: .utf8) {
                print("Got data from keychain")
                savedinfo = result
            }
        }
    }
}

#Preview {
    KeyChainView()
}
