//
//  VVAppUitility.swift
//  UIVVMaterialComponent
//
//  Created by Vinod VIshwakarma on 31/01/2020.
//  Copyright © 2020 Appinventor Inc http://appinventor.co.in. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
import CoreTelephony

public class VVAppUtility {
    
    var active_view: UIView!
    
    static let instance: VVAppUtility = { VVAppUtility() }()
    
    func isEmail(email:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    //MARK: Dynamically get app name
    func getAppName() -> String {
        return Bundle.main.infoDictionary!["CFBundleName"] as! String
    }
    
    func getAppVersion() -> String {
        return Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
    }
    
    func getBundleId() -> String {
        let bundleID = Bundle.main.bundleIdentifier
        return bundleID!
    }
    
    //MARK: Clear App cache
    
    func clearCache() -> Void {
        URLCache.shared.removeAllCachedResponses()
        URLCache.shared.diskCapacity = 0
        URLCache.shared.memoryCapacity = 0
    }
    
    func clearCookies() -> Void {
        let cookieStorage = HTTPCookieStorage.shared
        
        guard let cookies = cookieStorage.cookies else { return }
        
        for cookie in cookies {
            cookieStorage.deleteCookie(cookie)
        }
    }
    
    
    //MARK:- Device
    
    func getDeviceModel() -> String {
        return UIDevice.current.model
    }
    
    func getDeviceName() -> String {
        return UIDevice.current.systemName
    }
    
    func getDeviceVer() -> String {
        return UIDevice.current.systemVersion
    }
    
    func getDeviceUUID() -> String {
        return UIDevice.current.identifierForVendor!.uuidString
    }
    
    func getDeviceLanguage() -> String {
        return Bundle.main.preferredLocalizations.first!
    }
    
    func getDeviceOSName() -> String {
        return UIDevice.current.systemName
    }
    
    func getDeviceOSRelease() -> String {
        return UIDevice.current.systemVersion
    }
    
    func getDeviceBrand() -> String {
        return "Apple"
    }
    
    func getDeviceManufacturer() -> String {
        return "Apple"
    }
    
    
    //MARK:- Coutry List
    func getCountryList() -> [String] {
        var countries: [String] = []
        
        for code in NSLocale.isoCountryCodes  {
            let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: code])
            let name = NSLocale(localeIdentifier: "en_UK").displayName(forKey: NSLocale.Key.identifier, value: id) ?? "Country not found for code: \(code)"
            countries.append(name)
        }
        countries.sort()
        return countries
    }
    
    func getCountryArray() ->NSArray {
        let countries = NSMutableArray()
        
        for code in NSLocale.isoCountryCodes  {
            let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: code])
            let name = NSLocale(localeIdentifier: "en_UK").displayName(forKey: NSLocale.Key.identifier, value: id) ?? "Country not found for code: \(code)"
            let dataDict = NSMutableDictionary()
            dataDict.setValue(name, forKey: "name")
            countries.add(dataDict)
        }
        let descriptor: NSSortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        let sortedResults = countries.sortedArray(using: [descriptor])
        
        return sortedResults as NSArray
    }
    
    
    //MARK:- Coutry List
    func getCountryCodeList() -> [String] {
        var countries: [String] = []
        
        for code in NSLocale.isoCountryCodes  {
            let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: code])
            let name = NSLocale(localeIdentifier: "en_UK").displayName(forKey: NSLocale.Key.identifier, value: id) ?? "Country not found for code: \(code)"
            countries.append(name)
        }
        countries.sort()
        return countries
    }
    
    
    func getCountryCallingCode() -> NSArray? {
        
        // get the file path for the file "test.json" in the playground bundle
        let filePath = Bundle.main.path(forResource:"phone_code", ofType: "json")
        
        // get the contentData
        let contentData = FileManager.default.contents(atPath: filePath!)
        
        // get the string
        //let content = String(data:contentData!, encoding:String.Encoding.utf8)
        var dataArray:NSArray?
        do {
            let json = try JSONSerialization.jsonObject(with: contentData!) as! Dictionary<String, AnyObject>
            
            //              DispatchQueue.main.async {
            let dataDict = json as NSDictionary
            dataArray = (dataDict.value(forKey: "countries") as! NSArray)
            //              }
            //print(json)
        } catch {
            print(error)
        }
        
        return dataArray
        
    }
    
    
    func getCountryCode() -> String {
        guard let carrier = CTTelephonyNetworkInfo().subscriberCellularProvider, let countryCode = carrier.isoCountryCode else { return "" }
        
        let prefixCodes = ["AF": "93", "AE": "971", "AL": "355", "AN": "599", "AS":"1", "AD": "376", "AO": "244", "AI": "1", "AG":"1", "AR": "54","AM": "374", "AW": "297", "AU":"61", "AT": "43","AZ": "994", "BS": "1", "BH":"973", "BF": "226","BI": "257", "BD": "880", "BB": "1", "BY": "375", "BE":"32","BZ": "501", "BJ": "229", "BM": "1", "BT":"975", "BA": "387", "BW": "267", "BR": "55", "BG": "359", "BO": "591", "BL": "590", "BN": "673", "CC": "61", "CD":"243","CI": "225", "KH":"855", "CM": "237", "CA": "1", "CV": "238", "KY":"345", "CF":"236", "CH": "41", "CL": "56", "CN":"86","CX": "61", "CO": "57", "KM": "269", "CG":"242", "CK": "682", "CR": "506", "CU":"53", "CY":"537","CZ": "420", "DE": "49", "DK": "45", "DJ":"253", "DM": "1", "DO": "1", "DZ": "213", "EC": "593", "EG":"20", "ER": "291", "EE":"372","ES": "34", "ET": "251", "FM": "691", "FK": "500", "FO": "298", "FJ": "679", "FI":"358", "FR": "33", "GB":"44", "GF": "594", "GA":"241", "GS": "500", "GM":"220", "GE":"995","GH":"233", "GI": "350", "GQ": "240", "GR": "30", "GG": "44", "GL": "299", "GD":"1", "GP": "590", "GU": "1", "GT": "502", "GN":"224","GW": "245", "GY": "595", "HT": "509", "HR": "385", "HN":"504", "HU": "36", "HK": "852", "IR": "98", "IM": "44", "IL": "972", "IO":"246", "IS": "354", "IN": "91", "ID":"62", "IQ":"964", "IE": "353","IT":"39", "JM":"1", "JP": "81", "JO": "962", "JE":"44", "KP": "850", "KR": "82","KZ":"77", "KE": "254", "KI": "686", "KW": "965", "KG":"996","KN":"1", "LC": "1", "LV": "371", "LB": "961", "LK":"94", "LS": "266", "LR":"231", "LI": "423", "LT": "370", "LU": "352", "LA": "856", "LY":"218", "MO": "853", "MK": "389", "MG":"261", "MW": "265", "MY": "60","MV": "960", "ML":"223", "MT": "356", "MH": "692", "MQ": "596", "MR":"222", "MU": "230", "MX": "52","MC": "377", "MN": "976", "ME": "382", "MP": "1", "MS": "1", "MA":"212", "MM": "95", "MF": "590", "MD":"373", "MZ": "258", "NA":"264", "NR":"674", "NP":"977", "NL": "31","NC": "687", "NZ":"64", "NI": "505", "NE": "227", "NG": "234", "NU":"683", "NF": "672", "NO": "47","OM": "968", "PK": "92", "PM": "508", "PW": "680", "PF": "689", "PA": "507", "PG":"675", "PY": "595", "PE": "51", "PH": "63", "PL":"48", "PN": "872","PT": "351", "PR": "1","PS": "970", "QA": "974", "RO":"40", "RE":"262", "RS": "381", "RU": "7", "RW": "250", "SM": "378", "SA":"966", "SN": "221", "SC": "248", "SL":"232","SG": "65", "SK": "421", "SI": "386", "SB":"677", "SH": "290", "SD": "249", "SR": "597","SZ": "268", "SE":"46", "SV": "503", "ST": "239","SO": "252", "SJ": "47", "SY":"963", "TW": "886", "TZ": "255", "TL": "670", "TD": "235", "TJ": "992", "TH": "66", "TG":"228", "TK": "690", "TO": "676", "TT": "1", "TN":"216","TR": "90", "TM": "993", "TC": "1", "TV":"688", "UG": "256", "UA": "380", "US": "1", "UY": "598","UZ": "998", "VA":"379", "VE":"58", "VN": "84", "VG": "1", "VI": "1","VC":"1", "VU":"678", "WS": "685", "WF": "681", "YE": "967", "YT": "262","ZA": "27" , "ZM": "260", "ZW":"263"]
        let countryDialingCode = prefixCodes[countryCode.uppercased()] ?? ""
        return "+\(countryDialingCode)"
    }
    
    func getUserCountryCode(code:String) -> String {
        
        let prefixCodes = ["AF": "93", "AE": "971", "AL": "355", "AN": "599", "AS":"1", "AD": "376", "AO": "244", "AI": "1", "AG":"1", "AR": "54","AM": "374", "AW": "297", "AU":"61", "AT": "43","AZ": "994", "BS": "1", "BH":"973", "BF": "226","BI": "257", "BD": "880", "BB": "1", "BY": "375", "BE":"32","BZ": "501", "BJ": "229", "BM": "1", "BT":"975", "BA": "387", "BW": "267", "BR": "55", "BG": "359", "BO": "591", "BL": "590", "BN": "673", "CC": "61", "CD":"243","CI": "225", "KH":"855", "CM": "237", "CA": "1", "CV": "238", "KY":"345", "CF":"236", "CH": "41", "CL": "56", "CN":"86","CX": "61", "CO": "57", "KM": "269", "CG":"242", "CK": "682", "CR": "506", "CU":"53", "CY":"537","CZ": "420", "DE": "49", "DK": "45", "DJ":"253", "DM": "1", "DO": "1", "DZ": "213", "EC": "593", "EG":"20", "ER": "291", "EE":"372","ES": "34", "ET": "251", "FM": "691", "FK": "500", "FO": "298", "FJ": "679", "FI":"358", "FR": "33", "GB":"44", "GF": "594", "GA":"241", "GS": "500", "GM":"220", "GE":"995","GH":"233", "GI": "350", "GQ": "240", "GR": "30", "GG": "44", "GL": "299", "GD":"1", "GP": "590", "GU": "1", "GT": "502", "GN":"224","GW": "245", "GY": "595", "HT": "509", "HR": "385", "HN":"504", "HU": "36", "HK": "852", "IR": "98", "IM": "44", "IL": "972", "IO":"246", "IS": "354", "IN": "91", "ID":"62", "IQ":"964", "IE": "353","IT":"39", "JM":"1", "JP": "81", "JO": "962", "JE":"44", "KP": "850", "KR": "82","KZ":"77", "KE": "254", "KI": "686", "KW": "965", "KG":"996","KN":"1", "LC": "1", "LV": "371", "LB": "961", "LK":"94", "LS": "266", "LR":"231", "LI": "423", "LT": "370", "LU": "352", "LA": "856", "LY":"218", "MO": "853", "MK": "389", "MG":"261", "MW": "265", "MY": "60","MV": "960", "ML":"223", "MT": "356", "MH": "692", "MQ": "596", "MR":"222", "MU": "230", "MX": "52","MC": "377", "MN": "976", "ME": "382", "MP": "1", "MS": "1", "MA":"212", "MM": "95", "MF": "590", "MD":"373", "MZ": "258", "NA":"264", "NR":"674", "NP":"977", "NL": "31","NC": "687", "NZ":"64", "NI": "505", "NE": "227", "NG": "234", "NU":"683", "NF": "672", "NO": "47","OM": "968", "PK": "92", "PM": "508", "PW": "680", "PF": "689", "PA": "507", "PG":"675", "PY": "595", "PE": "51", "PH": "63", "PL":"48", "PN": "872","PT": "351", "PR": "1","PS": "970", "QA": "974", "RO":"40", "RE":"262", "RS": "381", "RU": "7", "RW": "250", "SM": "378", "SA":"966", "SN": "221", "SC": "248", "SL":"232","SG": "65", "SK": "421", "SI": "386", "SB":"677", "SH": "290", "SD": "249", "SR": "597","SZ": "268", "SE":"46", "SV": "503", "ST": "239","SO": "252", "SJ": "47", "SY":"963", "TW": "886", "TZ": "255", "TL": "670", "TD": "235", "TJ": "992", "TH": "66", "TG":"228", "TK": "690", "TO": "676", "TT": "1", "TN":"216","TR": "90", "TM": "993", "TC": "1", "TV":"688", "UG": "256", "UA": "380", "US": "1", "UY": "598","UZ": "998", "VA":"379", "VE":"58", "VN": "84", "VG": "1", "VI": "1","VC":"1", "VU":"678", "WS": "685", "WF": "681", "YE": "967", "YT": "262","ZA": "27" , "ZM": "260", "ZW":"263"]
        let countryDialingCode = prefixCodes[code.uppercased()] ?? ""
        return "+\(countryDialingCode)"
    }
    
    
    
    //MARK:- Check location permission
    
    func hasLocationPermission() -> Bool {
        var hasPermission = false
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
            case .notDetermined, .restricted, .denied:
                hasPermission = false
            case .authorizedAlways, .authorizedWhenInUse:
                hasPermission = true
            @unknown default:
                hasPermission = false
            }
        } else {
            hasPermission = false
        }
        return hasPermission
    }
    
    func getServerDateFromString(date:String) -> String {
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let formattedDate = dateFormatter.date(from: date)
        let dateString:String = dateFormatter.string(from: formattedDate!)
        return dateString
    }
    
    func getServerDate(date:Date) -> String {
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString:String = dateFormatter.string(from: date)
        return dateString
    }
    
    func getUserDate(date:Date) -> String {
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let dateString:String = dateFormatter.string(from: date)
        return dateString
    }
    
    func getStringDDMMYYYY(date:String) -> String {
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd-MM-yyyy"
        
        let dateObj = dateFormatter.date(from: date)
        var dateString:String = ""
        if dateObj != nil {
            dateString.append(dateFormatterPrint.string(from: dateObj!))
        }
        return dateString
    }
    
    func getFullDate(date:String) -> String {
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "d MMM yyyy HH:mm"
        
        let dateObj = dateFormatter.date(from: date)
        var dateString:String = ""
        if dateObj != nil {
            dateString.append(dateFormatterPrint.string(from: dateObj!))
        }
        return dateString
    }
    
    //Parse server date string in YYYY-mm-dd
    func parseStringDate(date:String) -> String {
        if date.isEmpty {
            return ""
        } else {
            let dateFormatter:DateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let serverDate:Date = dateFormatter.date(from: date)!
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let dateString:String = dateFormatter.string(from: serverDate)
            
            return dateString
        }
    }
    
    
    
    //MARK: Geocode
    
    func getAddressFromLatLon(lat: String, lang: String) {
        var center : CLLocationCoordinate2D = CLLocationCoordinate2D()
        let lat: Double = Double("\(lat)")!
        //21.228124
        let lon: Double = Double("\(lang)")!
        //72.833770
        let ceo: CLGeocoder = CLGeocoder()
        center.latitude = lat
        center.longitude = lon
        
        let loc: CLLocation = CLLocation(latitude:center.latitude, longitude: center.longitude)
        
        ceo.reverseGeocodeLocation(loc, completionHandler:
            {(placemarks, error) in
                if (error != nil)
                {
                    print("reverse geodcode fail: \(error!.localizedDescription)")
                }
                let pm = placemarks! as [CLPlacemark]
                
                if pm.count > 0 {
                    let pm = placemarks![0]
                    print(pm.country!)
                    print(pm.locality!)
                    print(pm.subLocality!)
                    print(pm.thoroughfare!)
                    print(pm.postalCode!)
                    print(pm.subThoroughfare!)
                    
                    var addressString : String = ""
                    
                    if pm.subLocality != nil {
                        addressString = addressString + pm.subLocality! + ", "
                    }
                    if pm.thoroughfare != nil {
                        addressString = addressString + pm.thoroughfare! + ", "
                    }
                    if pm.locality != nil {
                        addressString = addressString + pm.locality! + ", "
                    }
                    if pm.country != nil {
                        addressString = addressString + pm.country! + ", "
                    }
                    if pm.postalCode != nil {
                        addressString = addressString + pm.postalCode! + " "
                    }
                    
                    
                    print(addressString)
                }
        })
        
    }
    
    
    
    func getCurrentLocation(latitude: String, lang: String) ->CLLocation {
        
        //        var city:String = ""
        
        var center : CLLocationCoordinate2D = CLLocationCoordinate2D()
        let lat: Double = Double("\(latitude)")!
        let lon: Double = Double("\(lang)")!
        
        //        let geoCoder = CLGeocoder()
        center.latitude = lat
        center.longitude = lon
        
        let loc: CLLocation = CLLocation(latitude:center.latitude, longitude: center.longitude)
        
        /*geoCoder.reverseGeocodeLocation(loc, preferredLocale: Locale.current) { (placemarks, error) in
         
         if (error != nil) {
         print("reverse geodcode fail: \(error!.localizedDescription)")
         
         } else if let placemark = placemarks?.first {
         // you should always update your UI in the main thread
         DispatchQueue.main.async {
         city = placemark.locality ?? ""
         print(placemark.country ?? "unknown")
         }
         }
         }*/
        
        return loc
        
        /*CLGeocoder().reverseGeocodeLocation(loc, completionHandler:
         {(placemarks, error) in
         
         if (error != nil) {
         print("reverse geodcode fail: \(error!.localizedDescription)")
         
         } else if let placemark = placemarks?.first {
         // you should always update your UI in the main thread
         DispatchQueue.main.async {
         //  update UI here
         print("name:", placemark.name ?? "unknown")
         
         print("address1:", placemark.thoroughfare ?? "unknown")
         print("address2:", placemark.subThoroughfare ?? "unknown")
         print("neighborhood:", placemark.subLocality ?? "unknown")
         print("city:", placemark.locality ?? "unknown")
         
         print("state:", placemark.administrativeArea ?? "unknown")
         print("subAdministrativeArea:", placemark.subAdministrativeArea ?? "unknown")
         print("zip code:", placemark.postalCode ?? "unknown")
         print("country:", placemark.country ?? "unknown", terminator: "\n\n")
         
         print("isoCountryCode:", placemark.isoCountryCode ?? "unknown")
         print("region identifier:", placemark.region?.identifier ?? "unknown")
         
         print("timezone:", placemark.timeZone ?? "unknown", terminator:"\n\n")
         
         // Mailind Address
         print(placemark.country ?? "unknown")
         }
         }
         })*/
        
        
    }
    
    
    func MKMapRectForCoordinateRegion(region:MKCoordinateRegion) -> MKMapRect {
        let topLeft = CLLocationCoordinate2D(latitude: region.center.latitude + (region.span.latitudeDelta/2), longitude: region.center.longitude - (region.span.longitudeDelta/2))
        let bottomRight = CLLocationCoordinate2D(latitude: region.center.latitude - (region.span.latitudeDelta/2), longitude: region.center.longitude + (region.span.longitudeDelta/2))
        
        let a = MKMapPoint(topLeft)
        let b = MKMapPoint(bottomRight)
        
        return MKMapRect(origin: MKMapPoint(x:min(a.x,b.x), y:min(a.y,b.y)), size: MKMapSize(width: abs(a.x-b.x), height: abs(a.y-b.y)))
    }
    
    
    //-- System time stamp
    func getTimeStamp() -> String {
        return String((Int(NSDate().timeIntervalSince1970)))
    }
    
    // THIS WILL GIVE A DATE FROM UTC DATE
    
    func getDateFromUTC(utcDate:String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.000Z"
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        let date = dateFormatter.date(from: utcDate)
        return date!
    }
    
    //MARK:- Convert String JSON to Dictionary
    func getDictionary(stringRes:String) -> NSDictionary {
        if let data = stringRes.data(using: String.Encoding.utf8) {
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? NSDictionary
                return json ?? NSDictionary()
            } catch {
                print("unable to conver the string")
            }
        }
        
        return NSDictionary()
    }
    
    //MARK:- Convert Dictionary to String ()
    func stringify(json: Any) -> String {
        let options: JSONSerialization.WritingOptions = []
        do {
            let data = try JSONSerialization.data(withJSONObject: json, options: options)
            if let string = String(data: data, encoding: String.Encoding.utf8) {
                return string
            }
        } catch {
            print(error)
        }
        
        return ""
    }
    
    
    //MARK:- Convert JSON to DataModel
    /**
     Here is the use case of
     - DataModel:
     let data = VVAppUitility.instance.jsonToDataObj(json:some json object)
     let dataModel  = try JSONDecoder().decode(SomeModel.self, from: jsonData)
     
     
     */
    func jsonToDataObj(json: Any) -> Any {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
            
            return jsonData
            
        } catch {
            print(error)
        }
        return Data.init()
    }
    
    
    
    func saveToFile(_ path: String, img:UIImage) throws {
        let data: Data?
        data = img.jpegData(compressionQuality: 0.8)
        try data?.write(to: URL(fileURLWithPath: path), options: .atomicWrite)
    }
    
    
    func getDocumentDirPath() -> String {
        let directoryPath =  NSHomeDirectory().appending("/Documents/")
        debugPrint(directoryPath)
        return directoryPath
    }
    
    func delete(fileName : String)-> Bool {
        let docDir = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let filePath = docDir.appendingPathComponent(fileName)
        do {
            try FileManager.default.removeItem(at: filePath)
            print("File deleted")
            return true
        }
        catch {
            print("Error")
        }
        return false
    }
    
    func deleteFromDocumentDir(filePath : String)-> Void {
        let url = URL(fileURLWithPath: filePath, isDirectory: false)
        
        do {
            try FileManager.default.removeItem(at: url)
            print("File deleted")
        }
        catch {
            print("Error")
        }
    }
    
    
    //MARK: Ref https://stackoverflow.com/a/39934058/3683571
    func convertDateToInt(date:Date) -> Int {
        let timeInterval = date.timeIntervalSince1970
        return Int(timeInterval)
    }
    
    func convertTimeIntervalToDate(date:Date) -> Date {
        let timeInt = date.timeIntervalSince1970
        let timeInterval = Double(timeInt)
        let myNSDate = Date(timeIntervalSince1970: timeInterval)
        return myNSDate
    }
    
    
    func getCurrentDate() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        return dateFormatter.string(from: Date())
        
    }
    
    func getCurrentDateObj() -> Date {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        let dateStr = dateFormatter.string(from: Date())
        return dateFormatter.date(from: dateStr)!
    }
    
    
    /*
     Convert NSArray/NSDctionary to string and pass to server using post method
     */
    func jsonString(from object:Any) -> Any? {
        guard let data = try? JSONSerialization.data(withJSONObject: object, options: []) else {
            return ""
        }
        return String(data: data, encoding: String.Encoding.utf8)
    }
    
    
    
    /*
     Convert NSArray to json array and pass to server using post method
     */
    func jsonArray(from object:Any) -> Any? {
        //        guard let data = try? JSONSerialization.data(withJSONObject: object, options: []) else {
        //            return ""
        //        }
        //        return String(data: data, encoding: String.Encoding.utf8)
        do {
            
            //Convert to Data
            let jsonData = try JSONSerialization.data(withJSONObject: object, options: JSONSerialization.WritingOptions.prettyPrinted)
            
            //Convert back to string. Usually only do this for debugging
            if let JSONString = String(data: jsonData, encoding: String.Encoding.utf8) {
                print(JSONString)
            }
            
            //In production, you usually want to try and cast as the root data structure. Here we are casting as a dictionary. If the root object is an array cast as [Any].
            let jsonArray = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [Any]
            
            debugPrint(jsonArray as Any)
            return jsonArray
        } catch {
        }
        
        return nil
    }
    
    /*
     Convert Dictionary to json object and pass to server using post method
     */
    func jsonObject(from object:Any) -> Any? {
        do {
            
            //Convert to Data
            let jsonData = try JSONSerialization.data(withJSONObject: object, options: JSONSerialization.WritingOptions.prettyPrinted)
            
            //Convert back to string. Usually only do this for debugging
            if let JSONString = String(data: jsonData, encoding: String.Encoding.utf8) {
                print(JSONString)
            }
            
            //In production, you usually want to try and cast as the root data structure. Here we are casting as a dictionary. If the root object is an array cast as [Any].
            let jsonObj = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:Any]
            
            debugPrint(jsonObj as Any)
            return jsonObj
        } catch {
        }
        
        return nil
    }
    
    
    func getDateObjFromUTC(utcDate:String) -> Date? {
        
        // Ref : https://stackoverflow.com/a/47844108/3683571
        
        if utcDate.count > 0 {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
            var formattedString = utcDate.replacingOccurrences(of: "Z", with: "")
            if let lowerBound = formattedString.range(of: ".")?.lowerBound {
                formattedString = "\(formattedString[..<lowerBound])"
            }
            
            guard let date = dateFormatter.date(from: formattedString) else {
                return nil
            }
            
            return date
        } else {
            return nil
        }
        
        
        
    }
    
    
    func getDateFromUTC(utcDate:String) -> String {
        
        // Ref : https://stackoverflow.com/a/47844108/3683571
        
        if utcDate.count > 0 {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
            var formattedString = utcDate.replacingOccurrences(of: "Z", with: "")
            if let lowerBound = formattedString.range(of: ".")?.lowerBound {
                formattedString = "\(formattedString[..<lowerBound])"
            }
            
            guard let date = dateFormatter.date(from: formattedString) else {
                return ""
            }
            
            // change to a readable time format and change to local time zone
            dateFormatter.dateFormat = "EEE, MMM d"
            dateFormatter.timeZone = NSTimeZone.local
            let formattedDate = dateFormatter.string(from: date)
            return formattedDate
        } else {
            return ""
        }
        
        
        
    }
    
    func getTimeFromUTC(utcTime:String) -> String {
        
        // Ref : https://stackoverflow.com/a/47844108/3683571
        
        if utcTime.count > 0 {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
            var formattedString = utcTime.replacingOccurrences(of: "Z", with: "")
            if let lowerBound = formattedString.range(of: ".")?.lowerBound {
                formattedString = "\(formattedString[..<lowerBound])"
            }
            
            guard let date = dateFormatter.date(from: formattedString) else {
                return ""
            }
            
            dateFormatter.timeStyle = .short
            dateFormatter.dateStyle = .none
            dateFormatter.locale = NSLocale(localeIdentifier: "en_GB") as Locale
            dateFormatter.timeZone = NSTimeZone.local
            let formattedDate = dateFormatter.string(from: date)
            return formattedDate
        } else {
            return ""
        }
        
        
    }
    
    
    /*func stringify(json: Any) -> String {
        let options: JSONSerialization.WritingOptions = []
        //        if prettyPrinted {
        //            options = JSONSerialization.WritingOptions.prettyPrinted
        //        }
        
        do {
            let data = try JSONSerialization.data(withJSONObject: json, options: options)
            if let string = String(data: data, encoding: String.Encoding.utf8) {
                return string
            }
        } catch {
            print(error)
        }
        
        return ""
    }*/
    
//    func getDictionary(stringRes:String) -> NSDictionary {
//        if let data = stringRes.data(using: String.Encoding.utf8) {
//            do {
//                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? NSDictionary
//                return json ?? NSDictionary()
//            } catch {
//                print("unable to conver the string")
//            }
//        }
//
//        return NSDictionary()
//
//    }
    
    
    func convertDictToData(json:NSDictionary) -> Data? {
        var jsonData:Data? = nil
        do {
            jsonData = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
        } catch { print(error) }
        return jsonData
        
    }
    
    
    func extractUserInfo(userInfo: [AnyHashable : Any]) -> (alert: String, badge: String) {
        var info = (alert: "", badge: "")
        guard let aps = userInfo["aps"] as? [String: Any] else { return info }
        let alert = aps["alert"] as? String ?? ""
        let badge = aps["badge"] as? String ?? ""
        //let sound = aps["sound"] as? String ?? ""
        info = (alert: alert, badge: badge)
        return info
    }
    
    
    func getExpiredDays(dateStr:String) -> Int? {
        
        // Ref : https://stackoverflow.com/a/47844108/3683571
        
        if dateStr.count > 0 {
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
            var formattedString = dateStr.replacingOccurrences(of: "Z", with: "")
            if let lowerBound = formattedString.range(of: ".")?.lowerBound {
                formattedString = "\(formattedString[..<lowerBound])"
            }
            
            guard let date = dateFormatter.date(from: formattedString) else {
                return 0
            }
            
            let dateFormatter1 = DateFormatter()
            dateFormatter1.dateFormat = "yyyy-MM-dd"
            let formatedStartDate = dateFormatter1.string(from: date)
            let previousDateFormated:Date = (dateFormatter1.date(from: formatedStartDate) ?? nil)!
            
            
            let currentDate = Date()
            let calendar = NSCalendar.current
            
            // Replace the hour (time) of both dates with 00:00 https://stackoverflow.com/a/28163560/3683571
            let todayDate = calendar.startOfDay(for: currentDate)
            let expiryDate = calendar.startOfDay(for: previousDateFormated)
            
            let components1 = calendar.dateComponents([.day], from: todayDate, to: expiryDate)
            
            let differenceInDays = components1.day
            
            //            debugPrint("totalDay=\(String(describing: differenceInDays))")
            
            return differenceInDays
        } else {
            return 0
        }
        
    }
    
   
    func getTodayDate() -> String {
        let date = Date()
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let dateString:String = dateFormatter.string(from: date)
        return dateString
    }
    
    func randomColor() -> UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
    
    //Color Range for classroom list
    private func colorStringArray() -> [String] {
        let arrColors = ["ff0000", "228B22", "00aaff", "800080", "ffa500"] // Use your color hex
        return arrColors
    }
    
    func hexToColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    
    func getMaterialColor() -> UIColor {
        let arrColors = self.colorStringArray()
        let randomIndex = Int(arc4random_uniform(UInt32(arrColors.count)))
        return self.hexToColor(hex: arrColors[randomIndex])
    }
    
    /**
     Get number of lines of text
     */
    func getTextNumberOfLine(textData:String) -> Int {
        var enumCount = 0
        textData.enumerateLines { (str, _) in
            enumCount += 1
        }
        debugPrint("total line =\(enumCount)")
        return enumCount
    }
    
    /**
                  let data = AppHelper.shared().formatPoints(num: totalPoints )
                  
      //            return String(format: "%d %@", self.points, pt)
                  return String(format: "%@ %@", data, pt)

     */
    func formatPoints(num: Double) ->String {
        let thousandNum = num/1000
        let millionNum = num/1000000
        if num >= 1000 && num <= 1000000 {
            if(floor(thousandNum) == thousandNum) {
                return("\(Int(thousandNum))K")
            }
            return("\(thousandNum.roundToPlaces(places: 1))K")
        }
        if num > 1000000 {
            if(floor(millionNum) == millionNum){
                return("\(Int(thousandNum))K")
            }
            return ("\(millionNum.roundToPlaces(places: 1))M")
        }
        else{
            if(floor(num) == num){
                return ("\(Int(num))")
            }
            return ("\(num)")
        }
        
    }
    
    func getCurrentUTCDate() -> String {
        
        let date = Date()
        
        let iso8601DateFormatter = ISO8601DateFormatter()
        iso8601DateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        let utcStr = iso8601DateFormatter.string(from: date)
        debugPrint(utcStr)
        return utcStr
    }
    
    class func convertDictionaryToData(json:NSDictionary) -> Data {
        guard let data = try? NSKeyedArchiver.archivedData(withRootObject: json, requiringSecureCoding: false) else { return Data() }
        return data
    }
    
    
    //https://stackoverflow.com/a/60475801
   @available(iOS 13.0, *)
   class func getStatusBarHeight() -> CGFloat {
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        let statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        return statusBarHeight
    }
    
    
}
