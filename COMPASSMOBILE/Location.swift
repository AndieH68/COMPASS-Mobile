//
//  Location.swift
//  COMPASSMOBILE
//
//  Created by Andrew Harper on 26/01/2016.
//  Copyright © 2016 HYDOP E.C.S. All rights reserved.
//

import UIKit

class Location: NSObject {
    
    // MARK: - Properties
    
    var RowId: String = String()
    var CreatedBy: String = String()
    var CreatedOn: NSDate = NSDate()
    var LastUpdatedBy: String? = nil
    var LastUpdatedOn: NSDate? = nil
    var Deleted: NSDate? = nil
    var PropertyId: String = String()
    var Name: String = String()
    var Description: String? = nil
    var Level: String? = nil
    var Number: String? = nil
    var SubNumber: String? = nil
    var Use: String? = nil
    var ClientLocationName: String? = nil
    
    // MARK: - Contructors
    
    convenience
    init(rowId:String, createdBy: String, createdOn: NSDate, lastUpdatedBy: String?, lastUpdatedOn: NSDate?, deleted: NSDate?, propertyId: String, name: String, description: String?, level: String?, number: String?, subNumber: String?, use: String?, clientLocationName: String?) {
        self.init()
        self.RowId = rowId
        self.CreatedBy = createdBy
        self.CreatedOn = createdOn
        self.LastUpdatedBy = lastUpdatedBy
        self.LastUpdatedOn = lastUpdatedOn
        self.Deleted = deleted
        self.PropertyId = propertyId
        self.Name = name
        self.Description = description
        self.Level = level
        self.Number = number
        self.SubNumber = subNumber
        self.Use = use
        self.ClientLocationName = clientLocationName
    }
    
    convenience
    init(XMLElement: AEXMLElement) {
        self.init()
        self.RowId = XMLElement.attributes["RowId"]!
        self.CreatedBy = XMLElement.attributes["CreatedBy"]!
        self.CreatedOn = NSDate(dateString: XMLElement.attributes["CreatedOn"]!)
        if XMLElement.attributes.keys.contains("LastUpdatedBy") {
            if XMLElement.attributes["LastUpdatedBy"] != ""
            {
                self.LastUpdatedBy = XMLElement.attributes["LastUpdatedBy"]!
            }
        }
        if XMLElement.attributes.keys.contains("LastUpdatedOn") {
            if XMLElement.attributes["LastUpdatedOn"] != ""
            {
                self.LastUpdatedOn = NSDate(dateString: XMLElement.attributes["LastUpdatedOn"]!)
            }
        }
        if XMLElement.attributes.keys.contains("Deleted") {
            if XMLElement.attributes["Deleted"] != ""
            {
                self.Deleted = NSDate(dateString: XMLElement.attributes["Deleted"]!)
            }
        }
        self.PropertyId = XMLElement.attributes["PropertyId"]!
        self.Name = XMLElement.attributes["Name"]!
        if XMLElement.attributes.keys.contains("Description") {
            if XMLElement.attributes["Description"] != ""
            {
                self.LastUpdatedBy = XMLElement.attributes["Description"]!
            }
        }
        if XMLElement.attributes.keys.contains("Level") {
            if XMLElement.attributes["Level"] != ""
            {
                self.LastUpdatedBy = XMLElement.attributes["Level"]!
            }
        }
        if XMLElement.attributes.keys.contains("Number") {
            if XMLElement.attributes["Number"] != ""
            {
                self.LastUpdatedBy = XMLElement.attributes["Number"]!
            }
        }
        if XMLElement.attributes.keys.contains("SubNumber") {
            if XMLElement.attributes["SubNumber"] != ""
            {
                self.LastUpdatedBy = XMLElement.attributes["SubNumber"]!
            }
        }
        if XMLElement.attributes.keys.contains("Use") {
            if XMLElement.attributes["Use"] != ""
            {
                self.LastUpdatedBy = XMLElement.attributes["Use"]!
            }
        }
        if XMLElement.attributes.keys.contains("ClientLocationName") {
            if XMLElement.attributes["ClientLocationName"] != ""
            {
                self.LastUpdatedBy = XMLElement.attributes["ClientLocationName"]!
            }
        }
    }
}
