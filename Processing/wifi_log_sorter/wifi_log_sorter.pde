// The following short XML file called "mammals.xml" is parsed 
// in the code below. It must be in the project's "data" folder.
//
// <?xml version="1.0"?>
// <mammals>
//   <animal id="0" species="Capra hircus">Goat</animal>
//   <animal id="1" species="Panthera pardus">Leopard</animal>
//   <animal id="2" species="Equus zebra">Zebra</animal>
// </mammals>

XML xml;
XML[] all_aps;
AccessPoint[] ap_list;

int parse_limit = 0; // set to zero to parse all ap's in the file...

Table ap_table;

void setup() {
  // Load the kml file as an xml file
  xml = loadXML("all.kml");
  //  println(xml.listChildren());

  // We only care about the Placemark elements so only get those
  all_aps = xml.getChildren("Document")[0].getChildren("Placemark");

  // Figure out how many AP's to actually parse:
  if (parse_limit <= 0) {
    parse_limit = all_aps.length;
    println("Total access point count is " + parse_limit + ".");
  } else {
    println("Total access point count is " + all_aps.length + " but we're only parsing " + parse_limit + " of them.");
  }
  
  // Initialize the array that's going to hold all of the parse acecss point objects
  ap_list = new AccessPoint[parse_limit];
  
  // Fill in the ap array
  println("Loading...");
  for (int i = 0; i < parse_limit; i++) {
    ap_list[i] = new AccessPoint(all_aps[i]);
  }
  println("Done!\n");
  
  println("Now we'll save out a CSV file...");
  
  ap_table = createTable();
  
  ap_table.addColumn("ssid");
  ap_table.addColumn("mac");
  ap_table.addColumn("channel");
  ap_table.addColumn("strength");
  ap_table.addColumn("encryption_type");
  ap_table.addColumn("ap_type");
  ap_table.addColumn("first_seen");
  ap_table.addColumn("last_seen");
  ap_table.addColumn("latitude");
  ap_table.addColumn("longitude");
  ap_table.addColumn("altitude");
  
  for (int i = 0; i < ap_list.length; i++) {
    
    TableRow newRow = ap_table.addRow();
    newRow.setString("ssid", ap_list[i].ssid);
    newRow.setString("mac", ap_list[i].mac);
    newRow.setInt("channel", ap_list[i].channel);
    newRow.setInt("strength", ap_list[i].strength);
    newRow.setString("encryption_type", ap_list[i].encryption_type);
    newRow.setString("ap_type", ap_list[i].ap_type);
    newRow.setString("first_seen", ap_list[i].first_seen);
    newRow.setString("last_seen", ap_list[i].last_seen);
    newRow.setFloat("latitude", ap_list[i].latitude);
    newRow.setFloat("longitude", ap_list[i].longitude);
    newRow.setFloat("altitude", ap_list[i].altitude);
  }
  
  saveTable(ap_table, "data/ap_list.csv");
  println("Saved!");
  
  exit();
  
}

class AccessPoint {
  XML original_xml;
  String original_desc;
  String coordinates;
  
  String ssid;
  String mac;
  int channel;
  int strength;
  String encryption_type;
  String ap_type;
  String first_seen;
  String last_seen; //new java.util.Date(timestamp*1000);
  float latitude, longitude, altitude;

  AccessPoint (XML initial_xml) {
    parseXMLObject(initial_xml);
//    println(ssid + ": " + original_desc);
  }

  void parseXMLObject(XML to_parse) {
    ssid = to_parse.getChildren("name")[0].getContent();
    original_desc = to_parse.getChildren("description")[0].getContent();
    coordinates = to_parse.getChildren("Point")[0].getChildren("coordinates")[0].getContent(); 
    
    String[] split_desc = split(original_desc, "<br>");
    String[] split_coords = split(coordinates, ',');
    
    latitude = Float.parseFloat(split_coords[0]);
    longitude = Float.parseFloat(split_coords[1]);
    altitude = Float.parseFloat(split_coords[2]);
     
    mac = split(split_desc[0], ": ")[1];
    channel = Integer.parseInt(split(split_desc[1], ": ")[1]);
    strength = Integer.parseInt(split(split_desc[2], ": ")[1]);
    encryption_type = split(split_desc[3], ": ")[1];
    ap_type = split(split_desc[4], ": ")[1];
    first_seen = split(split_desc[5], ": ")[1];
    last_seen = split(split_desc[6], ": ")[1];
    
  }
  
  String print() {
    return "" + ssid + ", " + mac + "," + channel + "," + strength + "," + encryption_type + "," + ap_type + "," + first_seen + "," + last_seen; 
  }

  void update() { 
    // do nothing on updates
  }
} 

