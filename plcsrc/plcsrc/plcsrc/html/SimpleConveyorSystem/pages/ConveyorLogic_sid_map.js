function RTW_SidParentMap() {
    this.sidParentMap = new Array();
    this.sidParentMap["SimpleConveyorSystem:1:6"] = "SimpleConveyorSystem:1";
    this.sidParentMap["SimpleConveyorSystem:1:7"] = "SimpleConveyorSystem:1";
    this.sidParentMap["SimpleConveyorSystem:1:8"] = "SimpleConveyorSystem:1";
    this.sidParentMap["SimpleConveyorSystem:1:12"] = "SimpleConveyorSystem:1";
    this.sidParentMap["SimpleConveyorSystem:1:9"] = "SimpleConveyorSystem:1";
    this.sidParentMap["SimpleConveyorSystem:1:10"] = "SimpleConveyorSystem:1";
    this.sidParentMap["SimpleConveyorSystem:1:11"] = "SimpleConveyorSystem:1";
    this.sidParentMap["SimpleConveyorSystem:1:6:2"] = "SimpleConveyorSystem:1:6";
    this.sidParentMap["SimpleConveyorSystem:1:10:1"] = "SimpleConveyorSystem:1:10";
    this.sidParentMap["SimpleConveyorSystem:1:11:1"] = "SimpleConveyorSystem:1:11";
    this.sidParentMap["SimpleConveyorSystem:1:8:2"] = "SimpleConveyorSystem:1:8";
    this.sidParentMap["SimpleConveyorSystem:1:7:2"] = "SimpleConveyorSystem:1:7";
    this.sidParentMap["SimpleConveyorSystem:1:12:1"] = "SimpleConveyorSystem:1:12";
    this.sidParentMap["SimpleConveyorSystem:1:8:3"] = "SimpleConveyorSystem:1:8";
    this.getParentSid = function(sid) { return this.sidParentMap[sid];}
}
    RTW_SidParentMap.instance = new RTW_SidParentMap();
