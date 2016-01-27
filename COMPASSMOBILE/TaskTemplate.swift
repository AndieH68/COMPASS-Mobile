//
//  TaskTemplate.swift
//  COMPASSMOBILE
//
//  Created by Andrew Harper on 26/01/2016.
//  Copyright © 2016 HYDOP E.C.S. All rights reserved.
//

import Foundation

class TaskTemplate: NSObject {
    
    // MARK: - Properties
    
    var RowId: String = String()
    var CreatedBy: String = String()
    var CreatedOn: NSDate = NSDate()
    var LastUpdatedBy: String? = nil
    var LastUpdatedOn: NSDate? = nil
    var Deleted: NSDate? = nil
    var OrganisationId: String = String()
    var AssetType: String = String()
    var TaskName: String = String()
    var Priority: Int = Int()
    var EstimatedDuration: Int = Int()

    // MARK: - Contructors
    
    convenience
    init(rowId:String, createdBy: String, createdOn: NSDate, lastUpdatedBy: String?, lastUpdatedOn: NSDate?, deleted: NSDate?, organisationId: String, assetType: String, taskName: String, priority: Int, estimatedDuration: Int) {
        self.init()
        self.RowId = rowId
        self.CreatedBy = createdBy
        self.CreatedOn = createdOn
        self.LastUpdatedBy = lastUpdatedBy
        self.LastUpdatedOn = lastUpdatedOn
        self.Deleted = deleted
        self.OrganisationId = organisationId
        self.AssetType = assetType
        self.TaskName = taskName
        self.Priority = priority
        self.EstimatedDuration = estimatedDuration
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
        self.OrganisationId = XMLElement.attributes["OrganisationId"]!
        self.AssetType = XMLElement.attributes["AssetType"]!
        self.TaskName = XMLElement.attributes["TaskName"]!
        self.Priority = Int(XMLElement.attributes["Priority"]!)!
        self.EstimatedDuration = Int(XMLElement.attributes["EstimatedDuration"]!)!

    }
}
