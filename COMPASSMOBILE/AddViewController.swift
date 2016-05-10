//
//  AddViewController.swift
//  COMPASSMOBILE
//
//  Created by Andrew Harper on 25/02/2016.
//  Copyright © 2016 HYDOP E.C.S. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var SitePopupSelector: KFPopupSelector!
    @IBOutlet weak var PropertyPopupSelector: KFPopupSelector!
    @IBOutlet weak var LocationGroupPopupSelector: KFPopupSelector!
    @IBOutlet weak var LocationPopupSelector: KFPopupSelector!
    @IBOutlet weak var AssetTypePopupSelector: KFPopupSelector!
    @IBOutlet weak var AssetGroupPopupSelector: KFPopupSelector!
    @IBOutlet weak var TaskNamePopupSelector: KFPopupSelector!
    @IBOutlet weak var AssetNumberPopupSelector: KFPopupSelector!

    var Sites: [String] = []
    var SiteDictionary: Dictionary<String, String> = [:]
    var SiteId: String? = String?()
    
    var Properties: [String] = []
    var PropertyDictionary: Dictionary<String, String> = [:]
    var PropertyId: String? = String?()
    
    var LocationGroups: [String] = []
    var LocationGroupDictionary: Dictionary<String, String> = [:]
    var LocationGroupId: String? = String?()
    
    var Locations: [String] = []
    var LocationDictionary: Dictionary<String, String> = [:]
    var LocationId: String? = String?()
    
    var AssetTypes: [String] = []
    var AssetTypeDictionary: Dictionary<String, String> = [:]
    var AssetType: String? = String?()
    
    var AssetGroups: [String] = []
    var AssetGroupDictionary: Dictionary<String, String> = [:]
    var AssetGroup: String? = String?()
    
    var TaskNames: [String] = []
    var TaskNameDictionary: Dictionary<String, String> = [:]
    var TaskName: String? = String?()
    
    var AssetNumbers: [String] = []
    var AssetNumberDictionary: Dictionary<String, String> = [:]
    var AssetId: String? = String?()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        PropertyPopupSelector.unselectedLabelText = "not applicable"
        PropertyPopupSelector.enabled = false
        
        LocationGroupPopupSelector.unselectedLabelText = "not applicable"
        LocationGroupPopupSelector.enabled = false
        
        LocationPopupSelector.unselectedLabelText = "not applicable"
        LocationPopupSelector.enabled = false
        
        AssetTypePopupSelector.unselectedLabelText = "not applicable"
        AssetTypePopupSelector.enabled = false
        
        AssetGroupPopupSelector.unselectedLabelText = "not applicable"
        AssetGroupPopupSelector.enabled = false
        
        TaskNamePopupSelector.unselectedLabelText = "not applicable"
        TaskNamePopupSelector.enabled = false
        
        AssetNumberPopupSelector.unselectedLabelText = "not applicable"
        AssetNumberPopupSelector.enabled = false
        
        PopulateSiteSelector()
    }
    
    @IBAction func Cancel(sender: UIBarButtonItem) {
                self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func Done(sender: UIBarButtonItem) {
                self.navigationController?.popViewControllerAnimated(true)
    }

    // MARK : populate the drop downs
    
    func PopulateSiteSelector()
    {
        //Get this list of sites currently available for this user
        Sites = []
        SiteDictionary = [:]
        
        // go and get the search/filter criteria from the values selected in the session
        var criteria: Dictionary<String, String> = [:]
        criteria["OrganisationId"] = Session.OrganisationId
        
        var siteData: [Site] = [] //NSMutableArray!
        Sites.append("")
        
        // go and get the site data based on the criteria built
        siteData = ModelManager.getInstance().findSiteList(criteria)
        
        for currentSite: Site in siteData
        {
            Sites.append(currentSite.Name)
            SiteDictionary[currentSite.Name] = currentSite.RowId
        }
        
        SitePopupSelector.buttonContentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        SitePopupSelector.setLabelFont(UIFont.systemFontOfSize(17))
        SitePopupSelector.setTableFont(UIFont.systemFontOfSize(17))
        SitePopupSelector.options = Sites.map { KFPopupSelector.Option.Text(text: $0) }
        SitePopupSelector.selectedIndex = nil
        SitePopupSelector.unselectedLabelText = "Select Site"
        SitePopupSelector.displaySelectedValueInLabel = true
    }
    
    func PopulatePropertySelector()
    {
        //Get this list of Propertys currently available for this user
        Properties = []
        PropertyDictionary = [:]
        
        // go and get the search/filter criteria from the values selected in the session
        var criteria: Dictionary<String, String> = [:]
        criteria["SiteId"] = SiteId
        
        var PropertyData: [Property] = [] //NSMutableArray!
        Properties.append("")
        
        // go and get the Property data based on the criteria built
        PropertyData = ModelManager.getInstance().findPropertyList(criteria)
        
        for currentProperty: Property in PropertyData
        {
            Properties.append(currentProperty.Name)
            PropertyDictionary[currentProperty.Name] = currentProperty.RowId
        }
        
        PropertyPopupSelector.buttonContentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        PropertyPopupSelector.setLabelFont(UIFont.systemFontOfSize(17))
        PropertyPopupSelector.setTableFont(UIFont.systemFontOfSize(17))
        PropertyPopupSelector.options = Properties.map { KFPopupSelector.Option.Text(text: $0) }
        PropertyPopupSelector.selectedIndex = nil
        PropertyPopupSelector.unselectedLabelText = "Select Property"
        PropertyPopupSelector.displaySelectedValueInLabel = true
    }
    
    func PopulateLocationGroupSelector()
    {
        //Get this list of LocationGroups currently available for this user
        LocationGroups = []
        LocationGroupDictionary = [:]
        
        // go and get the search/filter criteria from the values selected in the session
        var criteria: Dictionary<String, String> = [:]
        criteria["PropertyId"] = PropertyId!
        
        // go and get the search/filter criteria from the values selected in the session
        var LocationGroupData: [LocationGroup] = [] //NSMutableArray!
        LocationGroups.append("")
        
        // go and get the LocationGroup data based on the criteria built
        LocationGroupData = ModelManager.getInstance().findLocationGroupList(criteria)
        
        for currentLocationGroup: LocationGroup in LocationGroupData
        {
            if (currentLocationGroup.Name == nil) {currentLocationGroup.Name = "missing name"}
            LocationGroups.append(currentLocationGroup.Name!)
            LocationGroupDictionary[currentLocationGroup.Name!] = currentLocationGroup.RowId
        }
        
        LocationGroupPopupSelector.buttonContentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        LocationGroupPopupSelector.setLabelFont(UIFont.systemFontOfSize(17))
        LocationGroupPopupSelector.setTableFont(UIFont.systemFontOfSize(17))
        LocationGroupPopupSelector.options = LocationGroups.map { KFPopupSelector.Option.Text(text: $0) }
        LocationGroupPopupSelector.selectedIndex = nil
        LocationGroupPopupSelector.unselectedLabelText = "Select Area"
        LocationGroupPopupSelector.displaySelectedValueInLabel = true
    }
    
    func PopulateLocationSelector()
    {
        //Get this list of Locations currently available for this user
        Locations = []
        LocationDictionary = [:]
        
        // go and get the search/filter criteria from the values selected in the session
        var criteria: Dictionary<String, String> = [:]
        criteria["PropertyId"] = PropertyId
        
        // go and get the search/filter criteria from the values selected in the session
        var LocationData: [Location] = [] //NSMutableArray!

        Locations.append("")
        
        // go and get the Location data based on the criteria built
        (LocationData, _) = ModelManager.getInstance().findLocationListByLocationGroup(LocationGroupId!, criteria: criteria, pageSize: nil, pageNumber: nil)
        
        for currentLocation: Location in LocationData
        {
            Locations.append(currentLocation.Name)
            LocationDictionary[currentLocation.Name] = currentLocation.RowId
        }
        
        LocationPopupSelector.buttonContentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        LocationPopupSelector.setLabelFont(UIFont.systemFontOfSize(17))
        LocationPopupSelector.setTableFont(UIFont.systemFontOfSize(17))
        LocationPopupSelector.options = Locations.map { KFPopupSelector.Option.Text(text: $0) }
        LocationPopupSelector.selectedIndex = nil
        LocationPopupSelector.unselectedLabelText = "Select Location"
        LocationPopupSelector.displaySelectedValueInLabel = true
    }
    
    func PopulateAssetTypeSelector()
    {
        //Get this list of AssetGroups currently available for this user
        AssetGroups = []
        AssetGroupDictionary = [:]
        
        // go and get the search/filter criteria from the values selected in the session
        var criteria: Dictionary<String, String> = [:]
        criteria["LocationId"] = LocationId
        
        // go and get the search/filter criteria from the values selected in the session
        var AssetData: [Asset] = [] //NSMutableArray!
        AssetGroups.append("")
        
        // go and get the Asset data based on the criteria built
        AssetData = ModelManager.getInstance().findAssetList(criteria)
        
        for currentAsset: Asset in AssetData
        {
            let currentAssetTypeDisplay: String = ModelUtility.getInstance().ReferenceDataDisplayFromValue("PPMAssetType", key: currentAsset.AssetType)
            if(!AssetTypeDictionary.keys.contains(currentAssetTypeDisplay))
            {
                AssetTypes.append(currentAssetTypeDisplay)
                AssetTypeDictionary[currentAssetTypeDisplay] = currentAsset.AssetType
            }
        }
        
        AssetTypePopupSelector.buttonContentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        AssetTypePopupSelector.setLabelFont(UIFont.systemFontOfSize(17))
        AssetTypePopupSelector.setTableFont(UIFont.systemFontOfSize(17))
        AssetTypePopupSelector.options = AssetTypes.map { KFPopupSelector.Option.Text(text: $0) }
        AssetTypePopupSelector.selectedIndex = nil
        AssetTypePopupSelector.unselectedLabelText = "Select Asset Type"
        AssetTypePopupSelector.displaySelectedValueInLabel = true
    }
    
    
    func PopulateAssetGroupSelector()
    {
        //Get this list of AssetGroups currently available for this user
        AssetGroups = []
        AssetGroupDictionary = [:]
        
        // go and get the search/filter criteria from the values selected in the session
        var criteria: Dictionary<String, String> = [:]
        criteria["Type"] = "PPMAssetType"
        criteria["Value"] = AssetType
        criteria["ParentType"] = "PPMAssetGroup"
        
        // go and get the search/filter criteria from the values selected in the session
        var AssetGroupData: [ReferenceData] = [] //NSMutableArray!
        AssetGroups.append("")
        
        // go and get the Asset data based on the criteria built
        AssetGroupData = ModelManager.getInstance().findReferenceDataList(criteria)
        
        for currentAssetGroup: ReferenceData in AssetGroupData
        {
            let currentAssetGroupDisplay: String = ModelUtility.getInstance().ReferenceDataDisplayFromValue("PPMAssetGroup", key: currentAssetGroup.ParentValue!)
            if(!AssetGroupDictionary.keys.contains(currentAssetGroupDisplay))
            {
                AssetGroups.append(currentAssetGroupDisplay)
                AssetGroupDictionary[currentAssetGroupDisplay] = currentAssetGroup.ParentValue
            }
         }
        
        AssetGroupPopupSelector.buttonContentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        AssetGroupPopupSelector.setLabelFont(UIFont.systemFontOfSize(17))
        AssetGroupPopupSelector.setTableFont(UIFont.systemFontOfSize(17))
        AssetGroupPopupSelector.options = AssetGroups.map { KFPopupSelector.Option.Text(text: $0) }
        AssetGroupPopupSelector.selectedIndex = nil
        AssetGroupPopupSelector.unselectedLabelText = "Select Asset Group"
        AssetGroupPopupSelector.displaySelectedValueInLabel = true
    }
    
    func PopulateTaskNameSelector()
    {
        //Get this list of TaskNames currently available for this user
        TaskNames = []
        TaskNameDictionary = [:]
        
        // go and get the search/filter criteria from the values selected in the session
        var criteria: Dictionary<String, String> = [:]
        criteria["Type"] = "PPMTaskType"
        criteria["ParentValue"] = AssetGroup
        criteria["ParentType"] = "PPMAssetGroup"
        
        // go and get the search/filter criteria from the values selected in the session
        var TaskNameData: [ReferenceData] = [] //NSMutableArray!
        TaskNames.append("")
        
        // go and get the TaskName data based on the criteria built
        TaskNameData = ModelManager.getInstance().findReferenceDataList(criteria)
        
        for currentTaskName: ReferenceData in TaskNameData
        {
            TaskNames.append(currentTaskName.Display)
            TaskNameDictionary[currentTaskName.Display] = currentTaskName.Value
        }
        
        TaskNamePopupSelector.buttonContentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        TaskNamePopupSelector.setLabelFont(UIFont.systemFontOfSize(17))
        TaskNamePopupSelector.setTableFont(UIFont.systemFontOfSize(17))
        TaskNamePopupSelector.options = TaskNames.map { KFPopupSelector.Option.Text(text: $0) }
        TaskNamePopupSelector.selectedIndex = nil
        TaskNamePopupSelector.unselectedLabelText = "Select Task Name"
        TaskNamePopupSelector.displaySelectedValueInLabel = true
    }
    
    func PopulateAssetNumberSelector()
    {
        //Get this list of AssetNumbers currently available for this user
        AssetNumbers = []
        AssetNumberDictionary = [:]
        
        // go and get the search/filter criteria from the values selected in the session
        var criteria: Dictionary<String, String> = [:]
        criteria["PropertyId"] = PropertyId
        criteria["LocationId"] = LocationId
        criteria["AssetType"] = AssetType
        
        // go and get the search/filter criteria from the values selected in the session
        var AssetNumberData: [Asset] = [] //NSMutableArray!
        AssetNumbers.append("")
        
        // go and get the AssetNumber data based on the criteria built
        AssetNumberData = ModelManager.getInstance().findAssetList(criteria)
        
        for currentAsset: Asset in AssetNumberData
        {
            let AssetNumber: String = ModelUtility.getInstance().AssetNumber(currentAsset)
            AssetNumbers.append(AssetNumber)
            AssetNumberDictionary[AssetNumber] = currentAsset.RowId
        }
        
        AssetNumberPopupSelector.buttonContentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        AssetNumberPopupSelector.setLabelFont(UIFont.systemFontOfSize(17))
        AssetNumberPopupSelector.setTableFont(UIFont.systemFontOfSize(17))
        AssetNumberPopupSelector.options = AssetNumbers.map { KFPopupSelector.Option.Text(text: $0) }
        AssetNumberPopupSelector.selectedIndex = nil
        AssetNumberPopupSelector.unselectedLabelText = "Select Asset Number"
        AssetNumberPopupSelector.displaySelectedValueInLabel = true
    }
    
    
    @IBAction func SiteChanged(sender: KFPopupSelector) {
        //set the site
        if (SitePopupSelector.selectedIndex != nil && Sites[SitePopupSelector.selectedIndex!] != "")
        {
            SiteId = SiteDictionary[Sites[SitePopupSelector.selectedIndex!]]
            
            //do the property stuff
            PopulatePropertySelector()
            PropertyPopupSelector.enabled = true
        }
        else
        {
            if (SitePopupSelector.selectedIndex != nil) { SitePopupSelector.selectedIndex = nil }
            SiteId = nil
            PropertyPopupSelector.unselectedLabelText = "not applicable"
            PropertyPopupSelector.enabled = false
        }
    }
    
    @IBAction func PropertyChanged(sender: KFPopupSelector) {
        //set the property
        if (PropertyPopupSelector.selectedIndex != nil  && Properties[PropertyPopupSelector.selectedIndex!] != "")
        {
            PropertyId = PropertyDictionary[Properties[PropertyPopupSelector.selectedIndex!]]
            
            //do the locationgroup stuff
            PopulateLocationGroupSelector()
            LocationGroupPopupSelector.enabled = true
        }
        else
        {
            if (PropertyPopupSelector.selectedIndex != nil) { PropertyPopupSelector.selectedIndex = nil }
            PropertyId = nil
            LocationGroupPopupSelector.unselectedLabelText = "not applicable"
            LocationGroupPopupSelector.enabled = false
        }
    }

    @IBAction func LocationGroupChanged(sender: KFPopupSelector) {
        //set the location group
        if (LocationGroupPopupSelector.selectedIndex != nil && LocationGroups[LocationGroupPopupSelector.selectedIndex!] != "")
        {
            LocationGroupId = LocationGroupDictionary[LocationGroups[LocationGroupPopupSelector.selectedIndex!]]
            
            //do the location stuff
            PopulateLocationSelector()
            LocationPopupSelector.enabled = true
        }
        else
        {
            if (LocationGroupPopupSelector.selectedIndex != nil) { LocationGroupPopupSelector.selectedIndex = nil }
            LocationGroupId = nil
            LocationPopupSelector.unselectedLabelText = "not applicable"
            LocationPopupSelector.enabled = false
        }
    }
    
    @IBAction func LocationChanged(sender: KFPopupSelector) {
        //set the location
        if (LocationPopupSelector.selectedIndex != nil && Locations[LocationPopupSelector.selectedIndex!] != "")
        {
            LocationId = LocationDictionary[Locations[LocationPopupSelector.selectedIndex!]]
            
            //do the asset type stuff
            PopulateAssetTypeSelector()
            AssetGroupPopupSelector.enabled = true
        }
        else
        {
            if (LocationPopupSelector.selectedIndex != nil) { LocationPopupSelector.selectedIndex = nil }
            LocationId = nil
            AssetTypePopupSelector.unselectedLabelText = "not applicable"
            AssetTypePopupSelector.enabled = false
        }
    }
    
    @IBAction func AssetTypeChanged(sender: KFPopupSelector) {
        //set the asset type
        if (LocationPopupSelector.selectedIndex != nil && Locations[LocationPopupSelector.selectedIndex!] != "")
        {
            AssetType = AssetTypeDictionary[AssetTypes[AssetTypePopupSelector.selectedIndex!]]
            
            //do the asset group stuff
            PopulateAssetGroupSelector()
            AssetGroupPopupSelector.enabled = true
        }
        else
        {
            if (LocationPopupSelector.selectedIndex != nil) { LocationPopupSelector.selectedIndex = nil }
            AssetType = nil
            AssetGroupPopupSelector.unselectedLabelText = "not applicable"
            AssetGroupPopupSelector.enabled = false
        }
    }
    
    @IBAction func AssetGroupChanged(sender: KFPopupSelector) {
        //set the asset group
        if (AssetGroupPopupSelector.selectedIndex != nil && AssetGroups[AssetGroupPopupSelector.selectedIndex!] != "")
        {
            AssetGroup = AssetGroupDictionary[AssetGroups[AssetGroupPopupSelector.selectedIndex!]]
            
            //do the Task name stuff
            PopulateTaskNameSelector()
            TaskNamePopupSelector.enabled = true
        }
        else
        {
            if (AssetGroupPopupSelector.selectedIndex != nil) { AssetGroupPopupSelector.selectedIndex = nil }
            AssetGroup = nil
            TaskNamePopupSelector.unselectedLabelText = "not applicable"
            TaskNamePopupSelector.enabled = false
        }
    }
    
    @IBAction func TaskNameChanged(sender: KFPopupSelector) {
        //set the task name
        if (TaskNamePopupSelector.selectedIndex != nil && TaskNames[TaskNamePopupSelector.selectedIndex!] != "")
        {
            TaskName = TaskNameDictionary[TaskNames[TaskNamePopupSelector.selectedIndex!]]
            
            //do the AssetNumber stuff
            PopulateAssetNumberSelector()
            AssetNumberPopupSelector.enabled = true
        }
        else
        {
            if (TaskNamePopupSelector.selectedIndex != nil) { TaskNamePopupSelector.selectedIndex = nil }
            TaskName = nil
            AssetNumberPopupSelector.unselectedLabelText = "not applicable"
            AssetNumberPopupSelector.enabled = false
        }
    }
    
    @IBAction func AssetNumberChanged(sender: KFPopupSelector) {
        //set the AssetNumber
        if (AssetNumberPopupSelector.selectedIndex != nil && AssetNumbers[AssetNumberPopupSelector.selectedIndex!] != "")
        {
            AssetId = AssetNumberDictionary[AssetNumbers[AssetNumberPopupSelector.selectedIndex!]]
        }
        else
        {
            if (AssetNumberPopupSelector.selectedIndex != nil) { AssetNumberPopupSelector.selectedIndex = nil }
            AssetId = nil
        }
    }
}
